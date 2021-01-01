<?php

return [
    'data_type' => 'number',
    'formater' => [
        [
            'function' => 'mb_strlen($value) <= 11',
            'failed_message' => '不能超过 11 位',
        ],
        [
            'function' => 'is_numeric($value)',
            'failed_message' => '必须为整数',
        ],
    ],
    'display_name' => 'ID',
];
