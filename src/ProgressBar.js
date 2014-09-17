var ProgressBar = Loader.extend({
  className: "notification progress",
  update: function (percent,text) {
    if(text) {
      this.$el.find("p").text(text);
    }
    this.$el.find("em").width(percent + "%");
    return this;
  }
});
