# -*- coding: utf-8 -*-
"""
Created on Thu May  8 14:16:22 2025

@author: Eduardo_Mendes
"""

import matplotlib.pyplot as plt
import plotly.express as px
import plotly.io as pio
import plotly.graph_objects as go
import numpy as np

pio.renderers.default='browser'

def axis_stuff(figure):
    
    figure.update_xaxes(title_text="X [mm]")
    figure.update_yaxes(title_text="Y [mm]")

    figure.update_xaxes(nticks=10, tickfont=dict(size=14))
    figure.update_yaxes(nticks=10, tickfont=dict(size=14))
    
    figure.update_xaxes(
        ticks="outside",
        ticklen=3,
        tickwidth=1,
        showline=True
    )
    
    figure.update_yaxes(
        ticks="outside",
        ticklen=3,
        tickwidth=1,
        showline=True
    )
    
    return figure;

def draw_circumference(length, figure):
    ##
    ## Adicionar circunferência
    ##
    
    # Definir centro e raio
    cx, cy = 0, 0  # coordenadas do centro
    r = length / (2*np.pi)          # raio
    
    figure.add_shape(
        type="circle",
        xref="x", yref="y",
        x0=cx - r, y0=cy - r,
        x1=cx + r, y1=cy + r,
        line_color="white",
        line_width=1
    )
    
    return figure;

def draw_square(x0, y0, L, figure):
    
    # square parameters (pixel coordinates)
   
    cx, cy = 0, 0  # coordenadas do centro
    
    figure.add_shape(
        type="rect",
        xref="x", yref="y",
        x0= cx - x0,
        y0= cy - y0,
        x1= (cx - x0) + L,
        y1= (cy - y0) + L,
        line_color="white",
        line_width=1,
        layer="above"   # <-- critical
    )

    return figure;

def draw_line_hor(figure, L):
    
    xc, yc = 0, 0  # coordenadas do centro
    
    figure.add_shape(
        type="line",
        x0=xc - L/2,
        y0=yc,
        x1=xc + L/2,
        y1=yc,
        line=dict(color="white", width=1),
        layer="above",   # <-- critical
        row=1, col=1
    )
    
    return figure;


def draw_line_vert(figure, L):
    
    xc, yc = 0, 0  # coordenadas do centro
    
    figure.add_shape(
        type="line",
        x0=xc,
        y0=yc - L/2,
        x1=xc,
        y1=yc + L/2,
        line=dict(color="white", width=1),
        layer="above",   # <-- critical
        row=1, col=1
    )
    
    return figure;

def add_text(text,figure, x_pos, y_pos):
    
    figure.update_layout(
        annotations=[
            dict(
                showarrow=False,
                text=text,
                xref="paper", yref="paper",
                x=x_pos, y=y_pos,
                font=dict(size=16, color="white"),
                bgcolor="rgba(0,0,0,0.7)",
                borderpad=4
            )
        ]
    )
    
    return figure;

def add_title(title, figure, x_pos):
    
    figure.update_layout(
        title=title,
        title_x=x_pos,  # 0 = esquerda, 0.5 = centro, 1 = direita
    )
    
    figure.update_layout(
        title=dict(
            font=dict(size=20)
        )
    )
    
    return figure;

def color_bar_stuff(figure):
    
    figure.update_coloraxes(
        colorbar=dict(
            title=dict(
                text="Pressure [kPa]",
                side="right",
                font=dict(size=18)
            ),
            len=0.85,
            y=0.5,
            yanchor="middle"
        )
    )
    
    return figure;

def plot_plane(pressure, x_plane, z_plane, dt, Tau, Stimulus, n_frame, n_SP, z_max, SHOW = 0):
    
    zmin = 0.0
    zmax = z_max   # choose your limits
    
    fig = px.imshow(pressure/1e3, x=x_plane*1000, y=z_plane*1000,
                    origin='lower',
                    color_continuous_scale="Jet",
                    #contrast_rescaling='minmax',
                    #aspect="auto",
                    zmin=0,             # Fix minimum value for colorscale
                    zmax=zmax/1e3         # Fix maximum value for colorscale (Valor obtido para uma linha de 58 transdutores)
                    )
    
    
    ##
    ## DRAW Circumference
    ##
    
    #fig = draw_circumference(0.157*1000, fig);
    
    ##
    ## DRAW Square
    ##   
   
    length = 0.24 * 1000;

    x0, y0 = length/8, length/8;
    
    #fig = draw_square(x0, y0, length/4, fig);
    
    
    ##
    ## DRAW Line
    
    length = 0.095 * 1000;
    
    #fig = draw_line_hor(fig, length);
    
    #fig = draw_line_vert(fig, length);
    
    
    
    ##
    ## ADD Texto Tempo
    ##    
    
    duration = n_frame * dt;
    duration = round(duration,3)
    
    
    text = "Elapsed time: " + str(duration) + " s";
    x=0.5; y=1.05;
    fig = add_text(text,fig, x, y);

    
    ##
    ## ADD TITLE
    ##    
    
    #title = "SP " + str(n_SP);
    title = "Acoustic Field ";
    x_pos = 0.5;
    fig = add_title(title, fig, x_pos);

    
    ##
    ## PLOT STUFF
    ##    
    
    # Títulos dos eixos
    
    fig = axis_stuff(fig);
    
 
    ##
    ## COLOR BAR
    ##
    
    fig = color_bar_stuff(fig);
    
    ##
    ## 1:1 Aspect ratio
    ##
    
    ny, nx = pressure.shape  # rows, cols
    
    fig.update_xaxes(constrain="domain")
    fig.update_yaxes(constrain="domain", scaleanchor="x", scaleratio=1)
    
    # choose one dimension and compute the other
    W = 500
    H = int(W * ny / nx)
    
    fig.update_layout(width=W, height=H)
    
    ## SET Z-Limits    
    # for tr in fig.data:
    #     if tr.type == "heatmap":
    #         tr.update(zmin=zmin, zmax=zmax)
        
    
    if SHOW == 1:
        fig.show()

    return fig;
    
    
    