require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"findModule":[function(require,module,exports){
var _findAll, _getHierarchy, _match;

_getHierarchy = function(layer) {
  var a, i, len, ref, string;
  string = '';
  ref = layer.ancestors();
  for (i = 0, len = ref.length; i < len; i++) {
    a = ref[i];
    string = a.name + '>' + string;
  }
  return string = string + layer.name;
};

_match = function(hierarchy, string) {
  var regExp, regexString;
  string = string.replace(/\s*>\s*/g, '>');
  string = string.split('*').join('[^>]*');
  string = string.split(' ').join('(?:.*)>');
  string = string.split(',').join('$|');
  regexString = "(^|>)" + string + "$";
  regExp = new RegExp(regexString);
  return hierarchy.match(regExp);
};

_findAll = function(selector, fromLayer) {
  var layers, stringNeedsRegex;
  layers = Framer.CurrentContext.getLayers();
  if (selector != null) {
    stringNeedsRegex = _.find(['*', ' ', '>', ','], function(c) {
      return _.includes(selector, c);
    });
    if (!(stringNeedsRegex || fromLayer)) {
      return layers = _.filter(layers, function(layer) {
        if (layer.name === selector) {
          return true;
        }
      });
    } else {
      return layers = _.filter(layers, function(layer) {
        var hierarchy;
        hierarchy = _getHierarchy(layer);
        if (fromLayer != null) {
          return _match(hierarchy, fromLayer.name + ' ' + selector);
        } else {
          return _match(hierarchy, selector);
        }
      });
    }
  } else {
    return layers;
  }
};

exports.Find = function(selector, fromLayer) {
  return _findAll(selector, fromLayer)[0];
};

exports.ƒ = function(selector, fromLayer) {
  return _findAll(selector, fromLayer)[0];
};

exports.FindAll = function(selector, fromLayer) {
  return _findAll(selector, fromLayer);
};

exports.ƒƒ = function(selector, fromLayer) {
  return _findAll(selector, fromLayer);
};

Layer.prototype.find = function(selector, fromLayer) {
  return _findAll(selector, this)[0];
};

Layer.prototype.ƒ = function(selector, fromLayer) {
  return _findAll(selector, this)[0];
};

Layer.prototype.findAll = function(selector, fromLayer) {
  return _findAll(selector, this);
};

Layer.prototype.ƒƒ = function(selector, fromLayer) {
  return _findAll(selector, this);
};


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyaWZ5L25vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCIvVXNlcnMvUmljY2FyZG8vRHJvcGJveC9EZXNpZ24gTmV3LzA1IGFwcC8yMDE2MDYyMC9tYXAyLmZyYW1lci9tb2R1bGVzL2ZpbmRNb2R1bGUuY29mZmVlIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FDQ0EsSUFBQTs7QUFBQSxhQUFBLEdBQWdCLFNBQUMsS0FBRDtBQUNkLE1BQUE7RUFBQSxNQUFBLEdBQVM7QUFDVDtBQUFBLE9BQUEscUNBQUE7O0lBQ0UsTUFBQSxHQUFTLENBQUMsQ0FBQyxJQUFGLEdBQU8sR0FBUCxHQUFXO0FBRHRCO0FBRUEsU0FBTyxNQUFBLEdBQVMsTUFBQSxHQUFPLEtBQUssQ0FBQztBQUpmOztBQU1oQixNQUFBLEdBQVMsU0FBQyxTQUFELEVBQVksTUFBWjtBQUVQLE1BQUE7RUFBQSxNQUFBLEdBQVMsTUFBTSxDQUFDLE9BQVAsQ0FBZSxVQUFmLEVBQTBCLEdBQTFCO0VBQ1QsTUFBQSxHQUFTLE1BQU0sQ0FBQyxLQUFQLENBQWEsR0FBYixDQUFpQixDQUFDLElBQWxCLENBQXVCLE9BQXZCO0VBQ1QsTUFBQSxHQUFTLE1BQU0sQ0FBQyxLQUFQLENBQWEsR0FBYixDQUFpQixDQUFDLElBQWxCLENBQXVCLFNBQXZCO0VBQ1QsTUFBQSxHQUFTLE1BQU0sQ0FBQyxLQUFQLENBQWEsR0FBYixDQUFpQixDQUFDLElBQWxCLENBQXVCLElBQXZCO0VBQ1QsV0FBQSxHQUFjLE9BQUEsR0FBUSxNQUFSLEdBQWU7RUFFN0IsTUFBQSxHQUFhLElBQUEsTUFBQSxDQUFPLFdBQVA7QUFDYixTQUFPLFNBQVMsQ0FBQyxLQUFWLENBQWdCLE1BQWhCO0FBVEE7O0FBV1QsUUFBQSxHQUFXLFNBQUMsUUFBRCxFQUFXLFNBQVg7QUFDVCxNQUFBO0VBQUEsTUFBQSxHQUFTLE1BQU0sQ0FBQyxjQUFjLENBQUMsU0FBdEIsQ0FBQTtFQUVULElBQUcsZ0JBQUg7SUFDRSxnQkFBQSxHQUFtQixDQUFDLENBQUMsSUFBRixDQUFPLENBQUMsR0FBRCxFQUFLLEdBQUwsRUFBUyxHQUFULEVBQWEsR0FBYixDQUFQLEVBQTBCLFNBQUMsQ0FBRDthQUFPLENBQUMsQ0FBQyxRQUFGLENBQVcsUUFBWCxFQUFvQixDQUFwQjtJQUFQLENBQTFCO0lBQ25CLElBQUEsQ0FBQSxDQUFPLGdCQUFBLElBQW9CLFNBQTNCLENBQUE7YUFDRSxNQUFBLEdBQVMsQ0FBQyxDQUFDLE1BQUYsQ0FBUyxNQUFULEVBQWlCLFNBQUMsS0FBRDtRQUN4QixJQUFHLEtBQUssQ0FBQyxJQUFOLEtBQWMsUUFBakI7aUJBQStCLEtBQS9COztNQUR3QixDQUFqQixFQURYO0tBQUEsTUFBQTthQUlFLE1BQUEsR0FBUyxDQUFDLENBQUMsTUFBRixDQUFTLE1BQVQsRUFBaUIsU0FBQyxLQUFEO0FBQ3RCLFlBQUE7UUFBQSxTQUFBLEdBQVksYUFBQSxDQUFjLEtBQWQ7UUFDWixJQUFHLGlCQUFIO2lCQUNFLE1BQUEsQ0FBTyxTQUFQLEVBQWtCLFNBQVMsQ0FBQyxJQUFWLEdBQWUsR0FBZixHQUFtQixRQUFyQyxFQURGO1NBQUEsTUFBQTtpQkFHRSxNQUFBLENBQU8sU0FBUCxFQUFrQixRQUFsQixFQUhGOztNQUZzQixDQUFqQixFQUpYO0tBRkY7R0FBQSxNQUFBO1dBYUUsT0FiRjs7QUFIUzs7QUFvQlgsT0FBTyxDQUFDLElBQVIsR0FBa0IsU0FBQyxRQUFELEVBQVcsU0FBWDtTQUF5QixRQUFBLENBQVMsUUFBVCxFQUFtQixTQUFuQixDQUE4QixDQUFBLENBQUE7QUFBdkQ7O0FBQ2xCLE9BQU8sQ0FBQyxDQUFSLEdBQWtCLFNBQUMsUUFBRCxFQUFXLFNBQVg7U0FBeUIsUUFBQSxDQUFTLFFBQVQsRUFBbUIsU0FBbkIsQ0FBOEIsQ0FBQSxDQUFBO0FBQXZEOztBQUVsQixPQUFPLENBQUMsT0FBUixHQUFrQixTQUFDLFFBQUQsRUFBVyxTQUFYO1NBQXlCLFFBQUEsQ0FBUyxRQUFULEVBQW1CLFNBQW5CO0FBQXpCOztBQUNsQixPQUFPLENBQUMsRUFBUixHQUFrQixTQUFDLFFBQUQsRUFBVyxTQUFYO1NBQXlCLFFBQUEsQ0FBUyxRQUFULEVBQW1CLFNBQW5CO0FBQXpCOztBQUdsQixLQUFLLENBQUEsU0FBRSxDQUFBLElBQVAsR0FBa0IsU0FBQyxRQUFELEVBQVcsU0FBWDtTQUF5QixRQUFBLENBQVMsUUFBVCxFQUFtQixJQUFuQixDQUFzQixDQUFBLENBQUE7QUFBL0M7O0FBQ2xCLEtBQUssQ0FBQSxTQUFFLENBQUEsQ0FBUCxHQUFrQixTQUFDLFFBQUQsRUFBVyxTQUFYO1NBQXlCLFFBQUEsQ0FBUyxRQUFULEVBQW1CLElBQW5CLENBQXNCLENBQUEsQ0FBQTtBQUEvQzs7QUFFbEIsS0FBSyxDQUFBLFNBQUUsQ0FBQSxPQUFQLEdBQWtCLFNBQUMsUUFBRCxFQUFXLFNBQVg7U0FBeUIsUUFBQSxDQUFTLFFBQVQsRUFBbUIsSUFBbkI7QUFBekI7O0FBQ2xCLEtBQUssQ0FBQSxTQUFFLENBQUEsRUFBUCxHQUFrQixTQUFDLFFBQUQsRUFBVyxTQUFYO1NBQXlCLFFBQUEsQ0FBUyxRQUFULEVBQW1CLElBQW5CO0FBQXpCIiwiZmlsZSI6ImdlbmVyYXRlZC5qcyIsInNvdXJjZVJvb3QiOiIiLCJzb3VyY2VzQ29udGVudCI6WyIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSIsIiMgaHR0cHM6Ly9naXRodWIuY29tL2F3dDI1NDIvRmluZC1mb3ItRnJhbWVyXG5fZ2V0SGllcmFyY2h5ID0gKGxheWVyKSAtPlxuICBzdHJpbmcgPSAnJ1xuICBmb3IgYSBpbiBsYXllci5hbmNlc3RvcnMoKVxuICAgIHN0cmluZyA9IGEubmFtZSsnPicrc3RyaW5nXG4gIHJldHVybiBzdHJpbmcgPSBzdHJpbmcrbGF5ZXIubmFtZVxuXG5fbWF0Y2ggPSAoaGllcmFyY2h5LCBzdHJpbmcpIC0+XG4gICMgcHJlcGFyZSByZWdleCB0b2tlbnNcbiAgc3RyaW5nID0gc3RyaW5nLnJlcGxhY2UoL1xccyo+XFxzKi9nLCc+JykgIyBjbGVhbiB1cCBzcGFjZXMgYXJvdW5kIGFycm93c1xuICBzdHJpbmcgPSBzdHJpbmcuc3BsaXQoJyonKS5qb2luKCdbXj5dKicpICMgYXN0ZXJpa3MgYXMgbGF5ZXIgbmFtZSB3aWxkY2FyZFxuICBzdHJpbmcgPSBzdHJpbmcuc3BsaXQoJyAnKS5qb2luKCcoPzouKik+JykgIyBzcGFjZSBhcyBzdHJ1Y3R1cmUgd2lsZGNhcmRcbiAgc3RyaW5nID0gc3RyaW5nLnNwbGl0KCcsJykuam9pbignJHwnKSAjIGFsbG93IG11bHRpcGxlIHNlYXJjaGVzIHVzaW5nIGNvbW1hXG4gIHJlZ2V4U3RyaW5nID0gXCIoXnw+KVwiK3N0cmluZytcIiRcIiAjIGFsd2F5cyBib3R0b20gbGF5ZXIsIG1heWJlIHBhcnQgb2YgaGllcmFyY2h5XG5cbiAgcmVnRXhwID0gbmV3IFJlZ0V4cChyZWdleFN0cmluZylcbiAgcmV0dXJuIGhpZXJhcmNoeS5tYXRjaChyZWdFeHApXG5cbl9maW5kQWxsID0gKHNlbGVjdG9yLCBmcm9tTGF5ZXIpIC0+XG4gIGxheWVycyA9IEZyYW1lci5DdXJyZW50Q29udGV4dC5nZXRMYXllcnMoKVxuXG4gIGlmIHNlbGVjdG9yP1xuICAgIHN0cmluZ05lZWRzUmVnZXggPSBfLmZpbmQgWycqJywnICcsJz4nLCcsJ10sIChjKSAtPiBfLmluY2x1ZGVzIHNlbGVjdG9yLGNcbiAgICB1bmxlc3Mgc3RyaW5nTmVlZHNSZWdleCBvciBmcm9tTGF5ZXJcbiAgICAgIGxheWVycyA9IF8uZmlsdGVyIGxheWVycywgKGxheWVyKSAtPlxuICAgICAgICBpZiBsYXllci5uYW1lIGlzIHNlbGVjdG9yIHRoZW4gdHJ1ZVxuICAgIGVsc2VcbiAgICAgIGxheWVycyA9IF8uZmlsdGVyIGxheWVycywgKGxheWVyKSAtPlxuICAgICAgICAgIGhpZXJhcmNoeSA9IF9nZXRIaWVyYXJjaHkobGF5ZXIpXG4gICAgICAgICAgaWYgZnJvbUxheWVyP1xuICAgICAgICAgICAgX21hdGNoKGhpZXJhcmNoeSwgZnJvbUxheWVyLm5hbWUrJyAnK3NlbGVjdG9yKVxuICAgICAgICAgIGVsc2VcbiAgICAgICAgICAgIF9tYXRjaChoaWVyYXJjaHksIHNlbGVjdG9yKVxuICBlbHNlXG4gICAgbGF5ZXJzXG5cblxuIyBHbG9iYWxcbmV4cG9ydHMuRmluZCAgICA9IChzZWxlY3RvciwgZnJvbUxheWVyKSAtPiBfZmluZEFsbChzZWxlY3RvciwgZnJvbUxheWVyKVswXVxuZXhwb3J0cy7GkiAgICAgICA9IChzZWxlY3RvciwgZnJvbUxheWVyKSAtPiBfZmluZEFsbChzZWxlY3RvciwgZnJvbUxheWVyKVswXVxuXG5leHBvcnRzLkZpbmRBbGwgPSAoc2VsZWN0b3IsIGZyb21MYXllcikgLT4gX2ZpbmRBbGwoc2VsZWN0b3IsIGZyb21MYXllcilcbmV4cG9ydHMuxpLGkiAgICAgID0gKHNlbGVjdG9yLCBmcm9tTGF5ZXIpIC0+IF9maW5kQWxsKHNlbGVjdG9yLCBmcm9tTGF5ZXIpXG5cbiMgTWV0aG9kc1xuTGF5ZXI6OmZpbmQgICAgID0gKHNlbGVjdG9yLCBmcm9tTGF5ZXIpIC0+IF9maW5kQWxsKHNlbGVjdG9yLCBAKVswXVxuTGF5ZXI6OsaSICAgICAgICA9IChzZWxlY3RvciwgZnJvbUxheWVyKSAtPiBfZmluZEFsbChzZWxlY3RvciwgQClbMF1cblxuTGF5ZXI6OmZpbmRBbGwgID0gKHNlbGVjdG9yLCBmcm9tTGF5ZXIpIC0+IF9maW5kQWxsKHNlbGVjdG9yLCBAKVxuTGF5ZXI6OsaSxpIgICAgICAgPSAoc2VsZWN0b3IsIGZyb21MYXllcikgLT4gX2ZpbmRBbGwoc2VsZWN0b3IsIEApXG4iXX0=
