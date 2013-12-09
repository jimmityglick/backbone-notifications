var Notification = Backbone.View.extend({
    tagName: "div",
    className: "notification",

    initialize: function (options) {
        _.extend(this, options);
    },

    render: function () {
        this.$el
            .html(this.text)
            .addClass(this.type)
            .delay(this.wait)
            .slideUp("fast");
        return this;
    }
});
