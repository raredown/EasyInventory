"use strict";

var InventarioPageView = Backbone.View.extend({
// Compile the template using Handlebars
	template: Handlebars.compile( $("#search_template").html() ),
	events: {
		"click .nuevaEntrada"			: "cambio",
		"click .actualizar" : "actualizar",
		"click .borrar" : "borrar"
	},
	initialize: function (options) {
	 },
	render: function () {
		this.$el.html(
			this.template({			
				pruebas :this.collection.toJSON()
		})
		);
		return this;
	},
	cambio: function () {
		Backbone.history.navigate("inventario/form", {trigger: true});
	},
	actualizar: function (event){
		event.stopPropagation();
		event.preventDefault();
		Backbone.history.navigate("inventario/update", {trigger: true});
	},
	borrar: function (event){
		event.stopPropagation();
		event.preventDefault();
		Backbone.history.navigate("inventario/delete", {trigger: true});
	}
});
