/// <reference path="regexvis.ts"/>
// declare widget binding
HTMLWidgets.widget({
    name: "rregvis",
    type: "output",
    initialize: function (el, width, height) {
        var vis = new RegexVis(el, width, height);
        return {
            rregvis: vis
        };
    },
    renderValue: function (el, x, inst) {
        inst.rregvis.load(x);
    },
    resize: function (el, width, height, inst) {
    }
});
