"use strict";
$(document).ready(function() {
    var nueva = new Router();
});
var   Router = Backbone.Router.extend({

    routes: {
      "inventario/index"			: "init",
      "inventario/form"			: "formulario",
      "inventario/:id/update"			: "update",
      "inventario/:id/delete"			: "delete"

    },
    $container: $('#izquierda'),
    initialize: function () {
      //creamos la coleccion
      this.collection = new InventarioCollection();
      this.collection.fetch({ajaxSync: false});
      this.init();
      // empezamos a escuchar las url
      Backbone.history.start();
    },
    init: function () {
      //queremos cargar el index del boton
      var view = new InventarioPageView({
        collection	: this.collection,
        model			: new InventarioModel()
      });
      this.$container.html(view.render().el);
    },
    formulario: function () {

      //queremos cargar el index del boton
      var view = new InventarioCreatePageView({
        collection	: this.collection,
        model			: new InventarioModel()
      });
      this.$container.html(view.render().el);
      $("#formPrueba").validate({
            rules: {

              email: {// compound rule

              email: true
          }
            },
            messages: {
              email: "Tiene que ser un email correcto"
          }
        });
    },
    update: function (id) {
      var view = new InventarioEditarPageView({model: this.collection.get(id)});
      this.$container.html(view.render().el);
    },
    delete: function (id) {
      var intentario = this.collection.get(id);
      intentario.destroy();
      Backbone.history.navigate("inventario/index", {trigger: true});
    }

  });
