<?php

return [
    'autoload' => false,
    'hooks' => [
        'upgrade' => [
            'ldcms',
        ],
        'app_init' => [
            'ldcms',
        ],
        'config_init' => [
            'ldcms',
        ],
    ],
    'route' => [
        '/ldcms/$' => 'ldcms/index/index',
        '/ldcms/search' => 'ldcms/search/index',
        '/ldcms/sitemap.xml' => 'ldcms/sitemap/index',
        '/ldcms/tag/[:tag]$' => 'ldcms/tag/index',
        '/ldcms/[:category]$' => 'ldcms/lists/index',
        '/ldcms/[:category]/[:id]$' => 'ldcms/detail/index',
    ],
    'priority' => [],
    'domain' => '',
];
