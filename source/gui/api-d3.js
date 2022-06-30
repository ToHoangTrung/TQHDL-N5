function displayTrendProductsBarChart(data) {
    const svg = d3.select('svg');

    const margin = 80;
    const width = 1200 - 2 * margin;
    const height = 600 - 2 * margin;

    const chart = svg.append('g')
        .attr('transform', `translate(${margin}, ${margin})`);

    const xScale = d3.scaleBand()
        .range([0, width])
        .domain(data.map((s) => s.productName))
        .padding(0.4)

    const yScale = d3.scaleLinear()
        .range([height, 0])
        .domain([0, d3.max(data, (s) => { return s.amountPurchased;})]);

    const makeYLines = () => d3.axisLeft()
        .scale(yScale)

    chart.append('g')
        .attr('transform', `translate(0, ${height})`)
        .call(d3.axisBottom(xScale));

    chart.append('g')
        .call(d3.axisLeft(yScale));

    chart.append('g')
        .attr('class', 'grid')
        .call(makeYLines()
            .tickSize(-width, 0, 0)
            .tickFormat('')
        )

    const barGroups = chart.selectAll()
        .data(data)
        .enter()
        .append('g')

    barGroups
        .append('rect')
        .attr('class', 'bar')
        .attr('x', (g) => xScale(g.productName))
        .attr('y', (g) => yScale(g.amountPurchased))
        .attr('height', (g) => height - yScale(g.amountPurchased))
        .attr('width', xScale.bandwidth())
        .on('mouseover', function (){
            d3.select(this)
                .transition()
                .duration(300)
                .attr('opacity', 0.6);
        })
        .on('mouseleave', function (){
            d3.select(this)
                .transition()
                .duration(300)
                .attr('opacity', 1);
        })

    barGroups
        .append('text')
        .attr('class', 'value')
        .attr('x', (a) => xScale(a.productName) + xScale.bandwidth() / 2)
        .attr('y', (a) => yScale(a.amountPurchased) + 30)
        .attr('text-anchor', 'middle')
        .text((a) => `${a.amountPurchased}`)

    svg.append('text')
        .attr('class', 'label')
        .attr('x', -(height / 2) - margin)
        .attr('y', margin / 2.4)
        .attr('transform', 'rotate(-90)')
        .attr('text-anchor', 'middle')
        .text('Amount Purchased')

    svg.append('text')
        .attr('class', 'label')
        .attr('x', width / 2 + margin)
        .attr('y', height + margin * 1.7)
        .attr('text-anchor', 'middle')
        .text('Product Name')

    svg.append('text')
        .attr('class', 'title')
        .attr('x', width / 2 + margin)
        .attr('y', 40)
        .attr('text-anchor', 'middle')
        .text('Trend Products')
}
