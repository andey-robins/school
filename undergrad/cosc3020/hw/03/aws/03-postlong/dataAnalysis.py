import numpy as np
import plotly.graph_objects as go
import plotly.express as px
import pandas as pd

def main():

    with open("results.txt", "r") as f:
        lines = f.readlines()

    time = []
    graph = []
    hkTime = []
    lsTime = []
    hkCost = []
    lsCost = []
    costDiff = []

    for line in lines:
        l = parseLine(line)
        time.append(l[0])
        graph.append(l[1])
        hkTime.append(l[2])
        lsTime.append(l[3])
        hkCost.append(l[4])
        lsCost.append(l[5])
        costDiff.append(int(l[5]) - int(l[4]))

    sizes = range(len(lines) + 3)[3:]   # calculate value for the correct x-axis scale

    # generate runtime comparison graph
    runtimeFig = go.Figure()
    runtimeFig.add_trace(go.Scatter(x=sizes, y=hkTime, mode='lines+markers', name='Held Karp Time'))
    # runtimeFig.add_trace(go.Scatter(x=sizes, y=lsTime, mode='lines+markers', name='Local Search Time'))
    runtimeFig.update_layout(title='Runtime Comparison', xaxis_title='Nodes in Graph', yaxis_title='Runtime (Seconds)')
    runtimeFig.show()

    # # generate a cost comparison graph
    # costFig = go.Figure(data=[
    #     go.Bar(name='True Cost', x=sizes, y=hkCost),
    #     go.Bar(name='Local Search Cost', x=sizes, y=lsCost),
    #     go.Bar(name='Difference', x=sizes, y=costDiff)
    # ])
    # costFig.update_layout(title='Found Cost Comparison', xaxis_title='Nodes in Graph', yaxis_title='Cost')
    # costFig.show()
    #
    # # generate a cost comparison graph
    # bins = [0, 10, 30, 80, 200, 2000]
    #
    # labels = ['Excellent', 'Acceptable', 'Poor', 'Terrible', 'Unnaceptable']
    # colors = {  'Terrible': 'red',
    #             'Poor': 'orange',
    #             'Acceptable': 'lightgreen',
    #             'Excellent': 'darkgreen',
    #             'Unnaceptable': 'black'}
    #
    # df = pd.DataFrame({ 'y': costDiff,
    #                     'x': sizes,
    #                     'label': pd.cut(costDiff, bins=bins, labels=labels)})
    #
    # bars = []
    # for label, label_df in df.groupby('label'):
    #     bars.append(go.Bar(x=label_df.x,
    #                        y=label_df.y,
    #                        name=label,
    #                        marker={'color': colors[label]}))
    #
    # diffFig = go.Figure(data=bars)
    # diffFig.update_layout(title='Quality of Difference Between Held-Karp and Local Search', xaxis_title='Nodes in Graph', yaxis_title='Cost Difference')
    # diffFig.show()

    return

def parseLine(line):
    o = []
    m = []
    l = line.split(',')
    flag = False
    for e in l:
        if '[' in e:
            flag = True

        if ']' in e:
            flag = False
            m.append(e[:-1])
            o.append(m)
            continue

        if flag:
            m.append(e[1:])
        else:
            o.append(e)
    return o

if __name__ == '__main__':
    main()
