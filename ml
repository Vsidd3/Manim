from manim import *

class MachineLearningIntro(Scene):
    def construct(self):
        self.scene_1_introduction()
        self.scene_2_regression()
        self.scene_3_classification()
        self.scene_4_clustering()
        self.scene_5_neural_networks()
        self.scene_6_recommender_anomaly()
        self.scene_7_reinforcement_learning()
        self.scene_8_conclusion()

    def scene_1_introduction(self):
        # Scene 1: Introduction (0-5 seconds)
        self.camera.background_color = DARK_GRAY
        grid = NumberPlane(
            x_range=(-8, 8, 1),
            y_range=(-4.5, 4.5, 1),
            faded_line_ratio=2
        ).set_opacity(0.1)
        title_text = Text(
            "Introducing: The Ultimate Machine Learning Course",
            font_size=36,
            color=BLUE_C
        ).scale(1.2)
        light_sweep = Rectangle(
            width=FRAME_WIDTH,
            height=0.5,
            fill_color=WHITE,
            fill_opacity=0.5,
            stroke_opacity=0
        )
        light_sweep.move_to(LEFT * FRAME_WIDTH)
        
        self.add(grid)
        self.play(
            FadeIn(title_text, shift=UP, run_time=2),
            Sound("swoosh_sound.mp3", time_offset=0)
        )
        self.play(
            light_sweep.animate.move_to(RIGHT * FRAME_WIDTH),
            run_time=2
        )
        self.wait(1)
        narration = Text(
            "Unlock the world of intelligent systems and data-driven decisions.",
            font_size=24,
            color=LIGHT_GRAY
        ).next_to(title_text, DOWN)
        self.play(FadeIn(narration, run_time=2))
        self.wait(1)
        self.play(FadeOut(title_text, narration, light_sweep))

    def scene_2_regression(self):
        # Scene 2: Regression (5-8 seconds)
        self.camera.background_color = WHITE
        axes = Axes(
            x_range=[0, 10, 1],
            y_range=[0, 10, 1],
            x_length=6,
            y_length=6,
            axis_config={"include_numbers": True}
        ).to_edge(LEFT)
        dots = VGroup(*[
            Dot(axes.coords_to_point(x, 0.5 * x + np.random.normal(0, 0.5)), color=BLUE)
            for x in np.linspace(1, 9, 15)
        ])
        regression_line = axes.get_graph(lambda x: 0.5 * x, color=RED)
        equation = MathTex("y = 0.5x").next_to(axes, UP)
        title = Text("Regression", font_size=36, color=BLACK).to_edge(RIGHT)

        self.play(Create(axes), run_time=2)
        self.play(FadeIn(dots, lag_ratio=0.1), run_time=2)
        self.play(Create(regression_line), run_time=2)
        self.play(Write(equation), FadeIn(title))
        self.wait(1)
        self.play(FadeOut(axes, dots, regression_line, equation, title))

    def scene_3_classification(self):
        # Scene 3: Classification (8-11 seconds)
        self.camera.background_color = "#001f3f"
        plane = NumberPlane(x_range=[-5, 5], y_range=[-3, 3], background_line_style={"stroke_color": DARK_BLUE})
        class_A = VGroup(*[
            Dot(point=plane.coords_to_point(x, y), color=GREEN)
            for x, y in [(-3, -1), (-2, -2), (-3.5, 0), (-2.5, -0.5)]
        ])
        class_B = VGroup(*[
            Dot(point=plane.coords_to_point(x, y), color=YELLOW)
            for x, y in [(2, 1), (3, 2), (2.5, 0.5), (3.5, 1.5)]
        ])
        decision_boundary = Line(
            plane.coords_to_point(0, -3),
            plane.coords_to_point(0, 3),
            color=RED
        )
        title = Text("Classification", font_size=36, color=WHITE).to_edge(UP)

        self.play(Create(plane), run_time=2)
        self.play(FadeIn(class_A, class_B), run_time=2)
        self.play(Create(decision_boundary), run_time=2)
        self.play(Write(title))
        self.wait(1)
        self.play(FadeOut(plane, class_A, class_B, decision_boundary, title))

    def scene_4_clustering(self):
        # Scene 4: Clustering (11-14 seconds)
        self.camera.background_color = BLACK
        cluster_1 = VGroup(*[
            Dot(point=[np.random.normal(-2, 0.5), np.random.normal(2, 0.5), 0], color=BLUE)
            for _ in range(10)
        ])
        cluster_2 = VGroup(*[
            Dot(point=[np.random.normal(2, 0.5), np.random.normal(-2, 0.5), 0], color=GREEN)
            for _ in range(10)
        ])
        cluster_3 = VGroup(*[
            Dot(point=[np.random.normal(0, 0.5), np.random.normal(0, 0.5), 0], color=YELLOW)
            for _ in range(10)
        ])
        labels = VGroup(
            Text("Cluster 1", color=BLUE).next_to(cluster_1, UP),
            Text("Cluster 2", color=GREEN).next_to(cluster_2, DOWN),
            Text("Cluster 3", color=YELLOW).next_to(cluster_3, RIGHT)
        )
        title = Text("Clustering", font_size=36, color=WHITE).to_edge(UP)

        self.play(FadeIn(cluster_1, cluster_2, cluster_3), run_time=2)
        self.play(FadeIn(labels), Write(title))
        self.wait(1)
        self.play(FadeOut(cluster_1, cluster_2, cluster_3, labels, title))

    def scene_5_neural_networks(self):
        # Scene 5: Neural Networks (14-18 seconds)
        self.camera.background_color = gradient_color([BLACK, DARK_GRAY], 5)
        layers = []
        for i, n in enumerate([3, 5, 4, 2]):
            layer = VGroup(*[
                Circle(radius=0.2, fill_color=WHITE, fill_opacity=1, stroke_color=WHITE)
                for _ in range(n)
            ]).arrange(DOWN, buff=0.5)
            layer.move_to([i * 2 - 3, 0, 0])
            layers.append(layer)
        connections = VGroup()
        for i in range(len(layers) - 1):
            for neuron_a in layers[i]:
                for neuron_b in layers[i + 1]:
                    line = Line(neuron_a.get_center(), neuron_b.get_center(), stroke_color=GRAY, stroke_width=1)
                    connections.add(line)
        title = Text("Neural Networks", font_size=36, color=WHITE).to_edge(UP)

        self.play(*[FadeIn(layer, shift=UP, run_time=1) for layer in layers])
        self.play(Create(connections, lag_ratio=0.01, run_time=2))
        self.play(Write(title))
        self.wait(1)
        self.play(FadeOut(VGroup(*layers, connections, title)))

    def scene_6_recommender_anomaly(self):
        # Scene 6: Recommender Systems & Anomaly Detection (18-24 seconds)
        # Left Side: Recommender Systems
        recommender_bg = Rectangle(
            width=6, height=6,
            fill_color="#f0f0f0",
            fill_opacity=1,
            stroke_color=BLACK
        ).to_edge(LEFT, buff=1)
        products = VGroup(*[
            Square(side_length=1, fill_color=BLUE_D, fill_opacity=0.8, stroke_color=WHITE).shift(UP * i + RIGHT * j)
            for i in [1, 0, -1] for j in [-1, 0, 1]
        ]).move_to(recommender_bg.get_center())
        recommended_tag = Text("Recommended for you", font_size=24, color=BLACK).next_to(recommender_bg, UP)
        
        # Right Side: Anomaly Detection
        anomaly_bg = Rectangle(
            width=6, height=6,
            fill_color="#1a1a1a",
            fill_opacity=1,
            stroke_color=BLACK
        ).to_edge(RIGHT, buff=1)
        data_stream = VGroup(*[
            Dot(point=[np.random.uniform(-2, 2), np.random.uniform(-2, 2), 0], color=GREEN)
            for _ in range(30)
        ]).move_to(anomaly_bg.get_center())
        anomalies = VGroup(*[
            Circle(radius=0.2, color=RED).move_to(dot.get_center())
            for dot in data_stream[:3]
        ])
        anomaly_label = Text("Anomaly Detected", font_size=24, color=RED).next_to(anomaly_bg, UP)

        title_left = Text("Recommender Systems", font_size=24, color=BLACK).next_to(recommender_bg, DOWN)
        title_right = Text("Anomaly Detection", font_size=24, color=WHITE).next_to(anomaly_bg, DOWN)

        self.play(FadeIn(recommender_bg, products, recommended_tag, title_left), run_time=2)
        self.play(FadeIn(anomaly_bg, data_stream, anomalies, anomaly_label, title_right), run_time=2)
        self.wait(2)
        self.play(FadeOut(recommender_bg, products, recommended_tag, title_left, anomaly_bg, data_stream, anomalies, anomaly_label, title_right))

    def scene_7_reinforcement_learning(self):
        # Scene 7: Reinforcement Learning (24-27 seconds)
        self.camera.background_color = DARK_GREY
        grid = NumberPlane().add_coordinates()
        agent = Square(side_length=0.5, fill_color=YELLOW, fill_opacity=1).move_to(grid.c2p(-3, -3))
        goal = Star(color=GREEN, fill_opacity=1).move_to(grid.c2p(3, 3))
        obstacles = VGroup(*[
            Rectangle(width=1, height=1, fill_color=RED, fill_opacity=1).move_to(grid.c2p(x, y))
            for x, y in [(-1, 0), (0, 1), (1, -1)]
        ])

        self.play(Create(grid), FadeIn(agent, goal, obstacles))
        path = [grid.c2p(-3, -3), grid.c2p(-2, -2), grid.c2p(-1, -1), grid.c2p(0, 0), grid.c2p(1, 1), grid.c2p(2, 2), grid.c2p(3, 3)]
        self.play(MoveAlongPath(agent, VMobject().set_points_as_corners(path)), run_time=4)
        self.play(Indicate(goal, scale_factor=1.5))
        title = Text("Reinforcement Learning", font_size=36, color=WHITE).to_edge(UP)
        self.play(Write(title))
        self.wait(1)
        self.play(FadeOut(grid, agent, goal, obstacles, title))

    def scene_8_conclusion(self):
        # Scene 8: Conclusion (27-30 seconds)
        self.camera.background_color = DARK_GRAY
        grid = NumberPlane(
            x_range=(-8, 8, 1),
            y_range=(-4.5, 4.5, 1),
            faded_line_ratio=2
        ).set_opacity(0.1)
        final_text = Text(
            "Master Machine Learning with Us",
            font_size=40,
            color=BLUE_C
        )
        border = SurroundingRectangle(final_text, color=WHITE, buff=0.5)
        call_to_action = Text(
            "Subscribe Now",
            font_size=32,
            color=YELLOW
        ).next_to(final_text, DOWN, buff=0.5)

        self.add(grid)
        self.play(Write(final_text), Create(border), run_time=2)
        self.play(FadeIn(call_to_action, scale=0.5), run_time=1)
        self.wait(2)
        self.play(FadeOut(final_text, border, call_to_action, grid))
