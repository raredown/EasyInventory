"use strict";

var InventarioEditarPageView = Backbone.View.extend({
// Compile the template using Handlebars
	template: Handlebars.compile( $("#formularioEdicion").html() ),
	events: {
		"click .updateando"			: "actualizardo"
	},
	initialize: function (options) {
	 },
	render: function () {

		this.$el.html(
		this.template(this.model.toJSON())
		);
		return this;
	},
 actualizardo: function (event) {
	 event.stopPropagation();
	 event.preventDefault();
	 this.model.set({
	 nombre			: this.$el.find('input[name=nombreEquipo]').val(),
	 tipo			: this.$el.find('input[name=tipoEquipo]').val(),
	

	 });


	 //
	 this.model.save();
	 //navegamos al inicio
	 Backbone.history.navigate("inventario/index", {trigger: true});
 }
});
