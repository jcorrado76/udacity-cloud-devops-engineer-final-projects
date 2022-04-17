import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
import plotly.graph_objects as go

MARKER_COLORS = [
    "Gold",
    "MediumTurquoise",
    "LightGreen",
    "firebrick"
]

app = dash.Dash(__name__)
app.layout = html.Div([
    html.P("Color:"),
    dcc.Dropdown(
        id="dropdown",
        options=[
            {
                "label": x,
                "value": x
            } for x in MARKER_COLORS
        ],
        value="Gold",
        clearable=False
    ),
    dcc.Graph(id="graph")
])


@app.callback(
    Output("graph", "figure"),
    [Input("dropdown", "value")]
)
def display_color(color):
    return go.Figure(data=go.Bar(y=[2, 3, 1], marker_color=color))


app.run_server(host="0.0.0.0", port=8050, debug=True)
