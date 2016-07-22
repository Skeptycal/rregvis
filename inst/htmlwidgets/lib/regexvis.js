var RegexVis = (function () {
    function RegexVis(el, width, height) {
        this.host = el;
    }
    RegexVis.prototype.load = function (data) {
        this.host.innerText = data.before[0];
    };
    return RegexVis;
})();
