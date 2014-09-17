var ProgressBar = Loader.extend({
    className: "notification progress",
    update: function (percent,text) {
        this.$el.find("em").width(percent + "%");
        return this;
    }
});
