% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gWidgets2tcltk-package.R, R/dnd.R,
%   R/GComponent.R, R/GContainer.R, R/GWidget.R, R/gbutton.R, R/gdf.R,
%   R/glabel.R, R/gprogressbar.R, R/gtimer.R
\docType{package}
\name{gWidgets2tcltk-package}
\alias{gWidgets2tcltk-package}
\alias{DND-class}
\alias{DND}
\alias{GComponent-class}
\alias{GComponent}
\alias{GContainer-class}
\alias{GContainer}
\alias{GWidget-class}
\alias{GWidget}
\alias{GWidgetWithItems-class}
\alias{GWidgetWithItems}
\alias{GButton-class}
\alias{GButton}
\alias{GDf-class}
\alias{GDf}
\alias{GLabel-class}
\alias{GLabel}
\alias{GProgressBar-class}
\alias{GProgressBar}
\alias{GTimer-class}
\alias{GTimer}
\title{gWidgets2tcltk}
\arguments{
\item{...}{passed to constructor}
}
\description{
The \pkg{gWidgets2} package provides a programming interface for
making graphical user interfaces within R. The package is a
rewrite of the \pkg{gWidgets} package, introducing a few external
changes but a significant number of internal ones. The package
relies on one of several underlying toolkit packages providing
access to the graphical libraries. This package provides the
implementation to interface with the underlying \pkg{tcltk}
package.

Drag and drop in \pkg{tcltk} is not supported by any underlying
toolkit functionality. As such, in \pkg{gWidgets2tcltk}  we roll
our own. The result is a little limited: a) you can't drop values
from other applications b) drop targets aren't allowed to be picky
about what they receive (not by mime-type anyways).

GComponent is a parent class for both GContainer and GWidget and
inherits its primary interface from
gWidgets2::BasicToolkitInterface.

The \code{GDf} class provides a means to edit a data frame. We
use the add on TK code provided by tablelist as the underlying
widget

The main reference methods \code{GTimer} are \code{start_timer} and \code{stop_timer}
}
\details{
To implement drag and drop, we bind to the toplevel window the
events: button1, motion and button1 release. The binding occurs
not to to widget, but to the toplevel window containing the
widget. This has some advantages, most imporantly it is unlikely
the binding will be overwritten by usual gWidgets2tcltk
programs. (Recall tkbind will only allow one binding per widget
per signal).

The gWidgets2 way of doing drag and drop is implemented here. You
add a drop source with a handler that returns the value of what
you want to pass via the dnd process. Then you specify a widget as
a drop target and give a handler. This handler receives the data
through the \code{dropdata} component of the "\code{h}"
argument. Here, the value is generated when the drop occurs, not
when the drag initiates. Not sure this makes any difference, but
it might.

Simply click on a row and the editor pops up as a modal
dialog. The shortcut Shift+Enter will go onto the next case,
saving changes provided the auto save featuer is employed.

There is no undo/redo support here. There is no support for
editing rownames (just lazy at the moment, holler if you would
like that). No support to change the dimensions of the data frame
or edit factors, ...
}
\section{Methods}{

\describe{
\item{\code{is_watching()}}{Are we watching for a drag?}

\item{\code{add_drag_motion(handler, action = NULL, ...)}}{Called when motion over widget occurs}

\item{\code{add_to_parent(parent, child, expand = NULL, fill = NULL, anchor = NULL,
  ...)}}{Add a child to parent if it is ia container and non null. Dispatches to add_child method of parent}

\item{\code{get_block()}}{Return surround block}

\item{\code{get_enabled()}}{is widget sensistive to user input}

\item{\code{get_index(drop = NULL, ...)}}{svalue; index=TRUE}

\item{\code{get_tk_id()}}{Return tk ID}

\item{\code{get_toplevel_tk_id()}}{return id of toplevel}

\item{\code{get_value(drop = NULL, ...)}}{Get main value of widget. From `svalue` when index = FALSE or NULL}

\item{\code{get_widget()}}{Return widget (not block)}

\item{\code{is_tkwidget()}}{Is widget older style widget}

\item{\code{is_ttkwidget()}}{Is widget new style widget?. Override in subclass if not}

\item{\code{set_enabled(value, ...)}}{specify with logical if widget is sensistive to user input}

\item{\code{set_size(value, ...)}}{Set widget size (size request), value=c(width=-1, height=-1)}

\item{\code{set_value(value, ..., drop = NULL)}}{for `svalue<-` when index = FALSE or NULL}

\item{\code{add(...)}}{add is just add_child}

\item{\code{child_bookkeeping(child)}}{Update parent property of child and children property of parent container}

\item{\code{get_widget()}}{Return widget (not block)}

\item{\code{connect_to_toolkit_signal(signal, decorator, emitter = handler_widget(), ...)}}{Connect signal of toolkit to notify observer}

\item{\code{remove_border()}}{Remove border by setting relief to none}

\item{\code{get_length(...)}}{Get length of object. Needed for sapply.}

\item{\code{save_data(nm, where)}}{Save data set}

\item{\code{set_interval(ms)}}{Set the interval. Need to stop and start active timer to implement.}

\item{\code{start_timer()}}{Start the timer}

\item{\code{stop_timer()}}{stop the timer}
}}

\author{
John Verzani \email{jverzani@gmail.com}

Maintainer: John Verzani \email{jverzani@gmail.com}
}
\keyword{package}
