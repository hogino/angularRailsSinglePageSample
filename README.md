AngularRailsSinglePageSample
============================

angularとrailsを使用したシングルページのサンプルアプリケーションです。

アプリケーション設定
--------------------

* railsでtemplateディレクトリーをassetsで参照可能にします

```ruby

# config/initializers/slim_assets.rb
Rails.application.assets.register_engine('.slim', Slim::Template)

```

* assetでのurl_helperを使用可能にします。
```ruby

# config/initializers/asset_helper
Rails.application.assets.context_class.class_eval do
  include ActionView::Helpers
  include Rails.application.routes.url_helpers
end
```

Angularを使用するための設定
---------------------------

Angularとrails(turbolink使用)の共存には、いくつか設定が必要です。

1. ```gem 'jquery-turbolinks'```の取得

```ruby
# [project directory]/Genmfile
gem 'jquery-turbolinks'
```

2.javascriptの読み込み順の変更
jqueryとjquery.turbolinksとturbolinksの順番があっていたら問題ないです。

```javascript

# app/assets/javascripts
# 設定例
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require angular.min
//= require_directory ./vendor
//= require app
//= require_tree .
```

Angularのダウンロード
---------------------

[angularJS]: https://github.com/angular/code.angularjs.org

gruntとyeomanを使用する方法もありますが、今回は使用しません。




