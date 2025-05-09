function plot_graph_result(A, BestPosition, plot_type)
% PLOT_GRAPH_RESULT Visualizes the community detection results
% Inputs:
%   A: Adjacency matrix
%   BestPosition: Best solution found (community assignments)
%   plot_type: Type of visualization ('force', 'circle', 'subplot', 'line', or 'all')
%              Default is 'all' which shows all visualization types

if nargin < 3
    plot_type = 'all';
end

n = size(A, 1);
[i, j] = find(triu(A));
edges = [i, j];
G = graph(edges(:,1), edges(:,2));
groups = round(BestPosition);
colors = lines(max(groups));

% English titles
titles = struct();
titles.force = 'Force Layout Visualization';
titles.circle = 'Circle Layout Visualization';
titles.subspace = 'Subspace Layout Visualization';
titles.layered = 'Layered Layout Visualization';
titles.main = 'Community Detection Results';

switch lower(plot_type)
    case 'force'
        figure('Name', 'Force Layout Visualization');
        h = plot(G, 'Layout', 'force', 'LineWidth', 1.5);
        for k = 1:n
            highlight(h, k, 'NodeColor', colors(groups(k), :), 'MarkerSize', 7);
        end
        title('Force Layout Visualization');
        
    case 'circle'
        figure('Name', 'Circle Layout Visualization');
        h = plot(G, 'Layout', 'circle', 'LineWidth', 1.5);
        for k = 1:n
            highlight(h, k, 'NodeColor', colors(groups(k), :), 'MarkerSize', 7);
        end
        title('Circle Layout Visualization');
        
    case 'line'
        figure('Name', '2D Line Plot Visualization');
        % Calculate node positions in 2D space
        [x, y] = deal(zeros(n, 1));
        for i = 1:max(groups)
            group_nodes = find(groups == i);
            % Arrange nodes in a circle for each community
            theta = linspace(0, 2*pi, length(group_nodes) + 1);
            theta = theta(1:end-1);
            x(group_nodes) = i + 0.5 * cos(theta);
            y(group_nodes) = 0.5 * sin(theta);
        end
        
        % Plot nodes
        hold on;
        for i = 1:max(groups)
            group_nodes = find(groups == i);
            plot(x(group_nodes), y(group_nodes), 'o', 'Color', colors(i,:), ...
                'MarkerFaceColor', colors(i,:), 'MarkerSize', 7);
        end
        
        % Plot edges
        for k = 1:size(edges, 1)
            plot([x(edges(k,1)), x(edges(k,2))], [y(edges(k,1)), y(edges(k,2))], ...
                'k-', 'LineWidth', 0.5, 'Color', [0.7 0.7 0.7]);
        end
        
        % Add labels
        for i = 1:n
            text(x(i), y(i), num2str(i), 'FontSize', 8, 'HorizontalAlignment', 'center');
        end
        
        title('2D Line Plot Visualization');
        xlabel('Community');
        ylabel('Position in Community');
        grid on;
        hold off;
        
    case 'subplot'
        figure('Name', 'Multiple Layouts Visualization');
        subplot(2,2,1);
        h1 = plot(G, 'Layout', 'force', 'LineWidth', 1.5);
        for k = 1:n
            highlight(h1, k, 'NodeColor', colors(groups(k), :), 'MarkerSize', 7);
        end
        title('Force Layout');
        
        subplot(2,2,2);
        h2 = plot(G, 'Layout', 'circle', 'LineWidth', 1.5);
        for k = 1:n
            highlight(h2, k, 'NodeColor', colors(groups(k), :), 'MarkerSize', 7);
        end
        title('Circle Layout');
        
        subplot(2,2,3);
        h3 = plot(G, 'Layout', 'subspace', 'LineWidth', 1.5);
        for k = 1:n
            highlight(h3, k, 'NodeColor', colors(groups(k), :), 'MarkerSize', 7);
        end
        title('Subspace Layout');
        
        subplot(2,2,4);
        % Calculate node positions in 2D space
        [x, y] = deal(zeros(n, 1));
        for i = 1:max(groups)
            group_nodes = find(groups == i);
            theta = linspace(0, 2*pi, length(group_nodes) + 1);
            theta = theta(1:end-1);
            x(group_nodes) = i + 0.5 * cos(theta);
            y(group_nodes) = 0.5 * sin(theta);
        end
        
        % Plot nodes
        hold on;
        for i = 1:max(groups)
            group_nodes = find(groups == i);
            plot(x(group_nodes), y(group_nodes), 'o', 'Color', colors(i,:), ...
                'MarkerFaceColor', colors(i,:), 'MarkerSize', 7);
        end
        
        % Plot edges
        for k = 1:size(edges, 1)
            plot([x(edges(k,1)), x(edges(k,2))], [y(edges(k,1)), y(edges(k,2))], ...
                'k-', 'LineWidth', 0.5, 'Color', [0.7 0.7 0.7]);
        end
        
        title('2D Line Plot');
        xlabel('Community');
        ylabel('Position in Community');
        grid on;
        hold off;
        
    case 'all'
        % Create all visualization types in separate figures
        plot_graph_result(A, BestPosition, 'force');
        plot_graph_result(A, BestPosition, 'circle');
        plot_graph_result(A, BestPosition, 'line');
        plot_graph_result(A, BestPosition, 'subplot');
end

% Add legend for communities
if ~strcmpi(plot_type, 'subplot') && ~strcmpi(plot_type, 'line')
    % Create dummy plots for legend
    hold on;
    for i = 1:max(groups)
        plot(NaN, NaN, 'o', 'Color', colors(i,:), 'MarkerFaceColor', colors(i,:), 'MarkerSize', 7);
    end
    legend_entries = cell(max(groups), 1);
    for i = 1:max(groups)
        legend_entries{i} = sprintf('Community %d', i);
    end
    legend(legend_entries, 'Location', 'best');
    hold off;
end

% Add colorbar to show community assignments (only for graph plots)
if ~strcmpi(plot_type, 'line')
    colormap(colors);
    c = colorbar('Ticks', 1:max(groups), 'TickLabels', arrayfun(@(x) sprintf('Community %d', x), 1:max(groups), 'UniformOutput', false));
end

end
