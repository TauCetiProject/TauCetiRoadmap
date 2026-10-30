# Roadmap: Gromov–Witten theory of closed symplectic manifolds

**Summary.** This roadmap constructs the cohomology-valued Gromov–Witten operations of a closed symplectic manifold with an arbitrary tame almost complex structure, proves their identities from the stable-map virtual data of AnalyticStableMaps and the virtual-class engine of ImplicitAtlases, and from them builds the Novikov-completed unital cohomological field theory, the genus-zero quantum product and the descendant and ancestor theory. From the Novikov coefficient ring of MorseNovikov N1 it builds the curve-class coefficients, their Chern grading and the finiteness of classes below an energy bound (Layer 0); from the stable-map carrier, the stable-domain groupoid of ComplexCurveModuli and the weighted pairing of Orbifolds it builds the combined evaluation–stabilization diagrams (Layer 1) and the operation `I_(g,n,A)` itself together with its independence of the tame structure along compact paths (Layer 2); the orientation and isotropy conventions, the Hodge bundle on nodal stable domains and the constant-map computation (Layer 3); effectivity, covariance and grading (Layer 4); the fundamental-class, divisor and degree-zero identities (Layer 5); the splitting and genus-reduction identities with their boundary Thom and transfer constructions (Layer 6); the unital cohomological field theory and the quantum product (Layer 7); and the descendant and ancestor classes with the string, dilaton, divisor and genus-zero topological recursion relations (Layer 8). The end theorems are the eight Kontsevich–Manin properties of the operations, the genus-one degree-zero normalization `I_(1,1,0)(1) = χ(X)·1`, the associativity of the quantum product and the genus-zero topological recursion relation for ancestors.

## Scope and ownership

Write `(X, ω)` for the closed symplectic target of real dimension `2m`, `J` for a smooth tame almost complex structure, `A` for an integral class in `H₂(X; ℤ)`, `g` for the arithmetic genus of a nodal domain and `n` for the number of ordered marks. The principal objects are the linear maps

    I_(g,n,A) : H^*(X; ℚ)^(⊗n) → H^*(M̄_(g,n); ℚ),    2g − 2 + n > 0,

where `M̄_(g,n)` is the coarse space of stable pointed curves equipped with the weighted rational pairing of its retained-arrow groupoid. The construction passes through the stable-map groupoid and its rational virtual functional and proves the comparison to that coarse carrier; a finite-group atlas on a singular map space is never treated as a smooth orbifold.

This roadmap owns:

- the effective set of a tame structure, the specialization of the Novikov ring of MorseNovikov N1 to `H₂(X; ℤ)` with the area homomorphism, the completed state module `V ⊗̂ Λ_ω` with its support filtration and Chern grading, and the finiteness of integral curve classes below an energy bound (Layer 0);
- the combined evaluation–stabilization diagrams on actual stable-map charts, the comparison of map-level and domain-level forgetting and stabilization, and the stable-range conventions for unstable pointed signatures (Layer 1);
- the weighted pairing and weighted adjoint on compact Deligne–Mumford targets, the definition of `I_(g,n,A)` by the weighted pairing against the virtual functional, and its endpoint equality along compact collared paths of tame structures and auxiliary reductions (Layer 2);
- the orientation and isotropy-weight conventions, the Hodge bundle on nodal stable domains constructed as a scalar family with Hardy boundary traces, the constant-map obstruction model, the master concordance to the equivariant Euler atlas and the constant-map Euler class computation (Layer 3);
- the Kontsevich–Manin properties 2.2.0–2.2.7: effectivity, covariance and grading (Layer 4), fundamental class, divisor and mapping to a point (Layer 5), splitting and genus reduction with the boundary Thom classes, clutching transfers, spine formula, capped trace and node-matching comparison they need (Layer 6);
- the Novikov-completed classes `Ω_(g,n)`, the unital cohomological field theory and the quantum product with its left-dual convention (Layer 7);
- domain and map cotangent lines, the rational class `ψ_i` on the coarse stable-map locus by finite-isotropy tensor-power descent, descendant and ancestor brackets, the string, dilaton and divisor equations, the genus-zero descendant–ancestor comparison and the genus-zero topological recursion relation (Layer 8).

What it builds on, and does not plan again:

- **AnalyticStableMaps.** The stable-map carrier with its retained automorphism arrows and the stability theorem (Layer 1 there), all-genus compactness (§3.7), the nodal linearization and augmented index (§4.1), finite-dimensional equivariant obstruction data (§4.3), the uniform gluing estimates and the fixed-evaluation complements (§6.2–§6.3), the projection charts (§7.3), the rational dual-Čech functional (§9.2), relative families, the tame-path interpolation and choice comparisons (§10.1–§10.2), evaluation, forgetting and clutching maps with the marked universal family (§11.1–§11.2), the joint models and the forget-compatible ambient collection (§12.1–§12.2), the pushforward of the functional, the target `X^n`, the stabilization–evaluation map and the exports to Gromov–Witten theory (§13.1–§13.4). Its §13.4 assigns to this roadmap exactly the operations, axioms, descendants and the curve-class, Chern and area specialization owned here.
- **ImplicitAtlases.** Implicit atlases (§1.1), the global relative trace and the rational virtual class with finite-subatlas independence (§4.2–§4.3), the boundary and cobordism law (§5.2), refinements (§5.3), pushforward (§5.4), the regular-manifold normalization and Euler comparison for the zero-set atlas of a smooth section (§5.6), product atlases and the Čech external product (§6.4–§6.5), transverse fiber products, the supported Gysin map and the application interface (§7.1–§7.4). Its §7.4 states that the splitting, divisor, unit and forgetful identities need application diagrams and orbifold weight normalizations beyond the engine: those diagrams are Layers 5–6 here.
- **TopologicalSheafCohomology** Layers 0–1: constant-ring adapters, the cover-refinement Čech colimit and the compact Hausdorff Čech/derived comparison, consumed through ImplicitAtlases and in Layer 2's test-class carrier.
- **ComplexCurveModuli.** The countable stable pointed chart groupoid (D5), analytic properness and the finite-action universal charts (D6, in particular D6 item 4), the universal curve, one-mark contraction, `forgetAuxiliarySet`, collision charts and clutching with the smoothing line `T_* ⊗ T_**` (D7 items 1–3), and the late Orbifolds target adapter with the weighted pairing on `M̄_(g,n)` and its product comparison with `X^n` (D8). Its domain theorems concern pointed-stable domains; map-dependent stability and map compactness are AnalyticStableMaps'.
- **Orbifolds** O1–O5: retained-arrow charts, the coarse triangulation and finite-CW witness, orbibundles and the weighted rational integration, Thom classes and Gysin maps (O5 items 1, 4 and 5), used only on the compact Deligne–Mumford targets after ComplexCurveModuli D8, never on the singular map zero locus.
- **MorseNovikov** N1: the period-controlled completed group ring `Nov(R, H, N)` with its exact finite-below support condition, its `AddMonoidAlgebra` embedding, the nonnegative subring and strictly positive ideal, and the pushforward along period-compatible homomorphisms. It states no completed tensor-product identification; §0.2 proves the one it needs for finite-dimensional state spaces.
- **CharacteristicClasses.** The Thom class of an oriented bundle, the representation of the Euler class by a transverse zero locus and `e(TM)[M] = χ(M)` (C2 items 1 and 3), integral Chern classes with their Whitney, dual, line-twist and tensor-product formulas and `c_r(E) = e(E_ℝ)` (C3 item 2), and the Čech/singular comparison on paracompact spaces of CW type (C1.2b). It constructs no Hodge family and no isotropy-weighted trace.
- **AlgebraicTopology.** Singular cochains and the universal-coefficient sequence (Stage 6 item 1), cup and cap products (Stage 6 item 2), the Eilenberg–Zilber and Künneth maps (Stage 5 item 1), the Euler–Poincaré identity for spaces of finite CW type (Stage 7 item 1) and the finite CW type of compact smooth manifolds (Stage 8 item 7).
- **GeometricTopology**, smoothing-and-triangulation comparison item 1: smooth triangulation of a compact smooth manifold, giving the finite CW witness of §0.3 and §2.1.
- **DifferentialGeometry** 8.3–8.5: smooth chains, integration over chains and the de Rham comparison, supplying the closed two-forms and their pairing with homology in §0.3.
- **ComplexKahlerGeometry** K5b: compact Hermitian elliptic theory, Dolbeault cohomology and Serre duality on compact complex manifolds, consumed on the smooth normalization components of a nodal domain in §3.2.
- **HeegaardFloer** Lane F1 items 1–3 (Sobolev spaces of maps of surfaces, the Calderón–Zygmund interior estimate and bootstrapping, linear Cauchy–Riemann operators on discs and strips as Fredholm operators) and Lane F2 item 1 (tame and compatible structures); **PDE** Lane A items 1 and 6 (weak Sobolev spaces, trace and extension). These are the local elliptic floor of §3.2; the compact-component scalar operator with Hardy boundary traces is constructed there, not consumed.
- **Mathlib and Tau Ceti at the pins.** The symplectic-form, taming and almost-complex carriers named in the contracts below; singular cohomology with cup product; `AddMonoidAlgebra`; finite-dimensional linear algebra over ℚ.

Outside this roadmap: the Chow-correspondence condition of Kontsevich–Manin 2.2.8, which concerns projective algebraic targets and is not an axiom for arbitrary symplectic manifolds; punctured, bordered and Lagrangian theories; Floer-theoretic applications, which HamiltonianFloerOperations constructs on top of Layer 7.

## Conventions

| Item | Convention |
| --- | --- |
| Target | `X` compact, boundaryless, Hausdorff, second countable, of real dimension `2m`, with a smooth two-form `ω` satisfying `SmoothTwoForm.IsSymplectic` and a smooth almost complex structure `J` with `ω.Tames J`; neither integrability nor genericity of `J` is assumed; disconnected targets are treated componentwise |
| Parameters | a compact finite-dimensional manifold with corners `P` and a smooth family `p ↦ J_p` of tame structures with uniform taming bounds and prescribed collars and faces, as in AnalyticStableMaps §2.1 and §10.1 |
| Coefficients | rational cohomology with cohomological grading and Koszul signs; obstruction representations are real; integral homology classes retain torsion |
| Chern number | `c₁(A) = ⟨c₁(TX, J), A⟩` with the integral class of CharacteristicClasses C3 item 2; `K_J = −c₁(TX, J)` |
| Virtual dimension | `d_(g,n,A) = 2((1 − g)(m − 3) + c₁(A) + n)`, a signed integer |
| Degree of the operation | `deg I_(g,n,A)(γ₁, …, γ_n) = Σ_i deg γ_i + 2(g − 1)m − 2c₁(A)`, equivalently the shift `2(K_J · A) + (2g − 2)m` of Kontsevich–Manin (2.2); the real virtual dimension and the cohomological degree are never conflated |
| Stable range | `2g − 2 + n > 0`; `(0, 3)` is stable with `M̄_(0,3)` a point; `(0, 0)`, `(0, 1)`, `(0, 2)` and `(1, 0)` are unstable and have no Deligne–Mumford target |
| Maps | `ev_i` is evaluation at the i-th mark; `st` forgets the map and contracts components unstable as pointed curves and exists only in the stable range; forgetting a mark of a stable map contracts newly unstable constant components and retains nonconstant components whose pointed domains become unstable |
| Pairing | `⟨α⟩ = ∫^wt α` is the weighted pairing of Orbifolds O5 on a compact Deligne–Mumford target, with a chart of group `Γ` weighted by `1/|Γ|` including ineffective kernels; `π_*` is the adjoint of `π^*` under the weighted pairings, never unweighted coarse integration |
| Casimir and signs | a homogeneous basis `Δ_a` of `H^*(X; ℚ)` with `g_(ab) = ∫_X Δ_a ⌣ Δ_b` and `(g^(ab)) = (g_(ab))^(−1)`; the Casimir is `Σ_(a,b) g^(ab) Δ_a ⊗ Δ_b` in the displayed order; reordering odd insertions carries the Koszul sign of the permutation and nothing else |
| Duals | the left Poincaré dual basis `e^j` of a homogeneous basis `e_j` is fixed by `∫_X e^j ⌣ e_i = δ^j_i`; reconstruction reads `v = Σ_j (∫_X v ⌣ e_j) e^j` |
| Novikov grading | `deg q^A = 2c₁(A)`; the completion is by the area filtration of N1 |
| Node branches | ordered as displayed; the self-clutching map glues the last two marks |

## Exact supplier contracts

### From Mathlib

- `AddMonoidAlgebra` (Mathlib/Algebra/MonoidAlgebra/Defs.lean): the uncompleted group ring `ℚ[H₂(X; ℤ)]` embedded in `Λ_ω` by N1. `Finset`, `Module.finrank`, `Basis`: the finite-basis arguments of §0.2.
- `Matrix` inverses over ℚ and `LinearMap.BilinForm` nondegeneracy: the Casimir `(g^(ab))` of Layer 6 and the perfectness statements of §2.1.
- Relative singular homology and `TopCat`: the carriers of `H₂(X; ℤ)` and of continuous maps between compact Hausdorff spaces.

### From Tau Ceti

- `SmoothTwoForm.IsSymplectic`, `SmoothTwoForm.Tames` (TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean) and `SmoothAlmostComplexStructure` (TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean): the closed symplectic target and its tame structures. `SmoothAlmostComplexStructure` bundles any smooth tangent endomorphism with `J² = −1` on a native manifold, with named constant, negated and product constructors; what the pin lacks is the compact nodal domain with its stable-domain and stable-map moduli, which are ComplexCurveModuli and AnalyticStableMaps carriers.
- `stdComplexLineEnergyDensity`, `stdComplexLineEnergy` and `Tames.stdComplexLineEnergyDensity_pos` (TauCeti/Geometry/Symplectic/Manifold/Energy.lean): the pointwise energy and its positivity under taming, the local input of §0.1's positivity of area.
- `IsPseudoholomorphic` (TauCeti/Geometry/Symplectic/Manifold/JHolomorphic.lean): the derivative-level pseudoholomorphicity predicate on which AnalyticStableMaps' carrier is built.
- `singularCohomologyFunctor` and the cup product (TauCeti/AlgebraicTopology/Cohomology/Basic.lean, Cup.lean): `H^*(X; ℚ)` with its ring structure, the state space of every operation.

### From TauCetiRoadmap.AnalyticStableMaps

- §1.1–§1.2: prestable maps, their retained-arrow groupoid, the class of a map and the stability theorem. A stable map may have nonconstant unmarked spheres or tori; finiteness of the map automorphism group is the stability condition.
- §0.1: the energy–area identity `E(u) = ∫u*ω = ⟨[ω], u_*[Σ]⟩` on closed components for the metric `g_J(v, w) = (ω(v, Jw) + ω(w, Jv))/2`, and the uniform comparison of Dirichlet energy and symplectic area over a compact family of tame structures on compact `X`. §0.3 and §4.1: the closed Cauchy–Riemann index and the nodal augmented index, whose value is `d_(g,n,A)`.
- §3.7: all-genus Gromov compactness of the coarse stable-map space for fixed `(g, n, A)` and a compact family of tame structures.
- §4.3: finite-dimensional real equivariant obstruction spaces supported away from nodes and marks. §6.2–§6.3: fixed-evaluation complements, right inverses and the uniform quadratic estimate. §7.3: projection charts and topological regularity.
- §9.2: the rational dual-Čech virtual functional `Φ_(g,n,A)` on the compact coarse stable-map space, with coefficients in the virtual orientation sheaf.
- §10.1–§10.2: relative families over `P`, the interpolation of tame structures by smooth paths fixed near their endpoints, finite-subatlas and refinement comparisons, and the rule that changes of auxiliary data not embedded in one ambient family require a constructed common ambient family or compatible cobordism.
- §11.1: evaluation to `X^n`, the map to the coarse stable-pointed space in the stable range, map-level forgetting with the anchor adapter, and auxiliary-mark independence. §11.2: external and self-clutching on evaluation-equal fibre products and the marked universal family with its equivariant and refinement maps.
- §12.1: joint models for diagonal identities and the trace squares obtained from ImplicitAtlases Layer 7 for the target diagonal `Δ : X → X × X`. §12.2: the forget-compatible ambient collection, the same-obstruction endpoint and the forgetting trace comparison; it states explicitly that the unit, divisor and splitting identities are not consequences of atlas existence.
- §13.1: pushforward of the functional along a continuous map, represented by a homology class for finite-CW targets. §13.2: the finite-CW model of `X^n`. §13.3: the stabilization–evaluation map `(st, ev)` to `|M̄_(g,n)| × X^n` and the domain-target adapter. §13.4: the exports consumed here.

### From TauCetiRoadmap.ImplicitAtlases

- §1.1: the implicit-atlas axioms, the local product projections `E_(J∖I)` and the freeness of the extra group over the regular preimage; §1.1's reflection atlas and `z ↦ zⁿ` examples fix what a chart weight means.
- §4.2–§4.3: the global relative trace and the finite-subatlas independence of the rational virtual class.
- §5.2: `δ^∨[X]^vir = [∂X]^vir` with outward-first orientation and the cobordism law for compatible boundary atlases; §5.3: refinements, shrinkings and disjoint unions; §5.4: pushforward along a continuous map.
- §5.6: the zero-set atlas of a smooth section with compact zero set, the regular-manifold normalization and the agreement of its class with the compactly supported Euler pairing. Layer 3 uses it as the linear Euler atlas at the end of a constructed concordance, never as a theorem about the stable-map atlas itself.
- §6.4–§6.5: product atlases and the Čech external product; §7.1–§7.3: fiber-product atlases, the supported Gysin map `i_!` and `Φ_Z(a) = Φ_P(i_!(a))`; §7.4: the application interface.

### From TauCetiRoadmap.TopologicalSheafCohomology

- §0.1 and §1.2–§1.3: the constant-coefficient Čech cohomology of a compact Hausdorff space as a cover colimit and its comparison with derived sections, consumed through ImplicitAtlases' use of them and in the test-class carrier of §2.1.

### From TauCetiRoadmap.ComplexCurveModuli

- D5: the countable étale stable pointed chart groupoid. D6: analytic properness of the stable-domain groupoid and the compact Hausdorff coarse space; D6 item 4: `finiteActionUniversalChart` and `unorderedAuxiliaryActionChart` with the lifted universal family. D4 and D3 item 5: Hardy gluing, universal plumbing charts and marked deformation slices, consumed in §3.2 as the family geometry on which the scalar operator is built.
- D7 item 1: one-mark forgetting and contraction with the bridge equation `xv = t₁t₂`, ordered and setwise arrow descent, `forgetAuxiliarySet` and the order coherence of forgetting an unordered auxiliary set. D7 item 2: `markedPointCollisionBubbleCharts`. D7 item 3: external and self-clutching with the permanent node and the smoothing line `T_* ⊗ T_**`, whose plumbing parameter is defined up to a nonvanishing unit.
- D8: the Orbifolds target adapter of the stable-domain groupoid with its complex orientation, the compact coarse finite-CW and Čech/singular witness, the product maps for `M̄_(g,n) × X^n`, the weighted rational perfect pairing and the generic ineffective isotropy of order 2 on `M̄_(1,1)` and `M̄_(2,0)`.

### From TauCetiRoadmap.Orbifolds

- O1–O3: retained-arrow presentations, averaging and the coarse triangulation. O4: orbibundles and the finite-atlas comparison. O5 item 1: the weighted integral `|G|⁻¹∫_U` with the full ineffective kernel; O5 item 4: compact weighted classes and rational duality with the weighted fundamental class `(1/k)[|Γ|]` for generic ineffective order `k`; O5 item 5: Thom classes of oriented orbibundles and Gysin maps for representable embeddings and proper submersions. Everything is applied to the compact Deligne–Mumford targets of D8 and to their products.

### From TauCetiRoadmap.MorseNovikov

- N1: `Nov(R, H, N)` for an abelian group `H` and a homomorphism `N : H → ℝ`, with the support condition that every sublevel set `{h : a(h) ≠ 0, N(h) < C}` is finite; coefficientwise equality, convolution with its finiteness lemma, the `AddMonoidAlgebra` embedding, the period filtration `U_C` with completeness, the nonnegative subring and strictly positive ideal, exp and log over a ℚ-algebra, and the pushforward `P_(ρ,φ)` along period-compatible homomorphisms. No completed tensor product and no domain property for `H` with torsion are taken from it.

### From TauCetiRoadmap.CharacteristicClasses

- C2 item 1: the Thom class of an oriented real vector bundle. C2 item 3: the zero locus of a transverse section represents the Euler class, and `e(TM)[M] = χ(M)` for a closed oriented manifold `M`. C3 item 2: integral Chern classes with pullback, Whitney, dual, line-twist and tensor-product formulas and `c_r(E) = e(E_ℝ)`; in particular `c_m(L ⊗ V) = Σ_(k=0)^m c₁(L)^k c_(m−k)(V)` for a line bundle `L` and a rank-`m` bundle `V`. C1.2b: the Čech/singular comparison on paracompact Hausdorff spaces of CW type.

### From TauCetiRoadmap.AlgebraicTopology

- Stage 6 item 1: singular cochains and the universal-coefficient sequence over a PID, under its stated coefficient hypotheses. Stage 6 item 2: cup and cap products with their signs. Stage 5 item 1: Eilenberg–Zilber and the Künneth isomorphism over a field. Stage 7 item 1: Euler–Poincaré for spaces of finite CW type, so that the `χ(X)` of CharacteristicClasses C2 item 3 is `Σ_i (−1)^i dim H^i(X; ℚ)`. Stage 8 item 7: finite CW type of compact smooth manifolds.

### From TauCetiRoadmap.GeometricTopology

- Smoothing-and-triangulation comparison item 1: a compact smooth manifold has a finite smooth triangulation.

### From TauCetiRoadmap.DifferentialGeometry

- 8.3–8.5: smooth singular chains, integration of forms over chains, Stokes for chains and the de Rham comparison `deRhamEquiv` on a Hausdorff σ-compact finite-dimensional manifold.

### From TauCetiRoadmap.ComplexKahlerGeometry

- K5b: Dolbeault Hodge theory and Serre duality on compact complex manifolds, applied to the smooth normalization components of a nodal domain with the sheaf `𝒪` and the canonical sheaf.

### From TauCetiRoadmap.HeegaardFloer

- Lane F1 items 1–3: Sobolev spaces of maps of surfaces, the Calderón–Zygmund interior estimate and bootstrapping, linear Cauchy–Riemann operators on discs and strips as Fredholm operators. Lane F2 item 1: tame and compatible structures. Nothing here concerns a compact Riemann surface with circle boundaries, which §3.2 constructs.

### From TauCetiRoadmap.PDE

- Lane A items 1 and 6: weak Sobolev spaces, trace and extension on Lipschitz domains, the local trace floor of §3.2.

## How to read the build

Layer 0 fixes the coefficients: the effective set, the Novikov ring on `H₂(X; ℤ)`, the completed state module and the finiteness of classes below an energy bound. Layer 1 builds the combined evaluation–stabilization diagrams on actual stable-map charts and fixes the stable-range conventions. Layer 2 defines `I_(g,n,A)` by the weighted pairing on the Deligne–Mumford target against the virtual functional and proves its independence of the tame structure along compact paths. Layer 3 fixes orientations and isotropy weights, constructs the Hodge bundle on nodal domains and computes the constant-map operations, including `I_(1,1,0)(1) = χ(X)·1`. Layers 4–6 prove the eight Kontsevich–Manin properties, the two gluing identities of Layer 6 requiring the boundary Thom, transfer and spine constructions of §6.4–§6.6. Layer 7 sums the operations into Novikov-completed classes, proves the unital cohomological field theory and constructs the associative quantum product. Layer 8 constructs cotangent lines and ψ-classes, the descendant and ancestor brackets and their equations. Numbering: Layer k is the k-th stage in build order and carries the label Gk by which HamiltonianFloerOperations cites it; subsection k.n is the n-th target of that layer.

## Layer 0: Coefficients, effective classes and finiteness (G0)

### 0.1 Realized effective classes and the area homomorphism

Fix `(g, n, J)`. Define the effective set `Eff(g, n, J) ⊆ H₂(X; ℤ)` as the set of classes represented by a stable map of type `(g, n)` for `J`, with `0` adjoined (AnalyticStableMaps §1.1 for the class of a map). Define the area homomorphism `ω : H₂(X; ℤ) → ℝ` by pairing with the de Rham class of `ω` (DifferentialGeometry 8.4–8.5). Prove that a nonconstant component of a `J`-holomorphic stable map has positive area, by the pinned pointwise positivity `Tames.stdComplexLineEnergyDensity_pos` and the energy–area identity of AnalyticStableMaps §0.1, so that a stable map of area zero is constant and has `A = 0`, and so that every class in `Eff(g, n, J)` other than `0` has positive area. Retain the area homomorphism as a map to ℝ even when its image is not discrete.

- `0 ∈ Eff(g, n, J)` for every `(g, n)` by definition; `0` is represented by a constant stable map exactly when `2g − 2 + n > 0` and `X` is nonempty. For the unstable pointed signatures `(0, 0)`, `(0, 1)`, `(0, 2)`, `(1, 0)`, and for `X = ∅`, the stable-map space of class `0` is empty although `0 ∈ Eff(g, n, J)`.
- `A ∈ Eff(g, n, J)` and `A ≠ 0` imply `ω(A) > 0`; a nonzero torsion class is in no effective set.
- For `A ∉ Eff(g, n, J)` the stable-map space is empty, and every operation of class `A` is zero (Layer 4).

**Checks.**

- `ℂP²` with the Fubini–Study form of line area 1: `H₂ = ℤ·ℓ`, `ω(dℓ) = d`, and `Eff(0, 3, J) = {dℓ : d ≥ 0}` for the standard `J`; a class `dℓ` with `d < 0` has negative area and is excluded by positivity alone.
- The product `T² × T²` of two tori of areas `1` and `√2`: `H₂` has rank 6, the area image `ℤ + √2ℤ` is dense in ℝ, and for a product complex structure `E₁ × E₂` the degree-`a` covers of a fibre `E₁ × {y}` and the degree-`b` covers of a fibre `{x} × E₂` represent `aF₁` and `bF₂` in genus one, of areas `a` and `b√2`; no discreteness of the area image is available or used. Mixed classes occur: for `E₁ = E₂ = E` the diagonal of `E × E` is a genus-one holomorphic curve whose class has nonzero Künneth component in `H₁ ⊗ H₁`, so it pairs to `1` with a suitable `α₁ ⌣ β₂` while every `aF₁ + bF₂` pairs to `0`, and its area is `1 + √2`. No classification of genus-one effective classes is asserted.
- An Enriques surface with a Kähler form: `H₂(X; ℤ) ≅ ℤ^10 ⊕ ℤ/2`, and the nonzero torsion class has area `0`, so it is represented by no nonconstant map and lies in no effective set although it lies in the kernel of the area homomorphism.

*Needs:* Tau Ceti `SmoothTwoForm.Tames`, `Tames.stdComplexLineEnergyDensity_pos`; AnalyticStableMaps §0.1, §1.1; DifferentialGeometry 8.4–8.5.

### 0.2 The Novikov coefficient ring and the completed state module

Define `Λ_ω = Nov(ℚ, H₂(X; ℤ), ω)`, the period-controlled completed group ring of MorseNovikov N1 for the additive group `H₂(X; ℤ)` and the period homomorphism `ω`; it is a commutative ℚ-algebra and need not be a field or a domain. For a finite-dimensional rational vector space `V` define `V ⊗̂ Λ_ω` as the space of functions `H₂(X; ℤ) → V` satisfying the N1 support condition, with its support filtration `U_C(V)` and the Cauchy product `(V ⊗̂ Λ_ω) × (W ⊗̂ Λ_ω) → (V ⊗ W) ⊗̂ Λ_ω`. Prove that the canonical map `V ⊗ Λ_ω → V ⊗̂ Λ_ω` is an isomorphism for finite-dimensional `V`, by choosing a finite basis of `V` and taking the finite union of the coordinate supports; this is a statement about finite-dimensional `V` and not a completed base-change theorem. Prove that the Cauchy product is bilinear and continuous for the support filtration, and that for a finite free graded state module with a perfect pairing the induced `Λ_ω`-bilinear pairing is perfect and pairs the homogeneous pieces defined next. Define the degree of the monomial `q^A` as `2c₁(A)`. For an integer `D` let `Λ_ω^D` be the elements supported in `{A : 2c₁(A) = D}`, and for graded `V` let `(V ⊗̂ Λ_ω)^D` be the functions `A ↦ v_A` with `v_A ∈ V^(D − 2c₁(A))` for every `A`; these homogeneous pieces are closed in the support filtration. Prove that `Λ_ω^D · Λ_ω^E ⊆ Λ_ω^(D+E)` and that the Cauchy product maps `(V ⊗̂ Λ_ω)^D × (W ⊗̂ Λ_ω)^E` into `((V ⊗ W) ⊗̂ Λ_ω)^(D+E)`, so that `⊕_D Λ_ω^D` is a graded ring and `⊕_D (V ⊗̂ Λ_ω)^D` a graded module over it in the ordinary sense. Prove that every element of `V ⊗̂ Λ_ω` is the sum, convergent in the support filtration, of its homogeneous components (for each `C` only finitely many components meet `{ω < C}`), and that every such convergent sum of homogeneous elements lies in `V ⊗̂ Λ_ω`; so `Λ_ω` and `V ⊗̂ Λ_ω` are the filtered completions of these direct sums and need not be internally graded. Prove that `Λ_ω` is the internal direct sum of its homogeneous pieces exactly when `c₁(TX, J)` pairs to zero with every class of `H₂(X; ℤ)`, in which case it is concentrated in degree `0`, and that otherwise, for a class `A` with `c₁(A) ≠ 0` and a class `B` with `ω(B) > 0` (one exists when `X` has positive dimension, since `[ω]^m ≠ 0` and `H²(X; ℝ) ≅ Hom(H₂(X; ℤ), ℝ)`), the series `Σ_(k≥0) q^(kA + k²B)` satisfies the support condition, its areas `k·ω(A) + k²·ω(B)` tending to `+∞`, and has nonzero components in the infinitely many degrees `2(k·c₁(A) + k²·c₁(B))`; the same holds for `V ⊗̂ Λ_ω` with `V ≠ 0`. A homogeneous element of degree `D` has its Chern numbers in the finite set `{(D − k)/2 : V^k ≠ 0}`, and may still have infinitely many monomials when infinitely many classes share a Chern number; an element may have components in infinitely many degrees.

- `Λ_ω` contains `ℚ[H₂(X; ℤ)]` through N1's embedding, and the embedding is onto exactly when `ω = 0` on `H₂(X; ℤ)`.
- `deg(q^A q^B) = deg q^A + deg q^B`, `deg q^0 = 0`; `q^A` is a unit of degree `2c₁(A)` with inverse `q^(−A)` of degree `−2c₁(A)`.
- For finite-dimensional `V` and `W` the Cauchy product of `V ⊗̂ Λ_ω` and `W ⊗̂ Λ_ω` is the ordinary tensor product of `V ⊗ Λ_ω` and `W ⊗ Λ_ω` under the isomorphism above.

**Checks.**

- `X = S²` with area 1: `H₂ = ℤ`, `ω(k) = k`, and N1's comparison identifies `Λ_ω` with the Laurent series ring `ℚ((q))`; `deg q = 2c₁([S²]) = 4`. For `ℂP²` the line class has `deg q^ℓ = 6`; for a K3 surface every class has degree `0`.
- `X = S²`: the series `Σ_(k≥0) q^k ∈ ℚ((q))` has components in the degrees `0, 4, 8, …`, so it is neither homogeneous nor a finite sum of homogeneous elements and lies only in the completion; for `V = ℚ` in degree `0` a homogeneous element of degree `D` is a single monomial `a q^(D/4)`. On `T² × T²` with `c₁ = 0` the series `Σ_(a,b ≥ 0) q^(aF₁ + bF₂)` has infinitely many monomials and is homogeneous of degree `0`.
- `V = ℚ²` with basis `e₁, e₂`: the element sending `A ↦ e₁` for `A` in a sublevel-finite support `S₁` and `A ↦ e₂` on a disjoint `S₂` is `e₁ ⊗ f₁ + e₂ ⊗ f₂` with `f_i` the indicator series of `S_i`, so it lies in `V ⊗ Λ_ω`; for `V = ℚ^(∞)` with basis `e₁, e₂, …` the function `A_k ↦ e_k` on classes `A_k` of area `k` satisfies the support condition but is not a finite sum of pure tensors, so the isomorphism fails for infinite-dimensional `V` and finite dimension is used.
- `T² × T²` with areas `1` and `√2` and `c₁ = 0`: `Λ_ω` is concentrated in degree `0`, the series `Σ_(a,b ≥ 0) q^(aF₁ + bF₂)` converges in the area filtration because `{(a, b) : a + b√2 < C}` is finite for every `C`, and the series `Σ_(a ≥ 0) q^(aF₁ − aF₂)` with areas `a(1 − √2) → −∞` violates the support condition and is not an element of `Λ_ω`. Since `c₁ = 0` on `H₂`, `Λ_ω = Λ_ω^0` is internally graded here, as it is for a K3 surface; on `S²` the series `Σ_(k≥0) q^k` above has components in infinitely many degrees, so `Λ_ω` is not internally graded there, and a claim that the completion is never internally graded fails on `T² × T²`.
- On `T²` with `H₂ = ℤ`, the pairing `∫ α ⌣ β = 1` on `H¹` extends to a perfect pairing of `H^*(T²; ℚ) ⊗̂ Λ_ω` of total degree `−2` over `Λ_ω`, and the odd generators remain odd in the completed grading since `deg q^A = 0`.

*Needs:* MorseNovikov N1; §0.1; Mathlib `AddMonoidAlgebra`, `Basis`; CharacteristicClasses C3 item 2 for the integral `c₁(TX, J)`.

### 0.3 Finiteness of classes below an energy bound

Prove that for a compact family of tame structures `J_p`, `p ∈ P`, and every bound `E`, only finitely many classes `A ∈ H₂(X; ℤ)` with `ω(A) ≤ E` are represented by a `J_p`-holomorphic stable map for some `p`. Route: GeometricTopology's smooth triangulation gives a finite CW model of `X`, hence `H₂(X; ℤ)` is finitely generated, with finite torsion subgroup and free quotient of finite rank `b`; AlgebraicTopology Stage 6 item 1 gives the universal-coefficient duality between `H²(X; ℝ)` and `Hom(H₂(X; ℤ), ℝ)`, under its stated coefficient hypotheses and not as the source of finite generation; DifferentialGeometry 8.5 represents a dual basis of the free quotient by closed real two-forms `η₁, …, η_b`. For a `J_p`-holomorphic stable map `u` of class `A` bound `|⟨η_i, A⟩| = |∫_Σ u*η_i| ≤ ‖η_i‖_(comass, g_p) · Area_(g_p)(u)`, where `g_p(v, w) = (ω(v, J_p w) + ω(w, J_p v))/2`, and prove the uniform comparison `Area_(g_p)(u) ≤ C · ω(A)` over the compact family from AnalyticStableMaps §0.1. The comass of each `η_i` is bounded uniformly in `p` by compactness of `X × P`. Hence each coordinate of the image of `A` in the free quotient is bounded by `C_i E`, so the image lies among finitely many lattice points, and finiteness of the torsion subgroup gives finitely many classes. Prove separately that the geometric supports of the operations of Layer 2 satisfy the N1 support condition, and that for a fixed `A` and two sublevel-finite supports the decompositions `A = A₁ + A₂` with `A_i` in the supports have `ω(A_i)` bounded above, hence are finitely many. N1's convolution finiteness holds for arbitrary sublevel-finite supports; nothing in N1 asserts that such supports are realized by curves, and this target does not infer it.

- The set `{A ∈ Eff(g, n, J_p) for some p : ω(A) ≤ E}` is finite for every `E`.
- The comass bound is uniform over a compact family of tame structures and depends on `(X, ω, P, J)` only.
- For a Novikov series supported on realized classes the sublevel sets `{A : ω(A) < C}` are finite, so the series is an element of `Λ_ω`.

**Checks.**

- `ℂP²`: `b = 1`, `η₁` the Fubini–Study form, `|⟨η₁, dℓ⟩| = d ≤ ω(dℓ) = d`; the classes with `ω ≤ E` are `dℓ` with `0 ≤ d ≤ E`, `⌊E⌋ + 1` of them.
- `T² × T²` with areas `1` and `√2`: `b = 6` and the six dual forms have comass bounded by a constant `C`; a realized class with `ω(A) ≤ E` has all six coordinates bounded by `CE`, so it lies among at most `(2CE + 1)^6` lattice points although the area image is dense. A finiteness argument from discreteness of the area image would be unavailable here.
- An Enriques surface: the torsion subgroup `ℤ/2` of `H₂` is nonzero, so a bound on the ten free coordinates alone leaves two, not one, classes per lattice point; the torsion count is part of the finite total.
- The decomposition count: on `ℂP²` with `A = 3ℓ`, the decompositions `A₁ + A₂ = A` into realized classes are `(0, 3ℓ), (ℓ, 2ℓ), (2ℓ, ℓ), (3ℓ, 0)`, four of them; with `A₁` allowed to range over all of `H₂` the pairs would be infinite.

*Needs:* §0.1, §0.2; GeometricTopology smoothing-and-triangulation comparison item 1; AlgebraicTopology Stage 6 item 1, Stage 8 item 7; DifferentialGeometry 8.3–8.5; AnalyticStableMaps §0.1, §2.1; MorseNovikov N1.

### Examples

- `ℂP¹` with the area-1 form: `Λ_ω = ℚ((q))` with `deg q = 4`, realized classes `dℓ`, `d ≥ 0`.
- The irrational torus `T² × T²` of areas `1` and `√2`: a dense area image with finitely many realized classes below every bound.

### Dependencies

Mathlib `AddMonoidAlgebra`; Tau Ceti symplectic carriers; MorseNovikov N1; AnalyticStableMaps §0.1, §1.1, §2.1; DifferentialGeometry Layer 8; GeometricTopology; AlgebraicTopology Stages 6 and 8; CharacteristicClasses C3.

## Layer 1: Stable-map operations and domain/virtual interfaces (G1)

### 1.1 The stable-map carrier and the stable range

Consume the stable-map groupoid of AnalyticStableMaps §1.1 with its retained automorphism arrows, its compactness (§3.7), its evaluation and map-level forgetting (§11.1), its clutching and universal family (§11.2) and its actual map-level gluing and refinement data (§12.1–§12.2). A stable map has a connected nodal domain of arithmetic genus `g`, `n` ordered distinct smooth marks, componentwise `J`-holomorphic maps of total class `A` and finite automorphism group; a nonconstant unmarked sphere or torus is allowed, and constant components unstable as pointed curves are contracted. Prove that the condition `2g − 2 + n > 0` is exactly the condition under which the domain stabilization to `M̄_(g,n)` exists, that `(0, 3)` is stable with `M̄_(0,3)` a point, and that for the unstable pointed signatures `(0, 0)`, `(0, 1)`, `(0, 2)` and `(1, 0)` the map-stable moduli spaces exist and carry the virtual functional but no Deligne–Mumford target, so that their operations are numerical and are defined by the virtual functional alone (§2.2).

**Checks.**

- A degree-one map `ℂP¹ → ℂP¹` with no marks is map-stable, of pointed signature `(0, 0)`: its automorphism group is trivial, its moduli space is a point with `d_(0,0,ℓ) = 2(−2 + 2 + 0) = 0`, and no stabilization map exists.
- A constant sphere with two marks has automorphism group `ℂ^*` and is not a stable map, so the class `0` with `(g, n) = (0, 2)` has empty moduli space although `d_(0,2,0) = 2(m − 3 + 2) = 2m − 2`; for `X = ℂP¹` the carrier is empty, `d = 0` and the numerical operation is `0`. The emptiness comes from stability, not from the dimension.
- A constant torus with one mark is a stable map with automorphism group of order 2 generically, pointed signature `(1, 1)`, and `d_(1,1,0) = 2(0 + 0 + 1) = 2`, the dimension of `M̄_(1,1) × X` minus the obstruction rank `2m`.

*Needs:* AnalyticStableMaps §1.1–§1.2, §3.7, §11.1–§11.2, §12.1–§12.2; ComplexCurveModuli D5–D6.

### 1.2 Combined evaluation–stabilization diagrams

Construct, on a finite common refinement of the stable-map charts of AnalyticStableMaps §7.3 and §9.1, the combined map `(st, ev)` to `|M̄_(g,n)| × X^n` of §13.3 together with its chart-level lift: choose auxiliary marks where required, construct the classifying map to the stable-domain charts of ComplexCurveModuli D5 and the induced homomorphisms of isotropy groups, and prove compatibility with the arrow maps of the stable-map groupoid, with auxiliary-mark forgetting and with chart refinements. The coarse pushforward of the virtual class along the tautological map to `M̄_(g,n) × X^n` is Pardon, Definition 9.3.1, p. 100, in the algebraic-atlas setting; the chart-level lift with its isotropy homomorphisms is this roadmap's construction. The isotropy homomorphisms need be neither injective nor surjective. Where stabilization is a sequence of one-mark contractions of D7 item 1, consume D7's proved order coherence of `forgetAuxiliarySet` only where every intermediate pointed target is stable; where a transition is map-stable but pointed-unstable, use the map-forgetful family of AnalyticStableMaps §11.1 instead. Pullbacks of the universal nodal curve to a map chart may have singular total space `xy = s(b)`; construct the relative-family and node-normalization diagrams on the actual map charts and never apply a smooth-bundle Gysin map to the nodal projection without proving its hypotheses or constructing the relative virtual substitute of §5.1.

- The combined map is continuous on the compact coarse space, and its chart lifts commute with the quotient maps and with the `ψ_(IJ)` of the atlas.
- Composing with the projection to `|M̄_(g,n)|` gives `st`, with the projection to `X^n` gives `ev`.
- Stabilization through two different orders of auxiliary contraction gives canonically isomorphic results, by D7 item 1's coherence.

**Checks.**

- Lines in `ℂP²` with three marks, class `ℓ`: `st` maps the 10-dimensional moduli space to the point `M̄_(0,3)` and `ev` to `(ℂP²)³`; at a map whose three marks are distinct the isotropy homomorphism is from the trivial group to the trivial group.
- A map with a nonconstant unmarked rational tail attached to a constant three-marked sphere, `(g, n) = (0, 3)`: `st` contracts the tail, the stabilized domain is the three-marked sphere, and the forgetful route through `(0, 2)` is pointed-unstable, so the map-forgetful family of §11.1 is used.
- The genus-one constant class: `M̄_(1,1)(X, 0) = M̄_(1,1) × X` and the isotropy homomorphism at a generic point is the identity of `ℤ/2`; at the curve with `j = 1728` it is the identity of `ℤ/4`.

*Needs:* §1.1; AnalyticStableMaps §7.3, §9.1, §11.1, §13.3; ComplexCurveModuli D5, D7 item 1.

### Examples

- Lines in `ℂP²`: the combined map to `M̄_(0,3) × (ℂP²)³`.
- The constant genus-one class: `M̄_(1,1) × X` with its isotropy homomorphisms.

### Dependencies

Layer 0; AnalyticStableMaps Layers 1, 3, 7, 9, 11–13; ComplexCurveModuli D5–D7.

## Layer 2: From the virtual functional to a cohomology-valued operation (G2)

### 2.1 The weighted pairing and the weighted adjoint

For a compact Deligne–Mumford target `M̄_(g,n)` with the adapter of ComplexCurveModuli D8, define `⟨α⟩ = ∫^wt α` for `α` of top degree as the weighted rational integral of Orbifolds O5 item 1, and prove that the pairing `(α, β) ↦ ∫^wt α ⌣ β` on `H^*(M̄_(g,n); ℚ)` is perfect (O5 item 4). For a proper forgetful or clutching map `π` between such targets define `π_*` as the adjoint of `π^*`: `∫^wt_target (π_* a) ⌣ b = ∫^wt_source a ⌣ π^* b` for all `b`. Prove that the right side is defined on the Čech/singular carrier of the target (TopologicalSheafCohomology §1.2–§1.3, CharacteristicClasses C1.2b on the finite-CW coarse space of D8) and that existence and uniqueness of `π_* a` follow from perfectness, not from Poincaré duality of the map moduli. The weighted adjoint is a definition of this roadmap on the supplier's weighted pairing and has no further source. Keep the coarse cohomology with its weighted pairing distinct from stack cohomology, from unweighted coarse integration and from an unqualified identification of homology with cohomology.

- `π_*` is `ℚ`-linear of degree `dim target − dim source` and satisfies the projection formula `π_*(a ⌣ π^* b) = (π_* a) ⌣ b`.
- `(π ∘ π')_* = π_* ∘ π'_*`.
- For the identity map `π_*` is the identity.

**Checks.**

- `M̄_(1,1)`: the generic isotropy has order 2, so `∫^wt 1 ⌣ [pt]^∨ = 1/2` where `[pt]^∨` is the coarse orientation class of the sphere `|M̄_(1,1)|`; unweighted coarse integration would give `1`.
- `M̄_(0,4) → M̄_(0,3)` forgetting the fourth mark: `π_* 1 = 0` since the degree of `π_* 1` is `−2`, and `π_* [pt] = 1` for a point class of the cross-ratio sphere; a definition of `π_*` by unweighted coarse integration gives the same values here because all isotropy is trivial.
- The self-clutching `ξ : M̄_(0,3) → M̄_(1,1)` onto the boundary point: `ξ_* 1` is the class with `∫^wt_(M̄_(1,1)) (ξ_* 1) ⌣ 1 = ∫^wt_(M̄_(0,3)) 1 = 1`, so `ξ_* 1 = 2[pt]^∨` in terms of the coarse point class, twice the unweighted pushforward of the point.

*Needs:* ComplexCurveModuli D8; Orbifolds O5 items 1 and 4; TopologicalSheafCohomology §1.2–§1.3; CharacteristicClasses C1.2b; AlgebraicTopology Stage 6 item 2.

### 2.2 The operation `I_(g,n,A)`

For homogeneous insertions put `s = Σ_i deg γ_i`, `t = 6g − 6 + 2n`, `d = d_(g,n,A)` and `r = t − d + s`. Define `I_(g,n,A)(γ₁, …, γ_n) ∈ H^r(M̄_(g,n); ℚ)` as the unique class with

    ∫^wt_(M̄_(g,n)) ψ ⌣ I_(g,n,A)(γ₁, …, γ_n) = Φ_(g,n,A)(st^* ψ ⌣ ev₁^* γ₁ ⌣ ⋯ ⌣ ev_n^* γ_n)

for every test class `ψ` of degree `t − r`, where `Φ_(g,n,A)` is the rational dual-Čech functional of AnalyticStableMaps §9.2 applied to the pullback along the combined map of §1.2, with the Čech cup product on the coarse map space; uniqueness is by perfectness of §2.1. The displayed order of insertions is fixed and is changed only with its Koszul sign. For an unstable pointed signature define the numerical operation `⟨I_(g,n,A)(γ₁, …, γ_n)⟩ = Φ_(g,n,A)(ev₁^* γ₁ ⌣ ⋯ ⌣ ev_n^* γ_n)` when `s = d` and `0` otherwise. Prove that `r = Σ_i deg γ_i + 2(g − 1)m − 2c₁(A)`, the degree of the Conventions, and that the class-valued operation determines the numerical pairing `⟨I_(g,n,A)(γ)⟩ = ∫^wt I_(g,n,A)(γ)` when `r = t`.

- `I_(g,n,A)` is multilinear and vanishes when `r ∉ [0, t]`.
- `⟨I_(g,n,A)(γ)⟩ = Φ_(g,n,A)(ev^* γ)` when `s = d`: the class-valued definition with `ψ = 1` recovers the numerical one.
- The definition depends on the atlas only through finite-subatlas independence and the comparisons of §2.3.

**Checks.**

- `(g, n, A) = (0, 3, 0)` on `ℂP¹`: `d = 2(−2 + 0 + 3) = 2 = dim ℂP¹`, `t = 0`, so `r = s − 2` and `I_(0,3,0)(pt, 1, 1) = (∫_X pt) · 1 = 1 ∈ H⁰(M̄_(0,3))`, consistent with the mapping-to-a-point formula of §5.4.
- Lines in `ℂP²`: `⟨I_(0,3,ℓ)(pt, pt, H)⟩` has `d = 2(−1 + 3 + 3) = 10`, `s = 4 + 4 + 2 = 10`, `r = 0`, value `1`; `⟨I_(0,3,ℓ)(pt, pt, pt)⟩` has `s = 12 ≠ 10` and vanishes by degree.
- `(1, 1, 0)` on any `X`, insertion `1`: `r = 0 + 0 − 0 = 0`, so `I_(1,1,0)(1) ∈ H⁰(M̄_(1,1))` is a rational multiple of `1`, the multiple computed in §3.4; since `A = 0` this instance does not separate the sign of the Chern term, which the next Check pins.
- Lines in `ℂP²` with `(g, n) = (0, 4)`: `r = s + 2(−1)(2) − 6 = s − 10`; for `I_(0,4,ℓ)(pt, pt, H, H)` with `s = 12` the class has `r = 2 = t`, a top class with `⟨I⟩ = 1`; with the shift `+2c₁(A)` instead of `−2c₁(A)` one would get `r = 14 > t` and a zero operation, so the sign of the Chern term is pinned by this value.

*Needs:* §1.2, §2.1; AnalyticStableMaps §9.2, §13.3; ImplicitAtlases §4.3; §0.1 for the class convention.

### 2.3 Endpoint equality along tame paths and auxiliary reductions

For a compact collared path `J_t`, `t ∈ [0, 1]`, of tame structures, consume the family maps `(st, ev)` of AnalyticStableMaps §13.4 and the collared relative family of §10.1 with fixed class `A` and the uniform support of §0.3; choose compatible relative-atlas and cobordism data of ImplicitAtlases §5.2 over this family with the endpoint reductions as its boundary faces; evaluate the same test class `ψ` at both ends against the identical weighted pairing of D8, and apply the global relative trace and the outward-first boundary convention of §5.2 to prove that the two pairings agree for every `ψ`; perfectness then gives `I_(g,n,A)^(J₀) = I_(g,n,A)^(J₁)`. For auxiliary reductions at fixed `J`, or for changes of auxiliary data not contained in one ambient atlas, require the constructed common ambient family or compatible cobordism of §10.2; independence between arbitrary unrelated atlases is not asserted. The theorem is independence along supplied compact paths and reductions with the stated compactness, uniform-support and compatibility witnesses; it says nothing about varying `ω`.

- Two tame structures for the same `ω` are joined by a smooth path fixed near its endpoints (AnalyticStableMaps §10.1), so `I_(g,n,A)` depends on `(X, ω)` and the atlas data only through the comparisons above.
- Finite subatlases of one ambient collection give the same operation (ImplicitAtlases §4.3).

**Checks.**

- Lines in `ℂP²` for the integrable `J` and for a tame perturbation `J'`: both give `⟨I_(0,3,ℓ)(pt, pt, H)⟩ = 1`, the endpoint relation reading `[M_1] − [M_0] = 0` on the test class `1`.
- The zero-set atlases of `x ↦ x` and `x ↦ x²` on ℝ (ImplicitAtlases §5.2 Checks) have classes `1` and `0` and admit no concordance; on ℂ the atlases of `z ↦ z` and `z ↦ z²` have classes `1` and `2`, the complex double zero having multiplicity `2` (AnalyticStableMaps §10.2 Checks), and admit none either: two atlases without a common refinement or cobordism witness are not compared, which is why the witnesses are hypotheses.
- A path of tame structures that is not collared at its endpoints is first reparametrized to one that is; the relative family of §10.1 requires the collar.

*Needs:* §2.2, §0.3; AnalyticStableMaps §10.1–§10.2, §13.4; ImplicitAtlases §4.3, §5.2–§5.3; ComplexCurveModuli D8.

### Examples

- Lines in `ℂP²`: the three-point number `1` and the degree bookkeeping `r = s − 10`.
- The genus-one constant class: a degree-zero class on `M̄_(1,1)` through the weighted pairing.

### Dependencies

Layers 0–1; AnalyticStableMaps §9.2, §10, §13; ImplicitAtlases §4.3, §5.2–§5.4; ComplexCurveModuli D8; Orbifolds O5; TopologicalSheafCohomology Layer 1; CharacteristicClasses C1.2b.

## Layer 3: Orientation, isotropy and constant maps (G3)

### 3.1 Orientation and isotropy weights

Prove the compatibility of the complex orientation of `TX`, the real Cauchy–Riemann determinant line of AnalyticStableMaps §8.1, the obstruction orientation and the node, parameter and mark factors through groupoid arrows and atlas refinements, in the ordered convention of AnalyticStableMaps' Conventions. The obstruction spaces `E_α` are finite-dimensional real representations and are distinct from the rational coefficients of the functional. A chart with finite group `Γ_α` contributes weight `1/|Γ_α|`, ineffective kernel included; the Deligne–Mumford target carries its own isotropy weights; compare the two chartwise and on overlaps, and prove that there is no universal correction by a group order: a component with generic ineffective kernel of order `k` has weighted fundamental class `1/k` times its coarse fundamental class on both sides.

**Checks.**

- `M̄_(1,1) × X` for the constant class: source and target generic isotropy are both `ℤ/2`, the weights `1/2` agree chartwise, and `I_(1,1,0)` is a ratio in which they cancel; omitting the kernel on one side only would halve or double `χ(X)` in §3.4.
- A map with a nontrivial automorphism acting trivially on the stabilized domain, such as a degree-2 cover of a line in `ℂP²` with no marks: source isotropy `ℤ/2`, target `M̄_(0,0)` undefined, numerical operation weighted by `1/2`.
- The reflection atlas of ImplicitAtlases §1.1 is not locally orientable and is excluded by the orientation data before any weight is assigned.

*Needs:* AnalyticStableMaps §8.1, §9.1; ImplicitAtlases §1.1, §3.1; Orbifolds O5 item 1; ComplexCurveModuli D8.

### 3.2 The Hodge bundle on nodal stable domains

Construct the rank-`g` Hodge bundle `𝔼_g` on the stable-domain groupoid of ComplexCurveModuli D5 as the fibrewise dual of the rank-`g` cokernel bundle of the scalar operator `∂̄` on `𝒪_C`, as follows. On the normalized components of a fibre take holomorphic functions with Hardy boundary traces on the node circles of D4's plumbing charts and impose the Cauchy matching equations at paired node circles, with the plumbing parameters specifying the matching; construct this scalar operator family on D4's plumbing charts, prove its finite-dimensional kernel and cokernel reduction and its arrow-compatible base change, and identify the cokernel through the normalization complex `0 → 𝒪_C → ν_* 𝒪_C̃ → ⊕_(e ∈ E(Γ_C)) ℂ_e → 0`, whose last map is the difference of branch values (the cokernel of `𝒪_C → ν_* 𝒪_C̃` is a skyscraper of length one at each node, a node having δ-invariant `1`: Stacks Project, Lemma 19.7, Tag 0C4D, item (6); the sequence and its long exact cohomology sequence are those of the proof of Stacks Project, Lemma 18.3, Tag 0CE3). The maximum principle gives `H⁰(C, 𝒪_C) = ℂ` on connected fibres and the long exact sequence of the complex gives `dim H¹(C, 𝒪_C) = Σ_v g_v + |E(Γ_C)| − |V(Γ_C)| + 1 = Σ_v g_v + b₁(Γ_C) = g` for connected `C`. Identify the dual of the cokernel on a nodal fibre with the residue-matched meromorphic differentials on the normalization, with at most simple poles at paired node branches and opposite residues there, by componentwise Serre duality (ComplexKahlerGeometry K5b on each smooth normalization component) and the residue pairing, including the graph term; verify the identification through node smoothing. This is the description of the dualizing sheaf of a nodal curve of Deligne–Mumford, §1, p. 77, facts b) and c) (residue-matched differentials on the normalization, and `Hom(𝓕, ω_C)` dual to `H¹(C, 𝓕)`), stated there for stable curves of genus at least `2` and proved by coherent duality; the description is local at the nodes and is obtained here from the scalar family on every stable pointed fibre. The local elliptic inputs are HeegaardFloer Lane F1 items 1–3 on discs and strips and PDE Lane A items 1 and 6; the compact-component scalar operator with circle boundaries and Hardy traces is constructed here from them and from K5b on closed components, since neither supplier states it. No relative dualizing sheaf, GAGA or Grauert theorem is assumed; D4's Hardy families concern deformation and isomorphism maps, not a degenerating scalar family, which is this target.

- `𝔼_g` is an arrow-equivariant complex vector bundle of rank `g` on the stable-domain groupoid, compatible with base change and with the refinements of D5.
- On a smooth fibre `𝔼_g` is the space of holomorphic differentials.
- On a nodal fibre `𝔼_g` is the space of residue-matched differentials on the normalization, of dimension `Σ_v g_v + b₁(Γ_C)`.

**Checks.**

- The irreducible nodal rational curve, `g = 1`: normalization `ℂP¹` with branches `0` and `∞`, the differentials with at most simple poles there form `ℂ · dz/z`, with residues `+1` and `−1`, and the fibre is one-dimensional; here the residue theorem already forces opposite residues, so the matching condition is not tested, while a definition forbidding poles would give `0`.
- Two spheres joined at one node, `g = 0`: a differential with one simple pole on `ℂP¹` has zero residue by the residue theorem, hence is holomorphic, hence zero; the fibre is `0 = 0 + 0`.
- Two elliptic curves joined at one node, `g = 2`: each component contributes its holomorphic differential and a pole is excluded as before; dimension `1 + 1 + 0 = 2`. Two spheres joined at two nodes, `g = 1`: `b₁ = 1`; on each sphere the differentials with simple poles at its two branch points form a line, `c₁ dz/z` and `c₂ dw/w`, so the unmatched space has dimension `2`, and opposite residues at the paired branches impose the single condition `c₂ = −c₁` (the second node gives the same condition by the residue theorem), dimension `0 + 1 = 1`; a definition allowing independent residues would give `2`.
- On `M̄_(1,1)` the elliptic involution acts by `−1` on `𝔼₁`, so the generic ineffective `ℤ/2` acts nontrivially on `𝔼₁^∨ ⊗ T_xX`.

*Needs:* ComplexCurveModuli D3 item 5, D4, D5, D6; ComplexKahlerGeometry K5b; HeegaardFloer Lane F1 items 1–3; PDE Lane A items 1 and 6.

### 3.3 The constant-map obstruction model and the master concordance

On the constant-map charts of AnalyticStableMaps for `A = 0`, restrict to `Z = M̄_(g,n) × X` and construct a chart-arrow-compatible `Γ`-equivariant identification of the obstruction cokernel over `Z` with `H¹(C, 𝒪_C) ⊗ T_xX ≅ 𝔼_g^∨ ⊠ TX`, including the node-matching terms of the normalization complex. Construct a constant-map-adapted deformation family on a finite common refinement of the charts: in local target coordinates choose a coherent centre and a splitting of the constant-map directions, write the map as `u = exp_x(tξ)` and the obstruction coordinate as `e = te'`, and form `F_t(ξ, e') = t⁻¹F(exp_x(tξ), te')`, extended at `t = 0` by the fixed-domain linearization; prove that the centre and splitting choices respect chart arrows and refinements, or give the explicit transition homotopies. The normalization removes the constant `TX` kernel; AnalyticStableMaps §6.3 supplies the uniform quadratic estimate and §6.2 the fixed-evaluation complements; domain parameters enter continuously, not differentiably, across nodal strata. Along compact `Z` write the normal derivative `A = D_ν s(z, 0) : ν_Z → E|_Z` in a common finite-dimensional obstruction enlargement containing the atlas obstruction space and the constant-map model; prove, compatibly with arrows and refinements, that `A` is a `Γ`-equivariant bundle isomorphism onto its image `N_im ⊂ E|_Z`, choose an equivariant splitting `E|_Z = N_im ⊕ Ob` with projection `P`, and take the left inverse `A⁻¹P`; `Ob` is the extra obstruction, and `A⁻¹P` is not a right inverse onto `E|_Z` when `Ob ≠ 0`. For nested forcing spaces construct the compatible graph splitting: `E_I → Ob` is onto, `N_im = ker(E → Ob)`, and an equivariant lift of the extra-obstruction quotient gives `ν_J ≅ ν_I ⊕ E_(J∖I)` in chart coordinates; the raw extra summand need not lie in the uncorrected image. Prove the uniform estimate `‖s(z, ν) − A_z ν‖ ≤ C‖ν‖²`; at a zero of `s` or of the straight-line homotopy `A_z ν + t(s(z, ν) − A_z ν)` inside the master concordance, projection to `N_im` gives `‖ν‖ ≤ ‖A⁻¹P‖ C ‖ν‖²`, so after shrinking a uniform neighbourhood `ν = 0`, and compactness of `Z` keeps zeros inside the neighbourhood. Apply the product-projection and cocycle laws of ImplicitAtlases §1.1 to the master family and construct a collared concordance of §5.2 to the linear Euler atlas of §5.6. This is a target with the stated choice and coherence obligations, not a consequence of a chartwise straight-line homotopy, and it assumes neither a globally transverse equivariant section nor a smooth ambient zero locus.

**Checks.**

- `g = 0`: the obstruction rank is `0`, `Ob = 0`, `A` is an isomorphism `ν_Z ≅ E|_Z` on a regular chart and the concordance is to the manifold atlas of `M̄_(0,n) × X`.
- `g = 1`, `m = 1`: `E|_Z ≅ 𝔼₁^∨ ⊠ Tℂ P¹` has rank `1`; with one thickening datum of rank 1 the enlargement has rank 2, `N_im` rank 1 and `Ob` rank 1.
- A splitting chosen independently on two overlapping charts without a transition homotopy need not be arrow-compatible; the ineffective `ℤ/2` on `M̄_(1,1)` acts by `−1` on `Ob`, so an averaging that ignored it would produce the zero splitting.

*Needs:* §3.1, §3.2; AnalyticStableMaps §4.3, §6.2–§6.3, §7.3, §9.1; ImplicitAtlases §1.1, §5.2, §5.6.

### 3.4 The constant-map Euler class and the genus-one normalization

For `A = 0` the constant-map chart is `M̄_(g,n) × X` with obstruction bundle `𝔼_g^∨ ⊠ TX` of complex rank `mg` (Kontsevich–Manin 2.4.5, p. 10, where `E = R¹π_*𝒪` is the dual of `𝔼_g`). Construct the weighted Euler/Thom functional of the finite-chart equivariant obstruction representation by the local Thom construction (CharacteristicClasses C2 item 1), descend the rational Čech classes over the compact domain charts and take the weighted trace, retaining ineffective stabilizers; compare chartwise with the D8 weighted pairing, including the kernel factor, and prove invariance under finite refinements. Through the concordance of §3.3 and the Euler comparison of ImplicitAtlases §5.6 identify the virtual functional on the constant locus with this Euler/Thom functional. Prove that the Euler class is `c_(mg)(𝔼_g^∨ ⊠ TX)` and, for `g = 1`, expand `c_m(𝔼₁^∨ ⊠ TX) = Σ_(k=0)^m (−λ₁)^k c_(m−k)(TX)` by the line-twist formula of CharacteristicClasses C3 item 2, where `λ₁ = c₁(𝔼₁)`. Pair with a test class `α` of top degree on `M̄_(1,1)`: only the term `c_m(TX)` has full degree in `X`, the terms with `k ≥ 1` have lower `X`-degree and integrate to zero over `X`, and on `M̄_(1,1)` the terms with `k ≥ 2` also vanish by domain dimension; the functional is `χ(X) ∫^wt_(M̄_(1,1)) α` with `χ(X) = ∫_X c_m(TX)` (C3 item 2 with `c_m = e(TX_ℝ)`, and CharacteristicClasses C2 item 3 for `e(TX)[X] = χ(X)` on a closed oriented manifold, with AlgebraicTopology Stage 7 item 1 for `χ(X) = Σ_i (−1)^i dim H^i(X; ℚ)`), and the weighted pairing of a constant class `c` with `α` is `c ∫^wt α`, so perfectness gives

    I_(1,1,0)(1) = χ(X) · 1 ∈ H⁰(M̄_(1,1); ℚ).

For general `g` retain the full top Euler class `c_(mg)(𝔼_g^∨ ⊠ TX)` and derive the degree-zero formula of §5.4 by its weighted Thom pairing. The source states the coefficient of `I_(1,1,0)(1)` as `Σ_i (−1)^i h^(i,0)` (Kontsevich–Manin (2.9), p. 6); the constant-map computation gives the topological Euler characteristic, which differs already for `X = ℂP¹`, and the value proved here is `χ_top(X)`.

- `I_(1,1,0)(1) = χ(X) · 1`.
- For a degree-two insertion `δ`, `⟨I_(1,1,0)(δ)⟩ = −(1/24) ∫_X c_(m−1)(TX) ⌣ δ`, from the `k = 1` term and `∫^wt_(M̄_(1,1)) λ₁ = 1/24`.
- For `g ≥ 2`, `n = 0` and `m ≥ 4` the class `I_(g,0,0)(1)` has degree `2(g − 1)m > 6g − 6` and vanishes.

**Checks.**

- `X = ℂP¹`: `m = 1`, `c₁(Tℂ P¹)` integrates to `2`, so `I_(1,1,0)(1) = 2 · 1`; the source's `Σ(−1)^i h^(i,0) = 1` is refuted by this instance. `X = pt`: `1`. `X = T²`: `0`.
- `X = ℂP¹`, `δ = pt`: `⟨I_(1,1,0)(pt)⟩ = −(1/24) ∫ c₀ ⌣ pt = −1/24`; the genus-reduction identity of §6.3 restricted to the boundary point of `M̄_(1,1)` gives `ξ^* I_(1,1,0)(1) = Σ_(a,b) g^(ab) ∫_X Δ_a Δ_b = Σ_a (−1)^(deg Δ_a) = χ(X)`, consistent with the value above and computed only after Layer 6 is proved.
- The expansion for `m = 2`: `c₂(L ⊗ V) = c₂(V) + c₁(L)c₁(V) + c₁(L)²`; for `L = 𝔼₁^∨` on `M̄_(1,1)` the last term is `λ₁² = 0` by dimension, and the middle term pairs to zero over `X` against the insertion `1`.

*Needs:* §3.1–§3.3; ImplicitAtlases §5.6; CharacteristicClasses C2 items 1 and 3, C3 item 2; AlgebraicTopology Stage 7 item 1; ComplexCurveModuli D8; Orbifolds O5 item 5.

### Examples

- `ℂP¹`: `I_(1,1,0)(1) = 2`, `⟨I_(1,1,0)(pt)⟩ = −1/24`.
- The irreducible nodal rational curve as a fibre of `𝔼₁`.

### Dependencies

Layers 1–2; ComplexCurveModuli D3–D6, D8; ComplexKahlerGeometry K5b; HeegaardFloer Lane F1; PDE Lane A; AnalyticStableMaps §4.3, §6–§9; ImplicitAtlases §1.1, §5.2, §5.6; CharacteristicClasses C2–C3; AlgebraicTopology Stage 7.

## Layer 4: Effectivity, covariance and grading (G4)

The eight general properties of Kontsevich–Manin are 2.2.0–2.2.7 (pp. 4–6); 2.2.8 is the separate Chow-correspondence condition for projective algebraic targets (p. 6) and is outside this roadmap.

### 4.1 Effectivity

Prove that `I_(g,n,A) = 0` for `A ∉ Eff(g, n, J)` (Kontsevich–Manin 2.2.0, p. 4): the stable-map carrier is empty, so the virtual functional and the operation are zero. Prove that `A = 0` forces constant maps and that every nonconstant tame map has positive area (§0.1), and state the effective-class convention with torsion retained.

**Checks.**

- `ℂP²`, `A = −ℓ`: negative area, empty moduli, `I = 0`.
- A nonzero torsion class: area zero, no nonconstant representative, `I = 0`; `A = 0` with constant maps is not excluded.
- `A = 2ℓ` on `ℂP²` with `(g, n) = (0, 0)`: represented by conics, and the effective set is not `{0}`.

*Needs:* §0.1, §2.2; AnalyticStableMaps §1.1.

### 4.2 Symmetric-group covariance

Construct the relabelling action of `S_n` on the stable-map groupoid and on `M̄_(g,n)`, the induced action on `ev^*` products and the determinant orientation, and prove `I_(g,n,A)(γ_(σ(1)), …, γ_(σ(n))) = ε(σ, γ) · σ^* I_(g,n,A)(γ₁, …, γ_n)` with the Koszul sign `ε(σ, γ)` of permuting the odd insertions (Kontsevich–Manin 2.2.1, p. 4, with `H^*(X; ℚ)^(⊗n)` a superspace by the mod 2 grading).

**Checks.**

- `T²`, `(0, 3, 0)`, insertions `α, β, 1` with `∫ α ⌣ β = 1`: `I(α, β, 1) = 1` and `I(β, α, 1) = −1`, the sign of the transposition on two odd classes.
- `ℂP²`, insertions `pt, pt, H`: the transposition of the two even point classes has sign `+1`.
- The relabelling `σ` on `M̄_(0,4)` exchanging marks `1` and `2` fixes the cross-ratio boundary point `{12|34}` and exchanges the other two; `σ^*` acts trivially on `H⁰` and on `H²`.

*Needs:* §2.2; AnalyticStableMaps §11.1; ComplexCurveModuli D7 item 1.

### 4.3 Grading

Consume the nodal augmented index of AnalyticStableMaps §4.1, equal to `d_(g,n,A)`, and prove its compatibility with the pairing construction of §2.2, giving `deg I_(g,n,A)(γ₁, …, γ_n) = Σ_i deg γ_i + 2(K_J · A) + (2g − 2)m` (Kontsevich–Manin 2.2.2, equation (2.2), p. 4).

**Checks.**

- `(0, 3, 0)`: `deg I = s − 2m`, so `I_(0,3,0)` is nonzero only for `s = 2m`, the mapping-to-a-point condition of §5.4.
- Lines in `ℂP²`, `(0, 4, ℓ)`: `deg I = s − 6 − 4 = s − 10`, a top class exactly when `s = 12`.
- `(1, 1, 0)`: `deg I(γ) = deg γ`, so `I_(1,1,0)(1)` is in degree `0` and `I_(1,1,0)(δ)` for `deg δ = 2` is in degree `2 = dim_ℝ M̄_(1,1)`.

*Needs:* §2.2; AnalyticStableMaps §4.1.

### Examples

- `T²` with odd insertions: the covariance sign.
- Lines in `ℂP²`: the degree bookkeeping.

### Dependencies

Layers 0–2; AnalyticStableMaps §1.1, §4.1, §11.1; ComplexCurveModuli D7.

## Layer 5: Fundamental class, divisor and degree zero (G5)

### 5.1 Basic classes and the relative virtual class of the forgetful map

In Kontsevich–Manin's terminology (p. 4, (2.3)–(2.4)) a class is **basic** exactly when it is one of `I_(0,3,A)(γ₁, γ₂, γ₃)`, `I_(1,1,A)(γ)` or `I_(g,0,A)(1)` with `g ≥ 2`; every other class in the stable range is non-basic, and the forgetful map `π_n : M̄_(g,n) → M̄_(g,n−1)` exists for non-basic signatures. A class has **codimension zero** when its degree equals `2(3g − 3 + n)`. Consume the universal-curve and forget-family incidence diagrams of AnalyticStableMaps §12.2, including the common obstruction data, the free-mark incidence, the comparison of ImplicitAtlases §1.1 and the concordance of §10.2 and ImplicitAtlases §5.2 relating the retained incidence data to the actual zero loci; a mixed ambient forgetful map is not posited. Prove the compatibility of these diagrams with the nodal charts of ComplexCurveModuli D7 items 1–2 and construct the relative oriented class of the forgetful map: pull back along the nodal family, use the local plumbing and collision charts, and prove paired branch-boundary cancellation, arrow and refinement compatibility and the orientation. Then construct virtual fibre integration along the forgetful map on the possibly singular coarse base by finite Čech integration on the family charts, carrying point-stabilizer weights, and prove the projection formula. In chartwise push–pull distinguish the stabilizer of a point of the fibre from the automorphism group of the stable map: the coarse fibre can be `C/Aut`, not `C`; normalize each orbit contribution by the source and target isotropy orders and prove that their sum is the relative virtual degree. This consumes §12.2 and does not duplicate AnalyticStableMaps' forgetful family or ImplicitAtlases' relative trace.

- The relative class of `M̄_(g,n+1)(X, A) → M̄_(g,n)(X, A)` has relative degree `1` on the regular locus and is compatible with the virtual functionals: `Φ_(g,n+1,A)(π^* c) = Φ_(g,n,A)(c ⌣ π_* 1) = 0` for `c` of degree `d_(g,n,A)`.
- `π_* 1 = 0` and `π_*(ev_(n+1)^* δ) = ⟨A, δ⟩ · 1` for a degree-two class `δ`.
- The projection formula `π_*(π^* a ⌣ b) = a ⌣ π_* b`.

**Checks.**

- The non-basic signatures with `n ≥ 1` of smallest size: `(0, 4)`, `(1, 2)`, `(2, 1)` have targets `(0, 3)`, `(1, 1)`, `(2, 0)`, all stable; `(1, 1)` is basic and its forgetful target `(1, 0)` is unstable.
- Lines in `ℂP²`, `M̄_(0,3)(ℂP², ℓ) → M̄_(0,2)(ℂP², ℓ)`: the fibre over a map with distinct marks is the line itself, of real dimension `2`, and `π_* 1 = 0` by degree; `π_*(ev₃^* H) = (ℓ · H) · 1 = 1`.
- A map with automorphism group `ℤ/2` acting on the domain: the coarse fibre is `C/(ℤ/2)` and the orbit normalization restores relative degree `1`; integrating the coarse quotient with unit weight would give `1/2`.

*Needs:* §1.2, §2.1–§2.2; AnalyticStableMaps §10.2, §11.1, §12.2; ImplicitAtlases §1.1, §5.2; ComplexCurveModuli D7 items 1–2.

### 5.2 Fundamental class

For non-basic `I_(g,n,A)` prove `I_(g,n,A)(γ₁, …, γ_(n−1), 1) = π_n^* I_(g,n−1,A)(γ₁, …, γ_(n−1))` (Kontsevich–Manin 2.2.3, equation (2.6), p. 5); in particular such a class has codimension zero only when it vanishes. For the basic stable three-point signature prove the numerical exception `⟨I_(0,3,A)(γ₁, γ₂, 1)⟩ = 0` for `A ≠ 0` and `= ∫_X γ₁ ⌣ γ₂` for `A = 0` (equation (2.7), p. 5). For `A ≠ 0` construct the map-stable forgetful morphism `M̄_(0,3)(X, A) → M̄_(0,2)(X, A)`, whose target exists because a nonconstant map has finite automorphisms (AnalyticStableMaps §11.1), prove the compatibility of the obstruction and virtual data with it and the identity `π_* 1 = 0` of §5.1, which gives the zero; for `A = 0` use the unobstructed constant-map model `X` and the cup pairing. Construct the map and the virtual push–pull for all non-basic stable signatures, including contracted components.

**Checks.**

- `I_(0,4,0)(γ₁, γ₂, γ₃, 1) = π_4^* I_(0,3,0)(γ₁, γ₂, γ₃) = (∫_X γ₁γ₂γ₃) · 1` on `M̄_(0,4)`, consistent with §5.4; a model in which the fourth insertion `1` contributed a factor other than `1` would contradict §5.4's direct computation.
- `ℂP²`: `⟨I_(0,3,ℓ)(pt, pt, 1)⟩ = 0` both by the exception and by degree (`s = 8 ≠ 10`); `⟨I_(0,3,0)(pt, 1, 1)⟩ = ∫ pt ⌣ 1 = 1`.
- `ℂP²`, `A = ℓ`, the forgetful map `M̄_(0,3)(ℂP², ℓ) → M̄_(0,2)(ℂP², ℓ)`: `π_* 1 = 0`, whereas `π_* 1 = 1` would give `⟨pt, pt, 1⟩_ℓ = ⟨pt, pt⟩_(0,2,ℓ) = 1`, contradicting the degree count.

*Needs:* §5.1, §2.2, §3.4; AnalyticStableMaps §11.1, §12.2.

### 5.3 Divisor

For non-basic `I_(g,n,A)` and a degree-two last insertion `δ` prove the class-valued identity `π_(n*) I_(g,n,A)(γ₁, …, γ_(n−1), δ) = ⟨A, δ⟩ · I_(g,n−1,A)(γ₁, …, γ_(n−1))` with `⟨A, δ⟩ = ∫_A δ` (Kontsevich–Manin 2.2.4, p. 5, general form), and for a codimension-zero left side its numerical consequence `⟨I_(g,n,A)(γ₁, …, γ_(n−1), δ)⟩ = ⟨A, δ⟩ ⟨I_(g,n−1,A)(γ₁, …, γ_(n−1))⟩` (2.2.4, first display). Derive both from the universal curve, the relative virtual class and the projection formula of §5.1; at nodes supply the nodal relative Gysin and virtual push–pull on the actual charts, the universal nodal projection not being assumed smooth.

**Checks.**

- `ℂP²`: `⟨I_(0,4,ℓ)(pt, pt, H, H)⟩ = (ℓ · H) ⟨I_(0,3,ℓ)(pt, pt, H)⟩ = 1 · 1 = 1`, degrees `4 + 4 + 2 + 2 = 12 = d_(0,4,ℓ)`.
- `ℂP²`: `⟨I_(0,3,ℓ)(pt, pt, H)⟩ = 1 · ⟨pt, pt⟩_(0,2,ℓ) = 1`, where the right side is the numerical operation of §2.2 on the pointed-unstable signature `(0, 2)`, of dimension `8 = 4 + 4`.
- `A = 0`: `⟨0, δ⟩ = 0`, so `π_* I_(g,n,0)(…, δ) = 0`, consistent with §5.4 where the `δ`-insertion is pulled back from `X` and integrates to zero along the fibre.

*Needs:* §5.1, §2.1–§2.2; ComplexCurveModuli D7 items 1–2; Orbifolds O5 item 5.

### 5.4 Mapping to a point

For `A = 0` compute every genus from the constant-map model of §3.3–§3.4 (Kontsevich–Manin 2.2.5, pp. 5–6). For `g = 0` prove that `I_(0,n,0)(γ₁, …, γ_n) = (∫_X γ₁ ⌣ ⋯ ⌣ γ_n) · 1` on `M̄_(0,n)`, nonzero only for `Σ deg γ_i = 2m` (equation (2.8), p. 5). For `g = 1` and `g ≥ 2` give the Hodge–Euler formulas `I_(g,n,0)(γ) = p_(1*)(c_(mg)(𝔼_g^∨ ⊠ TX) ⌣ p_2^*(γ₁ ⌣ ⋯ ⌣ γ_n))` with `p₁, p₂` the projections of `M̄_(g,n) × X` (2.4.5, p. 10), the genus-one normalization being §3.4.

**Checks.**

- `ℂP¹`, `n = 4`: `I_(0,4,0)(pt, 1, 1, 1) = 1` and `I_(0,4,0)(pt, pt, 1, 1) = 0` since `s = 4 > 2`.
- `T²`, `(0, 3, 0)`, insertions `α, β, 1`: `∫ α ⌣ β = 1`; the genus-zero degree-zero operation sees the odd classes.
- `g = 1`, `δ` of degree 2: `⟨I_(1,1,0)(δ)⟩ = −(1/24) ∫_X c_(m−1)(TX) ⌣ δ` as in §3.4; for `g ≥ 2` and `m ≥ 4`, `I_(g,0,0)(1) = 0` by degree.

*Needs:* §3.3–§3.4, §2.2; CharacteristicClasses C3 item 2.

### Examples

- `ℂP²`: the divisor identity `⟨pt, pt, H, H⟩_ℓ = 1`.
- `ℂP¹`: the three-point exception and the degree-zero operations.

### Dependencies

Layers 1–3; AnalyticStableMaps §10.2, §11.1, §12.2; ImplicitAtlases §1.1, §5.2; ComplexCurveModuli D7; Orbifolds O5; CharacteristicClasses C3.

## Layer 6: Splitting and genus reduction (G6)

### 6.1 The Casimir and the splitting sign

Fix a homogeneous basis `Δ_a` of `H^*(X; ℚ)`, `g_(ab) = ∫_X Δ_a ⌣ Δ_b`, `(g^(ab)) = (g_(ab))^(−1)`, and the ordered Casimir `Σ_(a,b) g^(ab) Δ_a ⊗ Δ_b`, which represents the class of the diagonal in `H^*(X × X; ℚ)` under the Künneth isomorphism of AlgebraicTopology Stage 5 item 1 (Kontsevich–Manin 2.2.6, p. 6). For ordered subsets `S₁ ⊔ S₂ = {1, …, n}` define `ε(S)` as the Koszul sign of the permutation moving the ordered insertions into the order `S₁, S₂`, each subset keeping its relative order; no further sign enters the contraction.

**Checks.**

- `T²` with basis `1, α, β, pt`, `∫ α ⌣ β = 1`: `g_(αβ) = 1`, `g_(βα) = −1`, `g_(1,pt) = g_(pt,1) = 1`, and `Σ_(a,b) g^(ab) g_(ab) = 1 + 1 − 1 − 1 = 0 = χ(T²)`, while the unsigned count `Σ_a δ^a_a = 4` would be wrong by the sign of the odd block.
- `ℂP²` with basis `1, H, H²`: `(g_(ab))` is the antidiagonal matrix of ones, `(g^(ab))` equals it, and the Casimir is `1 ⊗ H² + H ⊗ H + H² ⊗ 1`.
- `S₁ = {2}`, `S₂ = {1, 3}` with `γ₁, γ₂` odd and `γ₃` even: the permutation to the order `(2, 1, 3)` is one transposition of two odd classes, `ε(S) = −1`.

*Needs:* AlgebraicTopology Stage 5 item 1, Stage 6 item 2; Mathlib `Matrix` inverses.

### 6.2 Splitting

For `g = g₁ + g₂`, `n = n₁ + n₂`, disjoint ordered `S₁ ⊔ S₂ = {1, …, n}` with `|S_i| = n_i` and `n_i + 2g_i − 2 ≥ 0`, so that each factor is stable after adding its node mark, let `φ_S : M̄_(g₁,n₁+1) × M̄_(g₂,n₂+1) → M̄_(g,n)` be the clutching map of ComplexCurveModuli D7 item 3 identifying the last mark of the first factor with the first mark of the second. Prove

    φ_S^* I_(g,n,A)(γ₁, …, γ_n) = Σ_(A₁+A₂=A) ε(S) Σ_(a,b) g^(ab) I_(g₁,n₁+1,A₁)((γ_j)_(j∈S₁), Δ_a) ⊗ I_(g₂,n₂+1,A₂)(Δ_b, (γ_j)_(j∈S₂))

(Kontsevich–Manin 2.2.6, equation (2.11), p. 6), the sum over decompositions into realized classes being finite by §0.3. The proof uses the joint virtual reductions of §6.4–§6.6 and the Künneth comparison on the product target of §6.6.

**Checks.**

- The admissible factor signatures: `(g_i, n_i) = (0, 2)` gives `n_i + 2g_i − 2 = 0`, factor `(0, 3)` after the node mark; `(0, 1)` gives `−1` and is excluded, its factor `(0, 2)` being unstable; `(1, 0)` gives `0`, factor `(1, 1)`.
- `ℂP²`, `(0, 4, ℓ)`, insertions `pt, pt, H, H`, `S₁ = {1, 2}`, `S₂ = {3, 4}`: `I_(0,4,ℓ)(pt, pt, H, H)` has degree `12 − 10 = 2`, so its restriction to the point `M̄_(0,3) × M̄_(0,3)` is `0`. On the right only `(A₁, A₂) = (ℓ, 0)` and `Δ_a = H` give a first factor of degree `0`, and the inverse pairing pairs `H` with `H` (`g^(H,H) = 1`, `g^(H,1) = 0`), so the term is `⟨pt, pt, H⟩_ℓ · ⟨H, H, H⟩_0 = 1 · ∫ H³ = 0`; replacing `g^(H,H)` by the entry `g^(H,1)` would wrongly give `1`.
- `ℂP²`, `(0, 4, ℓ)`, insertions `pt, H, H, H`, `S₁ = {1, 2}`, `S₂ = {3, 4}`: `I_(0,4,ℓ)(pt, H, H, H)` has degree `10 − 10 = 0`, a multiple `c · 1`. On the right only `(A₁, A₂) = (ℓ, 0)` with `(Δ_a, Δ_b) = (pt, 1)` contributes, the coefficient `g^(pt,1)` being `1`: `⟨pt, H, pt⟩_ℓ · ⟨1, H, H⟩_0 = 1 · ∫ H² = 1`, so `c = 1`; the decomposition `(0, ℓ)` gives first factors of positive degree on the point `M̄_(0,3)`.
- Conics in `ℂP²`: for `A = 2ℓ` and insertions `pt, pt, H, H` the operation has degree `12 − 4 − 12 = −4` and vanishes, `d_(0,4,2ℓ) = 18` exceeding the insertion degree `12`; the four-point splitting identity of degree `2ℓ` with these insertions contains no conic count.

*Needs:* §6.1, §6.4–§6.6, §2.1–§2.2, §0.3; ComplexCurveModuli D7 item 3.

### 6.3 Genus reduction

Let `ξ : M̄_(g−1,n+2) → M̄_(g,n)` be the self-clutching map of D7 item 3 gluing the last two marks, with `(g − 1, n + 2)` stable. Prove

    ξ^* I_(g,n,A)(γ₁, …, γ_n) = Σ_(a,b) g^(ab) I_(g−1,n+2,A)(γ₁, …, γ_n, Δ_a, Δ_b)

(Kontsevich–Manin 2.2.7, equation (2.12), p. 6), with the branches ordered as displayed and the branch-swap automorphism retained in the clutching map.

**Checks.**

- `ξ : M̄_(0,3) → M̄_(1,1)`, `A = 0`, insertion `1`: the right side is `Σ g^(ab) ∫_X Δ_a Δ_b = χ(X)`, equal to the restriction of `I_(1,1,0)(1) = χ(X) · 1` of §3.4 to the boundary point; on `T²` both sides are `0`.
- `ξ : M̄_(0,4) → M̄_(1,2)`, `A = 0`, insertions `γ₁, γ₂` with `deg γ₁ + deg γ₂ = 2`: the right side is `Σ g^(ab) (∫ γ₁γ₂Δ_aΔ_b) · 1` on `M̄_(0,4)` by §5.4, so the degree-two class `I_(1,2,0)(γ₁, γ₂)` restricts to the boundary divisor as a multiple of `1` determined by the cup product on `X`.
- Genus one with `(g − 1, n + 2) = (0, 2)`, i.e. `n = 0`: the source is unstable and the identity is not stated; `I_(1,0,A)` is itself outside the stable range.

*Needs:* §6.1, §6.4–§6.6, §3.4; ComplexCurveModuli D7 item 3.

### 6.4 Boundary Thom classes and clutching transfers

On the compact weighted target define, for a separating clutching map `φ_S` and the self-clutching map `ξ`, the pushforwards `φ_(S*)` and `ξ_*` as weighted adjoints as in §2.1. Define the normalized boundary Thom class `τ_D`, once for each unordered local node branch, as the supported Thom class (Orbifolds O5 item 5, CharacteristicClasses C2 item 1) of its normal smoothing line `T_* ⊗ T_**` of D7 item 3, whose plumbing parameter is defined up to a nonvanishing unit. Compute the pullback of `τ_D` under stabilization by the smoothing product of §6.5; it is not the clutching adjoint. Separately compute the transfers `ξ_* χ` and `φ_(S*) χ` from ordered branch lifts, source and target stabilizers and the quotient map, and prove the transfer degrees: for the self-clutching map the weighted transfer has degree `2` over the normalized unordered-node Thom class, from the ordered-branch double cover; for a separating clutching map the degree is `2` exactly in the symmetric unmarked case `n = 0`, `g₁ = g₂`, and `1` otherwise. These degrees are derived chartwise from branch lifts and stabilizers, not inserted into the formulas, and there is no single factor `1/2` covering both map types.

- `τ_D` is a degree-two class supported near the boundary stratum, pulled back along `st` as in §6.5.
- `ξ_* 1 = 2 τ_D` and `φ_(S*) 1 = τ_D` or `2 τ_D` according to the stated rule, near the open stratum of curves with exactly one node, computed in local ordered-branch charts.
- At a generic point `y` of the image the transfer degree is `Σ_x |Aut(y)| / |Aut(x)|`, summed over the coarse preimages `x` of `y`: a coarsely two-sheeted map with equal stabilizers and a coarsely one-sheeted map with stabilizer index `2` both have degree `2`; the degree is not in general the order of an automorphism of the target object.

**Checks.**

- The irreducible nodal genus-two curve whose normalization is an elliptic curve `E` with two points `p, q`: `(E, p, q) ≅ (E, q, p)` by the involution of `E` exchanging `p` and `q`, so the coarse map from `M̄_(1,2)` is injective there; the source has trivial generic stabilizer and the target stabilizer `{1, swap}` has order `2`, degree `1 · 2/1 = 2`.
- `ξ : M̄_(3,2) → M̄_(4,0)` at a generic point: `(C, p, q)` and `(C, q, p)` are non-isomorphic, all stabilizers are trivial, degree `2 · 1/1 = 2`.
- `φ_S : M̄_(1,1) × M̄_(1,1) → M̄_(2,0)` with `n = 0`, `g₁ = g₂ = 1`, at two glued non-isomorphic pointed elliptic curves: no automorphism exchanges the components, the two ordered preimages are distinct, and source and target stabilizers are both `ℤ/2 × ℤ/2`, degree `2 · 4/4 = 2`. `φ_S : M̄_(0,3) × M̄_(1,1) → M̄_(1,2)`: one preimage, source and target stabilizers of order `2`, degree `1 · 2/2 = 1`.
- `ξ : M̄_(0,3) → M̄_(1,1)`: the boundary point of `M̄_(1,1)` has isotropy of order `2`, the source is a point with trivial isotropy, and `ξ_* 1 = 2 [pt]^∨` as computed in §2.1.

*Needs:* §2.1; ComplexCurveModuli D7 item 3, D8; Orbifolds O5 item 5; CharacteristicClasses C2 item 1.

### 6.5 The spine formula and the capped trace

For the contracted preimage of one stabilized node the exceptional domain is a rational tree; the normal smoothing product uses only the edges on the unique path `P` joining the two surviving attaching flags, and iterating the bridge equation `xv = t₁t₂` of D7 item 1 gives `t = u ∏_(e∈P) t_e` with `u` a nonvanishing unit, side-branch edges mapping to the same stabilized point but not occurring in the product. Prove the tree contraction product by iterating the bridge equations and tail charts, with constant junctions and nonconstant unmarked side branches allowed. On the auxiliary-augmented stable-domain charts construct the lift of the domain classifying map and a regular-fibre carrier `W_e` for each nodal cut `e`, with a coverage witness for the relevant virtual zero locus. In the ambient joint chart, before imposing the nodal equation, construct the map with joint normal coordinates `(s_(J∖I), t_P)`, the extra-obstruction and spine-smoothing entries being distinct projections; prove that these coordinates are projections and identify the oriented determinant ordering, all plumbing-unit changes and the isotropy action, using AnalyticStableMaps §7.3 and §12.2 for the map directions only. Prove the capped trace formula

    Φ(c ⌣ st^* τ_D) = Σ_(e∈P) Φ_(cut,e)(c|_(W_e))

with the source and target chart weights and boundary orientations, on the map charts, including unit changes, branch orientation, finite isotropy and branch-label and automorphism-orbit multiplicities; the separate ordered clutching adjoint retains its transfer multiplicity of §6.4. The capped trace formula has no source: it is a target of this roadmap, as `[D_i]_(supp,vir)` is in §8.5. To pass from local spine formulas to the global identity let `𝔇` be the finite set of map-level cut branch orbits in the chosen finite chart cover, each with its chart-cover multiplicity and source and target automorphism weights; the global trace is the sum over `𝔇` of the weighted cut traces, each chart's spine sum restricted to the branches represented by that orbit. Construct the ambient line and section factorization on the regular auxiliary-augmented charts, the pullback of the ambient boundary line having section a nonvanishing unit times the product of the smoothing sections along the spine; descend the line, section and relative class through finite Čech refinement data including node permutations, and take the weighted trace. Global branches need not be Cartier on the map zero locus; the ambient factorization and the Čech descent give the relative class without a support-purity assumption. Use additivity of `c₁` and the product-section zero-cycle identity at corners. This boundary Thom and pushforward construction is this roadmap's; ImplicitAtlases §7.3 supplies only the target-diagonal step of §6.6.

**Checks.**

- A rational bridge of two nodes contracted to one stabilized node: `P` has two edges, `t = u t₁ t₂`, and the pulled-back supported class counts each of the two nodes once; counting once per stabilized node would give `1`, counting every node of a tree with a side branch would overcount.
- A tail of one node contracted onto a marked point: `P` is empty for a node-free stabilization and no boundary class is pulled back; the tail contributes to `D_i` of §8.5 instead.
- Lines in `ℂP²`, `(0, 4, ℓ)` with `st^* τ_D` for the boundary point `{12|34}` of `M̄_(0,4)`: `Φ(ev^*(pt, pt, H, H) ⌣ st^* τ_D)` is `0`, the integrand having degree `12 + 2 = 14 ≠ 12 = d_(0,4,ℓ)`. With insertions `pt, H, H, H` the degree is `10 + 2 = 12` and `Φ(ev^*(pt, H, H, H) ⌣ st^* τ_D) = 1`, the splitting value of §6.2, obtained as the single cut contribution of the stratum where the line carries marks `1, 2` and a constant component carries `3, 4` (the line through the point and `H₃ ∩ H₄`), the stratum with marks `1, 2` on a constant component contributing `0` by degree.

*Needs:* §6.4, §1.2; ComplexCurveModuli D7 items 1 and 3; AnalyticStableMaps §7.3, §12.2; ImplicitAtlases §5.3; TopologicalSheafCohomology §1.2.

### 6.6 Node matching and the Künneth comparison on the product target

For the node-matching step consume the two-space evaluation chart and joint models of AnalyticStableMaps §12.1 and its trace comparison for the target diagonal `Δ : X → X × X`, obtained there from ImplicitAtlases §7.3; compose that comparison with the boundary trace of §6.5 and the weighted target pairing, without reapplying §7.3, which supplies neither the Deligne–Mumford boundary nor its positive-degree domain comparison. For the separating target `M̄_(g₁,n₁+1) × M̄_(g₂,n₂+1)` construct the weighted Čech product and Künneth comparison from the compact weighted product of Orbifolds and the product maps of AlgebraicTopology Stage 5 item 1 and TopologicalSheafCohomology §1.2; the `X^n` product adapter of D8 is not this two-factor comparison. For each of the two formulas construct: the simultaneous map-zero, node-matching and extra-obstruction model; orientation, determinant, stabilizer and chart-weight compatibility; the relative-pair virtual trace followed by the weighted target comparison; the displayed Casimir contraction with its Koszul sign; and the finiteness of the class decomposition (§0.3). Evaluations need not be jointly submersive for the Cauchy–Riemann operator, so the constrained right inverses and extra-obstruction data of §12.1 are used. The source identifies a general fiber-product formula as further work (Pardon, §5 introduction, p. 40, and the remark on the Kontsevich–Manin axioms, p. 95); the splitting theorem is an application theorem of this roadmap.

**Checks.**

- `ℂP²`, `A = ℓ`: the node-matching Casimir reduces to `Σ_a ⟨γ₁, γ₂, Δ_a⟩_ℓ ⟨Δ^a, γ₃, γ₄⟩_0` with `Δ^a` the dual basis. For `pt, pt | H, H` only `Δ_a = H`, `Δ^a = H` survives the degree count and the term is `1 · ∫ H³ = 0`; for `pt, H | H, H` only `Δ_a = pt`, `Δ^a = 1` survives and the term is `1 · ∫ H² = 1`.
- Two marks on lines in `ℂP²` with the diagonal: the joint model has normal coordinate in `T_x ℂP²`, real dimension `4`. On the locus of smooth-domain maps with distinct marks the fibre over the diagonal is empty, a line being embedded; on `M̄_(0,2)(ℂP², ℓ)`, of complex dimension `4`, the fibre is the collision-bubble stratum (a line with a constant sphere carrying both marks, parametrized by a line and a point on it) of complex dimension `3`, not the expected `2`. The intersection is excess, so neither emptiness nor transversality is used; this is why the constrained models of AnalyticStableMaps §12.1 enter, whose own emptiness Check holds only on the smooth-domain locus.
- The Künneth comparison for `M̄_(0,3) × M̄_(1,1)`: `H^*(pt) ⊗ H^*(M̄_(1,1); ℚ)` with the weighted pairing `1 · (1/2)` of the product, the product of the factor weights.

*Needs:* §6.5, §2.1; AnalyticStableMaps §12.1; ImplicitAtlases §6.4–§6.5, §7.3; Orbifolds O5 item 1; AlgebraicTopology Stage 5 item 1; TopologicalSheafCohomology §1.2; §0.3.

### Examples

- `T²`: the signed Casimir contraction `χ(T²) = 0`.
- `ℂP²`: the splitting identity for `(0, 4, ℓ)`, zero for the insertions `pt, pt, H, H` and `1` for `pt, H, H, H`.

### Dependencies

Layers 0–5; ComplexCurveModuli D7–D8; AnalyticStableMaps §7.3, §12; ImplicitAtlases §5.3, §6.4–§6.5, §7.3; Orbifolds O5; AlgebraicTopology Stages 5–6; TopologicalSheafCohomology §1.2; CharacteristicClasses C2.

## Layer 7: CohFT, Novikov series and quantum product (G7)

### 7.1 Novikov-completed classes and the unital cohomological field theory

Define `Ω_(g,n) = Σ_A q^A I_(g,n,A)` in `H^*(M̄_(g,n); ℚ) ⊗ Hom(H^*(X; ℚ)^(⊗n), ℚ) ⊗̂ Λ_ω`, and prove convergence in the area filtration and finiteness of the decomposition sums from §0.3. The grading is that of §0.2 with `deg q^A = 2c₁(A)`: the closed homogeneous pieces of total degree, their direct sum as an ordinary graded module, and the completed module as its filtered completion, in which an element may have components in infinitely many degrees unless `c₁(TX, J)` vanishes on `H₂(X; ℤ)` (§0.2). With the even nondegenerate Poincaré pairing on `H^*(X; ℚ)` prove that `(H^*(X; ℚ), Ω_(g,n))` is a **unital cohomological field theory** over `Λ_ω`: `S_n`-covariance (§4.2), the splitting identity (§6.2) and genus reduction (§6.3) in the form of Kontsevich–Manin Definition 6.1 with axioms 6.1.1–6.1.3 (p. 31), and the flat-unit identity `Ω_(g,n+1)(γ₁, …, γ_n, 1) = π^* Ω_(g,n)(γ₁, …, γ_n)` for non-basic signatures together with the three-point rule `⟨Ω_(0,3)(γ₁, γ₂, 1)⟩ = ∫_X γ₁ ⌣ γ₂` from §5.2. Definition 6.1 has no unit axiom; the unit is proved here. Unstable signatures carry no class, only the numerical conventions of §2.2.

- `Ω_(g,n)` maps a homogeneous `γ` with `Σ_i deg γ_i = s` into the closed homogeneous piece of degree `s + 2(g − 1)m` of `H^*(M̄_(g,n)) ⊗̂ Λ_ω`, whose Chern numbers lie in a finite set since `deg I_(g,n,A)(γ) ∈ [0, 6g − 6 + 2n]`.
- The `A = 0` term of `Ω_(g,n)` is `I_(g,n,0)`.
- The axioms of Definition 6.1 hold with `K = Λ_ω` after extension of scalars, the Casimir being the one of §6.1.

**Checks.**

- `ℂP¹`: `Ω_(0,3)(pt, pt, pt) = q` since only `A = ℓ` contributes, of degree `4 = deg q`; the degree-`0` statement reads `deg Ω_(0,3)(pt, pt, pt) = 6 − 2 = 4`.
- `T² × T²` with `c₁ = 0`: `Ω_(0,3)` has all its Novikov terms in degree `0` and its area-filtration convergence is the content of §0.3's finiteness, the area image being dense.
- `⟨Ω_(0,3)(γ₁, γ₂, 1)⟩ = ∫ γ₁ ⌣ γ₂` has no `q^A` term with `A ≠ 0`, by the three-point exception.

*Needs:* §0.2–§0.3, §2.2, §4.2, §5.2, §6.2–§6.3.

### 7.2 The quantum product

For a homogeneous basis `e_j` of `H^*(X; ℚ)` with left Poincaré dual basis `e^j` define

    a ⋆ b = Σ_A q^A Σ_j ⟨I_(0,3,A)(a, b, e_j)⟩ e^j

on `H^*(X; ℚ) ⊗̂ Λ_ω`, using the reconstruction `v = Σ_j (∫_X v ⌣ e_j) e^j` with the graded signs of the left-dual convention; left and right duals are not identified for odd classes. Prove that `⋆` is well defined and independent of the basis, of degree `0` for `deg q^A = 2c₁(A)`, graded commutative, with unit `1`, with the cup product as its `A = 0` term, and associative: derive associativity from the splitting identity of §6.2 on `M̄_(0,4)` and the equality of its three boundary-divisor classes in `H²(M̄_(0,4); ℚ)`. The source derives the quantum ring conditionally on the axioms (Kontsevich–Manin Theorem-Definition 4.5, p. 19); here the axioms are the theorems of Layers 4–6.

- `deg(a ⋆ b) = deg a + deg b`.
- `a ⋆ b = (−1)^(deg a · deg b) b ⋆ a`; `1 ⋆ a = a`.
- `(a ⋆ b) ⋆ c = a ⋆ (b ⋆ c)`.

**Checks.**

- `ℂP¹` with `x = pt`: `e_0 = 1, e_1 = x`, `e^0 = x, e^1 = 1`; `x ⋆ x = q ⟨x, x, x⟩_ℓ e^1 = q · 1`, degree `4 = 2 + 2`; `1 ⋆ x = Σ_j (∫ x ⌣ e_j) e^j = x`. With the shift `deg q^A = −2c₁(A)` the product would have degree `−4` on this term.
- `ℂP²` with `H` and `q = q^ℓ`: `H ⋆ H = H²`, `H ⋆ H² = q ⟨H, H², H²⟩_ℓ · 1 = q`, `H² ⋆ H² = q ⟨H², H², H⟩_ℓ H = qH`, every positive-degree coefficient being the line count `N₁ = 1` (a class `2ℓ` would need insertion degree `d_(0,3,2ℓ) = 16 > 12`). Associativity `(H ⋆ H) ⋆ H² = H ⋆ (H ⋆ H²)` reads `qN₁H = qN₁H`; it holds independently of the conic number and does not determine it.
- `T²` with `∫ α ⌣ β = 1`: the left duals are `e^α = −β`, `e^β = α`, since `∫ (−β) ⌣ α = 1`; a right-dual convention would give `e^α = β`, and the reconstruction `v = Σ (∫ v ⌣ e_j) e^j` applied to `v = α` gives `(∫ α ⌣ β) e^β = α` only with the left duals.

*Needs:* §7.1, §6.2, §5.2, §4.2, §0.2; AlgebraicTopology Stage 6 item 2.

### Examples

- `ℂP¹`: `QH^*(ℂP¹) = ℚ((q))[x]/(x² − q)` with `deg q = 4`.
- `ℂP²`: `QH^*(ℂP²) = ℚ((q))[x]/(x³ − q)` with `deg q = 6`, every structure constant of the small product being the line count `N₁ = 1`.

### Dependencies

Layers 0, 2, 4–6; AlgebraicTopology Stage 6; MorseNovikov N1.

## Layer 8: Descendants and ancestors (G8)

### 8.1 Cotangent lines on stable domains

Construct the domain cotangent line `L̄_i` on the stable pointed-curve groupoid of ComplexCurveModuli D5 as the relative cotangent bundle of the universal curve of D7 restricted to the i-th section, prove arrow equivariance and base-change compatibility, and set `ψ̄_i = c₁(L̄_i)`. In genus zero with `n ≥ 4` prove `ψ̄₁ = Σ [D_I]` over boundary divisors `D_I` with `1 ∈ I`, `2, 3 ∉ I`, `|I| ≥ 2`, by the universal plumbing charts and the branch normal line of D7 item 3. For forgetting the last mark prove `L̄_i^((n+1)) ≅ π^* L̄_i^((n)) ⊗ 𝒪(D_(i,n+1))`, with `D_(i,n+1)` the divisor where marks `i` and `n + 1` lie on a rational tail contracted by stabilization, from the cross-ratio section and the plumbing coordinate. On a boundary divisor with mark `1` on the first factor the marking line restricts to `pr₁^* L̄₁` of that factor and is not the node cotangent line; the node cotangent lines `L_*`, `L_**` enter the normal smoothing line `T_* ⊗ T_**` with `c₁ = −ψ_* − ψ_**`. Start the induction from `ψ̄ = 0` on the point `M̄_(0,3)`. In the algebraic setting the comparison, the restriction law and the genus-zero boundary expression are Kock, *Notes on psi classes*, Lemma 1.3.1 (p. 12), Lemma 1.2.6 (p. 10) and 1.5.2 (p. 15); here they are proved on the analytic stable-domain groupoid of ComplexCurveModuli.

- `L̄_i` is an arrow-equivariant complex line bundle on the stable-domain groupoid, compatible with base change and with the refinements of D5, and `ψ̄_i ∈ H²(M̄_(g,n); ℚ)`; relabelling the marks by `σ ∈ S_n` carries `ψ̄_i` to `ψ̄_(σ(i))`.
- For the forgetful map `π : M̄_(g,n+1) → M̄_(g,n)` with `2g − 2 + n > 0`, `ψ̄_i = π^* ψ̄_i + [D_(i,n+1)]` and `ψ̄_i ⌣ [D_(i,n+1)] = 0` (Kock, Lemma 1.3.1 and the identity preceding it, p. 12).
- Under a clutching map the restriction of `ψ̄_i` is the pullback of the cotangent class of mark `i` on the factor carrying it; in genus zero with `n ≥ 4`, `ψ̄₁ = Σ [D_I]` over `1 ∈ I`, `2, 3 ∉ I`, and `∫_(M̄_(0,n)) ψ̄₁^(k₁) ⋯ ψ̄_n^(k_n) = (n − 3)!/(k₁! ⋯ k_n!)` when `Σ k_i = n − 3` (Kock, Lemma 1.5.1, p. 15; Kontsevich–Manin 1998, equation (11), p. 5).

**Checks.**

- `M̄_(0,4) ≅ ℂP¹`: the divisors with `1 ∈ I`, `2, 3 ∉ I`, `|I| ≥ 2` reduce to `I = {1, 4}`, so `∫ ψ̄₁ = 1`; the formula with the anchors `2, 3` replaced by `2, 4` gives the same degree by symmetry, and a formula without anchors would give `3`.
- `M̄_(0,5)`: `∫ ψ̄₁² = 1` and `∫ ψ̄₁ ψ̄₂ = 2`, the values `(n − 3)!/∏ k_i!` for `n = 5`; the comparison `L̄₁^((5)) ≅ π^* L̄₁^((4)) ⊗ 𝒪(D_(1,5))` gives `ψ̄₁^((5)) = a + D` with `a = π^* ψ̄₁^((4))` and `D = [D_(1,5)]`; from `∫ a² = 0`, `∫ a D = ∫_(M̄_(0,4)) ψ̄₁ = 1` and `∫ D² = −1`, `∫ ψ̄₁² = 0 + 2 − 1 = 1`, and `∫ ψ̄₁ ⌣ D = 1 − 1 = 0`, as the restriction law requires (mark `1` lies on the three-pointed component of `D_(1,5)`, where the cotangent class is pulled back from the point `M̄_(0,3)`).
- `M̄_(1,1)`: `∫^wt ψ̄₁ = 1/24 = ∫^wt λ₁`; the coarse unweighted integral would be `1/12`.

*Needs:* ComplexCurveModuli D5, D7 items 1 and 3; CharacteristicClasses C3 item 2; Orbifolds O4, O5 item 1.

### 8.2 The cotangent line on the stable-map groupoid and the class `ψ_i`

Construct the complex cotangent line `L_i` on the stable-map groupoid from the relative cotangent of the marked universal family of AnalyticStableMaps §11.2 at its i-th section; prove arrow equivariance, coordinate-change compatibility and compatibility with refinements. The zero locus may be singular: `L_i` is a finite-group-equivariant topological line bundle on the compact zero locus, not a smooth orbibundle of Orbifolds. Choose a common positive multiple `N` of the orders of the finitely many chart groups and prove that `L_i^(⊗N)` has trivial stabilizer action and descends to a topological line bundle on the coarse space: average a local nonzero frame over the stabilizer, shrink to keep it nonzero, transport over the finite orbit neighbourhood and check the transition functions on common refinements. The compact Hausdorff coarse base is paracompact; on a finite trivializing cover a partition of unity gives a classifying map to a finite `ℂP^K`, and pulling back its universal first Chern class in Čech cohomology (CharacteristicClasses C3 item 2, C1.2b) defines

    ψ_i = (1/N) c₁(L_i^(⊗N)) ∈ Ȟ²(|M̄_(g,n)(X, A)|; ℚ).

Prove independence of `N`, of the chart choices, of auxiliary marks and of refinements, and the pullback and boundary formulas under forgetting and clutching, each proved by the equivariant tensor-power isomorphism and the naturality of the finite-cover classifying construction, never by a smooth structure on the zero locus. Descendant insertions are Čech cup products with `ψ_i^k` paired against the dual-Čech functional; no Čech-to-singular comparison is used on the source. In the algebraic setting and in genus zero the restriction law and the forgetful comparison for stable maps are Kock, *Notes on psi classes*, (5.1.7.1) and (5.1.7.2), pp. 50–51, stated there on `M̄_(0,n)(X, β)` with the higher-genus statement left open; the all-genus comparison on the analytic carrier and the finite-isotropy descent on the compact zero locus are this roadmap's.

- `L_i` is a finite-group-equivariant topological complex line bundle on the compact zero locus, compatible with arrows, coordinate changes and refinements; `ψ_i ∈ Ȟ²(|M̄_(g,n)(X, A)|; ℚ)` is independent of `N`, of the chart choices, of auxiliary marks and of refinements, and relabelling by `σ ∈ S_n` carries `ψ_i` to `ψ_(σ(i))`.
- For a map-stable forgetful map `π : M̄_(g,n+1)(X, A) → M̄_(g,n)(X, A)`, `ψ_i = π^* ψ_i + [D_(i,n+1)]`, where `D_(i,n+1)` is the supported class of the locus on which marks `i` and `n + 1` lie alone on a constant genus-zero component, and `ψ_i ⌣ [D_(i,n+1)] = 0`.
- Under a clutching map of stable maps the restriction of `ψ_i` is the pullback of `ψ_i` of the factor carrying mark `i`; for `X` a point, `ψ_i = ψ̄_i`.

**Checks.**

- Chart groups of orders `2` and `3`: `N = 6`, and `ψ_i = (1/6) c₁(L_i^(⊗6)) = (1/12) c₁(L_i^(⊗12))`, independence of `N`.
- `X = pt`: the stable-map groupoid is the stable-domain groupoid, `L_i = L̄_i` and `ψ_i = ψ̄_i`, with `∫^wt ψ₁ = 1/24` on `M̄_(1,1)`.
- `M̄_(0,2)(ℂP¹, ℓ) ≅ ℂP¹ × ℂP¹` by `(ev₁, ev₂)`: `ψ₁ = ev₁^* c₁(T^*ℂP¹) + [Δ] = −2[pt × ℂP¹] + [Δ]`, the diagonal being the locus where mark `1` sits on a contracted bubble; `∫ ψ₁ ⌣ ev₂^* pt = −2 + 1 = −1`.

*Needs:* AnalyticStableMaps §11.2, §9.1; CharacteristicClasses C3 item 2, C1.2b; TopologicalSheafCohomology §1.2.

### 8.3 Descendant and ancestor brackets

Define the descendant numbers

    ⟨τ_(k₁)(γ₁) ⋯ τ_(k_n)(γ_n)⟩_(g,A) = Φ_(g,n,A)(ev₁^* γ₁ ⌣ ψ₁^(k₁) ⌣ ⋯ ⌣ ev_n^* γ_n ⌣ ψ_n^(k_n))

on every map-stable signature, and the cohomology-valued descendants by pairing with `st^*` of a target test class in the stable range. Define the ancestor bracket by replacing each `ψ_i` by `ψ̄_i = st^* c₁(L̄_i)`, which requires `2g − 2 + n > 0`. Set `τ_(−1)(γ) = 0`. The three numerical equations of §8.4 assume only that the map signature is stable and that the displayed forgetful map of stable maps exists; they use the map-level functional and need no Deligne–Mumford target. The primary three-point cases use the exception of §5.2; no value is assigned to an unstable pointed moduli space by convention. The brackets are the conventional and generalized correlators of Kontsevich–Manin 1998, §1.1, equations (1)–(2), p. 2, there in the algebraic setting.

- Both brackets are `ℚ`-multilinear in the insertions, and reordering the pairs `(k_i, γ_i)` changes them by the Koszul sign of the permutation of the odd `γ_i` and nothing else.
- Degree selection: the descendant bracket vanishes unless `Σ_i (deg γ_i + 2k_i) = d_(g,n,A)`, and so does the ancestor bracket.
- With all `k_i = 0` both brackets equal the numerical operation `⟨I_(g,n,A)(γ₁, …, γ_n)⟩` of §2.2; in the stable range the ancestor bracket equals `∫^wt_(M̄_(g,n)) ψ̄₁^(k₁) ⋯ ψ̄_n^(k_n) ⌣ I_(g,n,A)(γ₁, …, γ_n)`, by the defining identity of §2.2 with the test class `ψ̄₁^(k₁) ⋯ ψ̄_n^(k_n)`.

**Checks.**

- `X = pt`: `⟨τ₀τ₀τ₀⟩₀ = 1`, `⟨τ₁τ₀τ₀τ₀⟩₀ = 1`, `⟨τ₁⟩₁ = 1/24`.
- `ℂP¹`: `⟨τ₀(pt) τ₀(pt)⟩_(0,ℓ) = 1` on the pointed-unstable signature `(0, 2)`, dimension `4 = 2 + 2`; `⟨τ₀(pt)⟩_(0,ℓ) = 1` on `(0, 1)`, dimension `2`.
- `ℂP¹`: `⟨τ₁(1) τ₀(pt)⟩_(0,ℓ) = −1`, computed in §8.2.

*Needs:* §8.2, §8.1, §2.2, §5.2; AnalyticStableMaps §9.2, §11.1.

### 8.4 String, dilaton and divisor equations

Prove, for a map-stable signature whose forgetful map exists (AnalyticStableMaps §11.1, §12.2), the string equation

    ⟨τ₀(1) ∏_(i=1)^n τ_(k_i)(γ_i)⟩_(g,A) = Σ_(j=1)^n ⟨∏_(i=1)^n τ_(k_i − δ_(ij))(γ_i)⟩_(g,A),

the dilaton equation

    ⟨τ₁(1) ∏_(i=1)^n τ_(k_i)(γ_i)⟩_(g,A) = (2g − 2 + n) ⟨∏_(i=1)^n τ_(k_i)(γ_i)⟩_(g,A),

and, for a degree-two class `δ`, the divisor equation

    ⟨τ₀(δ) ∏_(i=1)^n τ_(k_i)(γ_i)⟩_(g,A) = ⟨A, δ⟩ ⟨∏_(i=1)^n τ_(k_i)(γ_i)⟩_(g,A) + Σ_(j : k_j > 0) ⟨∏_(i=1)^n τ_(k_i − δ_(ij))(γ_i^((j)))⟩_(g,A),

with `γ_i^((j)) = δ ⌣ γ_j` for `i = j` and `γ_i` otherwise. Derive them from the forgetful map of §5.1, the line comparison `L_i^((n+1)) ≅ π^* L_i^((n)) ⊗ 𝒪(D_(i,n+1))` of §8.1 transported to the map groupoid by §8.2, and the relative class and projection formula of §5.1, keeping the primary three-point exception of §5.2. In the algebraic setting the divisor equation is Kontsevich–Manin 1998, Lemma 1.5.2, equation (12), p. 5, and the all-genus dilaton equation is its Lemma 1.5.3, p. 6, derived there from the Behrend–Manin axioms; for a point target the string and dilaton equations are Kock, *Notes on psi classes*, Lemma 1.4.2 (p. 14) and 1.6.2 (p. 16), and the push-down `π_* ψ_(n+1) = (2g − 2 + n) · [M̄]^vir` behind the dilaton equation is its (5.1.7.3), p. 51, written there against the virtual class of the genus-zero stable-map space `M̄_(0,n)(X, β)`. The proofs here follow those routes on the analytic carrier in every genus.

**Checks.**

- `X = pt`, `n = 5`: the string equation gives `⟨τ₂τ₀τ₀τ₀τ₀⟩₀ = ⟨τ₁τ₀τ₀τ₀⟩₀ = 1` and `⟨τ₁τ₁τ₀τ₀τ₀⟩₀ = 2⟨τ₁τ₀τ₀τ₀⟩₀ = 2`, the values `∫ ψ̄₁² = 1` and `∫ ψ̄₁ψ̄₂ = 2` of §8.1; the dilaton equation with `n = 3` gives `⟨τ₁τ₀τ₀τ₀⟩₀ = (0 − 2 + 3) · 1 = 1`.
- `ℂP¹`: dilaton with `n = 1`, `⟨τ₁(1) τ₀(pt)⟩_(0,ℓ) = (−2 + 1) ⟨τ₀(pt)⟩_(0,ℓ) = −1`, agreeing with the direct computation of §8.2; a dilaton coefficient `2g − 2 + n + 1` would give `0`.
- `ℂP¹`: divisor with `δ = pt`, `⟨τ₀(pt) τ₁(pt) τ₀(pt)⟩_(0,ℓ) = (ℓ · pt) ⟨τ₁(pt) τ₀(pt)⟩_(0,ℓ) + ⟨τ₀(pt ⌣ pt) τ₀(pt)⟩_(0,ℓ) = 0 + 0`, consistent with the degree count `2 + 4 + 2 = 8 ≠ 6`.

*Needs:* §8.3, §8.1–§8.2, §5.1–§5.3; AnalyticStableMaps §11.1, §12.2; ComplexCurveModuli D7 items 1–2.

### 8.5 The descendant–ancestor comparison in genus zero

A map cotangent line is not in general the pullback of the stabilized-domain cotangent line: a nonconstant rational tail with one node and one mark is map-stable but pointed-unstable and is contracted by `st`. For `g = 0`, `n ≥ 3` and a stable map let `D_i` be the supported sum over contracted genus-zero subtrees containing mark `i`, attached to the rest by exactly one node, carrying no other mark and positive total degree; the marked component inside such a subtree may itself be constant. Prove the line comparison and class identity

    L_i ≅ st^* L̄_i ⊗ 𝒪(D_i),    ψ_i = ψ̄_i + [D_i]_(supp,vir),

where `[D_i]_(supp,vir)` is constructed from the simple-zero plumbing parameter, its zero-section Euler class and the auxiliary-augmented chart trace of §6.5 on the map carrier, not by pulling back a Deligne–Mumford boundary divisor under `st`; include every positive class and every finite-isotropy weight in the supported sum and prove the empty and codimension-zero degeneracies instead of assuming an effective Cartier divisor on a singular base. The line morphism is the derivative of stabilization on the marked tangent line away from contracted tails; on a tail chart its vanishing order is computed from the plumbing coordinate. Define ancestors by pullback from the stabilized domain and prove the descendant–ancestor identities with this boundary correction, descending tensor powers through finite isotropy as in §8.2. In the algebraic setting the class identity in genus zero is Kock, *Notes on psi classes*, Lemma 5.1.9, p. 51 (`st^* ψ̄₁ = ψ₁ − E₁`), and the all-genus comparison of descendant and generalized correlators is Kontsevich–Manin 1998, Theorem 1.2, equation (4), p. 2, whose proof there is a sketch (p. 3); the supported virtual class `[D_i]_(supp,vir)` on the analytic carrier is this roadmap's construction.

**Checks.**

- `X = pt`: `D_i = 0` and `ψ_i = ψ̄_i`.
- `ℂP¹`, `(0, 3, ℓ)`, mark `1` on a degree-one component with one node and marks `2, 3` on a constant component: this stratum is `D₁`, of real codimension `2` in the 6-dimensional moduli space, and `ψ₁ = 0 + [D₁]` since `ψ̄₁` is pulled back from the point `M̄_(0,3)`. The dilaton equation with `2g − 2 + n = 0` gives `⟨τ₁(1) τ₀(pt) τ₀(pt)⟩_(0,ℓ) = 0`, and directly `[D₁]` pairs to zero against `ev₂^* pt ⌣ ev₃^* pt` because on `D₁` the two marks lie on a constant component and cannot meet two distinct points.
- `ℂP¹`, `(0, 3, ℓ)`, `⟨τ₁(pt) τ₀(pt) τ₀(1)⟩_(0,ℓ)`: string gives `⟨τ₀(pt)τ₀(pt)⟩_(0,ℓ) = 1`, while the ancestor `ψ̄₁ = 0` contributes `0`, so the supported correction `[D₁]` contributes the whole value `1`; a descendant TRR without the contracted-tail correction would predict `0`.

*Needs:* §8.1–§8.3, §6.5, §1.2; ComplexCurveModuli D7 items 1–2; AnalyticStableMaps §11.1.

### 8.6 The genus-zero topological recursion relation

For ancestors, `n ≥ 3`, `k ≥ 0` and realized `A`, sum over decompositions `A₁ + A₂ = A` and partitions `{2, …, n} = S ⊔ T` with `S ≠ ∅` and the anchors `2, 3 ∈ T`, each part keeping its inherited order, with the Koszul sign `ε(S, T)` of the regrouping:

    ⟨τ̄_(k+1)(α) ∏_(i=2)^n τ_(k_i)(γ_i)⟩_(0,A) = Σ_(A₁+A₂=A) Σ_(S⊔T) ε(S, T) Σ_(a,b) g^(ab) ⟨τ̄_k(α) ∏_(i∈S) τ_(k_i)(γ_i) Δ_a⟩_(0,A₁) ⟨Δ_b ∏_(j∈T) τ_(k_j)(γ_j)⟩_(0,A₂).

Both factors are stable after adding their node marks since `|T| ≥ 2`. For `n = 3` there is no admissible partition and the left side vanishes, `M̄_(0,3)` being a point with zero cotangent class. Derive the relation from `ψ̄₁ = Σ [D_I]` of §8.1 pulled back by `st` and the splitting identity of §6.2 with descendant insertions, and convert it to descendants by §8.5 (in the algebraic setting: Kock, *Notes on psi classes*, Proposition 5.1.8, p. 51, and the splitting lemma 5.2.1, p. 53; the three-point descendant case is Kontsevich–Manin 1998, Corollary 1.3, equation (4a), p. 3); the forgetful-family and cobordism diagrams are AnalyticStableMaps §12.2, the relative class and integration §5.1 and the boundary trace §6.5.

**Checks.**

- `X = pt`, `n = 4`, `k = 0`: the only partition is `S = {4}`, `T = {2, 3}`, giving `⟨τ₀τ₀τ₀⟩⟨τ₀τ₀τ₀⟩ = 1 = ∫ ψ̄₁` on `M̄_(0,4)`.
- `X = pt`, `n = 5`, `k = 0`, with `τ̄₁` at mark `2` as an extra insertion: the left side is `⟨τ̄₁τ̄₁τ₀τ₀τ₀⟩₀ = 2`; on the right, `S = {4}` and `S = {5}` each give `⟨τ₀τ₀τ₀⟩₀ ⟨τ₀τ₁τ₀τ₀⟩₀ = 1`, and `S = {4, 5}` gives `⟨τ₀τ₀τ₀τ₀⟩₀ ⟨τ₀τ₁τ₀⟩₀ = 0 · 0`, total `2`.
- `ℂP²`, `A = ℓ`, `n = 3`: the left side `⟨τ̄₁(α) γ₂ γ₃⟩_(0,ℓ)` is `0` for every insertion, the ancestor class on `M̄_(0,3)` being zero, while the descendant `⟨τ₁(H) pt pt⟩_(0,ℓ)`, degrees `4 + 4 + 4 = 12 ≠ 10`, is also `0` by degree; `⟨τ₁(pt) pt 1⟩_(0,ℓ)` has degrees `6 + 4 + 0 = 10` and equals `⟨pt, pt⟩_(0,2,ℓ) = 1` by the string equation, all of it from the correction `[D₁]` of §8.5.

*Needs:* §8.1, §8.3, §8.5, §6.2, §6.5, §5.1; AnalyticStableMaps §12.2.

### Examples

- `M̄_(0,4)` and `M̄_(0,5)`: `∫ ψ̄₁ = 1`, `∫ ψ̄₁² = 1`, `∫ ψ̄₁ψ̄₂ = 2`.
- `ℂP¹`: `⟨τ₁(1) τ₀(pt)⟩_(0,ℓ) = −1` by dilaton and by the direct computation on `ℂP¹ × ℂP¹`.

### Dependencies

Layers 1–2, 5–6; ComplexCurveModuli D5, D7; AnalyticStableMaps §9.1–§9.2, §11, §12.2; CharacteristicClasses C1.2b, C3; Orbifolds O4; TopologicalSheafCohomology §1.2.

## Downstream consumers

- **HamiltonianFloerOperations** consumes Layer 0's class group with its energy and Chern maps (its H1, where `q^A ↦ e^(−A)` and the degree `+2c₁(A)` are compared), the closed stable-map operations, unit and ordered-diagonal and left-dual conventions of Layers 5–7, and the quantum product of §7.2 (its H7), and constructs the Morse-incidence application and the multiplicative Piunikhin–Salamon–Schwarz comparison without rebuilding the closed theory.
- Roadmaps on punctured and bordered curves, symplectic field theory and Lagrangian Floer theory may consume the closed operations, the Novikov specialization of Layer 0 and the descendant classes of Layer 8 as their closed-case input; none is a supplier here.

## References

- M. Kontsevich and Yu. Manin, *Gromov–Witten classes, quantum cohomology, and enumerative geometry*, Comm. Math. Phys. 164 (1994), 525–562, [arXiv:hep-th/9402147v2](https://arxiv.org/abs/hep-th/9402147v2). Page numbers are those of the arXiv version. Cited for: Definition 2.2 and the properties 2.2.0 (effectivity), 2.2.1 (covariance) and 2.2.2 (grading, equation (2.2)), p. 4; basic classes (2.3) and codimension (2.4), p. 4; 2.2.3 fundamental class, equations (2.6)–(2.7), p. 5; 2.2.4 divisor, p. 5; 2.2.5 mapping to a point, equation (2.8), p. 5, and equations (2.9)–(2.10), p. 6, where the coefficient of (2.9) is corrected in §3.4; 2.2.6 splitting, equation (2.11), p. 6; 2.2.7 genus reduction, equation (2.12), p. 6; 2.2.8 motivic axiom, p. 6, outside this roadmap; 2.4.5 mapping to a point with the obstruction sheaf `E ⊠ TV` of rank `g · dim V`, p. 10; Theorem-Definition 4.5, p. 19, the quantum cohomology ring conditional on the axioms; Definition 6.1 with axioms 6.1.1–6.1.3, p. 31, the cohomological field theory without a unit.
- M. Kontsevich and Yu. Manin, *Relations between the correlators of the topological sigma-model coupled to gravity*, Comm. Math. Phys. 196 (1998), [arXiv:alg-geom/9708024v1](https://arxiv.org/abs/alg-geom/9708024v1). Page numbers are those of the arXiv version. Cited for: §1.1, equations (1)–(2), p. 2, descendant and generalized correlators; Theorem 1.2, equation (4), p. 2, with its proof sketch, p. 3, the descendant–ancestor comparison; Corollary 1.3, equation (4a), p. 3, the three-point genus-zero recursion; equation (11), p. 5, the genus-zero ψ̄-integrals; Lemma 1.5.2, equation (12), p. 5, the divisor equation; Lemma 1.5.3, p. 6, the dilaton equation. All in the algebraic setting.
- J. Kock, *Notes on psi classes*, preliminary version of 6 June 2001, author's page (https://mat.uab.cat/~kock/GW/notes/psi-notes.pdf). Cited for: Lemma 1.2.6, p. 10, restriction of cotangent lines to boundary divisors; the identity `ψ_i · D_(i,0) = 0` and Lemma 1.3.1, p. 12, the forgetful comparison; Lemma 1.4.2, p. 14, the string equation; Lemma 1.5.1 and 1.5.2, p. 15, the genus-zero integrals and boundary expression of `ψ̄₁`; 1.6.2, p. 16, the dilaton equation; (5.1.7.1)–(5.1.7.3), pp. 50–51, the stable-map analogues, stated in genus zero; Proposition 5.1.8 and Lemma 5.1.9, p. 51, the genus-zero boundary expression and descendant–ancestor comparison for stable maps; Lemma 5.2.1, p. 53, the splitting lemma. All in the algebraic setting.
- P. Deligne and D. Mumford, *The irreducibility of the space of curves of given genus*, Publ. Math. IHÉS 36 (1969), 75–109, [Numdam](http://www.numdam.org/item/PMIHES_1969__36__75_0/). Cited for: §1, p. 77, facts b) and c) on the dualizing sheaf of a stable curve: the residue-matched differentials on the normalization with at most simple poles at the node branches, and the duality between `Hom(𝓕, ω_C)` and `H¹(C, 𝓕)`.
- The Stacks Project authors, *The Stacks Project*, chapter *Algebraic Curves*, https://stacks.math.columbia.edu. Cited for: Lemma 18.3, Tag 0CE3, whose proof uses the normalization sequence `0 → 𝒪_X → f_*𝒪_Y → 𝓕 → 0` with `𝓕` supported at finitely many points; Lemma 19.7, Tag 0C4D, item (6), a node has δ-invariant `1` and two geometric branches.
- J. Pardon, *An algebraic approach to virtual fundamental cycles on moduli spaces of pseudo-holomorphic curves*, Geom. Topol. 20 (2016), 779–1034, [arXiv:1309.2370v6](https://arxiv.org/abs/1309.2370v6). Page numbers are those of arXiv v6. Cited for: Theorem 9.2.10 (the Gromov–Witten implicit atlas), Definition 9.3.1 (the Gromov–Witten invariant as a pushforward of the virtual class to `H_•(M̄_(g,n) × X^n; ℚ)`) and Lemma 9.3.2 (its independence of `J`), p. 100; the §5 introduction, p. 40, where the fiber-product formula is named as a desired property not proved there; and the remark, p. 95, that proving the Kontsevich–Manin axioms from implicit atlases needs further properties of the virtual class. The analytic content of §9 and Appendix B is consumed through AnalyticStableMaps, the engine of §§3–6 and Appendix A through ImplicitAtlases.
