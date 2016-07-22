/// <reference path="regexvis.ts"/>

// forward declare external type
declare var HTMLWidgets: any;

// local types
interface Instance {
    rregvis: RegexVis
}

// declare widget binding
HTMLWidgets.widget({

  name: "rregvis",

  type: "output",

  initialize: function(el: HTMLElement, width: number, 
                       height: number): Instance {
    var vis = new RegexVis(el, width, height);
    return {
      rregvis: vis
    };
  },
  
  renderValue: function(el: HTMLElement, x: RRegData, inst: Instance) {
      inst.rregvis.load(x);
  },
  
  resize: function(el: HTMLElement, width: number, height: number, 
                   inst: Instance) {
      
  }
});
