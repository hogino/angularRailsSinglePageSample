app.directive 'defaultMessage', ->
  restrict: 'E'
  scope: {
    title: '@'
    message: '@'
  }
#  transclude:true,
#  replace:true,
  template: '<div class="alert alert-dismissable alert-info">' +
              '<h4>{{title}}</h4>' +
              '<p>{{message}}</p>' +
            '</div>'