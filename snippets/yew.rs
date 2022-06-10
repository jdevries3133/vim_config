use yew::prelude::*;

struct $NAME$;

enum Msg {
}

impl Component for $NAME$ {
    type Message = Msg;
    type Properties = ();

    fn create(ctx: &Context<Self>) -> Self {
        Self
    }

    fn view(&self, ctx: &Context<Self>) -> Html {
        html! {
            $HTML$
        }
    }
}
