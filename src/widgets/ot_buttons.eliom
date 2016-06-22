[%%shared.start]

open Eliom_content.Html
open Eliom_content.Html.F


let%shared dropdown ?(a = []) ~menu content =
  let dropdown = D.div ~a:(a_class ["ot-dropdown"] :: a)
    (content @ [div ~a:[a_class ["ot-dropdown-menu"]] menu]) in
  (* the following does nothing, but still fixes hover anomalies on iPad *)
  ignore [%client (
    Lwt.async @@ fun () -> Lwt_js_events.clicks (To_dom.of_element ~%dropdown)
      (fun ev _ -> Lwt.return ())
  :_)];
  dropdown