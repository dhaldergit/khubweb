

    function dateFormat(date, fmt) {
        var o = {
            "M+": date.getMonth() + 1,
            "d+": date.getDate(),
        };
        if (/(y+)/.test(fmt)){
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        }
        for (var k in o) {
            if (new RegExp("(" + k + ")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            }
        }
        return fmt;
    }
function implementRange(minDate, maxDate) {
    var startDate = new Date(minDate),
        endDate = new Date(maxDate),
        offset = parseInt((endDate - startDate)/(1000*30*24*60*60));
    var dateShown = new Date(minDate);
    
    RangePicker.prototype = {
            constructor: RangePicker,
            __defaultOptions: {
                type: "single"
            },
            __template: "<div class='range-picker-wrapper'>" +
                          "<div class='range-picker'>" +                            
                            "<span id='startVal' name='startVal' class='label range-label'><%= startValue %></span>" +
                            "<span id='endVal' name = 'endVal'  class='label range-label end-label'><%= endValue %></span>" +
                            "<span class='not-select-process'></span>" +
                          "</div>" +
                        "</div>",
            __init: function(container, options) {
                this.__options = $.extend({}, this.__defaultOptions, options);
                this.__$containerElement = container;
                this.__render();
                this.__$rangepickerElement = this.__$containerElement.find(".range-picker");
                this.__addWidget();
                this.__setContainerToWrapperWidget();
                this.__setCursorInitialPosition();
                this.__updateProcessBarView();
            },

            __render: function() {
                var templateValue = {
                    startValue: this.__options.startValue,
                    endValue: this.__options.endValue
                },
                viewStr = replace(this.__template, templateValue);
                this.__$containerElement.html(viewStr);
            },

            __addWidget: function() {
                var positionChangeCallback = $.proxy(this.__handleLabelPositionChange, this);

                this.__selectCursors = [];
                this.__selectCursors.push(new Cursor({positionChange: positionChangeCallback}));
               
                if (this.__options.type === "double") {
                    this.__selectCursors.push(new Cursor({ positionChange: positionChangeCallback}));
                }
                this.__processBar = new ProcessBar();

                this.__$rangepickerElement.append(this.__processBar.getJQueryElement());
                for(var i = 0; i < this.__selectCursors.length; i++) {
                    this.__$rangepickerElement.append(this.__selectCursors[i].getJQueryElement());
                }
                this.__setWidgetInitialValue();
            },

            __setWidgetInitialValue: function() {
                var totalWidth = this.__$rangepickerElement.width();
               
                /*this.__selectCursors[0].render(
                    this.__options.translateSelectLabel(totalWidth, totalWidth)
                );*/

                if (!isUndefined(this.__selectCursors[1])) {
                    var cursor = this.__selectCursors[1];
                   // cursor.render(this.__options.translateSelectLabel(0, totalWidth));
                }
            },

            __setCursorInitialPosition: function() {
                var totalWidth = this.__$rangepickerElement.width(),
                    cursors = this.__selectCursors;

                cursors[0].updateArrowPosition(totalWidth);
                cursors[0].setTotalWidth(totalWidth);
                if (!isUndefined(cursors[1])) {
                    cursors[1].updateArrowPosition(0);
                    cursors[1].setTotalWidth(totalWidth);
                }
            },

            __setContainerToWrapperWidget: function() {
              
                var wrapperElement = this.__$containerElement.find(".range-picker-wrapper"),
                    cursors = this.__selectCursors,
                    totalWidth = this.__$rangepickerElement.width(),
                    cursorHeight = -(cursors[0].getJQueryElement().position().top);

                if (!isUndefined(cursors[1]) &&
                    -(cursors[1].getJQueryElement().position().top) > cursorHeight) {
                    cursorHeight = -(cursors[1].getJQueryElement().position().top);
                }
                wrapperElement.css("paddingTop", cursorHeight + "px");

               
                var endCursorElement = cursors[0].getJQueryElement(),
                    paddingRight = endCursorElement.outerWidth() / 2,
                    paddingLeft = null;
               // cursors[0].render(this.__options.translateSelectLabel(0, totalWidth));
                paddingLeft = endCursorElement.outerWidth() / 2;
               
               // cursors[0].render(this.__options.translateSelectLabel(totalWidth, totalWidth));

                wrapperElement.css({
                    paddingLeft: paddingLeft + "px",
                    paddingRight: paddingRight + "px"
                });

            },

            __handleLabelPositionChange: function(position) {
                this.__updateView(position.left);
            },

            __updateView: function() {
                this.__updateCursorView();
                this.__updateProcessBarView();
            },

            __updateCursorView: function() {
                var i = 0,
                    labelText = "",
                    position = null;

                for(; i < this.__selectCursors.length; i++) {
                    position = this.__selectCursors[i].getArrowPosition();
                    labelText = this.__options.translateSelectLabel(position.left,
                            this.__$rangepickerElement.width());
                   // this.__selectCursors[i].render(labelText);
                    var stDate = new Date(document.getElementById("startVal").innerHTML);
                    var enDate = new Date(document.getElementById("endVal").innerHTML);
                    var lbDate = new Date(labelText);
                    if(i == 1 && lbDate < enDate) {
                    	document.getElementById("startVal").innerHTML = labelText;
                    	document.getElementById("minDate").value = labelText;
                    } else if (i == 1 && lbDate > enDate) {
                    	document.getElementById("endVal").innerHTML = labelText;
                    	document.getElementById("maxDate").value = labelText;
                		
                    } else if (i == 0 && lbDate > stDate) {
                    	document.getElementById("endVal").innerHTML = labelText;
                    	document.getElementById("maxDate").value = labelText;
                		
                    } else if(i == 0 && lbDate < stDate) {
                    	document.getElementById("startVal").innerHTML = labelText;
                    	document.getElementById("minDate").value = labelText;
                    }
                }

            },

            __updateProcessBarView: function() {
                var cursorPosition = this.__getCursorPosition(),
                    processBarPosition = {
                        left: cursorPosition.start,
                        right: this.__$rangepickerElement.width() - cursorPosition.end
                    };
                this.__processBar.updatePosition(processBarPosition);
            },

            __getCursorPosition: function() {
                var position = {
                    start: 0,
                    startLabel: ""
                },
                tmpPosition = this.__selectCursors[0].getArrowPosition();

               
                position.end = tmpPosition.left;
                position.endLabel = tmpPosition.positionLabel;

                if (!isUndefined(this.__selectCursors[1])) {
                    tmpPosition = this.__selectCursors[1].getArrowPosition();
                   
                    if (tmpPosition.left > position.end) {
                            position.start = position.end;
                            position.startLabel = position.endLabel;
                            position.end = tmpPosition.left;
                            position.endLabel = tmpPosition.positionLabel;
                    } else {
                        position.start = tmpPosition.left;
                        position.startLabel = tmpPosition.positionLabel;
                    }
                }

                return position;
            },

            __formatPositionValue: function(value, cursorLeftPosition) {
                var totalWidth = this.__$rangepickerElement.width(),
                    offset = 0;
                value = value.replace(/\s+/, "");

                if (value[value.length - 1] === "%") {
                    offset = totalWidth * parseInt(value, 10) / 100;
                } else {
                    offset = cursorLeftPosition + parseInt(value, 10);
                }

                return offset;
            },

            getSelectValue: function() {
                var position = this.__getCursorPosition();
                position.totalWidth = this.__$rangepickerElement.width();

                return position;
            },

            updatePosition: function(endValue, startValue) {
                var cursors = this.__selectCursors;
                cursors[0].updateArrowPosition(this.__formatPositionValue(endValue,
                                                   cursors[0].getArrowPosition().left));
                if (!isUndefined(cursors[1]) && !isUndefined(startValue)) {
                    cursors[1].updateArrowPosition(this.__formatPositionValue(startValue,
                                                    cursors[1].getArrowPosition().left));
                }
                this.__updateView();
            }
        };

        function Cursor(options) {
            this.__init(options);
        }

        Cursor.prototype = {
            constructor: Cursor,
            __defaultOptions: {
                positionChange: $.loop
            },
            __template: "<span class='label select-label'></span>",

            __init: function(options) {
                this.__options = $.extend({}, this.__defaultOptions, options);
                this.__$element = $(this.__template);
                this.__bindDragEventHandler();
            },

            __bindDragEventHandler: function() {
                var self = this;

                this.__$element.on("mousedown", function(event) {
                    this.__rangepicker = {
                        isMouseDown: true,
                        mouseStartX: event.clientX,
                        previousMoveDistance: 0
                    };
                   
                    $(this).css("zIndex", 1000);
                }).on("mouseup", function() {
                    this.__rangepicker = null;
                    $(this).css("zIndex", 1);
                }).on("mousemove", function(event) {
                    if (this.__rangepicker && this.__rangepicker.isMouseDown) {
                        self.__handleDragEvent(event.clientX, this.__rangepicker);
                    }
                }).on("mouseout", function() {
                    $(this).css("zIndex", 1);
                    this.__rangepicker = null;
                });
            },

            __handleDragEvent: function(clientX, elementData) {
                var distance = clientX - elementData.mouseStartX - elementData.previousMoveDistance;
                elementData.previousMoveDistance = clientX - elementData.mouseStartX;
                var position = this.__calculatePosition(distance);
                this.updateArrowPosition(position);
               
                this.__options.positionChange(this.getArrowPosition(), this.__$element);

            },

            __calculatePosition: function(offset) {
                var newPosition = this.__arrowPosition + offset;
               
                if (newPosition > this.__totalWidth) {
                    newPosition = this.__totalWidth;
                } else if (newPosition < 0) {
                    newPosition = 0;
                }

                return newPosition;
            },

            __updatePosition: function(position) {
                for(var key in position) {
                    if (position.hasOwnProperty(key)) {
                        this.__$element.css(key, position[key] + "px");
                    }
                }
            },

            render: function(textValue) {
                this.__$element.text(textValue);
            },

            updateArrowPosition: function(position) {
                this.__arrowPosition = position;
                this.__updatePosition({
                    left: position - this.__$element.outerWidth() / 2 
                });
            },

            getJQueryElement: function() {
                return this.__$element;
            },

            getArrowPosition: function() {
                return {
                    left: this.__arrowPosition,
                    positionLabel: this.__$element.text()
                };
            },

            setTotalWidth: function(totalWidth) {
                this.__totalWidth = totalWidth;
            }
        };

        function ProcessBar(options) {
            this.__init(options);
        }

        ProcessBar.prototype = {
            constructor: ProcessBar,
            __template: "<span class='process'></span>",
            __init: function() {
                this.__$element = $(this.__template);
            },

            updatePosition: function(position) {
                for(var key in position) {
                    if (position.hasOwnProperty(key)) {
                        this.__$element.css(key, position[key] + "px");
                    }
                }
            },

            getJQueryElement: function() {
                return this.__$element;
            }
        };

        $.fn.rangepicker = function(options) {
            return new RangePicker(this, options);
        };

    
    
    
    $("#date_range").rangepicker({
        startValue: dateFormat(startDate, "yyyy/MM/dd"),
        endValue: dateFormat(endDate, "yyyy/MM/dd"),
        translateSelectLabel: function(currentPosition, totalPosition) {
            var timeOffset = offset * ( currentPosition / totalPosition);
            var date = new Date(+startDate + parseInt(timeOffset));
            return dateFormat(date, "yyyy/MM/dd");
        }
    });

   /* window.hello = $("#double_date_range").rangepicker({
        type: "double",
        startValue: dateFormat(startDate, "yyyy/MM/dd"),
        endValue: dateFormat(endDate, "yyyy/MM/dd"),
        translateSelectLabel: function(currentPosition, totalPosition) {
            var timeOffset = offset * ( currentPosition / totalPosition);
            var date = new Date(+startDate + parseInt(timeOffset));
            return dateFormat(date, "yyyy/MM/dd");
        }
    });
*/
    var doubleDataRange = $("#double_date_range").rangepicker({
        type: "double",
        startValue: dateFormat(startDate, "yyyy/MM/dd"),
        endValue: dateFormat(endDate, "yyyy/MM/dd"),
        translateSelectLabel: function(currentPosition, totalPosition) {
            var timeOffset = offset * ( currentPosition / totalPosition);
            dateShown = new Date(minDate);
            console.log("dateShown.getYear():: "+dateShown.getYear());
            dateShown.setMonth(dateShown.getMonth() + timeOffset % 12);
            dateShown.setYear(dateShown.getFullYear() + (timeOffset / 12));
            console.log("dateShown:: "+dateShown);
            return dateFormat(dateShown, "yyyy/MM/dd");
        }
    });
    
    
   
    $("#number_range").rangepicker({
        startValue: 0,
        endValue: 100,
        translateSelectLabel: function(currentPosition, totalPosition) {
            return parseInt(100 * (currentPosition / totalPosition));
        }
    });

    $("#double_number_range").rangepicker({
        type: "double",
        startValue: 0,
        endValue: 100,
        translateSelectLabel: function(currentPosition, totalPosition) {
            return parseInt(100 * (currentPosition / totalPosition));
        }
    });

    var week = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    $("#week_range").rangepicker({
        type: "double",
        startValue: week[0],
        endValue: week[6],
        translateSelectLabel: function(currentPosition, totalPosition) {
            var index = parseInt(6 * (currentPosition / totalPosition));
            return week[index];
        }
    });

    var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    $("#month_range").rangepicker({
        type: "double",
        startValue: month[0],
        endValue: month[11],
        translateSelectLabel: function(currentPosition, totalPosition) {
            var index = parseInt(11 * (currentPosition / totalPosition));
            return month[index];
        }
    });

}
