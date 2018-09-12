<?php

require 'vendor/autoload.php';


$app = new \atk4\ui\App('Welcome to Agile Toolkit');
$app->initLayout('Admin');


/****************************************************************
 * You can now remove the text below and write your own Web App *
 *                                                              *
 * Thank you for trying out Agile Toolkit                       *
 ****************************************************************/

// Default installation gives warning, so update php.ini the remove this line
date_default_timezone_set('UTC');

$app->layout->leftMenu->addItem(['Front-end demo', 'icon'=>'puzzle'], ['index']);
$app->layout->leftMenu->addItem(['Admin demo', 'icon'=>'dashboard'], ['admin']);

class Product extends \atk4\data\Model
{
    public $table = 'product';
    public $title_field = 'name';
    function init()
    {
        parent::init();

        
        // Field Declarations
        $this->addField('name', ['type' => 'string', 'required' => true]);
        $this->addField('part_number', ['type' => 'string', 'required' => true]);
        $this->addExpression('label', ['concat([name], "-", [part_number])', 'type' => 'text']);

        $this->addField('starting_inventory', ['type' => 'number', 'required' => true]);
        $this->addField('minimum_required', ['type' => 'string', 'required' => true, 'default' => '2']);





        // Extra Relations
        //$this->hasMany('Purchases', new Purchase());
        //$this->hasMany('Orders', new Order());

        //$this->getRef('Purchases')->addField('total_purchased', ['aggregate' => 'sum', 'field' => 'quantity']);
        //$this->getRef('Orders')->addField('total_sold', ['aggregate' => 'sum', 'field' => 'shipped']);
        //$this->addExpression('inventory', ['[starting_inventory]+[total_purchased]-[total_sold]', 'type' => 'number']);
        
    }
}

class Purchase extends \atk4\data\Model
{
    public $table = 'purchase';
    public $title_field = 'title';
    function init()
    {
        parent::init();

        // Field Declarations
        $this->addExpression('title', '"abcabcabc"');
        
        $this->addField('status', ['enum' => ['draft', 'ordered', 'received'], 'default' => 'draft']);
        $this->addField('quantity', ['type' => 'number', 'required' => true, 'default' => '20']);
        $this->addField('date', ['type' => 'date']);

        //$this->addExpression('title', ['concat([product_name], "-", [quantity])', 'type' => 'text']);
        //$this->hasOne('product_id', new Product())->addTitle();
        //$this->getRef('product_id')->addField('product_name', 'name');

    }
}

class Order extends \atk4\data\Model
{
    public $table = 'order';
    public $title_field = 'client';
    function init()
    {
        parent::init();
        
        // Field Declarations
        $this->addField('client', ['type' => 'string']);
        $this->addField('shipped', ['type' => 'number', 'required' => true]);
        $this->addField('date', ['type' => 'date']);
        $this->addField('status', ['enum' => ['draft', 'paid', 'shipped'], 'required' => true, 'default' => 'draft']);

        //$this->hasOne('product_id', new Product())->addTitle();
        //$this->getRef('product_id')->addField('product_name', 'name');
    }
}

session_start();
//$db = new \atk4\data\Persistence_Array($_SESSION);
$app->dbConnect('mysql://b170960c7eb1b9:6634cdf5@eu-cdbr-west-02.cleardb.net/heroku_8f1048a1bb68a21');

$app->add(['CRUD', 'paginator'=>false])->setModel(new Product($app->db));

