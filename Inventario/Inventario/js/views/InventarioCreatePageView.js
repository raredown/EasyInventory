"use strict";

var InventarioCreatePageView = Backbone.View.extend({
// Compile the template using Handlebars
	template: Handlebars.compile( $("#formularioEntrada").html() ),
	events: {
		"click .cancelar"			: "cancelar",
		"click .enviar"			: "enviar"
	},
	 initialize: function (options) {
		 this.model.bind('invalid', this.invalid, this);
	 },
	render: function () {
		this.$el.html(
			this.template({	}));


		return this;
	},
	invalid: function (error,attrs) {
		var mensaje = "";
		$.each( attrs, function( index, value ){
    		mensaje = mensaje + value +"<br>";
			});

		$('#errorcito').show();
		$('#errorcito').html(mensaje);
	  },

	cancelar: function (event) {
		event.stopPropagation();
		event.preventDefault();
		Backbone.history.navigate("inventario/index", {trigger: true});
	},
	enviar: function (event) {
		event.stopPropagation();
		event.preventDefault();

		this.model.set({
		nombre			: this.$el.find('input[name=nombreEquipo]').val(),
		tipo			: this.$el.find('input[name=tipoEquipo]').val(),
		email			: this.$el.find('input[name=email]').val()

		});
		if (this.model.isValid()) {
		// guardamos en la colleccion
		this.collection.add(this.model);
		//
		this.model.save();
		//navegamos al inicio
		Backbone.history.navigate("inventario/index", {trigger: true});
	}

	},

	errores: function () {

	}
});
