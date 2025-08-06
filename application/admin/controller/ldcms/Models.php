<?php

namespace app\admin\controller\ldcms;

use think\Db;
use think\Exception;
use think\exception\PDOException;
use app\common\controller\Backend;
use addons\ldcms\utils\builder\Form;
use think\exception\ValidateException;
use app\admin\model\ldcms\Models as ModelsModel;

/**
 * cms 模型管理
 *
 * @icon fa fa-circle-o
 */
class Models extends Base
{
    /**
     * Models模型对象
     * @var ModelsModel
     */
    protected $model = null;
    protected $searchFields = 'name';
    protected $multiFields = "ismenu,status";
    public function _initialize()
    {
        parent::_initialize();
        $this->model = new ModelsModel();
        $this->assignconfig('customColor', $this->model::getCustomColor());
    }


    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    public function add()
    {
        if ($this->request->isPost()) {
            parent::addPost();
        }

        return Form::instance()
            ->setHtml('<div class="alert alert-warning-light">
        <b>对应表如何填写？</b><br>
假设：需要新增一个新闻模型，那么对应表只需填写news即可。<br>不需要填写前缀，最终会生成<code>fa_ldcms_document_news</code>表。
    </div>')
            ->setFormItem('name', '模型名', 'string', 'required')
            ->setFormItem('table_name', '对应表', 'string', 'required')
            ->setFormItem('template_list', '列表模板', 'selectpage', '', function ($data) {
                $data['content_list'] = json_encode($this->model->getTpl('list'));
                return $data;
            })
            ->setFormItem('template_detail', '内容模板', 'selectpage', '', function ($data) {
                $data['content_list'] = json_encode($this->model->getTpl('detail'));
                return $data;
            })
            ->setFormItem('ismenu', '后台菜单', 'switch')
            ->setFormItem('status', '状态', 'switch', '', ['value' => 1])
            ->fetch();
    }

    public function edit($ids = null)
    {
        if ($this->request->isPost()) {
            parent::editPost($ids);
        }

        $row = $this->model->get($ids);
        return Form::instance()
            ->setHtml('<div class="alert alert-warning-light">
        <b>对应表如何填写？</b><br>
假设：需要新增一个新闻模型，那么对应表只需填写news即可。<br>不需要填写前缀，最终会生成<code>fa_ldcms_document_news</code>表。
    </div>')
            ->setFormItem('name', '模型名', 'string', 'required')
            ->setFormItem('table_name', '对应表', 'string', 'required', function ($data) {
                $data['extend_html'] = 'readonly';
                return $data;
            })
            ->setFormItem('template_list', '列表模板', 'selectpage', '', function ($data) {
                $data['content_list'] = json_encode($this->model->getTpl('list'));
                return $data;
            })
            ->setFormItem('template_detail', '内容模板', 'selectpage', '', function ($data) {
                $data['content_list'] = json_encode($this->model->getTpl('detail'));
                return $data;
            })
            ->setFormItem('ismenu', '后台菜单', 'switch')
            ->setFormItem('status', '状态', 'switch')
            ->values($row)
            ->fetch();
    }

    public function del($ids = null)
    {
        if (empty($ids)) {
            $this->error('请选择数据');
        }
        $notid = [1];
        $ids = explode(',', $ids);
        if (array_intersect($notid, $ids)) {
            $this->error('单页模型禁止删除');
        }
        parent::del($ids);
    }

    /**
     * 复制模型
     * @return void
     */
    public function copy($ids = null)
    {
        if (!$this->request->isPost()) {
            $this->error(__("Invalid parameters"));
        }
        $table_name = $this->request->param('table_name');
        if (!$table_name) {
            $this->error(__('请输入表名称'));
        }
        if ($ids) {
            if ($this->model->where('table_name', $table_name)->count()) {
                $this->error(__('表名重复，请重新输入~'));
            }
            $data = $this->model->where('id', $ids)->find();
            if (!$data) {
                $this->error(__('Invalid parameters'));
            }
            Db::startTrans();
            try {
                $data = $data->toArray();
                $data['name'] .= '_复制';
                $data['table_name'] = $table_name;
                unset($data['id']);
                unset($data['create_time']);
                unset($data['update_time']);

                $res = $this->model::create($data, true);
                $resid = $res->id;
                $fields = Db::name('ldcms_fields')->where('mid', $data['id'])->select();
                $copyFields = [];
                foreach ($fields as $key => $value) {
                    unset($value['id']);
                    $value['mid'] = $resid;
                    $copyFields[] = $value;
                }
                Db::name('ldcms_fields')->insertAll($copyFields);
                Db::commit();
            } catch (ValidateException | PDOException | Exception $e) {
                Db::rollback();
                $this->error($e->getMessage());
            }
            $this->success();
        }

    }
}
