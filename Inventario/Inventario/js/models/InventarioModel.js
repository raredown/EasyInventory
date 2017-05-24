"use strict";

var InventarioModel = Backbone.Model.extend({
      defaults: {
    		nombre: "",
    		tipo: "",
        email: ""
    	},initialize : function(attrs){

      },
      validate: function (attrs, opts) {
        var errors = {};
        if (!attrs.nombre) errors.nombre = "Necesitamos un nombre";
        if (!attrs.tipo) errors.tipo = "Necesitamos un tipo";
        if (!attrs.email){
           errors.email = "Necesitamos un email";
         }
        else {
          var re = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
          if (re.test(attrs.email))
                {

                }
                else
                {
                     errors.email = "Formato de email incorrecto";
                }
        }

        if (!_.isEmpty(errors)) return errors;
      }

  });

var  InventarioCollection = Backbone.Collection.extend({
    localStorage: new Backbone.LocalStorage("InventarioModel"),
    model: InventarioModel
  });
