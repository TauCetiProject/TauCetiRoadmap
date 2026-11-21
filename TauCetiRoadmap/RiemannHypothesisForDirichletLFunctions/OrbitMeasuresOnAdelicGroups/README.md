# Roadmap: orbit measures on adelic groups

**Summary.** Let `F` be a number field and `G` a connected linear algebraic group over `F`. The Tamagawa measure `τ_G` of the adelic points `G(𝔸_F)` is the restricted product over the places `v` of the measures `|ω|_v` of an invariant gauge form `ω`, corrected by convergence factors and a power of the discriminant, and the Tamagawa number `τ(G)` is the volume of `G(F)\G(𝔸_F)^1`. [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md) builds these for connected reductive groups. This roadmap extends that theory by what the comparison of Tamagawa measures on homogeneous spaces needs: the measure of a nowhere vanishing top form on the points of a smooth variety over a local field, with a fibre formula; the Tamagawa measure and number of a connected group `M ⋉ N` with a unipotent radical; and invariant gauge forms and quotient measures on homogeneous spaces. With them it computes three kinds of Tamagawa numbers, and it adds one statement on reductive groups: the structure of the centralisers of semisimple elements.

The headline theorems are these. (1) For every number field `F`, `τ(G_m) = 1`; equivalently, the norm-one idele classes `F^×\𝔸_F^1` have volume `κ_F = Res_{s=1} ζ_F(s)` for the measure induced by Tate's measure `d^×x`. (2) Let `G` be a smooth connected affine `F`-group acting on an affine variety, `x` an `F`-point with smooth connected stabilizer `H`, with `G` and `H` unimodular in the algebraic sense (`det Ad = 1` on their Lie algebras), the restriction `X^*(G) → X^*(H)` of geometric characters injective with finite cokernel, and the Tamagawa measures `τ_G`, `τ_H` defined. Then the orbit `X = G·x` carries an `F`-rational `G`-invariant gauge form `ω_X`, and the quotient of `τ_G` by `τ_H` on `H(𝔸)\G(𝔸)` is the restricted product `|d_F|^{−dim X/2} ∏_v |ω_X|_v` of the local measures on the local orbits. If `X` is open in a level set of a `G`-invariant morphism `Φ` between vector spaces, `G` acting linearly with determinant one and `dΦ` onto along `X`, this quotient is the restricted product of the local fibre measures of `Φ`. (3) For a connected group `H = M ⋉ N` with `N` unipotent and `M` connected reductive, `τ(H) = τ(M)`, and `τ(N) = 1`; for a central induced torus `T_1` in a connected reductive group `G_2`, `τ(G_2/T_1) = i·τ(G_2)/τ(T_1)`, where `i` is the index of the image of the restriction `X^*_F(G_2) → X^*_F(T_1)` of rational characters; so `τ(PGL_n) = n·τ(GL_n)`. (4) Let `G` be a connected reductive group over an algebraically closed field and `s ∈ G` semisimple. Then the centraliser `C_G(s)` is smooth, its identity component is reductive, and `C_G(s)` is connected if the derived group of `G` is simply connected (Steinberg).

The roadmap builds on [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md), which supplies the adelic points of algebraic groups with their integral models, characters, quotient measures, gauge forms, convergence factors, the Tamagawa measure and number of connected reductive groups, and the finiteness of volumes; on [ReductiveGroups](../../ReductiveGroups/README.md), whose structure theory is the setting of the statement on centralisers; on [ReductiveGroupsPartII](../../ReductiveGroupsPartII/README.md) for analytic charts on groups over local fields and Lang's theorem; on [LogicAndDefinabilityInNumberTheory](../../LogicAndDefinabilityInNumberTheory/README.md) for the measures of gauge forms over nonarchimedean local fields and their Fubini formula; and on [AnalyticNumberTheoryPartII](../../AnalyticNumberTheoryPartII/README.md) for Tate's measures, Poisson summation on the adeles and quotient measures in stages. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) uses Layers 2 and 3 for the Tamagawa numbers of unitary groups, local densities as fibre measures and Siegel's main theorem for Hermitian lattices, and [FiniteReductiveGroups](../FiniteReductiveGroups/README.md) uses Layer 4.

Layer 2 (target 2.6) constructs the measure of a top form with its fibre formula, the Tamagawa measure of `M ⋉ N`, and invariant gauge forms and quotient measures on homogeneous spaces, over local fields and adelically. Layer 3 (target 3.4a) computes `τ(G_m)` from Tate's zeta integral and the class number formula, the Tamagawa number of `M ⋉ N` with its invariance under restriction of scalars, and the Tamagawa number of a quotient by a central induced torus. Layer 4 (target 4.1) treats the centralisers of semisimple elements over an algebraically closed field. The layer numbers and the ids 2.6 and 3.4a place these statements beside the layers of AdelicAlgebraicGroups that they extend: 2.6 follows AdelicAlgebraicGroups §2.5, and 3.4a follows AdelicAlgebraicGroups §3.4.

## Conventions

Notation and conventions not restated here are those of the Conventions of AdelicAlgebraicGroups and of AdelicAlgebraicGroups §§2.1–2.4 in Layers 2 and 3, and those of the Conventions and Layer 7 of ReductiveGroups in Layer 4. In particular:

- `F` is a number field, `v` a place of `F`, `F_v` the completion, `𝒪_v` the valuation ring and `q_v` the residue cardinality at a finite `v`, `𝒪_{F,S}` the ring of `S`-integers, `d_F` the discriminant, `𝔇_v` the local different and `κ_F = Res_{s=1} ζ_F(s)` the residue of the Dedekind zeta function.
- Absolute values are normalised (`|z|_ℂ = z̄z` at a complex place); additive Haar measures give `𝒪_v` volume one and are `dx` on `ℝ` and `2 dx dy` on `ℂ`.
- `X^*(G)` is the Galois module of geometric characters of `G` and `X^*_F(G)` the lattice of `F`-rational characters; `a_G = Hom(X^*_F(G), ℝ)`, `H_G : G(𝔸) → a_G` is the logarithm map, `G(𝔸)^1 = ker H_G`, and `A_G(ℝ)^0` is the positive real part of the split centre (AdelicAlgebraicGroups §2.1).
- A gauge form on a smooth connected group is a nowhere vanishing invariant top form; `|ω|_v` is its measure on `G(F_v)`, `λ_v` are the convergence factors, `τ_G` is the Tamagawa measure, `τ^1_G` the measure it induces on `G(𝔸)^1`, and `τ(G)` the Tamagawa number (AdelicAlgebraicGroups §2.4). A group `G` is unimodular in the algebraic sense when `det Ad_{Lie G} = 1` on `G`.
- Tate's measure `d^×x` on the ideles and the self-dual measure on `𝔸_F` are those of AnalyticNumberTheoryPartII §§5.3h and 5.3j; quotient measures on homogeneous spaces are those of AdelicAlgebraicGroups §2.2.
- The targets 2.6 and 3.4a consist of named statements, each marked by a slug in italics such as *top-form-measure*; "2.6 *top-form-measure*" cites one of them. The other slugs in italics name statements of the roadmaps on main: *convergence-factors*, *Independence of the gauge form*, *quotient-measure*, *rational-characters-free*, *Modular function of `P(𝔸)`*, *Tamagawa number*, *tamagawa-restriction-scalars*, *Finite volume of `G(F)\G(𝔸)^1`*, *Anisotropic groups have compact quotients*, *Parabolic Haar Jacobian* and *The `GL_1` quotient is the idele class group* are statements of AdelicAlgebraicGroups, *smooth-group-analytic-charts*, *z-extension* and *lang-theorem* are statements of ReductiveGroupsPartII, and *smooth-morphism-submersion* is a statement of AdicSpacesPartV.
- AdelicAlgebraicGroups, AnalyticNumberTheoryPartII, LogicAndDefinabilityInNumberTheory, EndoscopicTransferAndUnitaryTraceComparison, AdicSpacesPartV, GeometryOfNumbersAndQuadraticArithmetic and HeightsRationalPointsAndObstructions are cited by section, ReductiveGroupsPartII by its own labels (`RG2.0`, `RG2.1.5`, `RG2.3.7`), and ReductiveGroups by layer or by item (`3A.5d`, `3A.5f`).
- In Layers 2 and 3 every field has characteristic zero; Layer 4 holds in every characteristic.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

## Layer 2: Measures of top forms and quotient measures on homogeneous spaces

This layer extends Layer 2 of AdelicAlgebraicGroups, which builds gauge forms and the Tamagawa measure of connected reductive groups, by one target with three named statements: the measure of a top form on a smooth variety over a local field with its fibre formula, the Tamagawa measure of a group with a unipotent radical, and invariant gauge forms with the quotient of Tamagawa measures on homogeneous spaces.

### 2.6 Top forms on varieties, groups with a unipotent radical and homogeneous spaces

In this subsection `k` is a nondiscrete locally compact field of characteristic zero (`ℝ`, `ℂ` or a finite extension
of some `ℚ_p`), with the additive Haar measures and the normalized absolute value of AdelicAlgebraicGroups §2.4 (`vol(𝒪_k) = 1`, `dx` on
`ℝ`, `2 dx dy` on `ℂ` with `|z|_ℂ = z̄z`).

- **The measure of a top form on a smooth variety.** (*top-form-measure*) Let `Y` be a smooth quasi-affine
  `k`-variety (a smooth locally closed subvariety of an affine space over `k`) of pure dimension `d`, and `ω` a
  nowhere vanishing algebraic `d`-form on `Y` defined over `k`. `Y(k)` is a `k`-analytic manifold of dimension `d`,
  with charts given near each point by `d` of the ambient coordinates. Define the measure `|ω|` on `Y(k)`: in a chart
  in which `ω = f dx_1 ∧ ⋯ ∧ dx_d`, it is `|f|_k` times the additive Haar measure of `k^d`. Prove: chart independence;
  `|cω| = |c|_k|ω|` for `c ∈ k^×`; `φ^*|ω| = |φ^*ω|` for an isomorphism `φ : Y′ → Y` of smooth quasi-affine varieties
  (that is, `φ` carries `|φ^*ω|` to `|ω|`); compatibility with restriction to open subvarieties; for a smooth affine
  `k`-group and a gauge form, `|ω|` is the measure of AdelicAlgebraicGroups §2.4; and the *fibre formula*: for a smooth morphism
  `π : Y → Y′` of smooth quasi-affine varieties and nowhere vanishing top forms `ω` on `Y`, `ω′` on `Y′`, let
  `ω/π^*ω′` be the relative form, the top form on each fibre `Y_y = π^{−1}(y)` with `ω = (ω/π^*ω′) ∧ π^*ω′` along
  `Y_y` (through `det T^*Y = det T^*Y_y ⊗ π^*det T^*Y′`); then for every nonnegative Borel `f` on `Y(k)`,
  `∫_{Y(k)} f |ω| = ∫_{Y′(k)} ( ∫_{Y_y(k)} f |ω/π^*ω′| ) |ω′|(y)`.
  For nonarchimedean `k`, `|ω|` is the measure of the gauge form `ω` (with `r = 1`) on the `k`-analytic manifold
  `Y(k)` of LogicAndDefinabilityInNumberTheory §2.7, where its chart independence and its invariance under analytic
  isomorphisms are proved, and the fibre formula is the Fubini formula of its §2.12 for the submersion
  `π : Y(k) → Y′(k)`, extended from absolutely integrable to nonnegative Borel `f` by monotone convergence. §2.12 puts
  the base first (`ω = π^*ω′ ∧ θ`), so its relative form is `θ = (−1)^{(d − d′)d′} ω/π^*ω′` with `d′ = dim Y′`, and
  the two give the same measure.
  ([Oesterlé], Chapter I, 2.3 and Theorem 2.4, p. 18, attaches to an algebraic top form its measure on the
  `𝒪_k`-points of a smooth `𝒪_k`-scheme at a nonarchimedean `k` and computes its density against the canonical
  measure; for groups, [Platonov–Rapinchuk–Rapinchuk], Theorem 3.71, p. 196, with the construction on pp. 192–196, as in AdelicAlgebraicGroups §2.4.
  Over `ℝ` and `ℂ` the fibre formula is this roadmap's deduction.)

  *Route.* At a nonarchimedean `k` the construction, its functoriality and the fibre formula are those of
  LogicAndDefinabilityInNumberTheory §§2.7 and 2.12; the steps below are written for `k = ℝ, ℂ`, and the scaling,
  restriction and group clauses are read off the chart description at every `k`. Near a point of `Y ⊆ 𝔸^N`,
  smoothness and the Jacobian criterion give `N − d` local equations with
  independent differentials, so the implicit function theorem over the complete field `k` (Mathlib
  `ImplicitFunctionData.implicitFunction`) makes `d` of the coordinates a chart of `Y(k)` (for `k = ℂ`, a chart of the
  complex manifold of ReductiveGroups 3A.5d). Transition maps between such
  charts are `k`-analytic, and the coefficients of `ω` in two charts differ by the Jacobian determinant, whose absolute
  value is the change-of-variables factor of the additive Haar measure (the analytic change of variables of
  ReductiveGroupsPartII RG2.0); so the local measures agree on overlaps
  and glue along a countable cover by compact chart domains. The scaling and functoriality clauses are the same
  computation. For a group the charts of RG2.0 *smooth-group-analytic-charts* are charts of this kind, so the measure
  is that of AdelicAlgebraicGroups §2.4. For the fibre formula, `π` is a submersion on `k`-points (smoothness; for `k = ℂ`,
  ReductiveGroups 3A.5d), so near each point there are
  charts of `Y` and `Y′` in which `π` is a coordinate projection `(x, y) ↦ y`; there `ω = g dx ∧ dy`, `ω′ = g′ dy` and
  `ω/π^*ω′ = (g/g′) dx`, and Fubini for the product Haar measure gives the formula on the chart; glue.
  *Needs:* AdelicAlgebraicGroups §2.4; ReductiveGroupsPartII RG2.0 (*smooth-group-analytic-charts* and its analytic change of variables);
  LogicAndDefinabilityInNumberTheory §2.7 (measures of gauge forms) and §2.12 (Fubini for relative top forms), at nonarchimedean `k`;
  ReductiveGroups 3A.5d (complex charts; smooth maps give holomorphic submersions), at `k = ℂ`;
  Mathlib `ImplicitFunctionData.implicitFunction`, `MeasureTheory.Measure.addHaarMeasure` (the Haar measure
  normalized on a positive compact set; on the positive compact `𝒪_k` at a nonarchimedean `k`, so that
  `vol(𝒪_k) = 1`, as AnalyticNumberTheoryPartII §5.3f fixes it), `MeasureTheory.Measure.prod`.

  **Checks.**
  - `Y = G_m ⊂ 𝔸^1` with `ω = dT/T`: `|ω|_p(ℤ_p^×) = 1 − p^{−1}`, the value of AdelicAlgebraicGroups §2.4.
  - Over `ℝ`, `π(x, y) = x² + y²` on `Y = 𝔸² ∖ 0`, `ω = dx ∧ dy`, `ω′ = dr`: the relative form on the circle
    `x² + y² = r` is `dx/(2y)`, of mass `π` for every `r > 0`, and `∫_0^1 π dr = π` is the area of the unit disc.
  - Replacing `ω` by `2ω` multiplies `|ω|` by `2` over `ℝ`, by `4` over `ℂ` and by `1/2` over `ℚ_2`.

- **Groups with a unipotent radical: the Tamagawa measure.** (*tamagawa-measure-unipotent-radical*) Let `F` be a
  number field and `H = M ⋉ N` a connected linear algebraic `F`-group with `N` unipotent and normal and `M` connected
  reductive (a Levi decomposition, given as data; one exists for every smooth connected affine `F`-group by ReductiveGroups
  Layer 6A). Prove: `X^*(H) = X^*(M)` as Galois modules (geometric characters are
  trivial on `N`); `H` satisfies the hypotheses of the Tamagawa measure of AdelicAlgebraicGroups §2.4, with the convergence factors and the
  leading coefficient of `M`; for gauge forms with `ω_H = ω_M ∧ ω_N` (through `M × N ≅ H`, `(m, n) ↦ mn`),
  `∫_{H(𝔸)} f dτ_H = ∫_{M(𝔸)} ∫_{N(𝔸)} f(mn) dτ_N(n) dτ_M(m)`, which is a left Haar measure of `H(𝔸)`; the modular
  character of `H(𝔸)` is `mn ↦ |χ(m)|_𝔸` for the `F`-rational character `χ = det Ad|_{Lie N}` of `M`; and
  `H(𝔸)^1 = M(𝔸)^1·N(𝔸)`, a closed normal subgroup of `H(𝔸)`, is unimodular: its modular character is the
  restriction of that of `H(𝔸)`, which is trivial on it. For a parabolic `P = M_P ⋉ N_P` of a connected reductive group,
  AdelicAlgebraicGroups §3.1 *Parabolic Haar Jacobian* gives this left Haar measure and modular character in the
  coordinates `(n, m)`.
  ([Oesterlé], Chapter I, Definition 4.7, p. 22, defines the Tamagawa measure of a connected linear group over a global
  field, and Proposition 5.3, p. 23, gives the modulus of `G(𝔸)` as `g ↦ |det Ad(g)|_𝔸^{−1}` in Bourbaki's
  convention, the inverse of the modular character used here; Chapter III, Theorem 3.3, p. 37,
  compares the Tamagawa measures of the terms of an exact sequence such as `1 → N → H → M → 1`.)

  *Route.* `N` has a filtration `N = N_0 ⊃ N_1 ⊃ ⋯ ⊃ 1` by subgroups normal in `H` (the lower central series) whose
  quotients are vector groups on which `M` acts linearly (characteristic zero; ReductiveGroups Layer 6A, item 1); a
  character of `H` is trivial on the
  unipotent `N`, so `X^*(H) = X^*(M)` and `X^*_F(H) = X^*_F(M)`. Choose `ω_N` compatible with the filtration and
  `ω_H = ω_M ∧ ω_N`. Spread `H = M ⋉ N` and the filtration out over `𝒪_{F,S}`; for almost all `v` the smooth model of
  `N` is an iterated extension of vector groups, with `q_v^{dim N}` points over `k_v`, so `|ω_N|_v(N(𝒪_v)) = 1` by
  Weil's volume formula (AdelicAlgebraicGroups §2.4), and `H(𝒪_v) = M(𝒪_v)N(𝒪_v)` gives
  `λ_v|ω_H|_v(H(𝒪_v)) = λ_v|ω_M|_v(M(𝒪_v))` with the same `λ_v` (*convergence-factors*): the convergence hypotheses
  of `τ_H` are those of `τ_M`. In the coordinates `(m, n)` the measure `|ω_M|_v ⊗ |ω_N|_v` is left invariant (left
  translation by `n′` changes `n` into `(m^{−1}n′m)n`), and the products over `v` give the integration formula (AdelicAlgebraicGroups §0.3).
  The modular character is AdelicAlgebraicGroups §2.2 (*Modular function of `P(𝔸)`*, stated for every finite-type `F`-group): it is the
  idele norm of `det Ad` on `Lie H = Lie M ⊕ Lie N`, which is `|χ(m)|_𝔸` because `det Ad_{Lie M} = 1` for reductive
  `M` and `Ad(n)` is unipotent. As `χ` is `F`-rational, it has norm one on `M(𝔸)^1`, and `H(𝔸)^1 = M(𝔸)^1N(𝔸)` because
  rational characters are trivial on `N`. `H(𝔸)^1` is the kernel of the continuous `H_H`, hence closed and normal; for
  a closed normal subgroup `K` of a locally compact group `G`, `f ↦ ∫_{G/K} ∫_K f(gk) dk dġ` is a left Haar measure of
  `G`, and right translation by `k_0 ∈ K` multiplies it by the modular character of `K` at `k_0`, so the modular
  character of `K` is the restriction of that of `G`.
  *Needs:* AdelicAlgebraicGroups §0.3; AdelicAlgebraicGroups §1.1; AdelicAlgebraicGroups §2.1; AdelicAlgebraicGroups §2.2 (*Modular function of `P(𝔸)`*); AdelicAlgebraicGroups §2.4 (Weil's volume formula,
  *convergence-factors*, Tamagawa measure); ReductiveGroups Layer 6A (Levi complements; item 1, the filtration).

  **Checks.**
  - The upper triangular Borel subgroup `B = G_m ⋉ G_a` of `SL_2`: `χ(diag(t, t^{−1})) = t²`, so the modular character
    `|t|_𝔸²` of `B(𝔸)` is nontrivial, while it is `1` on `B(𝔸)^1`; `X^*(B) = X^*(G_m) = ℤ`.
  - `M = 1`, `N = G_a`: the statement is the `G_a` clause of AdelicAlgebraicGroups §2.4, `τ_{G_a} = |d_F|^{−1/2}μ_𝔸`.

- **Gauge forms and quotient measures on homogeneous spaces.** (*homogeneous-gauge-measure*) Let `k` be a field of
  characteristic zero, `G` a smooth connected affine `k`-group acting on an affine `k`-variety `Y`, `x ∈ Y(k)` with
  smooth connected stabilizer `H`, `X = G·x ⊆ Y` its orbit (a smooth locally closed subvariety, ReductiveGroups
  Layer 3A), and `π : G → X`,
  `π(g) = g^{−1}x`, which identifies the right coset space `H\G` with `X` (`Hg ↦ g^{−1}x`). Assume that `G` and `H`
  are unimodular in the algebraic sense: `det Ad_{Lie G} = 1` on `G` and `det Ad_{Lie H} = 1` on `H`. This holds for
  connected reductive groups, for unipotent groups, and for `M ⋉ N` as in *tamagawa-measure-unipotent-radical* when
  `M` acts on `Lie N` with determinant one; by AdelicAlgebraicGroups §2.4 it makes every left-invariant gauge form also right-invariant.
  Prove:
  (i) `X` carries a `G`-invariant nowhere vanishing top form, unique up to `k^×`; for gauge forms `ω_G`, `ω_H` there is
  a unique `G`-invariant `ω_X = ω_G/ω_H` such that `ω_G(e) = ω_H(e) ⊗ ω_X(x)` under the isomorphism
  `det(Lie G)^∨ ≅ det(Lie H)^∨ ⊗ det(T_xX)^∨` given by `0 → Lie H → Lie G → T_xX → 0` (`dπ_e`), and then the relative
  form `ω_G/π^*ω_X` (*top-form-measure*) on each fibre `π^{−1}(g^{−1}x) = Hg` is the transport of `ω_H` by `h ↦ hg`;
  (ii) if `k` is `ℝ`, `ℂ` or a nonarchimedean local field of characteristic zero, `Hg ↦ g^{−1}x` is an open
  embedding of `H(k)\G(k)` into `X(k)` (its image, the orbit `G(k)·x`, may be smaller than `X(k)`), and the quotient
  of `|ω_G|` by `|ω_H|` (AdelicAlgebraicGroups §2.2 *quotient-measure*; here both are left and right Haar measures) is the pullback of
  the restriction of `|ω_X|` (*top-form-measure*):
  `∫_{G(k)} f |ω_G| = ∫_{H(k)\G(k)} ( ∫_{H(k)} f(hg) |ω_H|(h) ) |ω_X|(g^{−1}x)`;
  (iii) if `k = F` is a number field, the restriction `X^*(G) → X^*(H)` of geometric characters is injective with
  finite cokernel, and the Tamagawa measures `τ_G`, `τ_H` exist (AdelicAlgebraicGroups §2.4; for `H` with a unipotent radical,
  *tamagawa-measure-unipotent-radical*), then, for an integral model of `G` over `𝒪_{F,S}` and the closure of `H` in
  it, `H(F_v) ∩ G(𝒪_v) = H(𝒪_v)` for almost all `v`; the local orbit maps identify `H(𝔸)\G(𝔸)` with the restricted
  product of the open sets `H(F_v)\G(F_v) ⊆ X(F_v)` with respect to the compact open images `G(𝒪_v)·x` of the
  `G(𝒪_v)`; the product of the masses `|ω_X|_v(G(𝒪_v)·x)` converges absolutely to a nonzero limit; and, for every
  `F`-rational `G`-invariant gauge form `ω_X`, the quotient `μ_X` of `τ_G` by `τ_H` (AdelicAlgebraicGroups §2.2) is given on boxes: for
  Borel sets `C_v ⊆ H(F_v)\G(F_v)` of finite `|ω_X|_v`-measure with `C_v = G(𝒪_v)·x` for almost all `v`,
  `μ_X(∏_v C_v) = |d_F|^{−dim X/2} ∏_v |ω_X|_v(C_v)`,
  an absolutely convergent product. These boxes generate the Borel σ-algebra of `H(𝔸)\G(𝔸)`, so the formula
  determines `μ_X`; equivalently, `∫ ⊗_v f_v dμ_X = |d_F|^{−dim X/2} ∏_v ∫ f_v |ω_X|_v` for nonnegative Borel `f_v`
  with `f_v = 1_{G(𝒪_v)·x}` for almost all `v`. A measure on such a restricted product given on boxes by a product of
  local measures in this way is called the restricted product of the local measures;
  (iv) let `Φ : A → B` be a morphism of `k`-varieties between finite-dimensional `k`-vector spaces, `t ∈ B(k)`, and
  `X` a `G`-stable open subvariety of the fibre `Φ^{−1}(t)` (in (iv), `X` need not be one orbit until the last
  sentence) along which `dΦ` is onto (so `X` is smooth of dimension `dim A − dim B`); suppose that `G` acts linearly
  on `A` with determinant one and that `Φ(gy) = Φ(y)`. For constant gauge forms `dx` on `A` and `dS` on `B`, the
  residue form `ω_X = dx/Φ^*dS` (the relative form of *top-form-measure* for `Φ` on the open set `A°` where `dΦ` is
  onto, restricted to `X`) is a `G`-invariant gauge form. Over a local field, the *fibre measures* of `Φ` are the locally
  finite measures `μ_b` on `A°(k)`, one for each `b ∈ B(k)`, such that `μ_b` is carried by `Φ^{−1}(b) ∩ A°(k)`, such that
  `∫_{A°(k)} f dx = ∫_{B(k)} ( ∫ f dμ_b ) dS(b)` for every nonnegative Borel `f`, and such that `b ↦ ∫ f dμ_b` is
  continuous on `B(k)` for every continuous `f` with compact support in `A°(k)`. The second condition determines `μ_b` for
  almost every `b` and the third for every `b`, so the family is unique. Prove that it exists and that
  `μ_b = |dx/Φ^*dS|` on `Φ^{−1}(b) ∩ A°(k)` for every `b`. Over a
  number field `F`, let local Haar measures `dx_v = c_v|dx|_v` on `A(F_v)` and `dS_v = c′_v|dS|_v` on `B(F_v)` have as
  products the Tamagawa measures of the vector groups (`A(F)\A(𝔸)` and `B(F)\B(𝔸)` of volume one, so
  `∏_v c_v = |d_F|^{−dim A/2}` and `∏_v c′_v = |d_F|^{−dim B/2}`, with `c_v = c′_v = 1` for almost all `v`; the form that
  the family uses is [FormalProof],
  `Development/AbelianVarietyTheory/Proofs/DivisorProofs/TamagawaAdelicHaarEqMapProductMeasureStatement.lean`
  (`GlobalTheory.T.tamagawa_adelicHaar_eq_map_product_measure`),
  `Development/AbelianVarietyTheory/Definitions/Divisors/IsWeilFormulas.lean` (`GlobalTheory.SWLit.IsTamagawa`),
  `Development/AbelianVarietyTheory/Definitions/GlobalTwisting/DecayZero.lean` (`GlobalTheory.SWQ.IsCov1`)); then the
  local fibre measures on `X(F_v)` are `(c_v/c′_v)|ω_X|_v`, with `∏_v c_v/c′_v = |d_F|^{−dim X/2}`. Consequently, if
  moreover `X = G·x` for an `x ∈ X(F)` with the hypotheses of (iii), the quotient `μ_X` of `τ_G` by `τ_H` on
  `H(𝔸)\G(𝔸)` is the restricted product of the local fibre measures on the local orbits `H(F_v)\G(F_v) ⊆ X(F_v)`:
  `μ_X(∏_v C_v) = ∏_v (c_v/c′_v)|ω_X|_v(C_v)` for the boxes of (iii).
  ([Weil], Chapter II, Section 2.4: gauge forms on the group, on the subgroup and on the homogeneous space matching
  algebraically, and the comparison of the Tamagawa measures; [Weil 1965] for the residue form `dx/dQ` of a quadratic
  form, of which (iv) is this roadmap's generalization through the fibre formula of *top-form-measure*; the quadratic case
  `Φ = Q` in rank `m > 4`, with the continuity in the level, is GeometryOfNumbersAndQuadraticArithmetic §3.3
  `quadraticFiberDistribution`.)

  *Route.* (i) The `G`-invariant top forms on `X` correspond to their values at `x`, which must be fixed by `H`; for
  `h ∈ H`, `h·π(g) = π(gh^{−1}) = π(hgh^{−1})` (as `h^{−1}x = x`), so `H` acts on `T_xX = Lie G/Lie H` through `Ad`,
  hence on `det(T_xX)^∨` by `det Ad_{Lie H}/det Ad_{Lie G}|_H = 1`: the invariant forms are a line, and `ω_X(x)` is
  defined by the displayed isomorphism. Right translation `R_g` carries `H` to `Hg` and satisfies
  `π ∘ R_g = g^{−1}·π`; it preserves `ω_G` (right invariance, from unimodularity) and `ω_X` is `G`-invariant, so the
  decomposition at `e` is carried to `g`. (ii) `π`, the orbit map composed with inversion, is smooth (in characteristic
  zero the orbit map of an affine group onto its orbit is smooth: ReductiveGroups Layer 3A, after base change to `k̄`), so
  the orbit map `G(k) → X(k)` is a submersion of `k`-analytic manifolds with open image (AdicSpacesPartV §6.5
  *smooth-morphism-submersion* at nonarchimedean `k`, ReductiveGroups 3A.5f at `k = ℂ`), and `H(k)\G(k) → X(k)` is injective,
  continuous and open. The fibre formula of *top-form-measure* for `π`, with the relative forms of (i), is the displayed
  identity, which characterizes the quotient measure (AdelicAlgebraicGroups §2.2). (iii) The local convergence factors and the leading
  coefficients depend only on the Galois representations `X^*(G) ⊗ ℂ` and `X^*(H) ⊗ ℂ` (*convergence-factors*), which
  the restriction identifies (it is injective with finite cokernel), so they agree for `G` and `H`, and the
  discriminant factors `|d_F|^{−dim/2}` of AdelicAlgebraicGroups §2.4 divide to `|d_F|^{−dim X/2}`. Spread `G`, `H` and the action out
  over `𝒪_{F,S}` (AdelicAlgebraicGroups §1.1): for almost all `v` the closure of `H` is a smooth model of `H`, an `𝒪_v`-point of `G` lying
  in `H(F_v)` is an `𝒪_v`-point of the closure, and so `H(F_v) ∩ G(𝒪_v) = H(𝒪_v)`; this gives injectivity of
  `H(𝔸)\G(𝔸) →` the restricted product (if `g′_vg_v^{−1}` lies in `H(F_v)` for all `v` and `g_v, g′_v ∈ G(𝒪_v)` for
  almost all `v`, then `g′g^{−1} ∈ H(𝔸)`), surjectivity is the lift of local representatives `g_v ∈ G(𝒪_v)` at almost
  all `v`, and the map is open because each local orbit map is open and carries `G(𝒪_v)` onto `G(𝒪_v)·x`. By (ii) with
  `f = 1_{G(𝒪_v)}`, `|ω_X|_v(G(𝒪_v)·x) = |ω_G|_v(G(𝒪_v))/|ω_H|_v(H(𝒪_v))`; the corrected volumes
  `λ_v|ω_G|_v(G(𝒪_v))` and `λ_v|ω_H|_v(H(𝒪_v))`, with the same `λ_v`, have absolutely convergent products with
  nonzero limits (the hypotheses of AdelicAlgebraicGroups §2.4), hence so has their quotient. For the box formula, take `S` finite and
  large: on the open subgroup `G_S = ∏_{v∈S} G(F_v) × ∏_{v∉S} G(𝒪_v)`, `τ_G` is `|d_F|^{−dim G/2}ρ_G^{−1}` times the
  product of the measures `λ_v|ω_G|_v` (AdelicAlgebraicGroups §0.3), and likewise `τ_H` on `H(𝔸) ∩ G_S = ∏_{v∈S} H(F_v) × ∏_{v∉S} H(𝒪_v)`;
  the image of `G_S` in `H(𝔸)\G(𝔸)` is the open set of points with `v`-component in `G(𝒪_v)·x` for `v ∉ S`, on which
  `μ_X` is the quotient of these two product measures, which by the uniqueness of AdelicAlgebraicGroups §2.2 is the product of the local
  quotients, the measures `|ω_X|_v` of (ii); the factors `λ_v` cancel, the constants divide to `|d_F|^{−dim X/2}`, and
  every box lies in such an open set. The boxes are a family closed under intersection that generates the Borel
  σ-algebra of the second countable restricted product, and countably many boxes of finite measure cover it, so they
  determine `μ_X`. Replacing `ω_X` by `cω_X`, `c ∈ F^×`, changes nothing by the product formula (*Independence of the
  gauge form*). (iv) `dx = ω_X ∧ Φ^*dS` (the relative form first, as in *top-form-measure*) has a unique solution
  along `X` because `dΦ` is onto there, and it is `G`-invariant because `G` preserves `dx` (determinant one) and
  `Φ`. The fibre measures are the fibre formula of
  *top-form-measure* for `Φ : A° → B`, smooth on `A°`; the continuity in `b` holds because near each point of `A°(k)` the
  map `Φ` is a coordinate projection in which `|dx/Φ^*dS|` has a continuous density. The constants:
  `dx_v/dS_v = (c_v/c′_v)|dx/Φ^*dS|_v`, and
  `∏_v c_v/c′_v` is the ratio of the two discriminant powers. The last sentence is (iii) for the gauge form `ω_X`.
  *Needs:* AdelicAlgebraicGroups §0.3; AdelicAlgebraicGroups §1.1 (integral models, spreading out); AdelicAlgebraicGroups §2.2 (*quotient-measure*); AdelicAlgebraicGroups §2.4 (gauge forms,
  *convergence-factors*, Tamagawa measure, *Independence of the gauge form*); 2.6 *top-form-measure*,
  *tamagawa-measure-unipotent-radical*; ReductiveGroups Layer 3A (orbits and orbit maps) and 3A.5f (complex orbit maps);
  AdicSpacesPartV §6.5 (*smooth-morphism-submersion*).

  **Checks.**
  - Unimodularity of `G` is needed. Let `B ⊂ SL_2` be the upper triangular Borel subgroup acting on `G_m` through its
    character `n(u)a(t) ↦ t` (`n(u)` unipotent, `a(t) = diag(t, t^{−1})`), `x = 1`, so `H = N = {n(u)}` and
    `X = N\B ≅ G_m`. Here `det Ad_{Lie B}|_N = 1 = det Ad_{Lie N}`, but `det Ad_{Lie B}(a(t)) = t² ≠ 1`. In the
    coordinates `n(u)a(t)` the left-invariant gauge form of AdelicAlgebraicGroups §2.4 is `du ∧ dt/t³`, the right-invariant one
    `du ∧ dt/t`, `ω_N = du`, and the invariant form of `X` is `dt/t`. The left Haar measure `|du ∧ dt/t³|` disintegrates
    over `N\B` with base measure `|t|^{−3}|dt|`, which is not invariant; only the right-invariant form gives `|dt/t|`.
  - Unimodularity of `H` is needed. `G = SL_2 × G_m` acts linearly on `Y = 𝔸²` by `(g, s)·y = s^{−1}gy`; the stabilizer
    of `x = e_1` is `H = {([[s, u], [0, s^{−1}]], s)} ≅ B`, with `det Ad_{Lie H} = s² ≠ 1`, and the orbit is the open set
    `X = 𝔸² ∖ 0`. An invariant top form `f dy_1 ∧ dy_2` has `f` constant (`SL_2` preserves `dy_1 ∧ dy_2` and is
    transitive on `X`), and `(1, s)` multiplies `dy_1 ∧ dy_2` by `s^{−2}`: `X` has no `G`-invariant gauge form, as the
    route of (i) predicts (`H` acts on `det(T_xX)^∨` by `det Ad_{Lie H}/det Ad_{Lie G}|_H = s² ≠ 1`).
  - Without unimodularity there may be no invariant form at all, even when the stabilizer is unimodular: the affine
    group `G = {y ↦ ay + b}` of the line acting on `Y = 𝔸^1`, `x = 0`, has stabilizer `H = G_m` and orbit `X = 𝔸^1`;
    `y ↦ ay + b` multiplies `dy` by `a`, so `X` has no invariant gauge form. Here `det Ad_{Lie G}(y ↦ ay + b) = a`, so
    `G` is not unimodular, and `det Ad_{Lie G}|_H = a ≠ 1 = det Ad_{Lie H}`.
  - (iii) for `G = SL_2` acting on `F²`, `x = e_1`, `H = N ≅ G_a`: `X = 𝔸² ∖ 0`, both character modules are `0`; the
    image `SL_2(𝒪_v)·e_1` is the set of primitive vectors of `𝒪_v²`, of mass `1 − q_v^{−2}`, which is
    `|ω|_v(SL_2(𝒪_v))/|ω_N|_v(N(𝒪_v))` by the corrected volume of `SL_2` in AdelicAlgebraicGroups §2.4.
  - (iii) with a restriction that is not an isomorphism: `GL_2` acting on the affine variety `PGL_2` by left
    translation, `x = e`, `H` the scalars. `det` restricts to `t ↦ t²`, so `X^*(GL_2) = ℤ → X^*(H) = ℤ` is injective
    with cokernel `ℤ/2`; the convergence factors `(1 − q_v^{−1})^{−1}` and the leading coefficients `κ_F` agree, and
    `|ω_X|_v(PGL_2(𝒪_v)) = (1 − q_v^{−1})(1 − q_v^{−2})/(1 − q_v^{−1}) = 1 − q_v^{−2} = #PGL_2(k_v)q_v^{−3}`: (iii) says
    that `τ_{GL_2}` is the product of `τ_{G_m}` and the Tamagawa measure `|d_F|^{−3/2}∏_v|ω_X|_v` of `PGL_2`. The index
    `2` enters only on the norm-one parts (3.4a *tamagawa-central-induced-quotient*).
  - (iv) over `ℝ` for `Φ = x² + y² + z²` on `ℝ³`: the fibre measure on `{Φ = r}` is the area measure divided by
    `2√r`, of mass `2π√r`, and `∫_0^1 2π√r dr = 4π/3` is the volume of the unit ball.
  - The order of the factors in (iv): for `Φ(x, y) = y` on `𝔸²` with `dx ∧ dy` and `dS = dy`, the relative form is
    `ω_X = dx` (`dx ∧ dy = dx ∧ Φ^*dy`); the reversed order `dx ∧ dy = Φ^*dy ∧ ω_X` would give `−dx`, a different
    form with the same measure.

### Examples

- `Y = G_m ⊂ 𝔸^1` with `ω = dT/T` gives `|ω|_p(ℤ_p^×) = 1 − p^{−1}`, and replacing `ω` by `2ω` multiplies `|ω|` by `2` over `ℝ`, by `4` over `ℂ` and by `1/2` over `ℚ_2` (2.6 *top-form-measure*).
- The fibre formula for `x² + y²` on `𝔸² ∖ 0` over `ℝ` gives fibres of mass `π` and the area `π` of the unit disc; for `x² + y² + z²` on `ℝ³` the fibre measure on `{Φ = r}` has mass `2π√r`, and integrating gives the volume `4π/3` of the unit ball (2.6 *top-form-measure*, *homogeneous-gauge-measure* (iv)).
- For the upper triangular Borel subgroup `B = G_m ⋉ G_a` of `SL_2`, the modular character `|t|_𝔸²` of `B(𝔸)` is nontrivial and is `1` on `B(𝔸)^1` (2.6 *tamagawa-measure-unipotent-radical*).
- For `SL_2` acting on `F²` with `x = e_1`, the image `SL_2(𝒪_v)·e_1` is the set of primitive vectors of `𝒪_v²`, of mass `1 − q_v^{−2}`; for `GL_2` acting on `PGL_2` by left translation, `|ω_X|_v(PGL_2(𝒪_v)) = 1 − q_v^{−2}` (2.6 *homogeneous-gauge-measure* (iii)).
- Without unimodularity the invariant form may fail: on `N\B ≅ G_m` the left Haar measure of `B` disintegrates with the base measure `|t|^{−3}|dt|`, which is not invariant, and the affine group of the line acting on `𝔸^1` leaves no gauge form of `𝔸^1` invariant (2.6 *homogeneous-gauge-measure*).

### Dependencies

AdelicAlgebraicGroups §§0.3, 1.1, 2.1, 2.2 and 2.4 (products of measures; integral models; characters; modular functions and quotient measures; gauge forms, convergence factors and Tamagawa measures); ReductiveGroupsPartII RG2.0 (analytic charts and their change of variables); ReductiveGroups Layers 3A and 6A (orbits of algebraic actions and the smoothness of orbit maps, complex charts and complex orbit maps; Levi complements and the filtration of a unipotent group); AdicSpacesPartV §6.5 (smooth morphisms give submersions over nonarchimedean fields); LogicAndDefinabilityInNumberTheory §§2.7 and 2.12 (measures of gauge forms over nonarchimedean local fields and the Fubini formula for relative top forms); AnalyticNumberTheoryPartII §5.3f (the normalisation of additive Haar measures); Mathlib's implicit function theorem, additive Haar measures and product measures.

## Layer 3: Tamagawa numbers of tori, unipotent extensions and quotients

This layer stands beside §3.4 of AdelicAlgebraicGroups (finiteness of volumes, compactness of `F^×\𝔸_F^1`) and computes three kinds of Tamagawa numbers, in one target with three named statements.

### 3.4a Tamagawa numbers of `G_m`, of groups with a unipotent radical and of quotients by central induced tori

- **The Tamagawa number of `G_m`.** (*tamagawa-multiplicative-group*) For every number field `F`, prove
  `τ(G_m) = 1` for the Tamagawa measure of AdelicAlgebraicGroups §2.4 (convergence factors
  `(1 − q_v^{−1})^{−1}`, leading coefficient `κ_F = Res_{s=1}ζ_F`, Mathlib `NumberField.dedekindZeta_residue`).
  Equivalently: let `𝔸_F^1` carry the measure `μ^1` with `d^×x = μ^1 ⊗ d|x|/|x|` under `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}`
  (AdelicAlgebraicGroups §5.1, *The `GL_1` quotient is the idele class group*, `ℝ_{>0}` embedded diagonally at the
  archimedean places), for Tate's measure `d^×x` of
  AnalyticNumberTheoryPartII §5.3j and the idele norm `|x|`; in the diagonal coordinate `t` the norm is
  `t^{[F : ℚ]}`, so `d|x|/|x| = [F : ℚ]·dt/t`. This `μ^1` is the measure induced by `d^×x` and the Lebesgue measure on
  `a_{G_m}` normalized by the lattice `Hom(X^*_F(G_m), ℤ) = ℤ`, the logarithm being `H_{G_m}(x) = log|x|`. Then
  `μ^1(F^×\𝔸_F^1) = κ_F`.
  ([Tate]: the volume `κ_F` of the norm-one idele classes, for the measure with `dt/t` in the coordinate `t = |x|`, and
  the residue of the zeta integral; [Oesterlé], Chapter I, Example 5.14 (2), p. 25, for the reading `τ(G_m) = 1`. For
  totally complex `F` the form that the family uses is [FormalProof],
  `Development/AbelianVarietyTheory/Proofs/FlagMeasures/GenLinTamagawaVolumeStatement.lean` (`GlobalTheory.T.genLin_tamagawa_volume`),
  `Development/AbelianVarietyTheory/Statements/CuspFrameWeights/SameKindIsometric.lean` (`GlobalTheory.FlagMeas.GenLinVolume`),
  `Development/AbelianVarietyTheory/Definitions/SemilocalFrames/DefClassNum.lean` (`GlobalTheory.FlagMeas.glVol`).)

  *Route.* Take `f = ⊗_v f_v ∈ S(𝔸_F)` (AnalyticNumberTheoryPartII §5.3h) with `f_v ≥ 0`, `f_v = 1_{𝒪_v}` for almost
  all `v`, and `f̂(0) = ∫_{𝔸_F} f ≠ 0` for the self-dual measure (for instance the standard Gaussians at the archimedean
  places and `1_{𝒪_v}` at every finite place). The zeta integral `Z(f, s) = ∫_{𝔸_F^×} f(x)|x|^s d^×x` converges for
  real `s > 1`, and both computations below are for real `s > 1` only. First, split at `|x| = 1`, write
  `d^×x = μ^1 ⊗ d|x|/|x|` and apply Poisson summation (AnalyticNumberTheoryPartII §5.3h, for the idele acting by scalars) to `Σ_{ξ∈F} f(ξx)` on
  `|x| < 1`: `Z(f, s) = I(s) + μ^1(F^×\𝔸_F^1)·(f̂(0)/(s − 1) − f(0)/s)`, where
  `I(s) = ∫_{|x|≥1} (f(x)|x|^s + f̂(x)|x|^{1−s}) d^×x` converges for every `s` and is continuous in `s`, and the volume
  is finite because `F^×\𝔸_F^1` is compact (AdelicAlgebraicGroups §5.1; AdelicAlgebraicGroups §3.4, *Anisotropic groups
  have compact quotients*); so
  `(s − 1)Z(f, s) → μ^1(F^×\𝔸_F^1)·f̂(0)` as `s → 1^+`. Second, `Z(f, s) = ∏_v z(f_v, 1, s)` for the local zeta
  integrals of AnalyticNumberTheoryPartII §5.3j. Let `S` be the finite set of the archimedean places, of the places with `𝔇_v ≠ 𝒪_v` and of those
  with `f_v ≠ 1_{𝒪_v}`; for `v ∉ S`, `z(1_{𝒪_v}, 1, s) = (1 − q_v^{−s})^{−1}`, so the Euler product (Tau Ceti
  `TauCeti.dedekindZeta_eulerProduct_hasProd`) gives `Z(f, s) = ζ_F(s)·∏_{v∈S} z(f_v, 1, s)L_v(s)^{−1}`, with
  `L_v(s) = (1 − q_v^{−s})^{−1}` at finite `v` and `L_v = 1` at archimedean `v`. Each of these finitely many factors is
  holomorphic on `Re s > 0` (AnalyticNumberTheoryPartII §5.3j), and at `s = 1` it is `∫ f_v dx_v` for the self-dual measure (the factor
  `(1 − q_v^{−1})^{−1}` of `d^×x_v` cancels `L_v(1)^{−1}`), while `∫ 1_{𝒪_v} dx_v = 1` for `v ∉ S`. With Mathlib
  `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `(s − 1)Z(f, s) → κ_F·f̂(0)`. Comparing the two limits,
  `μ^1(F^×\𝔸_F^1) = κ_F`. Finally, at each place `λ_v|dx/x|_v = N(𝔇_v)^{1/2} d^×x_v` (`dx/|x|` on `ℝ`, `2dxdy/|z|_ℂ` on
  `ℂ`), and `∏_v N(𝔇_v) = |d_F|`, so `τ_{G_m} = |d_F|^{−1/2}κ_F^{−1}∏_v λ_v|dx/x|_v = κ_F^{−1}d^×x`; `H_{G_m}` carries
  the lattice-normalized Lebesgue measure of `a_{G_m}` to `d|x|/|x|`, so the measure induced on `𝔸_F^1` is
  `κ_F^{−1}μ^1`, and `τ(G_m) = 1`.
  *Needs:* AdelicAlgebraicGroups §2.1; AdelicAlgebraicGroups §2.4; AdelicAlgebraicGroups §3.4; AdelicAlgebraicGroups §5.1;
  AnalyticNumberTheoryPartII §§5.3h, 5.3j; Tau Ceti
  `TauCeti.dedekindZeta_eulerProduct_hasProd`; Mathlib `NumberField.dedekindZeta_residue`,
  `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

  **Checks.**
  - `F = ℚ`: `κ_ℚ = 1`; `ℚ^×\𝔸_ℚ^1` has the fundamental domain `{1} × ℤ̂^×`, of `μ^1`-measure
    `∏_p d^×x_p(ℤ_p^×) = 1 = κ_ℚ`; and directly, the Tamagawa factors `(1 − p^{−1})^{−1}|dx/x|_p(ℤ_p^×) = 1` give
    `τ(G_m) = 1`.
  - `F = ℚ(i)`: `κ_F = 2π·R·h/(w·√|d_F|) = 2π/(4·2) = π/4` (`r_2 = 1`, `R = h = 1`, `w = 4`, `|d_F| = 4`). As `h = 1`,
    `F^×\𝔸_F^1` is the quotient of `S^1 × ∏_v 𝒪_v^×` by `μ_4`. At the complex place
    `2dxdy/|z|_ℂ = dθ ⊗ d|z|_ℂ/|z|_ℂ`, so `μ^1` is `dθ` times the product of the `d^×x_v` on the `𝒪_v^×`, of total mass
    `∏_v N(𝔇_v)^{−1/2} = 1/2`, and `μ^1(F^×\𝔸_F^1) = 2π·(1/2)/4 = π/4 = κ_F`. In the diagonal coordinate `t` (positive
    reals at the complex place) the norm is `t²`; normalizing with `dt/t` instead of `d|x|/|x|` would double `μ^1` and
    give `π/2`. Without the factor `ρ_{G_m}^{−1} = κ_F^{−1}`, the Tamagawa volume would be `π/4` instead of `1`.

- **Groups with a unipotent radical: the Tamagawa number.** (*tamagawa-number-unipotent-radical*) For `H = M ⋉ N` as
  in 2.6 *tamagawa-measure-unipotent-radical*, give `a_H = a_M` the Lebesgue measure `du` normalized by
  `Hom(X^*_F(H), ℤ) = Hom(X^*_F(M), ℤ)` (the normalization of AdelicAlgebraicGroups §2.4 *Tamagawa number*), and let `μ^1` be the Haar
  measure of `H(𝔸)^1` with
  `∫_{H(𝔸)} f dτ_H = ∫_{a_H} ∫_{H(𝔸)^1} f(s(u)h) dμ^1(h) du`
  for nonnegative Borel `f` and a section `s` of `H_H : H(𝔸) → a_H` (the translate is on the left: `A_M(ℝ)^0` is not
  central in `H(𝔸)`, and `τ_H` is only a left Haar measure); equivalently `μ^1 = τ^1_M ⊗ τ_N` under `(m, n) ↦ mn`,
  with `τ^1_M` the measure on `M(𝔸)^1` of AdelicAlgebraicGroups §2.4 *Tamagawa number*. It depends neither on `s` nor on the Levi
  subgroup. When `det Ad|_{Lie N}` has absolute value one on `M(𝔸)` (for instance when `M` has no nontrivial `F`-rational
  character, as for a unitary group), `H(𝔸)` is unimodular, and `τ_H`, which is `τ_M ⊗ τ_N` under `(m, n) ↦ mn` (2.6), is
  also `τ_N ⊗ τ_M` under `(n, m) ↦ nm`. Define `τ(H) = μ^1(H(F)\H(𝔸)^1)`, with counting measure on `H(F)`; for `N = 1`
  this is the Tamagawa
  number of AdelicAlgebraicGroups §2.4, which it extends. It is finite by AdelicAlgebraicGroups §3.4 (*Finite volume of `G(F)\G(𝔸)^1`*). Prove:
  `τ(N) = 1` and `τ(H) = τ(M)`; in particular `τ(G_a) = 1`; and, for a
  finite extension `E/F` of number fields and `H = M ⋉ N` as above over `E`, `τ(Res_{E/F}H) = τ(H)`.
  ([Oesterlé], Chapter I, Definitions 5.9, p. 24, and 5.12, p. 25, for the measure on `G(𝔸)^1` and the Tamagawa number
  of a connected linear group, and Example 5.14 (1), p. 25, for `τ(G_a) = 1`; Chapter III, Theorem 5.3, p. 41, relates
  the Tamagawa numbers of the terms of an exact sequence, which gives `τ(N) = 1` for unipotent `N` over a number field
  along a composition series with quotients `G_a`, as its Introduction, p. 13, observes.)

  *Route.* The measure: by 2.6, `τ_H = ∫_{M(𝔸)}∫_{N(𝔸)} f(mn) dτ_N dτ_M`, and `τ_M = τ^1_M ⊗ du` through
  `M(𝔸) = M(𝔸)^1 × A_M(ℝ)^0` with `A_M(ℝ)^0` central in `M(𝔸)` (AdelicAlgebraicGroups §2.1, AdelicAlgebraicGroups §2.4); with `s(u) ∈ A_M(ℝ)^0` this is the
  displayed formula for `μ^1 = τ^1_M ⊗ τ_N`, a Haar measure of `H(𝔸)^1` because conjugation by `M(𝔸)^1` preserves
  `τ_N` (its modulus `|χ(m)|_𝔸` is `1` there). For another section `s′(u) = s(u)h_u`, `h_u ∈ H(𝔸)^1`, the formula is
  unchanged by left invariance of `μ^1`, and the formula determines `μ^1`; so `μ^1` depends neither on `s` nor on the
  Levi subgroup. `τ(N) = 1` by induction along the filtration of 2.6: `N(R) → (N/N_1)(R)` is onto for `R = F, F_v, 𝔸`
  (vector groups have trivial `H^1`; for `R = F, F_v`, ReductiveGroups Layer 6A, item 1), `N(F)\N(𝔸)` fibres over
  `(N/N_1)(F)\(N/N_1)(𝔸)` with fibre `N_1(F)\N_1(𝔸)`, the
  quotient measures compose in stages (AnalyticNumberTheoryPartII §5.3k), and `τ(G_a) = 1` (the Tamagawa measure of
  `G_a` is the self-dual measure, AdelicAlgebraicGroups §2.4, for which `F\𝔸_F` has volume one, AnalyticNumberTheoryPartII §5.3h). For `H`:
  `H(F) = M(F)N(F)`, so `H(F)\H(𝔸)^1` fibres over `M(F)\M(𝔸)^1` (in the coordinates `mn`) with fibre
  `m^{−1}N(F)m\N(𝔸)` over the class of `m`; conjugation by `m` scales `τ_N` by
  `|det(Ad(m)|_{Lie N})|_𝔸^{±1} = |χ(m)|_𝔸^{±1}`, which is `1` on `M(𝔸)^1`, so every fibre has volume `τ(N)`; Fubini for `μ^1 = τ^1_M ⊗ τ_N` gives
  `τ(H) = τ(M)τ(N) = τ(M)`. Restriction of scalars: the Weil restriction of `M × N ≅ H` gives
  `Res_{E/F}(M ⋉ N) = Res_{E/F}M ⋉ Res_{E/F}N` (AdelicAlgebraicGroups §1.4), with `Res_{E/F}N` unipotent and `Res_{E/F}M` connected
  reductive (over an algebraic closure `F̄`, `Res_{E/F}H ⊗_F F̄ ≅ ∏_σ H ⊗_{E,σ} F̄` over the embeddings `σ : E → F̄`);
  so `τ(Res_{E/F}(M ⋉ N)) = τ(Res_{E/F}M)` by the clause just proved over `F`, `τ(Res_{E/F}M) = τ(M)` by AdelicAlgebraicGroups §2.5
  *tamagawa-restriction-scalars*, and `τ(M) = τ(M ⋉ N)` by the same clause over `E`.
  *Needs:* AdelicAlgebraicGroups §1.4; AdelicAlgebraicGroups §2.1; AdelicAlgebraicGroups §2.4; AdelicAlgebraicGroups §2.5 (*tamagawa-restriction-scalars*); AdelicAlgebraicGroups §3.4; 2.6
  *tamagawa-measure-unipotent-radical*; AnalyticNumberTheoryPartII §§5.3h, 5.3k; ReductiveGroups Layer 6A (item 1).

  **Checks.**
  - The Borel subgroup `B = G_m ⋉ G_a` of `SL_2`: `τ(B) = τ(G_m) = 1` (with *tamagawa-multiplicative-group*), while
    `B(F)\B(𝔸)` has infinite volume and `B(𝔸)` is not unimodular; `τ` is taken on `B(𝔸)^1`.
  - The Heisenberg group `1 → G_a → N_3 → G_a² → 1`: two steps of the filtration give `τ(N_3) = 1·1 = 1`.
  - `M = 1`, `N = G_a` over `E`: an `F`-basis of `E` gives `Res_{E/F}G_a ≅ G_a^{[E:F]}`, and both sides of the
    restriction clause are `1`.
  - The side of the translate matters. For the affine group `{y ↦ ay + b} = G_m ⋉ G_a` of the line, with
    `(a, b)(a′, b′) = (aa′, ab′ + b)`, the left Haar measure `da db/a²` of its real points (`a > 0`) is `(da/a)·db′` in
    the coordinates `(a, 0)(1, b′)` but `(da/a)·(db/a)` in the coordinates `(1, b)(a, 0)`: only the left translate
    gives a product of `da/a` with the Haar measure `db′` of the normal factor.

- **Quotients by a central induced torus.** (*tamagawa-central-induced-quotient*) Let `G_2` be a connected reductive
  `F`-group, `T_1 ⊆ G_2` a central induced torus (a finite product of `Res_{F_i/F} G_m`, `F_i/F` finite),
  `G_3 = G_2/T_1`, and `i` the index of the image of the restriction `X^*_F(G_2) → X^*_F(T_1)` of `F`-rational
  characters (finite: the restriction has finite cokernel). Prove:
  `G_2(R) → G_3(R)` is surjective for `R = F`, every `F_v` and `𝔸_F`, and `τ(G_3) = i·τ(G_2)/τ(T_1)`.
  When moreover the derived group of `G_2` is simply connected, `G_2 → G_3` is a z-extension, and the surjectivity over `F`
  and every `F_v` is ReductiveGroupsPartII RG2.1.5 *z-extension* (`surjective_points`).
  (For tori, Ono's formula `τ(T) = #H^1(F, X^*(T))/#Ш^1(F, T)`, which gives the Tamagawa number of every torus and
  `τ(Res_{K/F}G_m) = 1`, is [Oesterlé], Chapter IV, Corollary 3.3, p. 56; its `#Ш^1(F, T)` is an invariant of the
  torus `T`, not the index `i` of this target. For a reductive `G_2` the exact-sequence formula is [Sansuc],
  Corollary 10.5, p. 77, and [Oesterlé], Chapter III, Theorem 5.3, p. 41.)

  *Route.* Surjectivity for `R = F, F_v`: `G_2 → G_3` is onto on points over an algebraic closure of `R`, so the fibre
  over `y ∈ G_3(R)` has a point `z ∈ G_2(L)` for a finite Galois extension `L/R` that splits `T_1`. For
  `σ ∈ Gal(L/R)`, `z^{−1}σ(z)` maps to `y^{−1}σ(y) = 1`, so it lies in `T_1(L)`, and `σ ↦ z^{−1}σ(z)` is a cocycle.
  `T_1(L) = ∏_i (F_i ⊗_F L)^×` is a product of modules coinduced from the stabilizers `Gal(L/K)` of the factors `K` of
  `F_i ⊗_F R` (embedded in `L`), so Shapiro's lemma (Mathlib `groupCohomology.coindIso`) and Hilbert 90 (Mathlib
  `groupCohomology.H1ofAutOnUnitsUnique`, for each `L/K`) give `H^1(Gal(L/R), T_1(L)) = 0`: `z^{−1}σ(z) = t^{−1}σ(t)`
  for some `t ∈ T_1(L)`, so `σ(zt^{−1}) = σ(z)σ(t)^{−1} = zt^{−1}` for every `σ`, and `zt^{−1}` is a point of
  `G_2(R)` over `y`. For almost all `v`, `G_2(𝒪_v) → G_3(𝒪_v)` is onto: spread the sequence out over `𝒪_{F,S}`
  (AdelicAlgebraicGroups §1.1) so that the model `𝒢_2 → 𝒢_3` of `G_2 → G_3` is smooth and surjective with kernel a torus `𝒯_1`, and
  `G_i(𝒪_v) = 𝒢_i(𝒪_v)`; on the special fibre `1 → 𝒯_1 ⊗ k_v → 𝒢_2 ⊗ k_v → 𝒢_3 ⊗ k_v → 1` is exact with smooth
  terms and connected kernel, so the reduction of `y ∈ G_3(𝒪_v)` lifts to `𝒢_2(k_v)` (ReductiveGroupsPartII RG2.3.7
  *lang-theorem* (c)), and this `k_v`-point of the fibre over `y`, which is smooth over `𝒪_v`, lifts to an
  `𝒪_v`-point by Hensel's lemma. So `G_2(𝔸) → G_3(𝔸)` is onto.
  *homogeneous-gauge-measure* (i), (ii), for `G_2` acting on `G_3` through `G_2 → G_3` with `x = e` and stabilizer
  `T_1` (all three groups reductive), give gauge forms with `ω_2(e) = ω_1(e) ⊗ ω_3(e)` and the local quotient
  measures `|ω_2|_v = |ω_1|_v ⊗ |ω_3|_v`. The restriction `X^*(G_2) → X^*(T_1)` of geometric characters has kernel
  `X^*(G_3)` and finite cokernel (`T_1` lies in the connected centre `Z^0`; over a finite extension splitting `G_2`,
  the characters of `G_2` restrict to `Z^0` with finite cokernel by AdelicAlgebraicGroups §2.1 *rational-characters-free*, and restriction
  from the torus `Z^0` to its subtorus `T_1` is onto), so `L_v(s, X^*(G_2)) = L_v(s, X^*(T_1))L_v(s, X^*(G_3))` and the
  leading coefficients multiply (*convergence-factors*); with the surjectivity on `𝒪_v`-points and the computation on
  the open subgroups `∏_{v∈S}G_2(F_v) × ∏_{v∉S}G_2(𝒪_v)` of the route of *homogeneous-gauge-measure* (iii),
  `τ_{G_2}` is the product of `τ_{T_1}` and `τ_{G_3}` in the quotient sense. Norm-one parts: `0 → X^*_F(G_3) → X^*_F(G_2) → X^*_F(T_1)` is exact
  with finite cokernel, so `0 → a_{T_1} → a_{G_2} → a_{G_3} → 0` is exact. `G_2(𝔸)^1 → G_3(𝔸)^1` is onto (for a lift
  `z ∈ G_2(𝔸)` of `y`, `H_{G_2}(z)` lies in the image of `a_{T_1}`, and `H_{T_1}` is onto, so `z` can be corrected by
  an element of the central `T_1(𝔸)`), with kernel `T_1(𝔸) ∩ G_2(𝔸)^1 = T_1(𝔸)^1`. On the lattices,
  `Hom(X^*_F(G_2), ℤ) → Hom(X^*_F(G_3), ℤ)` is onto (`X^*_F(G_2)/X^*_F(G_3)` embeds in the free `X^*_F(T_1)`), and its
  kernel `Hom(X^*_F(G_2)/X^*_F(G_3), ℤ)` contains the image of `Hom(X^*_F(T_1), ℤ)` with index `i`; so the
  lattice-normalized measures satisfy `da_{G_2} = i·da_{T_1} ⊗ da_{G_3}`, and the measures on the norm-one parts
  satisfy `τ^1_{G_2} = i^{−1}·τ^1_{T_1} ⊗ τ^1_{G_3}`. Integrate over `G_2(F)\G_2(𝔸)^1` in stages
  (AnalyticNumberTheoryPartII §5.3k): it fibres over `G_3(F)\G_3(𝔸)^1` (surjectivity on `F`- and `𝔸`-points) with
  fibres `T_1(F)\T_1(𝔸)^1` (`T_1` central, `G_2(F) ∩ T_1(𝔸) = T_1(F)`), and `τ(T_1)` is finite and positive (AdelicAlgebraicGroups §2.4,
  AdelicAlgebraicGroups §3.4); so `τ(G_2) = i^{−1}τ(T_1)τ(G_3)`.
  *Needs:* AdelicAlgebraicGroups §1.1; AdelicAlgebraicGroups §2.1; AdelicAlgebraicGroups §2.4; AdelicAlgebraicGroups §3.4; 2.6 *homogeneous-gauge-measure*; ReductiveGroupsPartII RG2.3.7
  (*lang-theorem* (c)); AnalyticNumberTheoryPartII §5.3k; Mathlib `groupCohomology.coindIso`,
  `groupCohomology.H1ofAutOnUnitsUnique`.

  **Checks.**
  - `GL_n → PGL_n`, `T_1 = G_m`: the determinant restricts to `t ↦ t^n`, so `i = n` and `τ(PGL_n) = n·τ(GL_n)/τ(G_m)`,
    which is `n` given `τ(GL_n) = 1` (Weil; not a target of this roadmap; for totally complex `F` the form that the family
    uses is [FormalProof], `Development/AbelianVarietyTheory/Proofs/FlagMeasures/GenLinTamagawaVolumeStatement.lean`
    (`GlobalTheory.T.genLin_tamagawa_volume`), `Development/AbelianVarietyTheory/Statements/CuspFrameWeights/SameKindIsometric.lean`
    (`GlobalTheory.FlagMeas.GenLinVolume`)) and *tamagawa-multiplicative-group*.
  - `τ(PGL_1(D)) = 2τ(GL_1(D))/τ(G_m)` for a quaternion algebra `D`: `G_2 = GL_1(D)`, `T_1 = G_m`, and `i = 2` because
    the reduced norm restricts to `t ↦ t²`. GeometryOfNumbersAndQuadraticArithmetic §3.3 `quaternionAdjointTamagawa`
    (`τ(PGL₁(D)) = 2`) is this case, with its own `τ(GL₁(D)) = 1`.
  - HeightsRationalPointsAndObstructions §3.18b `tamagawa_SLquotient_two` (`τ(SL_n/μ₂) = 2` for even `n`) is the case
    `G_2 = (SL_n × G_m)/μ₂`, `T_1 = G_m`, `i = 2`.
  - The quotient may have rational characters. `G_m² ⊃ G_m × 1`: the restriction is onto, `i = 1`, and
    `τ(G_m) = τ(G_m²)/τ(G_m) = 1`. `GL_2 × G_m` modulo the scalars of `GL_2`: `det` restricts to `t ↦ t²` and the second
    factor to `1`, so `i = 2` and `τ(PGL_2 × G_m) = 2·τ(GL_2 × G_m)/τ(G_m) = 2`, which is `τ(PGL_2)·τ(G_m)`.
  - For a quadratic extension `E/F`, `Res_{E/F}G_m → U(1)_{E/F}`, `z ↦ z/z̄`, with kernel `G_m`: `i = 2` because
    `N_{E/F}` restricts to `t ↦ t²`, so `τ(U(1)) = 2·1/1`. For the norm sequence `1 → U(1) → Res_{E/F}G_m → G_m → 1`
    the formula would give `τ(G_m) = τ(Res_{E/F}G_m)/τ(U(1)) = 1/2` (`i = 1`, as `X^*_F(U(1)) = 0`); the hypothesis that
    fails is that the kernel is induced: `U(1)` is not, and `N : E^× → F^×` is not onto. That `G_m` has a rational
    character is allowed.

### Examples

- Over `ℚ`, `κ_ℚ = 1` and `ℚ^×\𝔸_ℚ^1` has the fundamental domain `{1} × ℤ̂^×`, of `μ^1`-measure `1`; over `ℚ(i)`, `κ_F = π/4 = μ^1(F^×\𝔸_F^1)`, while normalising with `dt/t` instead of `d|x|/|x|` would give `π/2` (3.4a *tamagawa-multiplicative-group*).
- `τ(B) = τ(G_m) = 1` for the Borel subgroup `B = G_m ⋉ G_a` of `SL_2`, although `B(F)\B(𝔸)` has infinite volume, and the Heisenberg group has `τ(N_3) = 1` (3.4a *tamagawa-number-unipotent-radical*).
- For `GL_n → PGL_n`, `i = n` and `τ(PGL_n) = n·τ(GL_n)/τ(G_m)`; for a quaternion algebra `D`, `τ(PGL_1(D)) = 2τ(GL_1(D))/τ(G_m)`; for a quadratic extension `E/F`, `τ(U(1)) = 2`; applied to the norm sequence `1 → U(1) → Res_{E/F}G_m → G_m → 1`, whose kernel is not induced, the formula would give the false value `τ(G_m) = 1/2` (3.4a *tamagawa-central-induced-quotient*).

### Dependencies

Layer 2 (2.6); AdelicAlgebraicGroups §§1.1, 1.4, 2.1, 2.4, 2.5, 3.4 and 5.1 (integral models; restriction of scalars; characters and the norm-one subgroup; Tamagawa measures and numbers; *tamagawa-restriction-scalars*; finiteness of volumes and compactness of `F^×\𝔸_F^1`; the idele class group as the quotient of `GL_1`); ReductiveGroups Layer 6A (the filtration of a unipotent group); ReductiveGroupsPartII RG2.3.7 (Lang's theorem); AnalyticNumberTheoryPartII §§5.3h, 5.3j and 5.3k (Poisson summation and the self-dual measure; Tate's measure and the local zeta integrals; quotient measures in stages); Mathlib's Dedekind zeta residue with the class number formula, and its group cohomology (Shapiro's lemma, Hilbert 90); Tau Ceti's Euler product of the Dedekind zeta function.

## Layer 4: Centralisers of semisimple elements in reductive groups

This layer adds to the structure theory of ReductiveGroups Layer 7 one target on the centralisers of semisimple elements, in every characteristic.

### 4.1 Centralisers of semisimple elements

Let `G` be a connected reductive group over an algebraically closed field
`k̄`, `s ∈ G(k̄)` semisimple and `T` a maximal torus containing `s`, with roots `Φ` and root subgroups `U_α`. Prove:
(a) the centraliser `C_G(s)` is smooth, and its identity component `C_G(s)°` is reductive, generated by `T` and the
`U_α` with `α(s) = 1`; its root system with respect to `T` is `{α ∈ Φ : α(s) = 1}` and its Weyl group
`W(C_G(s)°, T)` is generated by the reflections `s_α` with `α(s) = 1`;
(b) every maximal torus of `G` containing `s` lies in `C_G(s)°`, and `C_G(s)` is generated by `C_G(s)°` and the
`ẇ ∈ N_G(T)` with `w(s) = s`;
(c) if the derived group of `G` is simply connected, `C_G(s)` is connected (Steinberg);
(d) `s` is regular (`C_G(s)°` a maximal torus) iff `α(s) ≠ 1` for every root `α`; if `C_G(s)` is abelian, then
`C_G(s) = C_G(s)°` is a maximal torus;
(e) for `G` defined over a field `k` and `s ∈ G(k)`, `C_G(s)` and `C_G(s)°` are defined over `k`; for a Frobenius or
Steinberg endomorphism `F` with `F(s) = s`, `F(C_G(s)°) = C_G(s)°`.

In characteristic zero, the reductivity of `C_G(s)°` in (a), statement (c) and the maximal-torus criterion for an abelian `C_G(s)` in (d) are targets of EndoscopicTransferAndUnitaryTraceComparison §1.3, stated there over an algebraic closure of a field of characteristic zero; 4.1 extends these three statements to every characteristic.

The reductivity of `C_G(s)°` in (a) and the connectedness of `C_G(s)` in (c) are stated in `Suggested.lean` as `reductive_identityComponent_centralizer` and `geometricallyConnected_centralizer_of_simplyConnected`, with `G` given by its coordinate Hopf algebra over `k̄` and `C_G(s)` the closed subgroup whose points are the elements of `G(k̄)` that commute with `s`.

*Route.* `Ad(s)` acts on `𝔤 = Lie(T) ⊕ ⊕_α 𝔤_α` by `α(s)` on `𝔤_α`, so the fixed subalgebra is
`Lie(T) ⊕ ⊕_{α(s)=1} 𝔤_α`; the subgroup `H` generated by `T` and the `U_α` with `α(s) = 1` centralises `s` and has this
Lie algebra, and `dim C_G(s) ≤ dim 𝔤^{Ad(s)}`, so `C_G(s)` is smooth with identity component `H`. `H` is
reductive. Its unipotent radical `R` is normalised by `T`, so `RT` is a smooth connected solvable subgroup and lies in a
Borel subgroup `B′ ⊇ T`; `R` lies in the unipotent radical of `B′`, whose Lie algebra is the sum of the `𝔤_β` over the
positive system `Φ^+` of `B′` (ReductiveGroups Layers 5 and 7). So the `T`-stable `Lie R` is the sum of the `𝔤_β` over
a set of roots `β ∈ Φ^+` with `β(s) = 1`. For such a `β`, also `(−β)(s) = 1`, so `H` contains `U_{−β}` and the element
`n_β = x_β(1)x_{−β}(−1)x_β(1)`, which normalises `T` and acts on it as `s_β` (the rank-one subgroups of ReductiveGroups
Layer 7 and their root maps in Layer 7C); `n_β` normalises `R` and carries `𝔤_β` to `𝔤_{−β}`, so `−β ∈ Φ^+`,
which is absurd. Hence `Lie R = 0` and `R = 1`. The roots of `H` with respect to `T` are the nonzero weights of `T` on `Lie H`, that is
`{α : α(s) = 1}`, and its Weyl group is generated by their reflections (ReductiveGroups Layer 7 for `(H, T)`). A
maximal torus through `s` is connected and centralises `s`. The component
group: two maximal tori of `C_G(s)°` are conjugate in it, so `C_G(s) = C_G(s)°·(N_G(T) ∩ C_G(s))`. (c) Write `s = zs′`
with `z` in the connected centre `Z°` and `s′` a semisimple element of the derived group `G^der` (`G = Z°·G^der`); then
`C_G(s) = C_G(s′) = Z°·C_{G^der}(s′)`, and `C_{G^der}(s′)` is connected because `G^der` is semisimple and simply
connected ([Steinberg], Theorem 8.1; see also [Humphreys], §2.11). (d) The first statement from (a). If `C_G(s)` is abelian it
centralises the maximal torus `T ⊂ C_G(s)°`, so `C_G(s) ⊂ C_G(T) = T ⊂ C_G(s)°`. (e) `C_G(s)` is the fibre over `s` of the
conjugation morphism, defined over `k`, and `F(C_G(s)) = C_G(F(s))`.

*Needs:* ReductiveGroups Layer 7 (root datum, root subgroups, Borel subgroups with their positive systems, maximal
tori); ReductiveGroups Layer 7C (the rank-one root maps and the elements `n_α`); ReductiveGroups Layer 5 (unipotent
radicals and the structure of connected solvable groups); ReductiveGroups Layer 3 (smoothness and identity
components); ReductiveGroups Layer 9E for Steinberg endomorphisms; EndoscopicTransferAndUnitaryTraceComparison §1.3
(in characteristic zero: the reductivity in (a), statement (c) and the torus criterion in (d)).

**Checks.**
- `GL_n`, `s = diag(a₁, …, a_n)`: `C_G(s) = ∏_a GL_{m_a}` over the distinct eigenvalues, connected, with roots the
  `e_i − e_j` with `a_i = a_j`.
- `PGL₂` in characteristic `≠ 2`, `s` the image of `diag(1, −1)`: `C_G(s)°` is the diagonal torus and `C_G(s)` also
  contains the image of `[[0, 1], [1, 0]]`, so `C_G(s)` is disconnected; `PGL₂` has non-simply-connected derived group,
  consistently with (c).
- `SL₂`, `s = −1`: central, `C_G(s) = SL₂`.
- (d) cannot say more for regular `s` alone: in `PGL₂` the image of `diag(1, −1)` is regular, `C_G(s)°` is the diagonal
  torus, and `C_G(s)` is not abelian (it contains the image of `[[0, 1], [1, 0]]`, which does not commute with the
  torus).

### Examples

- In `GL_n` the centraliser of `diag(a₁, …, a_n)` is the product of the `GL_{m_a}` over the distinct eigenvalues, connected, with roots the `e_i − e_j` with `a_i = a_j` (4.1 (a), (c)).
- In `PGL₂` in characteristic `≠ 2` the image of `diag(1, −1)` is regular, and its centraliser is disconnected and not abelian; the derived group `PGL₂` is not simply connected (4.1 (c), (d)).
- In `SL₂`, `s = −1` is central and `C_G(s) = SL₂` (4.1).

### Dependencies

ReductiveGroups Layer 3 (smoothness and identity components), Layer 5 (unipotent radicals and connected solvable groups), Layer 7 (root data, root subgroups, Borel subgroups, maximal tori and Weyl groups), Layer 7C (rank-one root maps) and Layer 9E (Steinberg endomorphisms); EndoscopicTransferAndUnitaryTraceComparison §1.3 (the reductivity of `C_G(s)°`, the connectedness of `C_G(s)` for a simply connected derived group and the torus criterion, in characteristic zero); for the statements of `Suggested.lean`, Tau Ceti's reductive, semisimple and simply connected affine groups in Hopf coordinates, semisimple points, derived subgroups, identity components and closed subgroups cut out by vanishing ideals.

## Downstream consumers

In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [HermitianFormsAndLattices](../HermitianFormsAndLattices/README.md) and [FiniteReductiveGroups](../FiniteReductiveGroups/README.md) use the statements here:

- HermitianFormsAndLattices §6.0 uses 3.4a *tamagawa-multiplicative-group* and *tamagawa-central-induced-quotient* for `τ(U(1)) = 2`; HermitianFormsAndLattices §6.0b uses 2.6 *tamagawa-measure-unipotent-radical* and *homogeneous-gauge-measure* for the stabilizers of vectors, and 3.4a *tamagawa-number-unipotent-radical* for `τ(U(W_0) ⋉ N) = τ(U(W_0))`; HermitianFormsAndLattices §§6.1 (f) and 6.2 use 2.6 *top-form-measure* and *homogeneous-gauge-measure* for the fibre measures of Gram maps and the Tamagawa measure of `U(V)` as a fibre measure; HermitianFormsAndLattices §6.5 uses 2.6 *homogeneous-gauge-measure* for Siegel's main theorem in Weil's form.
- FiniteReductiveGroups §0.3 uses 4.1, and through it FiniteReductiveGroups §§4.3, 4.6 and 4.7.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the measure of a nowhere vanishing top form on a smooth quasi-affine variety over `ℝ` and `ℂ`, with its functoriality and fibre formula, and, over every local field of characteristic zero, its scaling, its restriction to open subvarieties and its agreement with the gauge measures of AdelicAlgebraicGroups §2.4; the Tamagawa measure of a connected group `M ⋉ N` with a unipotent radical, with its integration formula, its modular character and its norm-one subgroup; invariant gauge forms on homogeneous spaces, the comparison of local quotient measures with the measure of the invariant form, the comparison of the quotient of Tamagawa measures with the restricted product of the local measures, and residue forms and fibre measures on level sets (2.6); the Tamagawa number of `G_m`, the Tamagawa number of `M ⋉ N` with its invariance under restriction of scalars, and the quotient formula for a central induced torus with the surjectivity of the quotient map on rational, local and adelic points (3.4a); and the structure of the centralisers of semisimple elements in connected reductive groups over algebraically closed fields, with Steinberg's connectedness theorem (4.1); of the three centraliser statements whose characteristic-zero case EndoscopicTransferAndUnitaryTraceComparison §1.3 owns (below), this roadmap owns the extension to positive characteristic.

Not owned here. The theory these statements extend belongs to [AdelicAlgebraicGroups](../../AdelicAlgebraicGroups/README.md): adelic points and integral models (Layer 1); characters, the norm-one subgroup, quotient measures, gauge forms, convergence factors, and the Tamagawa measure and number of connected reductive groups with their invariance under restriction of scalars (Layer 2); the finiteness of volumes and the compactness of `F^×\𝔸_F^1` (AdelicAlgebraicGroups §3.4). It belongs as well to [ReductiveGroups](../../ReductiveGroups/README.md): smoothness and identity components (Layer 3), orbits of algebraic actions, complex charts and complex orbit maps (Layer 3A), Levi complements in characteristic zero (Layer 6A), the structure theory of reductive groups (Layer 7) and Steinberg endomorphisms (Layer 9E). Analytic charts on groups over local fields and Lang's theorem are ReductiveGroupsPartII RG2.0 and RG2.3.7. That smooth morphisms give submersions on points over a nonarchimedean field is AdicSpacesPartV §6.5. The measure of a gauge form on an analytic manifold over a nonarchimedean local field, with its invariance under analytic isomorphisms, and the Fubini formula for relative top forms are LogicAndDefinabilityInNumberTheory §§2.7 and 2.12, which 2.6 *top-form-measure* uses at nonarchimedean `k`. The normalised additive measures, Poisson summation with the self-dual measure, Tate's measure with the local zeta integrals, and quotient measures in stages are AnalyticNumberTheoryPartII §§5.3f, 5.3h, 5.3j and 5.3k. GeometryOfNumbersAndQuadraticArithmetic §3.3 constructs, within `quaternionAdjointTamagawa` (`τ(PGL₁(D)) = 2`), `orthogonalTamagawa_stabilizer` (the stabilizers of vectors in `SO(Q)`, an isotropic stabilizer being a case of 3.4a *tamagawa-number-unipotent-radical*) and the fibre measures `quadraticFiberDistribution` of a quadratic form, the cases it uses of 2.6 *homogeneous-gauge-measure* (iii), (iv) and of the three statements of 3.4a; the statements here are their general forms. EndoscopicTransferAndUnitaryTraceComparison §1.3 owns three centraliser statements over an algebraic closure of a field of characteristic zero: the reductivity of `C_G(s)°`, the connectedness of `C_G(s)` for a simply connected derived group, and the maximal-torus criterion for an abelian `C_G(s)`. In characteristic zero these are the reductivity in 4.1 (a), statement 4.1 (c) and the torus criterion in 4.1 (d), which 4.1 takes from §1.3 and extends to every characteristic. The Tamagawa numbers `τ(SO(Q)) = 2`, `τ(PGL₁(D)) = 2` and `τ(U(V)) = 2`, the mass formulas and Siegel's main theorem are not stated here: they belong to GeometryOfNumbersAndQuadraticArithmetic and HermitianFormsAndLattices.

## Exact supplier contracts

### From TauCetiRoadmap.AdelicAlgebraicGroups

Cited by section and by the slugs of its statements, each used as stated there.

- §0.3 (products, transport and changes of normalization of restricted products of measures): the integration formula of 2.6 *tamagawa-measure-unipotent-radical* and the box formula of 2.6 *homogeneous-gauge-measure* (iii).
- §1.1 (integral models and spreading out): 2.6 *tamagawa-measure-unipotent-radical* and *homogeneous-gauge-measure* (iii); 3.4a *tamagawa-central-induced-quotient*.
- §1.4 (restriction of scalars): 3.4a *tamagawa-number-unipotent-radical*.
- §2.1 (characters, `a_G`, `H_G`, the split centre and the norm-one subgroup; *rational-characters-free*): 2.6 *tamagawa-measure-unipotent-radical*; 3.4a.
- §2.2 (*Modular function of `P(𝔸)`*, stated for every finite-type group; *quotient-measure*, with its uniqueness): 2.6.
- §2.4 (gauge forms and their local measures, Weil's volume formula, *convergence-factors*, the Tamagawa measure and its `G_a` case, *Independence of the gauge form*, *Tamagawa number*): 2.6 and 3.4a.
- §2.5 (*tamagawa-restriction-scalars*): 3.4a *tamagawa-number-unipotent-radical*.
- §3.4 (*Finite volume of `G(F)\G(𝔸)^1`*, *Anisotropic groups have compact quotients*): 3.4a.
- §5.1 (*The `GL_1` quotient is the idele class group*: `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}` with `ℝ_{>0}` diagonal at the archimedean places, and the compactness of `F^×\𝔸_F^1`): 3.4a *tamagawa-multiplicative-group*.

### From TauCetiRoadmap.ReductiveGroups

Layer 3 (smoothness of closed subgroups and identity components), Layer 5 (unipotent radicals; a connected solvable group over an algebraically closed field is the semidirect product of a maximal torus and its unipotent radical), Layer 7 (root data, root subgroups, the rank-one subgroups `G_α`, Borel subgroups and the positive systems they determine, maximal tori, Weyl groups), Layer 7C (the rank-one root maps and the central isogeny from `SL_2` onto `G_α`, through which `n_α = x_α(1)x_{−α}(−1)x_α(1)` normalises the maximal torus and acts on it as `s_α`) and Layer 9E (Steinberg endomorphisms): 4.1.

Layer 3A (the orbit theorems of its supplier contract: orbits are locally closed, over every field, and for an affine group in characteristic zero the orbit map onto the orbit is smooth; 3A.5d, the complex charts of a smooth `ℂ`-scheme, under which smooth maps become holomorphic submersions; 3A.5f, the complex orbit map is a holomorphic submersion): 2.6 *top-form-measure* at `k = ℂ` and *homogeneous-gauge-measure*. Layer 6A (Levi complements of smooth connected affine groups in characteristic zero; item 1, the filtration of a normal unipotent subgroup by normal subgroups with vector-group quotients carrying a linear action, and the surjectivity of `U(k) → (U/U_1)(k)`): 2.6 *tamagawa-measure-unipotent-radical*; 3.4a *tamagawa-number-unipotent-radical*.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§1.3 (for a connected reductive group over a field of characteristic zero and a semisimple element, over an algebraic closure: the identity component of its centraliser is reductive, the centraliser is connected when the derived group is simply connected, and an abelian centraliser is a maximal torus): the characteristic-zero case of the reductivity in 4.1 (a), of 4.1 (c) and of the torus criterion in 4.1 (d), used as stated there; 4.1 extends these three statements to every characteristic.

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.0 (*smooth-group-analytic-charts* and its analytic change of variables): 2.6 *top-form-measure*. RG2.3.7 (*lang-theorem* (c)): 3.4a *tamagawa-central-induced-quotient*.

### From TauCetiRoadmap.AnalyticNumberTheoryPartII

§5.3f (the additive Haar measure normalized by `vol(𝒪_k) = 1` at a nonarchimedean place): 2.6 *top-form-measure*. §5.3h (Poisson summation on `𝔸_F`, with the idele acting by scalars; the self-dual measure, for which `𝔸_F/F` has volume one): 3.4a *tamagawa-multiplicative-group* and *tamagawa-number-unipotent-radical*. §5.3j (Tate's measure `d^×x` and the local zeta integrals, holomorphic on `Re s > 0`): 3.4a *tamagawa-multiplicative-group*. §5.3k (composition of quotient measures in stages): 3.4a.

### From TauCetiRoadmap.LogicAndDefinabilityInNumberTheory

§2.7 (over a nonarchimedean local field, the measure of an `r`-gauge form on an analytic manifold, given in a chart by its density against the normalised additive Haar measure, its invariance under analytic isomorphisms, and the analytic manifold of points of the smooth locus of an algebraic variety), used with `r = 1`; §2.12 (for a submersion of analytic manifolds and gauge forms on source and target, the relative form, algebraic in the smooth algebraic case, and the Fubini formula for absolutely integrable functions): 2.6 *top-form-measure* at nonarchimedean `k`. §2.12 orders the relative form base first (`ω = π^*ω′ ∧ θ`), oppositely to 2.6, which puts the relative form first; for `π : Y → Y′` with `d = dim Y` and `d′ = dim Y′` the two forms differ by the sign `(−1)^{(d − d′)d′}` and give the same measure.

### From TauCetiRoadmap.AdicSpacesPartV

§6.5 (*smooth-morphism-submersion*: over a complete nonarchimedean field of characteristic zero a smooth morphism of smooth rigid spaces gives a submersion on rational points, and the orbit map of a smooth linear algebraic group onto a homogeneous space is a submersion at every point): 2.6 *homogeneous-gauge-measure* (ii) at nonarchimedean `k`.

### From Mathlib

- `ImplicitFunctionData.implicitFunction`, `MeasureTheory.Measure.addHaarMeasure` (the Haar measure normalized on a positive compact set, here `𝒪_k`) and `MeasureTheory.Measure.prod`: 2.6 *top-form-measure*.
- `NumberField.dedekindZeta_residue` and `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`: 3.4a *tamagawa-multiplicative-group*.
- `groupCohomology.coindIso` (Shapiro's lemma) and `groupCohomology.H1ofAutOnUnitsUnique` (Hilbert 90 for a finite extension): 3.4a *tamagawa-central-induced-quotient*.
- `Subgroup.centralizer`: the statements of 4.1 in `Suggested.lean`.

### From Tau Ceti

- `TauCeti.dedekindZeta_eulerProduct_hasProd` (the Euler product of the Dedekind zeta function): 3.4a *tamagawa-multiplicative-group*.
- For the statements of 4.1 in `Suggested.lean`: finite-type commutative Hopf algebras `TauCeti.FiniteTypeCommHopfAlgCat` with their quotients `TauCeti.FiniteTypeCommHopfAlgCat.quotient` and identity components `TauCeti.FiniteTypeCommHopfAlgCat.identityComponent`; reductivity `TauCeti.reductiveCommHopfAlgProperty`, with the semisimplicity of the derived subgroup `TauCeti.reductiveCommHopfAlgProperty.semisimple_derived` cut out by `TauCeti.CommHopfAlgCat.derivedDefiningIdeal`; simple connectedness `TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty`; semisimple points `TauCeti.HopfAlgebra.IsSemisimplePoint`; the vanishing ideal of a subgroup of points `TauCeti.HopfIdeal.vanishingIdeal`; geometric connectedness `TauCeti.geometricallyConnectedCommHopfAlgProperty`.

## References

- **Platonov–Rapinchuk–Rapinchuk**: V. Platonov, A. Rapinchuk and I. Rapinchuk, *Algebraic Groups and Number Theory*, Volume I, second edition, Cambridge Studies in Advanced Mathematics 205, Cambridge University Press, 2023. Locators use printed pages.
- **Weil**: André Weil, *Adeles and Algebraic Groups*. Institute for Advanced Study (1961); Progress in Mathematics 23, Birkhäuser (1982).
- **Weil 1965**: André Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*. Acta Mathematica 113 (1965), 1–87.
- **Tate**: John Tate, *Fourier analysis in number fields and Hecke's zeta-functions*. Thesis (1950); in J. W. S. Cassels and A. Fröhlich (eds.), *Algebraic Number Theory*, Academic Press (1967).
- **Sansuc**: Jean-Jacques Sansuc, *Groupe de Brauer et arithmétique des groupes algébriques linéaires sur un corps de nombres*. Journal für die reine und angewandte Mathematik 327 (1981), 12–80.
- **Oesterlé**: J. Oesterlé, *Nombres de Tamagawa et groupes unipotents en caractéristique p*. Inventiones Mathematicae 78 (1984).
- **Steinberg**: Robert Steinberg, *Endomorphisms of linear algebraic groups*. Memoirs of the American Mathematical Society 80 (1968).
- **Humphreys**: James E. Humphreys, *Conjugacy classes in semisimple algebraic groups*. Mathematical Surveys and Monographs 43, American Mathematical Society (1995).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It has the forms of `τ(G_m) = 1` over totally complex fields (3.4a *tamagawa-multiplicative-group*), of the covolume-one Haar measure of an adelic vector group (2.6 *homogeneous-gauge-measure* (iv)) and of the normalisation of the additive Haar measures (Conventions) that the family uses.
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
