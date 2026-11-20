# Roadmap: Taubes–Gromov theory

**Summary.** Let `X` be a closed connected symplectic four-manifold with symplectic form `ω`
and a compatible almost complex structure `J`. Taubes's Gromov invariant counts embedded
`J`-holomorphic curves. For a class `A ∈ H₂(X; ℤ)` it is a finite signed sum over
configurations `{(C_a, m_a)}` of pairwise disjoint, connected, embedded `J`-holomorphic curves
with positive multiplicities and `Σ m_a [C_a] = A`, through `k` generic points, where `2k` is the
index of `A`. An ordinary curve enters with multiplicity one and a sign. A square-zero torus may
enter with any multiplicity `m`, weighted by the `m`-th coefficient of one of eight integral power
series, chosen by the determinant signs of its normal operator twisted by the four real line
bundles of the torus. This roadmap constructs that count, Taubes's analysis of the
Seiberg–Witten equations perturbed by a large multiple `r` of `ω`, and the plane vortices that
model the large-`r` solutions near a curve. It proves that the curve count equals the
Seiberg–Witten invariant with point insertions. Every global statement is about such an
`(X, ω, J)`, and Seiberg–Witten labels are Hermitian line bundles `E`, with `e = c₁(E)`.

The headline theorems are these.

- *Plane vortices.* For every `m ≥ 0` and every effective divisor of degree `m` on `ℂ` there is
  a smooth finite-energy solution of `∂̄_a α = 0`, `*iF_a = (1 − |α|²)/8` on the trivial line
  bundle over `ℂ`, framed at infinity with winding `m`, whose section vanishes exactly on the
  divisor. It is unique up to gauge transformations tending to one at infinity, and its gauge-fixed
  deformation operator is Fredholm with zero cokernel and index `2m`.
- *SW = Gr.* If `b₂⁺(X) > 1` and `J` is count-admissible, then the point-insertion
  Seiberg–Witten invariant of the canonical `Spinᶜ` structure twisted by `E`, oriented by the
  canonical homology orientation, equals Taubes's count in the class Poincaré dual to `e`. Before
  this equality, both sides vanish whenever `e · [S] < −1` for some embedded `J`-holomorphic sphere
  `S` of square `−1`.
- *Mapping tori.* Let `φ` be an area-preserving diffeomorphism of a closed connected oriented
  surface whose mapping torus `Y_φ` has `b₁ = 1`. Then `S¹ × Y_φ` is minimal with `b₂⁺ = 1`, and
  in the chamber of large-`r` perturbations the two invariants agree on pulled-back labels. The
  series of these values, indexed by `H₁(Y_φ; ℤ)`, is the orbit zeta function of `φ` coefficient
  by coefficient when every iterate of `φ` is nondegenerate, with vacuum coefficient `1`, and its
  homological Lefschetz zeta function when `φ` is degenerate. The same identity holds when
  `b₁(Y_φ) > 1`, through the comparison for `b₂⁺ > 1`.

Four groups of neighbours place the roadmap. [SeibergWittenTheory](../SeibergWittenTheory/README.md)
supplies the `Spinᶜ` structures, the monopole equations, their moduli spaces and orientations, the
invariant and its wall formula; this roadmap owns the large-`r` analysis and the comparison.
[PseudoholomorphicCurveAnalysis](../PseudoholomorphicCurveAnalysis/README.md),
[HeegaardFloer](../HeegaardFloer/README.md) and [AnalyticStableMaps](../AnalyticStableMaps/README.md)
supply Cauchy–Riemann operators, positivity of intersections, singular adjunction, genericity and
stable-map compactness, which are applied here to embedded curves and their counts.
[MorseNovikov](../MorseNovikov/README.md) supplies the completed series and the zeta functions
of the mapping-torus application, and [SymplecticGeometry](../SymplecticGeometry/README.md) the
symplectic suspension.

## How to read the build

Layers 0–3 build the curve side: the labels, the canonical homology orientation and charge
conjugation (Layer 0), embedded curves, their normal operators and the generic `J` (Layer 1),
the four-twist weights and the weighted sum (Layer 2), and compactness, the good-curve structure
theorem and the weighted count at a fixed `J` (Layer 3). Layer 4 is the plane-vortex theory.
Layer 5 proves the quantitative bounds for Seiberg–Witten solutions at large `r`. Layer 6 extracts
curves from sequences of solutions and proves the vanishing for bad classes. Layer 7 is the
inverse construction: from an admissible configuration it builds and controls Seiberg–Witten
solutions by inserting vortices and reducing to finitely many dimensions. Layer 8 proves that this
construction finds every solution once and compares the determinant lines. Layer 9 proves the
equality of the invariants, for `b₂⁺ > 1` and for the minimal products in their chamber. Layers 10
and 11 treat `S¹ × Y`: the support of the invariant on pulled-back labels, the wall values, the
localization of curves to orbit tori and the zeta identity. Each subsection's *Needs:* line lists
its inputs, so that a target proved by another route is not blocked behind an unrelated section.

## Conventions

1. **Setting.** `X` is a nonempty connected closed oriented smooth four-manifold with symplectic
   form `ω`, oriented by `ω²`, with a compatible almost complex structure `J` and the metric
   `g(v, w) = ω(v, Jw)`. Manifolds, smooth bundles and connections, singular homology and
   cohomology, Fredholm operators and determinant lines are the native carriers of Mathlib and
   Tau Ceti and of the supplier roadmaps; no parallel carrier is introduced.
2. **Labels.** `K = Λ²'⁰T*X` is the canonical line and `κ = c₁(K)`. For a Hermitian line `E`,
   `e = c₁(E) ∈ H²(X; ℤ)`, `A = PD_X(e)` and `PD(a) = a ⌢ [X]`. The canonical `Spinᶜ` lift `s_ω` of
   SeibergWittenTheory SW11.1 is twisted to `s_ω ⊗ E`, with `W⁺ = E ⊕ K⁻¹E`, determinant line
   `L = K⁻¹E²` and `l = c₁(L) = −κ + 2e` (SeibergWittenTheory SW11.2). The actual line `E` and the
   actual lift are kept throughout, two-torsion included; a statement about real or determinant
   classes alone does not identify them.
3. **Dimension.** `d(e) = ⟨e² − κe, [X]⟩ ∈ ℤ` is the real dimension of the Seiberg–Witten moduli
   space of `s_ω ⊗ E`, an even integer (§0.3), and `k(e) = d(e)/2` when `d(e) ≥ 0`. The same
   formula `d(C) = C² − κ · C` is the index of a curve class.
4. **Seiberg–Witten conventions** are those of SeibergWittenTheory: `c(v)² = −|v|²`,
   `Γ = −c(e₁)c(e₂)c(e₃)c(e₄)`, `∇ = d + A`, gauge action `(A, ψ) ↦ (A − 2u⁻¹du, uψ)`,
   `c₁(L)_ℝ = [iF_A/(2π)]`, curvature equation `F_A⁺ = q(ψ) + η` with `q = (1/4)τ(ψψ*)`.
5. **The point-insertion invariant.** For `d = 2k ≥ 0`,
   `SW⁰_X(s_ω ⊗ E) = ⟨μ^k, [M_SW]⟩`, where `μ` is the charge-one point class of
   SeibergWittenTheory SW7.2. The universal determinant point class is `2μ` and is not used. The
   full exterior-form invariant, with insertions from `H₁(X; ℤ)`, is SeibergWittenTheory's; the
   general comparison here is point-only. A line `E` with `d(e) < 0` has `SW⁰ = 0`.
6. **The curve invariant** is Taubes's point-insertion count of embedded curves with the
   four-twist torus weights. It is not a stable-map Gromov–Witten invariant, and it is not McDuff's
   modified invariant `Gr′`, which treats multiply covered exceptional spheres differently (McDuff,
   *Lectures on Gromov invariants for symplectic 4-manifolds*, Definition 3.2).
7. **Chambers.** When `b₂⁺ = 1` the positive harmonic line through `ω` is fixed, and `C₊` is the
   chamber `w > 0` of SeibergWittenTheory's wall coordinate `w` (§9.3).
8. **Local series** are elements of `PowerSeries ℤ` and their units, with Mathlib's
   `PowerSeries.invOfUnit` for inverses; global series over `H₁` are MorseNovikov's completed
   group rings. No new period-completion carrier is introduced.
9. **Numbering.** Layer `k` has subsections `k.n`; a subsection numbered `k.na` follows `k.n`.
   Statements of this roadmap without a declaration in `Suggested.lean` are written in prose. In
   the former numbering, TGk is Layer k and TGk.n is §k.n; the former TG6.1 is §6.1 together
   with §6.1a–§6.1c.

## Layer 0: labels and canonical orientation

### 0.1 The complex determinant orientation

Construct the canonical homology orientation from an elliptic operator (Taubes, *GR = SW*). Put
`ω_u = ω/√2` and `δ₀ = (−d*, √2 d⁺) : Ω¹ → Ω⁰ ⊕ Ω⁺`. Use the complex structure `J` on covectors
given by the metric, and on `Ω⁰ ⊕ Ω⁺` the complex structure `J′(f, g ω_u + ρ) = (−g, f ω_u + ω_u × ρ)`,
where `ρ ⊥ ω_u` and `×` is taken in an oriented orthonormal self-dual frame. Define the
complex-linear part `δ_ω = ½(δ₀ − J′δ₀J)` as an operator on the compact manifold. Prove that `δ_ω`
is complex linear and has the principal symbol of `δ₀`, so that `δ₀ − δ_ω` is of order zero and
the straight path from `δ_ω` to `δ₀` is a Fredholm homotopy. The pointwise symbol algebra is Tau
Ceti's: the symbol `TauCeti.SeibergWitten.deformationSymbol` intertwines `J` and `J′`
(`TauCeti.SeibergWitten.deformationSymbol_comp_toLinearMap`), `J′` is
`TauCeti.SeibergWitten.deformationComplexStructure`, and the complex-linear part has the same
symbol (`TauCeti.SeibergWitten.two_inv_smul_sub_deformationComplexStructure_deformationSymbol`).
Orient `det δ_ω` complexly; transport the orientation along the homotopy to `δ₀`, then along the
positive target-block rescaling `(f, η) ↦ (2f, η/√2)` to SeibergWittenTheory's
`T = (−2d*, d⁺)` (Tau Ceti's `TauCeti.SeibergWitten.abelianDeformationOperator`), and construct
its comparison with the harmonic forms and the homology orientation, in the declared target order
`H¹`, then `H⁰ ⊕ H⁺`. This fixes the canonical homology orientation `h_can` geometrically.
*Needs:* SeibergWittenTheory SW3.4 and SW7.1; HeegaardFloer §2.2 (determinant lines of Fredholm
families); ComplexKahlerGeometry §5.1 and §5.7 (Hodge star, harmonic forms); Tau Ceti
`TauCeti.SeibergWitten.deformationSymbol`, `TauCeti.SeibergWitten.deformationComplexStructure`,
`TauCeti.SeibergWitten.abelianDeformationOperator`.

**Checks.**
- In an oriented unitary coframe `e₁, e₂, e₃, e₄` with `Je₁ = e₂`, `Je₃ = e₄`, put
  `ρ₁ = (e₁₃ − e₂₄)/√2` and `ρ₂ = (e₁₄ + e₂₃)/√2`. The symbol of `δ₀` at `ξ = e₁` is
  `a ↦ (⟨e₁, a⟩, √2 (e₁ ∧ a)⁺)` and sends `e₁, e₂, e₃, e₄` to `1, ω_u, ρ₁, ρ₂`, because
  `*e₁₂ = e₃₄`, `*e₁₃ = −e₂₄` and `*e₁₄ = e₂₃`. It is an isometry from covectors to
  `ℝ ⊕ Λ⁺`; `J′1 = ω_u` matches `Je₁ = e₂`, and `J′ρ₁ = D_J ρ₁/2 = ρ₂` matches `Je₃ = e₄`. This
  computation at one covector extends to all covectors by unitary covariance. A normalization `δ₀ = (−d*, d⁺)` without the
  factor `√2` would send `e₂ = Je₁` to `ω_u/√2`, while `J′` sends the image `1` of `e₁` to
  `ω_u`, so that symbol would not be complex linear.

### 0.2 Charge conjugation and point nonvanishing

Construct the canonical `Spinᶜ` isomorphism `conj(s_ω ⊗ E) ≃ s_ω ⊗ (K ⊗ E⁻¹)` through the
`U(2)` and `Spinᶜ` representations, keeping every two-torsion label (Taubes, *GR = SW*). The
quaternionic antilinear Clifford intertwiners give `(A, ψ, η, u) ↦ (Ā, jψ, −η, ū)` on the
completed equations, the gauge groups and the regular solution quotients. Prove `q(jψ) = −q(ψ)`
on the bundles (pointwise this is Tau Ceti's `TauCeti.SeibergWitten.quadraticEnd_map`), the
Dirac intertwining law, and involutivity modulo the central gauge group. Construct the map of
determinant lines with SeibergWittenTheory SW7.1's zero-order homotopy to its ordered real factor
`T` and complex Dirac factor. The real factor contributes `(−1)^(1+b₁+b⁺)` and the complex factor
`(−1)^ind_C(D)`; put `ε_det = (−1)^(1+b₁+b⁺+ind_C(D))`. For `d = 2k`, the `k` point insertions
contribute `(−1)^k`, and since `d = 2 ind_C(D) − (1 − b₁ + b⁺)` the total point-pairing sign is
`ε_det (−1)^k = (−1)^((1−b₁+b⁺)/2)`. Construct the factor maps in the declared order and prove
their compatibility through kernel jumps and stabilization: the parity identity alone does not
give the analytic determinant transport. The charge-one universal line pulls back to its
conjugate, so `μ` pulls back to `−μ`, and for `d = 2k` the point pairings of `E` and `K ⊗ E⁻¹`
differ by the sign `ε_det (−1)^k`. For `b₂⁺ > 1` apply SeibergWittenTheory SW8.3's perturbation
independence: at independently chosen regular wall-free data, `SW⁰_X(s_ω ⊗ E) ≠ 0` if and only if
`SW⁰_X(s_ω ⊗ K ⊗ E⁻¹) ≠ 0`. Equality of determinant Chern classes alone does not determine the
`Spinᶜ` lift, so the bundle and orientation maps are constructed, not inferred.
*Needs:* §0.1; SeibergWittenTheory SW1.2, SW7.1, SW7.2 and SW8.3; FourManifolds §4.1 (`Spinᶜ`
lifts and twists); Tau Ceti `TauCeti.SeibergWitten.quadraticEnd_map`,
`TauCeti.SeibergWitten.quadraticEndPolar_map_map` and `TauCeti.SeibergWitten.quadraticTwoForm`.

**Checks.**
- For a Kähler surface the total sign `(−1)^((1−b₁+b⁺)/2)` is `(−1)^χ_h`, with `χ_h` the
  holomorphic Euler characteristic. For a smooth quintic surface in `CP³`, `b₁ = 0` and `b⁺ = 9`,
  so the sign is `−1`: for `E = K`, `d(κ) = 0`, `k = 0`, and `ind_C(D) = (1 − b₁ + b⁺)/2 = 5` makes
  `ε_det = (−1)^(1+0+9+5) = −1`. A comparison that kept only the real factor `(−1)^(1+b₁+b⁺)`
  would give `+1`.

### 0.3 Labels, dimension parity and the convention comparison

Prove that `d(e) = ⟨e² − κe, [X]⟩` is an even integer for every `e ∈ H²(X; ℤ)`: it is an integer
pairing, not a natural-number subtraction, and it is even because `κ` reduces modulo two to the
second Stiefel–Whitney class, which is characteristic for the intersection form (Wu), so
`e² ≡ κe` modulo two. Construct the comparison of symbols, charges, frames and homology
orientations between the conventions above and the chosen Seiberg–Witten supplier before any
count is compared, and fix that isomorphism once, with no class-dependent unexplained sign. The
principal comparison has `b₂⁺ > 1`; the `b₂⁺ = 1` application is the minimal product chamber of
Layers 9–11.
*Needs:* SeibergWittenTheory SW11.1–SW11.2 (canonical lift, twists and the dimension formula);
FourManifolds §4.1–§4.2 (Wu identities); CharacteristicClasses (Chern and Stiefel–Whitney
classes); §0.1.

**Checks.**
- On the blowup of a K3 surface at one point, `κ = E_x` is the exceptional class. For `e = 2E_x`,
  `e² = −4` and `κe = −2`, so `d(e) = −2`: the label has negative dimension, no point insertion and
  `SW⁰ = 0`. Natural-number subtraction would return `d = 0` and treat it as a dimension-zero label.
- For `X = CP²` and `e = H`, `κ = −3H` gives `d(H) = 1 + 3 = 4`, so `k = 2`, the two points that
  determine a line.

### Examples

- For `X = CP²`, `κ = −3H`, and the labels `e = jH` have `d = j² + 3j`, always even, with
  `k = 0, 2, 5, 9` for `j = 0, 1, 2, 3`.
- For a K3 surface, `κ = 0`, `d(e) = e²` and the total conjugation sign is `+1`
  (`b₁ = 0`, `b⁺ = 3`); conjugation exchanges `e` and `−e`.

### Dependencies

SeibergWittenTheory SW1, SW3.4, SW7, SW8.3 and SW11; FourManifolds Layer 4; HeegaardFloer §2.2;
ComplexKahlerGeometry Layer 5; CharacteristicClasses. Tau Ceti: the pointwise deformation symbol,
its complex structure, the abelian deformation operator and the charge-conjugation sign of the
quadratic map.

## Layer 1: embedded normal operators and application regularity

### 1.1 Configurations, exceptional spheres and good classes

Define the space of finite unordered configurations `{(C_a, m_a)}` (Taubes, *Counting
pseudo-holomorphic submanifolds in dimension 4*): each `C_a` is a connected closed embedded
`J`-holomorphic image with its complex orientation, distinct components are disjoint, each `m_a`
is a positive integer, and `Σ m_a [C_a] = A` in integral homology. Equivalence forgets
parametrizations and keeps the embedded images and their multiplicities; an embedded torus in a
divisible class is distinct from a multiplicity on a smaller torus image. For a count-admissible
compatible `J` (§1.3) let `Exc_J` be the set of embedded `J`-holomorphic spheres of
self-intersection `−1`, and define `good_J(e)` to mean `e · [S] ≥ −1` for every `S ∈ Exc_J`. The
predicate and the count use the same `J`.
*Needs:* Tau Ceti `TauCeti.IsPseudoholomorphic` (pseudoholomorphic maps of almost complex
manifolds); HeegaardFloer §4.6b (simple maps and their images); AlgebraicTopology (fundamental
classes of closed oriented surfaces).

**Checks.**
- The canonical class is good for every `J`: an exceptional sphere `S` has `κ · S = −1`. A
  definition by `e · S ≥ 0` would make `κ` bad on every nonminimal `X`, although
  `SW⁰_X(s_ω ⊗ K) = ±1` when `b₂⁺ > 1` by §0.2 and §9.1, contradicting the vanishing of §6.2.

### 1.2 The embedded normal operator

For an embedding use the quotient normal bundle `i*TX/TC` and the exact sequence of tangent and
normal bundles, consuming GeometricTopology's tube and the comparison of the metric normal bundle
with the quotient. Derive the normal real Cauchy–Riemann operator, its Fredholm realizations,
domains and adjoint from PseudoholomorphicCurveAnalysis §6.2–§6.3, its determinant orientation
from HeegaardFloer §3.4, and compare the normal graph charts with AnalyticStableMaps Layer 2's
smooth quotient of simple maps (Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*).
Prove the adjunction formula `2g − 2 = A_C² + κ · A_C` and that the normal index is
`A_C² − κ · A_C`, with the tangent and reparametrization cancellation made explicit. The almost
complex structure need not be integrable. Each fixed point constraint removes two real normal
dimensions; construct the evaluation and normal-incidence orientation maps instead of inferring
submersivity of evaluation at a fixed `J`. The generic machinery is the suppliers'; this
roadmap owns its embedded normal and counting application.
*Needs:* §1.1; PseudoholomorphicCurveAnalysis §6.2–§6.3 and §7.2; HeegaardFloer §3.4 and §4.6e
(singular adjunction); AnalyticStableMaps Layer 2; GeometricTopology Layer 1 (tubes).

**Checks.**
- A line in `CP²` has `A² = 1`, `κ · A = −3`, so `2g − 2 = −2` and `g = 0`; its normal index is
  `1 + 3 = 4`, two point constraints. With the sign `A² + κ · A` the index would be `−2`.
- An embedded sphere of square `−1` has `κ · S = −1` by adjunction and normal index `0`; a
  square-zero torus has `κ · T = 0` and index `0`.

### 1.3 Count-admissible almost complex structures

Construct a countable admissibility condition on bounded windows of symplectic area, class and
cover degree (Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*): every relevant
simple normal operator and chosen point-incidence operator is regular; the index-zero normal
operator of an isolated torus, on every relevant finite unbranched cover, is nondegenerate; and
the constrained strata of forbidden intersections, singularities and excess index have the
required codimension. State the selected operators, covering spaces and derivative budgets.
Prove the residual and relative generic-path versions with these finite derivative budgets, and
pass to smooth `J` on compact targets. Include unmarked moving-domain regularity for every
nonconstant somewhere-injective closed curve, in countably many windows of genus, integral class
and area, not only for embedded configurations; in particular the chosen `J` is regular for every
simple normalization of area at most `⟨[ω]κ, [X]⟩` that can occur in §6.2. Construct these
residual sets from the compact-target simple-curve theory of HeegaardFloer and AnalyticStableMaps
and intersect them with the cover and incidence admissibility sets. The same chosen `J` is used
for `Exc_J`, `good_J`, both large-`r` limits of §6.2 and the fixed-`J` count; no simultaneous
fixed-`j` regularity for all domain complex structures is asserted. The restricted
image-normalization and index-exclusion application is §3.1.
*Needs:* §1.2; HeegaardFloer §2.1–§2.2 and §4.4; AnalyticStableMaps §2.9–§2.15 (§2.13 is the
smooth-`J` passage).

### 1.4 Multiplicities and exceptional components

Ordinary components have multiplicity one; higher multiplicity is allowed only on square-zero
tori with `κ · [C] = 0`. In the `b₂⁺ > 1` comparison, ordinary multiplicity-one exceptional
spheres are kept as components on a nonminimal `X`. General limits of Seiberg–Witten solutions
(§6.1) keep arbitrary positive multiplicities on exceptional spheres; the bad-class vanishing
(§6.2) and the extraction for `good_J` point-constrained data (§6.3) are proved from them. The
`b₂⁺ = 1` comparison is limited to minimal symplectic products `S¹ × Y_φ` and has no
exceptional-sphere case.
*Needs:* §1.1–§1.3.

### Examples

- For a product `J` on `T² × S²` with a product form, the fibres `T² × {p}` are embedded
  square-zero tori with `κ · [T²] = 0`, the curves on which multiplicities above one occur.
- For `CP²` with its integrable structure, the lines are embedded spheres of square `1` and index
  `4`, and `Exc_J` is empty.

### Dependencies

PseudoholomorphicCurveAnalysis Layers 6–7; HeegaardFloer Layers 2–4; AnalyticStableMaps Layer 2;
GeometricTopology Layer 1; AlgebraicTopology (fundamental classes). Tau Ceti: pseudoholomorphic
maps of almost complex manifolds.

## Layer 2: four-twist weights and configuration assembly

### 2.1 Four twists and their determinant labels

For each relevant embedded square-zero torus `C` construct its four flat real sign lines
`χ : π₁(C) → {±1}`, equivalently the classes of `H¹(C; ℤ/2)`, and the twisted normal operators
`D_(C,χ)` (Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*). Prove their
pullback, finite-cover, change-of-trivialization and determinant-reference comparisons. At regular
data define `σ(C)` as the oriented determinant sign of `D_(C,0)` and `i(C)` as the number of
negative signs among the three nonzero twists. The signs use a constructed path to a
complex-linear reference and coherent determinant transport, not kernel dimensions alone; prove
their independence of the reference path and trivialization by the determinant orientation
theorem. An orientation of `C` identifies an indexing by `H₁` of the source with the indexing by
characters explicitly.
*Needs:* §1.2–§1.3; HeegaardFloer §2.2 and §3.4; PseudoholomorphicCurveAnalysis §6.2–§6.3.

### 2.2 Local weights

The local weight of a torus with label `(σ, i)` and multiplicity `m` is
`w_(σ,i)(m) = [t^m] f_(σ,i)` for the series with constant term one
`f_(+,0) = 1/(1 − t)`, `f_(+,1) = 1 + t`, `f_(+,2) = (1 + t)/(1 + t²)`,
`f_(+,3) = (1 + t)(1 − t²)/(1 + t²)` and `f_(−,i) = 1/f_(+,i)` (Taubes, *Counting
pseudo-holomorphic submanifolds in dimension 4*; the same eight series, with the labels defined by
the four twisted determinant signs, are in McDuff, *Lectures on Gromov invariants for symplectic
4-manifolds*, §5.2, p. 34 of the arXiv version). These are Tau Ceti's
`TauCeti.torusWeightSeries` and `TauCeti.torusWeight`, with `σ = true` for the positive sign; the
weight is a power-series coefficient, not an automorphism reciprocal and not the orbit logarithm's
`1/m`. Define the contribution of a configuration as the product of its component contributions:
an ordinary component contributes its determinant and incidence sign, and a torus of label
`(σ, i)` and multiplicity `m` contributes `w_(σ,i)(m)`. Fix `k` ordered distinct generic point
constraints. The image condition determines which component meets which point, with no arbitrary
ordering of components and no division by `k!`; prove the determinant permutation law, whose
indices here are even.
*Needs:* §2.1; Tau Ceti `TauCeti.torusWeightSeries`, `TauCeti.torusWeight`,
`TauCeti.isUnit_torusWeightSeries`.

**Checks.**
- `f_(+,2) = 1 + t − t² − t³ + t⁴ + t⁵ − ⋯` and `f_(+,3) = 1 + t − 2t² − 2t³ + 2t⁴ + ⋯`, while
  `f_(−,3) = 1 − t + 3t² − 3t³ + 5t⁴ − 5t⁵ + ⋯`; all coefficients are integers.
- A torus of label `(+,0)` contributes `1` with every multiplicity. The weight `1/m` of the orbit
  logarithm would give `1/2` at `m = 2`, which is not an integer.

### 2.3 The weighted sum and the ray series

Define `Gr_(J,ω)(A)` as the finite sum, over mutually compatible configurations in the class `A`
through the `k` points, of their contributions, and prove the finiteness it needs (§3.1) before
summing. For a finite set of pairwise disjoint torus images the sum over their multiplicities is
the coefficient of the product of their local series (Tau Ceti's
`TauCeti.coeff_prod_torusWeightSeries`). On a square-zero homology ray, prove that distinct
relevant `J`-holomorphic torus images are disjoint, by positivity of intersections and zero
intersection number, before using an unrestricted product of components. For general classes the
disjointness condition stays in the definition; not every series of the count factors over all
embedded curves. For a primitive square-zero class `A₀` define the ray count by configurations
whose every component is a torus of class `mA₀`, `m ≥ 1`. Through a finite cutoff its series is
`Π_(m≥1) Π_(C ∈ T(A₀,m)) f_label(C)(t^m)`; the coefficient identity is Tau Ceti's
`TauCeti.coeff_rayTorusWeightSeries` and `TauCeti.coeff_tprod_expand_torusWeightSeries`, applied
after the disjointness theorem. It equals the full series on the classes `jA₀`, `0 ≤ j ≤ N`, only
under the additional geometric hypothesis that every admissible configuration in those classes
consists of these ray tori; prove that conditional comparison. A total class on a ray does not
force the classes of its components onto the ray. For the mapping-torus application use the full
sum over compatible configurations indexed by integral classes and its finite-below support (§11.3),
then MorseNovikov's specialization of exponents with its fibre-finiteness hypotheses.
*Needs:* §2.2, §3.1; HeegaardFloer §4.6e (positivity of intersections); Tau Ceti
`TauCeti.coeff_prod_torusWeightSeries`, `TauCeti.rayTorusWeightSeries`,
`TauCeti.coeff_rayTorusWeightSeries`, `TauCeti.coeff_tprod_expand_torusWeightSeries`; MorseNovikov
Layer 1.

**Checks.**
- Two disjoint tori of label `(+,0)` have total weight `3` in total multiplicity `2`, the
  coefficient of `t²` in `f_(+,0)²`: the distributions `(2,0)`, `(1,1)` and `(0,2)` each have
  weight one. Adding the two local series instead of multiplying them would give `2`. This is the
  value `k + 1` at `k = 2` of McDuff, *Lectures*, Lemma 5.1, p. 33, for the two section tori of
  `S² × T²`.
- A torus `T` of class `A₀` and label `(+,0)` together with a torus `T′` of class `2A₀` and label
  `(+,1)` give the ray series `f_(+,0)(t) f_(+,1)(t²) = 1 + t + 2t² + 2t³ + ⋯`. Its coefficient in
  class `A₀` is `1`, from `T` alone; without the substitution `t ↦ t²` the product
  `f_(+,0)(t) f_(+,1)(t)` has coefficient `2` there and credits `T′` to the class `A₀`.

### Examples

- A single torus with label `(−,0)` has series `1 − t`: it contributes `−1` in its own class and
  nothing in its multiples. A torus with label `(+,1)` has series `1 + t`: it contributes `1` in
  its own class and nothing in its multiples.

### Dependencies

Layer 1 and §3.1; HeegaardFloer §2.2, §3.4 and §4.6e; PseudoholomorphicCurveAnalysis Layer 6;
MorseNovikov Layer 1. Tau Ceti: the local series, their unit property and the product and ray
coefficient expansions.

## Layer 3: compactness, local bifurcations and the weighted count

### 3.1 Bounded-window compactness and exclusion

Prove the bounded-window compactness and exclusion theorem that Layers 1–2 need (Taubes,
*Counting pseudo-holomorphic submanifolds in dimension 4*). On the compact `X`, bound cohomology
pairings by comass times area, hence bound the free coordinates of the integral homology classes,
and keep the finitely many torsion choices. Derive that only finitely many component classes occur
below an area cutoff, and combine the adjunction and index bounds with a uniform positive lower
bound on area to bound genera, numbers of components and multiplicities. Apply closed-target
stable-map compactness only after these bounds are supplied. Construct the adapter that
decomposes a limit in a Taubes window into images and extracts embedded components, including
positivity, the analysis of singularities and branch points, and the exclusion of unwanted strata
by dimension counts under the generic point conditions. Prove the normalization and
image-comparison theorem for these limits, with all finite exceptional sets and multiplicities; a
weak current limit alone does not identify an admissible embedded configuration.
*Needs:* §1.2–§1.3; AnalyticStableMaps Layers 0 and 3 (§0.5 normalization, §3.7 compactness);
HeegaardFloer §4.6e.

### 3.2 The good-curve structure theorem

Let `D = Σ m_i C_i` be a finite positive cycle of distinct simple `J`-holomorphic images with
primitive closed normalizations, in the class `PD(e)`, with `good_J(e)` and `k(e) ≥ 0`, passing
through `k(e)` prescribed generic distinct points. Prove that its components are pairwise disjoint
embedded curves, that a negative-square component is an exceptional sphere of multiplicity one,
that multiplicity above one occurs only on square-zero tori with `κ · [C] = 0`, and that each
ordinary component `C` contains exactly `d(C)/2` of the points (Taubes, *Counting
pseudo-holomorphic submanifolds in dimension 4*). The geometric input is: normalize and combine
equal images; generic dimension bounds for simple curves and singular adjunction give every image
index `d(C) − 2δ(C) ≥ 2k_C` with `k_C` the number of points on it and `δ(C) ≥ 0` its singularity
number; every negative-square image is an embedded exceptional sphere; and the points are chosen
off these spheres with simultaneous incidence transversality for every class and genus. From these
inputs the numerical conclusions are Tau Ceti's `TauCeti.IsGoodCycle` and its consequences; in
particular `d(e) = Σ d(C)` over the ordinary components, repeated tori have index zero, each ordinary
component through `k_C` assigned points has `2k_C ≤ d(C)` with equality, and every point is assigned
to exactly one component
(`TauCeti.IsGoodCycle.singularity_eq_zero`, `TauCeti.IsGoodCycle.apply_eq_zero`,
`TauCeti.IsGoodCycle.mult_eq_one_of_apply_self_neg`,
`TauCeti.IsGoodCycle.apply_self_eq_zero_of_one_lt_mult`,
`TauCeti.IsGoodCycle.apply_canonical_eq_zero_of_one_lt_mult`,
`TauCeti.IsGoodCycle.apply_self_sub_apply_canonical_eq`, `TauCeti.IsGoodCycle.existsUnique_mem`,
`TauCeti.IsGoodCycle.eq_empty_of_one_lt_mult`), with the component inequality
`TauCeti.sum_mul_apply_self_sub_apply_canonical_le`. The theorem is conditional on a cycle through
the points and asserts no existence for an empty curve space. It is independent of the inverse
construction and of SW = Gr. Keep the finite partition of the point labels; generic points avoid
index-zero and exceptional images.
*Needs:* §1.1–§1.3, §3.1; HeegaardFloer §4.6e (singular adjunction, positivity); Tau Ceti
`TauCeti.IsGoodCycle`, `TauCeti.sum_mul_apply_self_sub_apply_canonical_le`.

**Checks.**
- On a K3 surface (`κ = 0`) the cycle `2T`, with `T` an embedded square-zero torus, is allowed:
  `d(2T) = 2 d(T) + 2(2 − 1)T² = 0`, and it passes through no points. A cycle `2C` with `C` an
  embedded curve of square `1` has `d(2C) = 2 d(C) + 2`, so it would have to carry
  `d(C) + 1` generic points, while `C` passes through at most `d(C)/2` of them: the theorem
  excludes it, as it excludes every multiplicity above one off square-zero tori.

### 3.3 The weighted count at a fixed `J`

At a fixed count-admissible `J`, define the finite weighted point count `Gr_J(A)` from the
configuration space (§1.1), its compactness (§3.1) and the local weight algebra (§2.2–§2.3),
before any path theorem (Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*).
Prove its independence of the point constraints, of refinements and of the cutoff, from compact
incidence models. The empty configuration gives `Gr_J(0) = 1`, and a class of negative index has
count zero. A nonzero torsion class `e` has no nonempty positive-area holomorphic representative,
and is not identified with the zero class because its real pairings vanish.
*Needs:* §1.1–§1.3, §2.2–§2.3, §3.1–§3.2.

**Checks.**
- On `CP²` with its integrable structure, `Gr_J(H)` counts the lines through two generic points:
  one line, an ordinary component with sign `+1`, so `Gr_J(H) = 1`. A count dividing by the `2!`
  orderings of the points would give `1/2`.

### 3.4 Curve paths and bifurcations

For relative paths along which the embedded exceptional spheres in the relevant area window
continue smoothly, without appearing, splitting or degenerating, construct compact
one-dimensional configuration and bifurcation models (Taubes, *Counting pseudo-holomorphic
submanifolds in dimension 4*): ordinary signed births and deaths, and every bifurcation of covered
tori that affects the cutoff. Give explicit finite-dimensional reductions and oriented
correspondences of branches and multiplicities. Derive the changes of the four-twist labels and
the coefficient identities from those reductions, checking both signs and all multiplicities with
finite-cover compatibility, and prove the local weight identities and the total oriented boundary
cancellation under these path hypotheses. This path theorem does not continue through
exceptional degenerations. It uses intrinsic oriented reductions of curves and covers and their
coefficient identities; the physical local-degree and wall comparison on the monopole and vortex
side is Layers 7–8's, and the two keep their own reduction, orientation and cover hypotheses. The
independence of the count from `J` and the symplectic form in
general is §9.2 and §9.5, which derive it from the equality with the Seiberg–Witten invariant; it
is not an input to that equality.
*Needs:* §1.3, §2.1–§2.3, §3.3; HeegaardFloer Layer 2 (generic Fredholm families);
AnalyticStableMaps §2.16–§2.17 (relative families).

### Examples

- For every `X` and `J`, `Gr_J(0) = 1` from the empty configuration, matching `SW⁰_X(s_ω) = 1`
  for the canonical homology orientation (§9.1).
- On the one-point blowup of a K3 surface, with `κ = E_x`, the class `2E_x` has index `−2` and
  count zero.

### Dependencies

Layers 1–2; AnalyticStableMaps Layers 0, 2 and 3; HeegaardFloer Layers 2 and 4. Tau Ceti: the
intersection inequalities of good cycles.

## Layer 4: framed plane vortices on a concrete Sobolev scale

The plane vortex equations, for an imaginary connection `a` on the trivial line over `ℂ` and a
section `α`, are `∂̄_a α = 0` and `*iF_a = (1 − |α|²)/8`. Tau Ceti writes a field in the real
coordinates `x = (b₁, b₂, p, q)`, with `a = i(b₁ ds + b₂ dt)` and `α = 2(p + iq)`, so that the
coefficient metric `|b|² + |δα|²/4` is Euclidean; `TauCeti.Vortex.equation` is the triple of
defects and `TauCeti.Vortex.sectionValue` the section.

### 4.1 Framed pairs, gauge groups and the affine Sobolev model

A *smooth framed degree-`m` finite-energy pair* is a smooth imaginary connection `a` on the
trivial line and a smooth section `α` with `∫_ℂ (|F_a|² + |d_a α|² + (1 − |α|²)²) < ∞` and
`α(z) e^(−imθ) → 1` uniformly as `|z| → ∞`, for a fixed end coordinate and frame (Taubes,
*Gr ⇒ SW*). Its smooth framed gauge group consists of all smooth `u : ℂ → U(1)` with `u → 1` at
infinity, with no base-point condition; it acts by `(a, α) ↦ (a − u⁻¹du, uα)` and preserves the
energy and the phase framing. These are Tau Ceti's `TauCeti.Vortex.framedGaugeGroup`,
`TauCeti.Vortex.gaugeTransform`, `TauCeti.Vortex.energyDensity_gaugeTransform` and
`TauCeti.Vortex.tendsto_sectionValue_gaugeTransform`. Decay and normalization are proved below
for solutions, not assumed for every pair. For each `m ≥ 0` the smooth reference field
`TauCeti.Vortex.referenceField`, equal to `(−im dθ, e^(imθ))` outside a disc, need not solve the
equations, and the affine space `A_m^k = (a_m, α_m) + H^k(ℂ; iT*ℂ ⊕ ℂ)` is
`TauCeti.Vortex.framedFieldSpace`; changing the cutoff of the reference changes it by a compactly
supported smooth field and gives the same affine space (`TauCeti.Vortex.framedFieldSpace_eq`).
For integer `k ≥ 3` define the Banach gauge group

    G_(k+1) = {u = 1 + h : h ∈ H^(k+1)(ℂ; ℂ), |u| = 1 on its continuous representative},

and construct its Banach charts, multiplication, inversion and action
`(a, α) ↦ (a − u⁻¹du, uα)` on `A_m^k`. The `H^(k+1)` tail and uniform continuity give `u → 1`;
the smooth gauges form a separate subgroup and do not define the completion. Use one field space,
keeping the collision divisors, rather than independent single-vortex spaces.
*Needs:* Tau Ceti `TauCeti.Vortex.framedGaugeGroup`, `TauCeti.Vortex.gaugeTransform`,
`TauCeti.Vortex.referenceField`, `TauCeti.Vortex.framedFieldSpace`,
`TauCeti.Vortex.framedFieldSpace_eq`, `TauCeti.Vortex.sobolevFields`; Mathlib
`TemperedDistribution.MemSobolev` (the Bessel-potential Sobolev classes).

### 4.2 The equation map, the flux and the deformation complex

Construct the equation map `x ↦ (∂̄_a α, *iF_a − (1 − |α|²)/8)` from `A_m^k` into
`H^(k−1)(ℂ; ℝ ⊕ ℂ)` (Taubes, *Gr ⇒ SW*); pointwise it is `TauCeti.Vortex.equation`. For its
solutions the curvature decays exponentially and is integrable (Tau Ceti's
`TauCeti.Vortex.exists_abs_curvature_le_mul_exp` and `TauCeti.Vortex.integrable_curvature`).
Prove the flux identity `(2π)⁻¹ ∫ iF_a = m` for a framed degree-`m` vortex (stated, in coordinates
scaled by `√2` where the curvature coefficient is `1/4`, in Taubes, *SW ⇒ Gr*, Proposition
4.1(3)(i)–(ii), p. 871, with `m` the number of zeros counted with multiplicity); no `L¹` bound on
the
curvature is asserted for arbitrary affine `H^k` fields. Construct the deformation complex
`H^(k+1)(iℝ) → H^k(iT*ℂ ⊕ ℂ) → H^(k−1)(ℝ ⊕ ℂ)` with `d₁d₀ = 0` at a solution, the real `L²`
coefficient metric `|b|² + |δα|²/4` for `a = ib`, the formal `L²` adjoint `d₀*` and the
gauge-fixed operator `d₀* ⊕ d₁` with target `H^(k−1)(ℝ ⊕ ℝ ⊕ ℂ)`, as bounded operators on these
spaces. Pointwise, `d₁d₀ = 0` is `TauCeti.Vortex.linearizedEquation_gaugeDirection`, `d₀*` is
`TauCeti.Vortex.gaugeAdjoint` (with `TauCeti.Vortex.integral_mul_gaugeAdjoint`) and `d₀* ⊕ d₁` is
`TauCeti.Vortex.gaugeFixedOperator` with formal adjoint `TauCeti.Vortex.gaugeFixedAdjoint`.
Establish the weak equation, nonlinear smoothness, the elliptic bootstrap, the slice and the
proper quotient, and the comparison between different `k`, before treating the smooth moduli
space.
*Needs:* §4.1; Tau Ceti `TauCeti.Vortex.equation`, `TauCeti.Vortex.linearizedEquation`,
`TauCeti.Vortex.gaugeFixedOperator`, `TauCeti.Vortex.integrable_curvature`; ComplexKahlerGeometry
§5.4 (Sobolev scales), PseudodifferentialOperators (elliptic regularity).

**Checks.**
- Since `*iF_a = (1 − |α|²)/8`, the flux identity reads `∫ (1 − |α|²) = 16πm`. The vacuum, with
  `|α| ≡ 1`, has `m = 0`; the coefficient `1/4` in place of `1/8` would give `8πm` and a different
  moduli problem.

### 4.3 The vacuum operator and the Fredholm theory at a vortex

Pin the full vacuum normalization (Taubes, *Gr ⇒ SW*). For `α = 1 + u + iv` put `p = u/2`,
`q = v/2`. In real coordinates the gauge-fixed operator at the vacuum sends `(b₁, b₂, p, q)` to

    G  = ∂₁b₁ + ∂₂b₂ + q/2,     C  = −∂₁b₂ + ∂₂b₁ + p/2,
    H₁ = ∂₁p − ∂₂q − b₂/2,      H₂ = ∂₁q + ∂₂p + b₁/2.

Its adjoint has `(L₀*y)_(b₁) = −∂₁G − ∂₂C + H₂/2`, and `L₀*L₀ = (−Δ + 1/4) Id`,
`‖L₀x‖₂² = ‖∇x‖₂² + ‖x‖₂²/4`; the Fourier inverse gives invertibility `H^k → H^(k−1)` and the
first-order gap `1/2`. All of this is Tau Ceti's: `TauCeti.Vortex.vacuumOperator`,
`TauCeti.Vortex.vacuumAdjoint`, `TauCeti.Vortex.vacuumAdjoint_vacuumOperator`,
`TauCeti.Vortex.integral_norm_sq_vacuumOperator`, `TauCeti.Vortex.temperedVacuumOperatorEquiv` and
`TauCeti.Vortex.memSobolev_temperedVacuumOperator_iff`. Use it for an exterior parametrix at a
vortex in its winding-`m` end trivialization; that trivialization is not a framed gauge. Prove that
the gauge-fixed operator at a framed degree-`m` vortex is Fredholm `H^k → H^(k−1)`, that its
cokernel vanishes, and that its kernel is the real tangent space of the symmetric product of
divisors, so that its real index is `2m`. The vacuum calculation alone supplies none of these
degree-`m` conclusions. Tau Ceti supplies two inputs: the exterior lower bound for the adjoint at
every mass below `1/2` (`TauCeti.Vortex.exists_exterior_integral_norm_sq_gaugeFixedAdjoint_ge`)
and the vanishing of the smooth `L²` kernel of the adjoint at every vortex
(`TauCeti.Vortex.eq_zero_of_memLp_of_gaugeFixedAdjoint_eq_zero`).
*Needs:* §4.1–§4.2; Tau Ceti `TauCeti.Vortex.vacuumOperator`,
`TauCeti.Vortex.temperedVacuumOperatorEquiv`,
`TauCeti.Vortex.exists_exterior_integral_norm_sq_gaugeFixedAdjoint_ge`,
`TauCeti.Vortex.eq_zero_of_memLp_of_gaugeFixedAdjoint_eq_zero`; Mathlib
`ContinuousLinearMap.IsFredholm`; PseudodifferentialOperators (parametrices).

**Checks.**
- On constant fields the vacuum operator is its zero-order part,
  `(b₁, b₂, p, q) ↦ (q, p, −b₂, b₁)/2`, one half of an orthogonal map. So `|L₀x| = |x|/2` and
  the gap is exactly `1/2`; the term `b₁` in `H₂` is what makes the adjoint formula carry `+H₂/2`.
- At `m = 0` the index `2m` is `0`, as the invertibility of the vacuum operator requires. At
  `m = 1` the kernel is spanned by the two translations of the vortex, made orthogonal to the
  gauge orbit.

### 4.4 Existence, uniqueness and the moduli space

A *framed degree-`m` plane vortex* (`IsFramedVortex`) is a smooth solution of the vortex equations
on `ℂ` with finite energy whose section, multiplied by `(z/|z|)^(−m)`, tends to one at infinity. Its
section has *zero divisor* `D` (`HasZeroDivisor`) when at every point `z` it vanishes to order
exactly the multiplicity of `z` in `D`, in the sense of a local factorization `(w − z)^n v(w)` with
`v` continuous and nonzero at `z`; this order is determined by the section. Prove Taubes's
classification (Taubes, *Arbitrary N-vortex solutions to the first order Ginzburg–Landau
equations*; stated, in coordinates scaled by `√2`, as Taubes, *SW ⇒ Gr*, Proposition 4.1(3), p. 871,
whose proof on p. 880 refers to that paper):

- the zero divisor of a framed degree-`m` vortex exists and has degree `m`
  (`exists_hasZeroDivisor_of_isFramedVortex`);
- every effective divisor of degree `m`, repeated points included, is the zero divisor of a framed
  degree-`m` vortex (`exists_isFramedVortex_hasZeroDivisor`);
- two framed degree-`m` vortices with the same zero divisor differ by an element of the smooth
  framed gauge group (`exists_mem_framedGaugeGroup_eq_gaugeTransform`).

Prove the smooth equivalence of the quotient with the symmetric product of `m` points of `ℂ`,
repeated zeros included, and the reconstruction through the scalar equation for `2 log |α|` with
the phase and connection clutching. Construct the comparison with the smooth finite-energy framed
vortex orbits: every such orbit has a representative in `A_m^k` after a smooth framed gauge, with
all derivative and decay estimates, and two representatives in `A_m^k` related by a smooth framed
gauge differ by an element of `G_(k+1)`. This must handle phases tending to one with a `1/|z|`
tail, which need not lie in `H^(k+1)`; only the normalized representative lies in the affine
model. Tau Ceti supplies the uniqueness argument for sections that differ by a nowhere-vanishing
factor (`TauCeti.Vortex.exists_eq_phaseGauge_of_forall_section_eq_mul`), the local factorization
and finiteness of zeros (`TauCeti.Vortex.exists_contDiffAt_section_eq_pow_mul`,
`TauCeti.Vortex.finite_setOfPred_section_eq_zero`), the scalar equation
(`TauCeti.Vortex.laplacian_log_normSq_of_equation_eq_zero`), the reconstruction from a solution
of the regularized scalar equation (`TauCeti.Vortex.amplitudeField`,
`TauCeti.Vortex.equation_amplitudeField_eq_zero_iff`), its end framing
(`TauCeti.Vortex.tendsto_sectionValue_amplitudeField_mul_inv_phase_iff`) and the finite energy of
every classical vortex with `|α| → 1` (`TauCeti.Vortex.integrable_energyDensity`). The target here
is the existence of the scalar solution for every divisor, the comparison of two sections with the
same divisor, and the moduli space.
*Needs:* §4.1–§4.3; the Tau Ceti declarations just named; Mathlib `Multiset`, `Sym`.

**Checks.**
- For `m = 0` the symmetric product is a point and the moduli space is the orbit of the vacuum.
- The framed gauge group has no base-point condition. Asking also `u(0) = 1` would leave a free
  action of the circle of values `u(0)` on the quotient, and the moduli space would have real
  dimension `2m + 1`, not the index `2m` of §4.3.
- The zero divisor records the oriented order of vanishing, not the growth of `|α|`. A field whose
  section is `w̄` near `0` has no zero divisor: `w̄ = wⁿ v(w)` with `v` continuous and nonzero at
  `0` fails for `n = 0` since `v(0) = 0`, for `n = 1` since `w̄/w` has no limit at `0`, and for
  `n ≥ 2` since `|v(w)| = |w|^(1−n)` is unbounded. A definition by `|α(w)| ~ |w|ⁿ` would give it
  order `1`.

### 4.5 Compact divisor windows: projections, right inverses and decay

Prove continuity and smoothness of the kernel projections and of the right inverses on
`L²`-orthogonal complements over each specified compact subset of the symmetric product,
including its collision locus in symmetric coordinates (Taubes, *Gr ⇒ SW*). Prove the
translation, rotation, permutation and line-frame laws and the cluster and separation estimates
that gluing needs. No uniform inverse over all of the noncompact symmetric product follows from
the vacuum gap. Keep these unweighted field and gauge carriers. Construct normalized smooth
families of representatives over each compact divisor window, with exterior phase the fixed
winding phase. After the winding-`m` end trivialization, prove that their fields tend to `(0, 1)`
with all specified spatial and symmetric-coordinate derivatives bounded by constants times
`exp(−c|z|)`, for every fixed `0 < c < 1/2`. An arbitrary asymptotically trivial framed gauge need
not preserve decay of the field tail, so this is proved for the chosen normalized representatives,
compatibly with the quotient and frame laws. The modulus defect itself decays at every rate below
`1/2` (Tau Ceti's `TauCeti.Vortex.exists_one_sub_normSq_le_mul_exp`).
*Needs:* §4.3–§4.4; Tau Ceti `TauCeti.Vortex.exists_one_sub_normSq_le_mul_exp`.

### 4.6 Weighted output estimates

For `ρ(z) = √(1 + |z|²)`, the inverse `Q_D` on the complement of the kernel at the divisor `D`,
and its kernel projections, prove the output estimate
`‖exp(cρ) Q_D f‖_(H^k) ≤ K ‖exp(cρ) f‖_(H^(k−1))`, with the complementary constraints, the
adjoint version and each requested parameter derivative (Taubes, *Gr ⇒ SW*). These are estimates
for the unweighted inverse on exponentially decaying inputs. Prove them by convergence to the
normalized vacuum, the exterior estimate for the conjugated operator with margin `1/4 − c²`,
control of the compact core, and differentiated identities for inverses and projections.
Constants depend on the compact divisor window, on `c` and on the derivative orders, and
collisions are included in symmetric coordinates. The vacuum threshold gives no uniform nonzero
spectral gap over all vortices or for the four-dimensional operator. Supply separate cluster
estimates where the compact-window hypotheses fail, and keep the reusable plane estimates for
separating clusters, in their declared noncompact regimes, for the enlarged wall models of §7.36;
confinement at a fixed `J` does not remove that broader statement.
*Needs:* §4.3–§4.5.

### 4.7 Flat scaling from the four-dimensional equations

Derive the flat scaling from the conventions of Layer 0 (Taubes, *Gr ⇒ SW*). With an oriented
splitting into tangent and normal directions, `β = 0`, `q(α, 0) = i|α|²ω/4` and `A = A₀ + 2a`, the
leading equation for the connection on `E` is `*iF_a = (r/4)(1 − |α|²)`. In the coordinate
`w = √(2r) y` the curvature coefficient is divided by `2r`, which gives the plane model with
`1/8`; the dilation laws are Tau Ceti's `TauCeti.Vortex.coupledEquation_dilateField` and
`TauCeti.Vortex.equation_dilateField_inv_sqrt`. Prove every density, derivative, gauge-adjoint
and Sobolev pullback factor, including the normalizations of the fields. The curvature of the
tube, the intrinsic torsion, the background connection and the cutoff terms go into the error of
Layer 7; the flat equation is not the four-dimensional equation.
*Needs:* §4.2, §5.1; Tau Ceti `TauCeti.Vortex.coupledEquation`,
`TauCeti.Vortex.equation_dilateField_inv_sqrt`.

**Checks.**
- Dilation by `t` multiplies the curvature coefficient by `t²`; with `t = (2r)^(−1/2)` the
  coefficient `r/4` becomes `(r/4)/(2r) = 1/8`. The coordinate `w = √r y` would give `1/4`.

### Examples

- The vacuum `(0, 1)` is the framed degree-`0` vortex, with zero divisor empty and invertible
  gauge-fixed operator.
- For `m = 1` and `D = {z₀}`, the vortex is the translate by `z₀` of the vortex centred at `0`,
  and the moduli space is `ℂ`.

### Dependencies

Tau Ceti's plane-vortex theory (fields, reference fields, framed gauge group, vacuum operator and
its tempered inverse, gauge-fixed operator and adjoint at a field, decay, uniqueness, zeros,
reconstruction, dilation). Mathlib: Sobolev spaces of tempered distributions, Fredholm operators,
multisets and symmetric products. PseudodifferentialOperators and ComplexKahlerGeometry Layer 5
(elliptic regularity and Sobolev scales). §5.1 for the four-dimensional origin of the scaling.

## Layer 5: large-parameter equations and quantified forward bounds

### 5.1 The canonical connection and the projected equations

Construct the canonical determinant connection `A₀` and the unit section `u₀` of the trivial
summand of `W⁺` from the almost-Kähler data. Prove its projected connection identities and
`D_(A₀)u₀ = 0` from the intrinsic torsion and `dω = 0`; no parallel spinor and no integrable
Dolbeault identity is assumed. With `a` a connection on `E`, `A = A₀ + 2a`, `χ = αu₀ + β` and
`Ψ = √r χ`, set

    η_r = F_(A₀)⁺ − irω/4,
    D_A Ψ = 0,    F_A⁺ = q(Ψ) + η_r + ρ,

where `ρ` is an imaginary self-dual smooth forcing. Prove `q(u₀) = iω/4`, the charge-one and
charge-two connection formulas, and that `P_α = (1 + i c₂(ω)/2)/2` and `P_β = (1 − i c₂(ω)/2)/2`
are the eigenprojections when `|ω| = √2`, with `u₀` in the `−2i` eigenline. Pointwise these are Tau
Ceti's `TauCeti.SeibergWitten.cliffordProjection`, `TauCeti.SeibergWitten.isStarProjection_cliffordProjection`,
`TauCeti.SeibergWitten.bivectorExterior_apply_of_cliffordProjection_apply_eq_self` and
`TauCeti.SeibergWitten.coe_quadraticTwoForm_of_cliffordProjection_apply_eq_self`; the targets are
the bundle-level statements and the frame and intertwiner comparison, constructed before a
projected formula is transported from another convention. For `ρ = 0` the connection `A₀`, the
section `u₀` and the projected equations are Taubes, *SW ⇒ Gr*, §1(c)–(d), (1.12)–(1.20),
pp. 850–851.
*Needs:* Layer 0; SeibergWittenTheory SW1–SW3 and SW11.1–SW11.3; Tau Ceti
`TauCeti.SeibergWitten.cliffordProjection`, `TauCeti.SeibergWitten.quadraticTwoForm`,
`TauCeti.SeibergWitten.coe_quadraticTwoForm_add_of_cliffordProjection`.

**Checks.**
- `|q(u₀)|² = |ω|²/16 = 1/8 = |u₀|⁴/8`, consistent with `|q(ψ)|² = |ψ|⁴/8` for every spinor. The
  normalization `|ω| = 1` would give `1/16`.

### 5.2 The coarse forward bounds

Fix an integer `s ≥ 3`, a finite coefficient budget `ℓ ≥ 2s + 6`, the line label, and a compact
family of smooth compatible geometric data with positive injectivity and tube bounds and bounded
`C^ℓ` coefficients, and allow `‖ρ‖_(C^ℓ) ≤ 1`. This budget concerns the forward estimates; the
finite correction order of Layer 7 needs its own, explicitly computed, coefficient and parameter
budget. Prove constants `C` and `r₀`, independent of `r` and of the solution within the family,
with every dependence explained, such that, with `w₊ = (1 − |α|²)₊`,

    |α|² + |β|² ≤ 1 + C/r,    |β|² ≤ C r⁻¹ w₊ + C r⁻²,
    |∇_a α|² + r|∇β|² ≤ C r w₊ + C,
    |F_a⁺| ≤ r/(4√2) w₊ + C,
    |F_a⁻| ≤ r/(4√2) (1 + C r^(−1/2)) w₊ + C,
    r ∫ |1 − |χ|²| ≤ C,
    r⁻¹ ‖F_a‖₂² + ‖∇χ‖₂² + r ‖1 − |χ|²‖₂² ≤ C,
    ‖∇β‖₂ + √r ‖β‖₂ ≤ C r^(−1/2) (‖∇_a α‖₂ + 1),
    ‖∂̄_a α‖₂ ≤ C r^(−1/2) (‖∂_a α‖₂ + 1).

All norms, connections and the positive-part and background terms are part of the statements.
Derive the inequalities from the forced projected Weitzenböck system, weak maximum principles and
Green's functions, and the Chern identities, including `F_(A₀)⁺`, `ρ` and their derivatives and
`F_a = (F_A − F_(A₀))/2`. For a fixed metric and `ρ = 0` the pointwise bounds are those of Taubes,
*SW ⇒ Gr*, (1.24) with Propositions 2.1, 2.3, 2.4 and 2.8, pp. 853–860, and the `L¹` bound on the
defect is its Lemma 2.6, p. 858.
*Needs:* §5.1; SeibergWittenTheory SW3.2 (Weitzenböck constants) and SW5.2 (weak maximum and
energy bounds); ComplexKahlerGeometry §5.7.

### 5.3 The Hermitian curvature theorem

On the same compact families, for real `F = iF_a` and the Hermitian part
`B(v, w) = (F(v, Jw) + F(w, Jv))/2`, prove `B ≥ −C g` uniformly, including `α = 0` and the whole
region where `α` is small. In a unitary oriented frame with `ω = e¹² + e³⁴` and `|ω|² = 2`, prove
`λ_min(B) = c − |F_a⁻|/√2` with `c = ⟨iF_a, ω⟩/2`, the anti-`J` self-dual summand contributing
nothing to `B`. The projected half-determinant equation gives
`c = r(1 − |α|² + |β|²)/8 + ⟨iρ, ω⟩/4 = r w₊/8 + O(1)`, so the Hermitian theorem gives the refined
bound `|F_a⁻| ≤ r w₊/(4√2) + C`. Construct its coupled tensor and eigenvalue-barrier proof from
the differentiated curvature, Dirac and Weitzenböck equations, keeping the `β` and covariant
gradient terms, the nonparallel `J` and torsion, the metric curvature, the background connection,
the forcing derivatives and all compact-family constants. Construct the regularized
minimum-eigenvalue test and the weak limiting argument across eigenvalue crossings and zeros of
`α`. Derive and close the differential and integral inequalities controlling the negative
eigenvalue, with finite coefficient orders and uniform constants, rather than assuming that a
scalar curvature inequality closes them. For a fixed metric and `ρ = 0` the refined bound is
Taubes, *SW ⇒ Gr*, Proposition 3.4, p. 866, proved there by another route: a maximum-principle
comparison whose barrier is built from the ball covering that the monotonicity formula of its
Proposition 3.1 gives (Lemmas 3.5–3.6). Every stronger rate used later is proved as its own
quantitative output.
*Needs:* §5.1–§5.2.

**Checks.**
- In the frame above, the anti-self-dual form `F = e¹² − e³⁴`, of norm `√2`, has
  `B = diag(1, 1, −1, −1)`, so `λ_min = −1 = −|F|/√2`, and the anti-`J` self-dual forms
  `e¹³ − e²⁴` and `e¹⁴ + e²³` give `B = 0`. For `F = ω`, `c = 1` and `B` is the identity. A formula
  with `|F_a⁻|` in place of `|F_a⁻|/√2` would give `−√2` for the first form.

### 5.4 Defect monotonicity

Define the local defect energy `E_r(B) = r ∫_B |1 − |χ|²|/4`. For balls of radius `σ` below a
fixed geometric radius, prove the differential inequality

    E_r(B_σ) ≤ (σ/2)(1 + Cσ)(1 + C r^(−1/2)) dE_r(B_σ)/dσ + Cσ⁴

in the coarea, almost-everywhere sense, with the stated controlled forcing. Deduce
`E_r(B_σ) ≤ Cσ²` for `c r^(−1/2) ≤ σ ≤ σ₀`, and `E_r(B_σ) ≥ c′σ²` when the centre is a zero of
`α`, specifying constants and ranges for every low-`α` variant used. Prove the packing bound
`N(σ) ≤ Cσ⁻²` for maximal families of disjoint half-balls with centres at zeros, with the
quantifier `r ≥ r₀(σ)`. For a fixed metric and `ρ = 0` these are Taubes, *SW ⇒ Gr*, Propositions
3.1–3.2, p. 862 (the differential inequality there for balls centred where `|α| < 1/2`), and the
packing bound is its Lemma 3.6, p. 867. This gives no monotonicity at radius zero and no statement
over
uncontrolled geometry.
*Needs:* §5.2; Mathlib `MeasureTheory.Measure.hausdorffMeasure` and the coarea formula for
Lipschitz distance functions.

**Checks.**
- On flat `ℝ⁴`, for a degree-`m` vortex constant along a plane through the centre of the ball,
  `r/4` times the integral of `1 − |α|²` over a normal disc is `2πm` by the flux identity of §4.2
  in the coordinate `w = √(2r) y`. So `E_r(B_σ) ≈ 2π²mσ²` for `σ ≫ r^(−1/2)`, and the inequality
  holds with equality at leading order, since `(σ/2) d(cσ²)/dσ = cσ²`. A defect energy growing
  like the volume `σ⁴` of the ball would not satisfy the integrated bound `E_r(B_σ) ≤ Cσ²` near
  a zero.

### 5.5 Rescaled compactness and the canonical connection

Prove local gauge and elliptic compactness at scale `r^(−1/2)`, with all finite derivative
estimates. For the canonical connection `A^can_α` on `L` obtained from `α²/|α|²` away from the zeros,
prove

    |A − A^can_α| + |F_A − F_(A^can_α)| ≤ C/r + C r exp(−c √r · dist(x, α⁻¹(0)))

where `dist(x, α⁻¹(0)) ≥ c₀ r^(−1/2)`, together with the derivative and model-approximation bounds
that Layers 6–8 use. Differences use the line identification induced by `α`, not a global choice
of phase. State the derivative order, the scaled norms and the background remainders of each
stronger estimate, and prove compact-family uniformity and stability for the smaller regularization
tolerance used later, keeping the integral line labels. For a fixed metric and `ρ = 0` the
rescaled limits on `ℝ⁴` are Taubes, *SW ⇒ Gr*, Proposition 4.2, p. 872, and the exponential decay
of `F_a`, `∇_a α`, `β` and `1 − |α|²` away from `α⁻¹(0)` is its Proposition 4.4, p. 875.
*Needs:* §5.2–§5.3; SeibergWittenTheory SW5.3–SW5.4.

### 5.6 Quantitative low-α zero localization

Match `A^can_α` with the pullback of the chosen `A₀` under the unit identification `α²/|α|²`
of `L` with `K⁻¹` on `α ≠ 0`, and prove the corresponding curvature identity with every fixed
background comparison bounded. Verify `π_ω(F_A − F_(A₀) − ρ) = (r/4)(|α|² − |β|² − 1)`. With
`h = (2r)^(−1/2)`, the bound away from the zeros and the `β` estimate give
`w₊ ≤ (C/r) w₊ + C/r + C exp(−c dist(x, Z_α)/h)` for `dist ≥ c₀h`. After absorption prove, for each
fixed `0 < θ < 1`, constants `K_θ` and `r_θ` such that `|α(x)| ≤ θ` implies
`dist(x, Z_α) ≤ K_θ h`, including the short-distance case and the case of no zeros. Choose
`θ = 1/√2` to cover the whole support `|α|² ≤ 1/2` of the cutoff current. For the independently
prescribed `ε_low(r) → 0`, choose eventually `ε_low ≤ 1/2` and use `K_(1/2)`, uniformly over the
compact family of geometry and forcing. Derive these implications from the displayed equations
and comparison, keeping their constants and thresholds. For a fixed metric and `ρ = 0` the
localization also follows from the decay of `r(1 − |α|²)` in Taubes, *SW ⇒ Gr*, Proposition 4.4,
p. 875.
*Needs:* §5.2, §5.5.

### 5.7 The mass bound for the curvature current

Use the `L¹` bound on the defect, the `β` bound and both curvature bounds to prove an
`r`-independent bound on the mass of the current `T_r(ζ) = ∫ (iF_a/2π) ∧ ζ` (for a fixed metric
and `ρ = 0`, Taubes, *SW ⇒ Gr*, (5.3), p. 882, from its Lemma 2.6 and Proposition 3.4). The scaled
`L²`
estimate alone only gives `‖F_a‖₂ = O(√r)` and does not suffice. Construct the topology of closed
currents and all passages between overlaps, gauges and weak and smooth convergence. For a
nowhere-vanishing symplectic form no distance to a zero set of the form and no noncompact boundary
theorem is assumed.
*Needs:* §5.2–§5.3; DifferentialGeometry (currents on manifolds).

### 5.8 The physical cutoff current

Construct a coarse cutoff-current theorem before normal dilation or good-class extraction. For
`s = |α|²` choose a smooth nondecreasing `0 ≤ χ ≤ 1` with `χ = 0` on `s ≤ 1/4` and `χ = 1` on
`s ≥ 1/2`, put `τ = Im(ᾱ ∇_a α)/s`, extend `χτ` by zero and set `Θ = iF_a + d(χτ)`. Prove that `Θ` is
smooth, closed and supported in `{s ≤ 1/2}`. From the coarse bounds of §5.2 derive
`Vol{s ≤ 1/2} ≤ C h²`, `‖β‖₂ ≤ C h²`, `‖∇_a α‖₂ ≤ C`, `‖∂̄_a α‖₂ ≤ C h` and the pointwise bound
`|∂̄_a α| ≤ C`. Prove that the integrated distance of `Θ/(2π)` from the cone of positive
`J`-`(1,1)` currents is `O(h)`, with bounded mass. The negative Hermitian density can be `O(h⁻¹)`
on that support, but its integral is `O(h)`, and the anti-`J` component is `O(h)` by the `β` and
Dirac bounds. This physical, undilated theorem needs no refined anti-self-dual estimate.
*Needs:* §5.2, §5.6–§5.7.

### 5.9 The curvature comparison from a modulus potential

With `d^c_J f = −df ∘ J/2`, `H(1) = 0` and `H′(s) = χ(s)/s`, constant near zero, prove the identity
`χτ = d^c_J H(s) + E` with `E = 2χ Re(α⁻¹ ∂̄_a α) ∘ J`, and the bounds `‖H(s)‖₁ ≤ C h²` and
`‖E‖₂ ≤ C h`. Hence `Θ/(2π)` and `iF_a/(2π)` have the same limits against every fixed smooth
two-form, with an `O(h)` bound in the stated `C²` test norm. This identifies real currents before
anisotropic confinement; the integral line and relative Euler classes are Layer 6's.
*Needs:* §5.8.

**Checks.**
- On `ℂ` with the trivial connection and `α = z`, `τ = Im(z̄ dz)/|z|² = dθ` and, where `χ = 1`,
  `d^c_J H = −d(log |z|²) ∘ J/2 = dθ`, while `∂̄α = 0` makes `E = 0`; the identity holds. The
  convention `d^c_J f = df ∘ J/2` would give `−dθ`.

### Examples

- For `X` Kähler with `ρ = 0` and `E` trivial, the solution with `α ≡ 1`, `β = 0` and `A = A₀` is a
  large-`r` solution with no zeros; all bounds of §5.2 hold with `w₊ = 0`.
- For the flat model `ℂ × ℂ` with a degree-`m` vortex in the normal factor in the coordinate
  `w = √(2r) y` of §4.7, constant along the base, the zeros lie at normal distance `O(r^(−1/2))`
  and the current `T_r` converges to `m` times the current of integration over `ℂ × {0}`.

### Dependencies

Layer 0 and §4.7; SeibergWittenTheory SW1–SW5 and SW11; ComplexKahlerGeometry Layer 5;
DifferentialGeometry (forms and currents). Tau Ceti: the Clifford projections and the quadratic
two-form. Mathlib: Hausdorff measure and the coarea and covering lemmas.

## Layer 6: raw integral limits, exceptional vanishing and good-class extraction

### 6.1 General raw cycle and integral label

Construct one reconstruction theorem from positive cohomology assignments (for a compact
symplectic manifold with compatible `J`, Taubes, *SW ⇒ Gr*, Proposition 6.1 with the criteria
(6.1), p. 891), on a smooth real four-manifold `Y` without boundary, compact or not, with an almost
complex
structure `J` tamed by a specified symplectic form `Ω` and its induced orientation. The inputs are
a closed subset `Z` with locally finite two-dimensional Hausdorff measure, and an integer
assignment to all continuous disc maps whose boundary avoids `Z`: zero when the whole disc misses
`Z`; invariant under admissible homotopies; multiplied by the signed degree under proper
continuous maps `θ : D → D` whose composites are admissible. For a compact target disc `K ⊂ D`
put `A = θ⁻¹K` and use AlgebraicTopology's relative orientation class
`[D]_A ∈ H₂(D, D ∖ A; ℤ)`; define `deg(θ)` by `θ_*[D]_A = deg(θ)[D]_K` in
`H₂(D, D ∖ K; ℤ) ≅ ℤ`. The source relative group need not be cyclic, and for `A = ∅` its
distinguished class is zero. Prove compatibility of these classes under excision and restriction,
independence of `K` by connectedness of `D`, then the composition, orientation-sign and
proper-homotopy laws, for homotopies whose inverse images of compact sets are uniformly compact.
For proper smooth `θ` prove `∫_D θ*β = deg(θ) ∫_D β` for compactly supported smooth two-forms. For
maps of closed disc pairs the assignment agrees with the relative Euler degree; it is additive over
every finite disjoint family of subdiscs, parametrized by orientation-preserving disc embeddings
and containing the whole inverse image of `Z`, the empty family included; and it is strictly
positive on every nonconstant `J`-holomorphic disc meeting `Z` with boundary outside `Z`.
Construct the carrier of proper `J`-holomorphic curves, the primitive normalization, the locally
discrete branch and singular set, positive integer multiplicities, and the identification of
charges with intersection numbers. Prove local regularity, removal of singularities and
normalization in the tamed setting, uniqueness of the weighted image from its local charges, and
the restriction, excision and compact-support laws. Compact `Z` gives a compact normalization and
a finite image decomposition. The theorem is independent of Seiberg–Witten theory, of good labels
and of the inverse and counting constructions.
*Needs:* AlgebraicTopology §6.3 (relative orientation classes); HeegaardFloer §4.2 and §4.6e
(local theory, positivity of intersections); PseudoholomorphicCurveAnalysis Layers 4–5
(the weak pseudoholomorphic equation and bootstrapping); Tau Ceti `TauCeti.IsPseudoholomorphic`; Mathlib
`MeasureTheory.Measure.hausdorffMeasure`.

### 6.1a Framed-charge stabilization

Construct a framed-charge stabilization lemma for the physical and normal applications (the
convergence of the disc integrals to integers is Taubes, *SW ⇒ Gr*, Proposition 5.6, p. 887, and
Lemma 6.2, pp. 891–892). Its inputs are closed smooth cutoff forms `Θ_n = iF_(a_n) + d(χτ_n)` of
Hermitian
lines `E_n`, a locally mass-bounded weak limit, a closed support `Z`, and uniform vacuum and
boundary-avoidance buffers outside `Z`, including the cutoff support and the nonvanishing framing
by `α_n`. On each admissible smooth disc identify `∫ Θ_n/(2π)` with its framed relative Euler, or
winding, integer. Build finitely many compactly supported spanning vector fields near the image of
the disc and their short flows, keeping all boundary collars outside `Z`. Their total evaluation
map is submersive, and an interior source cutoff with a smooth probability density on the
parameters gives, by fibre integration, a smooth compactly supported two-form representing the
common disc pairing; weak convergence then makes these integers converge and stabilize. Prove the
homotopy, proper-degree, disjoint and empty additivity and restriction laws, and extend to
continuous discs by relative approximation and boundary-avoiding homotopies. The lemma consumes
support and vacuum and asserts neither positivity nor density.
*Needs:* §5.8–§5.9, §6.1.

### 6.1b Physical inputs along a large-r sequence

For actual solutions with `r_n → ∞` and the forcing bounds of Layer 5, construct the physical
inputs in this order: Hausdorff convergence of the support and vacuum on compact sets; framed
integer disc charges; strictly positive charges of holomorphic discs and retention of zeros; lower
density at support points (Taubes, *SW ⇒ Gr*, Lemma 5.2, p. 884, for the finite Hausdorff
measure of the support and a lower bound on its Hausdorff measure in balls, and Proposition 5.6,
p. 887, for the positive integer charges). Fix an admissible nonconstant `J`-holomorphic disc
`σ` with boundary outside `Z` and a smooth metric on its parameter disc, and keep every factor of
`dσ` in the pulled-back projected Dirac equation. Prove bounds on declared compact subdiscs with
constants depending on the disc, its finite derivative bounds and the boundary vacuum buffers;
compact-family uniformity requires these controls. At critical points do not divide by `dσ` or
treat the degenerate induced tensor as a metric. For the eventually integral framed charge
`I_n(σ) = (2π)⁻¹ ∫ σ*Θ_n` prove `I_n(σ) ≥ −ε_n(σ)` with `ε_n → 0`, and, when `σ(D)` meets `Z`,
`I_n(σ) ≥ c_σ − ε_n(σ)` for some `c_σ > 0` independent of `n`. Derive these estimates from the
coupled equations, microscopic gauge and rescaling and local charge control, including residence
in the tangential tube, not from the ambient tube volume alone. Prove the same on admissible
subdiscs; positive winding forces zeros of the restricted `α_n` there, by the relative Euler class.
Construct the local isolation and degree comparisons that retention of zeros at support
intersections needs, including critical discs, tangencies, multiplicities and the boundary
framing. This local theorem is independent of reconstructed curves, good-class extraction, inverse
gluing and §5.3.

Along the same subsequence take a positive weak limit `ν_phys` of the defect measures
`(r_n/4)|1 − |χ_n|²| dvol_(g_n)`, with `χ_n = α_n u₀ + β_n` the normalized spinor and `g_n` the
selected metric; use one fixed auxiliary or limiting metric for the balls, with the uniform metric
comparisons of the compact family. Prove that `ν_phys` is a positive locally finite Radon measure
with the compact-set mass bounds of Layer 5, for the same subsequence and metric as the support and
current limit. For each compact `K` choose a compact neighbourhood `K′` and constants `c_K > 0`,
`ρ_K > 0` with all relevant balls in `K′`, and derive `ν_phys(B_ρ(x)) ≥ c_K ρ²` for every
`x ∈ Z ∩ K` and `0 < ρ < ρ_K` from the local coupled equations, charge and rescaled compactness.
The `5r` covering argument with this single measure and the finite `ν_phys(K′)` gives locally
finite two-dimensional Hausdorff measure, then reconstruction (§6.1) and the identification of the
current by local charges. Construct `E ≃ O(Σ mC)` by relative Euler classes and clutching (§6.1c),
torsion and empty support included. Keep arbitrary positive multiplicities on exceptional spheres,
combine equal images, and construct the comparison of integral currents and singular cycles by
relative support, subdivision and excision. Stable-map compactness of fixed signature is applied
only with bounds on class, genus and components.
*Needs:* Layer 5, §6.1–§6.1a; Mathlib `Vitali.exists_disjoint_subfamily_covering_enlargement`,
`MeasureTheory.Measure.hausdorffMeasure`; AnalyticStableMaps §3.7.

### 6.1c The line bundle of the limit

Construct `E ≃ O(Σ m_a C_a)` as topological line bundles: use the nonvanishing normalized `α`
away from the limit, the local transverse degrees of the zeros and compatible gauge and clutching
transitions, including the gluing on overlaps and the torsion data. Equivalently construct the
comparison `Σ m_a [C_a] = PD(c₁(E))` of the integral cycle with the relative Euler class, with the
line classification map. Weak convergence of curvature alone identifies only the real class (as in
Taubes, *SW ⇒ Gr*, (5.4), p. 883). Prove
that a limit with empty support forces `E` to be trivial. This general theorem precedes the
admissible and inverse constructions.
*Needs:* §6.1b; SmoothBundlesConnections §B6.2 (the first Chern class classifies circle
bundles); CharacteristicClasses (relative Euler classes, Thom classes).

**Checks.**
- For a nonzero torsion class `e` there are no large-`r` solutions: an empty limit would make `E`
  trivial, and a nonempty limit has positive symplectic area while `PD(e)` pairs to zero with
  `[ω]`. A comparison through real classes alone, which sees `e` as zero, would allow the vacuum
  as a limit.

### 6.2 Canonical-cycle algebra and bad-class point vanishing

Suppose `b₂⁺ > 1` and `SW⁰_X(s_ω ⊗ E) ≠ 0` (Taubes, *GR = SW*; the forward cycles come from
Taubes, *SW ⇒ Gr*, Theorem 1.3, p. 852). By §0.2 the
conjugate label `K ⊗ E⁻¹` has nonzero point invariant. At the count-admissible `J` of §1.3, with
its unmarked moving-domain regularity for all simple normalizations in the canonical-area window,
use SeibergWittenTheory's smooth genericity in a fixed bounded forcing ball and the invariance for
`b₂⁺ > 1` to obtain nonempty regular moduli spaces for both `E` and `K ⊗ E⁻¹` at arbitrarily large
`r`; large `r` gives the wall gap. The two rays are chosen independently, and perturbation
independence connects their invariants. Apply §6.1 alone to obtain cycles `C_A` and `C_B` and
combine their images into `D = C_A + C_B`, of integral class `PD(κ)`.

For a simple normalized image `C` let `δ(C) ≥ 0` be its singularity number. Prove from the
unmarked index and singular adjunction that `ind(C) = d(C) − 2δ(C) ≥ 0`, and that negative square
forces an embedded exceptional sphere with `C² = κ · C = −1`. Write `D = Σ m_i C_i`, with `N`
indexing the negative-square images and `P` the others. The intersection algebra that follows is
Tau Ceti's `TauCeti.IsCanonicalCycle`: evaluating `κ` on `C_i`, `i ∈ N`, gives
`−1 = −m_i + Σ_(j≠i) m_j C_i · C_j`, distinct negative images do not meet, and the expansion

    0 = Σ_(i∈P) m_i d(C_i) + Σ_(i∈P) m_i(m_i − 1) C_i²
        + 2 Σ_(i<j; i,j∈P) m_i m_j C_i · C_j + Σ_(i∈N) m_i(m_i − 1)

of `d(D) = d(κ) = 0` into nonnegative terms shows that every negative multiplicity is one, every
positive image is embedded of index zero, distinct images are disjoint, and repetition occurs only
on square-zero tori orthogonal to `κ` (`TauCeti.IsCanonicalCycle.mult_eq_one_of_apply_self_neg`,
`TauCeti.IsCanonicalCycle.apply_eq_zero_of_ne`,
`TauCeti.IsCanonicalCycle.apply_self_eq_zero_of_one_lt_mult`,
`TauCeti.IsCanonicalCycle.apply_canonical_eq_zero_of_one_lt_mult`,
`TauCeti.IsCanonicalCycle.apply_canonical_sum_eq_apply_self`). Every subcycle, `C_A` included, has
`d = 0` and is admissible. Every `S ∈ Exc_J` occurs in `D`, since otherwise
`κ · S = D · S ≥ 0`, contradicting `κ · S = −1`; it occurs once, so `e · S` is `0` or `−1`
(`TauCeti.IsCanonicalCycle.exists_eq_of_apply_canonical_neg`,
`TauCeti.IsCanonicalCycle.apply_sum_eq_zero_or_eq_neg_one`). Conclude that `not good_J(e)` implies
`SW⁰_X(s_ω ⊗ E) = 0`. Independently, positivity of admissible configurations gives that
`not good_J(e)` implies `Gr_J(PD(e)) = 0`. This proves the point simple-type consequence from raw
forward cycles and conjugation, before the inverse construction and the count equality.
*Needs:* §0.2, §1.3, §6.1–§6.1c; SeibergWittenTheory SW6.1–SW6.3 and SW8.3; HeegaardFloer §4.6e
(singular adjunction); Tau Ceti `TauCeti.IsCanonicalCycle`.

**Checks.**
- On the one-point blowup of a K3 surface, `κ = E_x` and the cycle `D = E_x` satisfies the
  conclusions; for `e = 2E_x` the class is not good (`e · E_x = −2`) and both invariants vanish,
  consistently with `d(2E_x) = −2 < 0`. A cycle `2E_x` would give `κ · E_x = D · E_x = −2 ≠ −1`, so
  multiplicity two on an exceptional sphere cannot occur in `D`.

### 6.3 Point cutdowns and guarded admissible refinement

Fix `good_J(e)`, `k(e) ≥ 0` and the generic distinct points of §3.2 (Taubes, *GR = SW*; the
forward statement with point constraints is Taubes, *SW ⇒ Gr*, Theorem 1.3, p. 852, with the
closed sets `Ω_i` taken to be the points). Before regularity or a truncation order is selected,
construct the normalized point-evaluation sections `α(x_j)` of `E_(x_j) ⊗ U_(x_j)` on open
neighbourhoods in SeibergWittenTheory SW4.5's irreducible `H^s` configuration quotient, `s ≥ 3`. Use
SW7.2's
charge-one line, bounded evaluation, principal gauge charts, buffered smaller chart neighbourhoods
with closure in their domains, local frames and smooth Hilbert-chart cutoffs. Construct a finite
spanning family `s_(r,a,ρ)` of sections, continuous together with the curvature data on its
ambient domain. Choose a compact ball `A_pre,r` about `0` in a specified finite coefficient space
`A_r`, with sections defined on an open product `A_r^open × P_r^open × U_r` of coefficient,
curvature and ambient-configuration domains, independent of the later profile order, boundary
separation and final tolerance, with errors at most `ε_low(r) → 0`. Every constrained zero, for
every `a ∈ A_pre`, then has `|α(x_j)| ≤ ε_low(r)`; prove the limit-support theorem placing each
`x_j` on the raw cycle. For `k = 0` use the empty tuple. All raw extraction, reconstruction, joint
finite-order estimates and fixed-`r` persistence below are uniform over all solutions and all
coefficients in `A_pre`, not only over generic cutdown zeros; no smooth raw zero set and no
evaluation submersion is presumed. The transverse representatives and their smaller controlled
homotopy are selected only in §8.2, after the curvature tolerance.

Although the spanning presentation, `A_pre,r` and the configuration domain `U_r` may depend on
`r`, prove the early raw and recovery estimates uniformly for all Seiberg–Witten fields satisfying
the declared `C⁰` low-`α` error, independently of that coefficient presentation: those sections do
not enter the equations. If higher derivatives of sections or coefficients are used early, derive
their `r`-dependent growth and include it in the finite ledger and the joint witness of §7.34;
fixed-`r` compactness gives no uniform polynomial growth. The later fixed-`r` quantities
`D_sec`, `H_r` and `B_r` of §7.40 may be large; `τ` and `A_late` shrink accordingly, with no rate
assumed. Apply §3.2's good-curve structure theorem to obtain an admissible embedded limit with
its multiplicities and point incidences, including for sequences whose invariant is zero.
Construct the controlled homotopy and local incidence comparison that §8.2 needs for these
cutdowns; their Chern classes alone do not give a local degree correspondence. Keep this
constrained refinement separate from the general raw theorem.
*Needs:* §3.2, §5.6, §6.1–§6.1c; SeibergWittenTheory SW4.5 and SW7.2.

### Examples

- For `X` Kähler with `b₂⁺ > 1` and `E = K`, the limit cycle of large-`r` solutions is a canonical
  divisor; on a minimal surface of general type with `Exc_J` empty every class is good.
- On the one-point blowup of a K3 surface, `SW⁰` vanishes on the bad label `2E_x`, and the
  canonical cycle is the exceptional sphere.

### Dependencies

Layers 0, 1, 3 and 5; SeibergWittenTheory SW4.5, SW6, SW7.2 and SW8.3; AlgebraicTopology
Layer 6; HeegaardFloer Layer 4; PseudoholomorphicCurveAnalysis Layers 4–5; AnalyticStableMaps
Layer 3; SmoothBundlesConnections Layer 6; CharacteristicClasses. Tau Ceti: the canonical-cycle
algebra and pseudoholomorphic maps. Mathlib: Hausdorff measure and Vitali covering.

## Layer 7: Banach norms, vortex insertion and finite-dimensional reduction

This layer constructs Seiberg–Witten solutions near an admissible configuration and proves that
every large-`r` constrained solution near it is one of them (Taubes, *Gr ⇒ SW* and *GR = SW*).
Its sections are in build order. §7.1–§7.6 set up the norms, the graft and the normal model;
§7.7–§7.19 extract, from any sequence of solutions, the normal cycle and confine it at the vortex
scale; §7.20–§7.28 prove the uniform finite regularity ladder and the onto inverse; §7.29–§7.35
build the profiles of finite order and the contraction; §7.36–§7.42 prove recovery, persistence and
the finite models with curvature forcing.

### 7.1 Notation and the rescaled Hilbert norms

Fix smooth reference derivatives on `iT*X` and on the bundle of normalized spinors, independent of
the unknown solution, and put `λ = √(2r)`. In this layer `N = N_prof` is the finite correction
order, `M_cov` a cutoff on covering multiplicities and `N_C` the geometric normal bundle of `C`;
`p_quad` is the quadratic exponent, distinct from the finite model parameters `p`; `R_core` is the
inner disc radius, `R_Newton` a contraction radius, `C_FS` a coupling block, `P_F^aux` an auxiliary
map and `P_F` the central projection, their common kernel `W` explicit. At fixed `r`,
`A_pre = A_pre,r`; `ε_low` is the low-`α` error, `ε_N^master` the typed profile residual and
`ε_Newton` the final contraction residual. For a connection increment `b` on `E` and a normalized
spinor increment `ζ` define the complete Hilbert norm

    ‖(b, ζ)‖_(E_(r,s))² = Σ_(j=0)^s λ^(−2j) (λ⁻² ‖∇^j b‖₂² + ‖∇^j ζ‖₂²/4),

and for triples `(f, τ, ν) ∈ iΩ⁰(X) ⊕ iΩ⁺(X) ⊕ Γ(W⁻)`, the gauge, curvature and negative-spinor
target,

    ‖(f, τ, ν)‖_(F_(r,s−1))² = Σ_(j=0)^(s−1) λ^(−2j) ‖∇^j (f, τ, ν)‖₂².

These are explicit norms on the Sobolev section spaces, equivalent to the fixed-order norms for
each finite `r`; construct the comparison maps and constants, and prove their quantitative
equivalence under changes of bundle, tube and gauge charts. The reference derivatives, finite
regularity budgets and parameter identifications are part of the data, and no power bound on a
right inverse is implicit in the definition.
*Needs:* SeibergWittenTheory SW4.1; ComplexKahlerGeometry §5.4.

**Checks.**
- In the rescaled normal coordinate `w = λy` of §4.7 a one-form `b` has plane coefficient
  `b_w = b/λ` and the normal area element is `λ⁻² d²w`, so
  `‖(b, ζ)‖_(E_(r,0))² = λ⁻² ∫ (|b_w|² + |ζ|²/4)`: the plane coefficient metric `|b|² + |δα|²/4`
  of Layer 4, up to the overall factor `λ⁻²`. Without the weight `λ⁻²` on `b` the connection would
  carry an extra factor `λ²` relative to the section.

### 7.2 The initial vortex graft

Construct an initial normalized vortex graft `Φ₀` from the quotient normal bundle and tube, the
families of vortices of all degrees (§4.4–§4.5), the canonical exterior vacuum, the clutching of
the line and cutoffs. Construct the graft and its high-order corrections for `ρ = 0`, with the
exact canonical exterior solution; global smooth curvature forcing is added later through the
explicit tolerance budget of §7.40.
*Needs:* §1.2, §4.4–§4.5, §5.1; GeometricTopology Layer 1.

### 7.3 The gauge slice and the physical section

For any reference `Φ = (a_app, χ_app)`, the initial and corrected grafts included, set
`A_app = A₀ + 2a_app` and use the imaginary infinitesimal gauge parameter `ξ ∈ iΩ⁰(X)` with
charge-one vector `d₀ξ = (−dξ, ξχ_app)` and `b ∈ iΩ¹(X)`. Let `d₀,r*` take values in `iΩ⁰(X)`, for
the real `L²` pairing on imaginary scalars and the coefficient metric `|b|² + λ²|ζ|²/4`, and
construct the local gauge slice. For the comparison with Layer 4 write `ξ = if` and `b = i b_real`
and divide the imaginary scalar and curvature outputs by `i`; prove the resulting identifications of
real rows and determinants. In each finite-model window choose one physical affine field chart,
reference gauge section and full Banach target coordinates before expanding; hold the section and
its reference gauge operator fixed in all complementary slow and fast field variables through the
recursion and the final translation of the origin. Dependence on the retained finite parameters
`p` and on `r` is permitted with proved derivative and norm bounds. A later change of gauge
reference requires an operator comparison with its residual terms. Use the section

    S_(r,ρ)(b, ζ) = (λ⁻² d₀,r*(b, ζ),
                     λ⁻² [F_(A_app+2b)⁺ − q(√r(χ_app + ζ)) − η_r − ρ],
                     (λ√r)⁻¹ D_(A_app+2b)(√r(χ_app + ζ))).

Prove that it maps the declared domain to `F_(r,s−1)`, that it is smooth, and its exact derivative,
product and norm formulas. Compare this charge-one rescaled slice with SeibergWittenTheory's slice
of determinant connections and its orientation; the target orders and scalar factors of its
gauge-fixed curvature and Dirac rows enter every determinant comparison.
*Needs:* §5.1, §7.1–§7.2; SeibergWittenTheory SW4.4 and SW7.1.

### 7.4 The full normal model

Decompose the full gauge-fixed normal model in eight real components, including the operator of
Layer 4 and its paired adjoint block. Construct the Clifford and frame intertwiners, the moving
slow normal projections `Π₊`, `Π₋` and the complementary normal inverses, and prove the
identifications of the kernel and cokernel bundles. The vortex index alone does not identify this
full operator, and these moving normal projections are not the full stabilized physical target
projections.
*Needs:* §4.3, §7.3; SpinGeometry (Clifford modules).

### 7.5 Normal-vortex coordinates and moving bundles

Construct exact nonlinear normal-vortex coordinates `(σ, f)` with `S₀(σ, 0) = 0` in the declared
physical section. Before any covering by leading zeros, use the moving fibrewise kernel, cokernel
and range bundles of `L_F(σ) = D_f S₀(σ, 0)` over the whole compact divisor window. Their smooth
bundle charts use symmetric collision coordinates; construct their metrics, domain and range
completions, orthogonal projections and the bounds of frame and gauge transitions. An early `σ`
is a section into this window, not a small perturbation of one selected section, and no fixed `W`
or central fast range is used for that early global theorem.
*Needs:* §4.5, §7.3–§7.4.

### 7.6 Local fixed-range stabilization

After the uniform ladder, the rates and the covering by leading zeros, work locally near each
selected leading section. First choose `W` transverse to the range of `L_F(σ)`, `P_F` with kernel
`W`, and prove that `A(σ) = P_F L_F(σ)` is invertible. Set `Π_σ = Id − L_F(σ) A(σ)⁻¹ P_F` and
`f₁(σ) = −A(σ)⁻¹ P_F S₁(σ, 0)`; then `L_F f₁ + S₁ = Π_σ S₁`, independently of the auxiliary fast
image when `W` is fixed. Construct the Fredholm leading section `G̃₀ = Π_σ S₁`, stabilize the range
by `DG̃₀ + I_obs O = W`, then split `W = Y_C ⊕ I_obs O` and reduce to `σ₀(p)`, `G₀`, `κ₀` and the
inverse of `D₀` on its selected complement. Prove a finite atlas of the isolating boundary and model
windows, `κ₀ ≠ 0` included. Only then choose the central `Y_F(p) = range L_F(σ₀(p))` and the
fixed-field projections `P_F`, `P_C`, `P_O`, `P^comp` with `P^comp I_obs = 0`. The lift is fixed in
the complementary fields; finite `p`- and `r`-derivatives, `DΠ_σ S₁` and `P_C (DL_F) f₁` stay in
every derivative. For a generic real-linear `D_C` construct `G̃₀` from the smooth vortex family and
the physical `S₁` in collision coordinates. The direct sum over powers of the normal line applies
only to the flat complex-linear model; an antilinear change of ordered roots is not presumed smooth
in the symmetric coefficients.
*Needs:* §7.5, §7.26–§7.27 (the ladder and the rates it is applied after).

### 7.7 Physical input and quantifiers

Apply the good-class extraction of §6.3 and §3.2's structure theorem to fix an embedded component
`C` of the admissible raw limit, its Hermitian normal line `N_C`, its induced real normal
Cauchy–Riemann operator `D_C` and a full buffered component tube. Consider all solutions of
`D_A Ψ = 0`, `F_A⁺ = q(Ψ) + F_(A₀)⁺ − irω/4 + ρ`, with `A = A₀ + 2a`, `Ψ = √r(αu₀ + β)`,
`h = (2r)^(−1/2)`, the geometric and forcing bounds of Layer 5, raw convergence to `mC` and the
declared low-`α` constraints, independently of their coefficient presentation. Fix `m ≤ M_cov`.
First construct the following geometric slicing, independently of the fields. In its normal
coordinates let `a_n` be the largest norm of a zero of `α_n`, attained on the compact core, with
`a_n → 0` and `h_n/a_n → 0`; the case of no zeros and the case `a_n = O(h_n)` have their own
conclusions. Comparison with any reference tube with the same first jet gives
`a_n / a_n^ref → 1`. Include ordinary components of multiplicity one and every size of `a_n`
relative to `√h_n`. Before using `m` as the transverse charge, prove boundary winding `m` by raw
integral clutching and vacuum on a boundary enclosing all zeros of the core. The torus application
instantiates these embedded, disjoint, good-class hypotheses explicitly before choosing its normal
line or tube; the general theorem of §6.1 has no such premise.
*Needs:* Layer 5, §3.2, §6.1–§6.3.

### 7.8 One `J`-holomorphic disc foliation and its coordinate laws

Construct `F : D_(R₀)(N_C) → X` with `F(z, 0) = z`, `dF` along `C` equal to the identification of
tangent and normal directions, and each `ξ ↦ F(z, ξ)` a `J`-holomorphic embedded disc in its
complex normal parameter. In metric exponential coordinates on `T_zX`, solve the small-disc
equation by a Cauchy–Green contraction normalized by centre and first jet, with a
rotation-equivariant radial cutoff. Prove uniqueness in the declared small Banach ball, `U(1)`
equivariance in the normal frame, smooth dependence on the compact base and the geometric
parameters with finite derivative budgets, global patching on `N_C`, and uniform embedding,
injectivity and tube bounds. Local base charts are holomorphic for `j_C`, and changes of normal
frame are `ξ′ = g(z)ξ` with smooth unitary `g`. Fix this one foliation for the coefficient
estimates. Its projection need not be `J`-holomorphic to the base: construct the induced quotient
complex structures and their small quasiregular and first-normal perturbation estimates, including
the quantitative margin between distortion and integrability at fixed `m`. The vertical kernel is
`J`-invariant, so nonvertical `J`-curves project positively; this geometry gives no Seiberg–Witten
atomicity or residual estimate by itself. Prove `Φ_a*J → J_N` in controlled `C¹` on each fixed
normal disc, for `Φ_a(z, W) = F(z, aW)`, keeping the full real normal operator. Under any smooth
reference tube with the same first jet prove the `O(|ξ|²)` comparison, rescaled `C¹` convergence to
the identity and the transport of currents and supports; coefficient `L^p` estimates are asserted
in the fixed foliation only. Consume HeegaardFloer §4.6e's local `J`-disc theorem with prescribed
centre and first jet (McDuff–Salamon E.6.2 there); the radial solver here constructs the
`U(1)`-equivariant compact-family choice and its global patching. For individual holomorphic
branches of degree `m` keep the margin `p_m(1 − 1/m) = 2 − 2/m² < 2`, and whenever a quasiregular
distortion `K` multiplies this exponent prove `K p_m(1 − 1/m) < 2`; for `m = 1` use the nonsingular
branch estimate. These branch bounds and the margin in symmetric coordinates of §7.13 are distinct
inputs.
*Needs:* §7.7; HeegaardFloer §4.6e; PseudoholomorphicCurveAnalysis §3.1 (the Hölder Cauchy–Green
operator); HopfRinow Layers 1–2 (the exponential map and its domains).

**Checks.**
- With `p_m = 2 + 2/m`, `p_m(1 − 1/m) = (2m + 2)(m − 1)/m² = 2 − 2/m²`, below `2` for every
  `m ≥ 1`; at `m = 1` it is `0`, the nonsingular case.

### 7.9 The localized current, slice bounds and mass

Put `s = |α|²`, `τ = Im(ᾱ ∇_a α)/s` and `∇_a = d + iA_E`. Fix a smooth nondecreasing `χ` with
`χ = 0` on `s ≤ 1/4` and `χ = 1` on `s ≥ 1/2`, extend `χτ` by zero, and put `Θ = iF_a + d(χτ)` and
`T_(h,a) = (2π)⁻¹ Φ_a*Θ`. Prove `dΘ = 0`, `supp Θ ⊂ {s ≤ 1/2}` and transverse `Θ`-flux `m`. From
the projected Dirac block and `|∇β| ≤ C` derive `|∂̄_a α| ≤ C`, and from the refined curvature
bounds `Θ(v, Jv) ≥ −C` for unit `v`. Thus each `J`-holomorphic slice of area `O(a²)`, with full
support inside its boundary, carries a normalized signed measure `μ_z` of mass `m` and negative
mass `O(a²)`. Use the localization with `θ = 1/√2` (§5.6) to put the whole support in
`|W| ≤ 1 + K h/a + O(a)`, and bound its moments by the total variation `m + O(a²)`. The exact
`Θ`-flux is distinct from the `iF_a`-flux, whose boundary primitive stays in its identity.
*Needs:* §5.3, §5.6, §5.8, §7.8.

### 7.10 The cone defect and mass absorption

Construct the four-dimensional type and mass estimate from the projected equations, with every
dilation, cutoff and covering factor. With an internal base-freezing scale `σ = √a` in fixed
geometric units, account for the `O(a) + O(σ)` errors of replacing `J_a` by `J_N` and by frozen
coefficients, and for the core terms `(h/a)² + h/a`. Prove a cone-defect estimate
`D_(J_N)(T_(h,a)) ≤ C[(h/a)² + h/a] + C(a + σ) Mass(T_(h,a))` with the declared local-to-global
covering constants; any altered bound the derivation needs must still tend to zero after mass
absorption, in every regime. Here `D` is the integrated distance from the cone of positive
`J_N`-`(1,1)` forms in a fixed rescaled metric. Construct `Ω = Kπ*ω_C + dλ` taming `J_N` on a
larger fixed disc bundle; closedness and full compact support give `T_(h,a)(Ω) = Km area(C)`.
Prove mass control by that pairing and the cone defect, then absorb the small geometric mass term.
The positive closed weak limits follow; the cone-defect and mass-absorption estimates are distinct
outputs, and integer charges, support retention and local Hausdorff measure are constructed
independently below.
*Needs:* §7.8–§7.9.

### 7.11 Moments and Newton coefficients

In a normal frame set `M_k(z) = ∫ W^k dμ_z`, `Q_ℓ(z) = ∫ W^ℓ W̄ dμ_z` and `M₀ = m`; they are smooth
for each finite field because `Θ` is smooth and supported inside the common disc. Define `b₀ = 1`
and `j b_j = Σ_(k=1)^j (−1)^(k−1) b_(j−k) M_k` for `1 ≤ j ≤ m`, sections of `N_C^j`, and
`P_z(W) = W^m − b₁W^(m−1) + ⋯ + (−1)^m b_m` with root multiset `R_z`. Bound `b_j` and `R_z` from
the slice variation bound before interpreting them as the core. The physical moments and
coefficients are exactly `a^k M_k` and `c_j = a^j b_j`. Prove `dM_k = π_*(kW^(k−1) dW ∧ T)`, with no
fibre-boundary term. In coordinates where `D_C = ∂̄ + νW + μW̄`, set
`E_k = ∂̄M_k + kνM_k + kμQ_(k−1)` and construct its expression from the projected equations,
including the geometric and slice-motion terms.
*Needs:* §7.9; Mathlib `MvPolynomial.psum`, `MvPolynomial.esymm`,
`MvPolynomial.mul_esymm_eq_sum` (Newton's identities).

**Checks.**
- For `μ_z` the counting measure of the roots `V₁, …, V_m`, `M_k` is the power sum and the
  recursion gives the elementary symmetric functions, so `P_z(W) = Π (W − V_i)`; for `m = 2`,
  `b₁ = V₁ + V₂` and `2b₂ = b₁M₁ − M₂ = 2V₁V₂`. The recursion without the factor `j` would give
  `b₂ = 2V₁V₂`.

### 7.12 Finite-charge quantization and mixed moments

Construct from the coupled equations a jointly vanishing function `ε_m^at(a, h/a)` bounding
`sup_z ∫ |P_z(W)|² dμ_z⁺`, with negative slice mass already `O(a²)`, uniformly over the early
families. Derive it through finite-charge weighted and argument-principle identities and local
core and vacuum estimates for the Seiberg–Witten fields, including collisions, branching and every
intermediate separation scale; the magnetic connection, the current cutoff and the slice-motion
terms are part of the construction, and no abstract sup-norm inverse is an input. Prove the compact
moment lemma: bounded signed measures of mass `m`, with vanishing negative mass and vanishing
variance of the Newton polynomial, converge uniformly in bounded-Lipschitz distance to the counting
measure of `R_z`, with a compactness modulus depending only on `m` and the support bound and no
numerical rate. Deduce that the mixed-moment errors `Q_ℓ − Σ_(V∈R_z) V^ℓ V̄` tend uniformly to zero
for `0 ≤ ℓ < m`. This is a quantization output of the equations, not an inference from the total
integral flux. Keep the uniform variance and total-variation conclusion in every regime
`a → 0`, `h/a → 0`. An averaged `O(h)` bound on the negative mass, or the removal of exceptional
fibres, does not replace the uniform coefficient and root bounds, the nonlinear mixed products, the
`L^(p_m)` residuals, the support dictionary, the retention of marked and maximal points or the
parameter laws.
*Needs:* §7.9–§7.11.

### 7.13 The weighted symmetric supercritical estimate

Put `p_m = 2 + 2/m`. On fixed buffered base charts construct the estimates

    A_j = Σ_(k=1)^j (−1)^(k−1) b_(j−k) E_k / k,
    ‖A_j‖_(L^(p_m)) ≤ ε_m^SW(a, h/a),    ε_m^SW → 0,
    ∂̄ b_j = −j ν b_j − μ Σ_(V∈R_z) V̄ e_(j−1)(R_z omit V) + R_j,
    ‖R_j‖_(L^(p_m)) ≤ ε_m(a, h/a) → 0,    ‖R_j^physical‖ ≤ a^j ε_m.

The last equation follows from the exact Newton derivative and the mixed-moment estimate; the first
is a coupled estimate to construct, including weighted steep-region terms and distributions across
collisions, by the projected identities, the covariant cancellation of current moments and the
finite-charge core analysis, with all derivative budgets and errors declared. A small unweighted
`L¹` type error gives no `L^(p_m)` estimate by itself. The exponent has margin
`p_m(1 − 2/k) < 2` for `k ≤ m` and Morrey exponent `1 − 2/p_m = 1/(m + 1)`. Compute the
first-normal, quasiregular and higher-coordinate terms in the fixed disc foliation and prove that
this margin controls their weighted contribution; integrability of branches alone is not the
estimate. The frame laws `b_j′ = g^j b_j`, `ν′ = ν − g⁻¹∂̄g`, `μ′ = (g/ḡ)μ` give the exact
transformed equation and the comparison of norms on compact bases. Declare and verify the
additional coefficient order `ℓ_F1(m, s)` these estimates need. Set the early threshold
`ℓ_F = max(2s + 6, max_(1≤m≤M_cov) ℓ_F1(m, s))` and prove every early estimate for every integer
`ℓ ≥ ℓ_F`, with compatible nested `C^ℓ` norms. After §7.34 fixes the finite profile order and its
residual derivative demands, choose a common finite coefficient order meeting them and `ℓ_F`; the
jets of grafts and profiles at `ρ = 0` feed only the later recovery. `W^(1,p_m)` bounds give the
endpoint Morrey exponent `1/(m + 1)`; every smaller exponent gives compact embedding.
*Needs:* §7.8, §7.11–§7.12.

**Checks.**
- `1 − 2/p_m = 1 − 2m/(2m + 2) = 1/(m + 1)`, and for `k ≤ m`,
  `p_m(1 − 2/k) ≤ p_m(1 − 2/m) = 2 − 2/m − 4/m² < 2`.

### 7.14 Four-dimensional support and retention

Construct, independently of convergence of mass or atomicity and of confinement, a jointly
vanishing `ε_m^supp(a, h/a)` such that the rescaled zero set of `α` and the root graph
`{(z, V) : P_z(V) = 0}` are within two-sided distance `ε_m^supp` on the whole compact tube, in its
fixed four-dimensional metric. Base points may move; this is not a same-fibre dictionary at scale
`Kh`. Prove that no root is missed and no ghost core occurs, attached excursions included, by
local charge and core bounds and the weighted analysis above, with no gap of the normal cover and
no inverse correspondence. Bound all `b_j` and apply scalar `∂̄` estimates for `W^(1,p_m)`
compactness and uniform convergence of the coefficients on a finite cover. Continuity of monic
roots and the support estimate give two-sided convergence to a finite closed multigraph `Z`. Keep
every marked and maximal zero and its limiting base point: a low-`α` marked point gives a zero
within physical distance `Kh`, which is `O(h/a) → 0` after dilation, and a maximal zero keeps
normal modulus one. Comparison with a reference tube transfers these support and current
conclusions geometrically, without asserting re-sliced coefficient `L^p` regularity.
*Needs:* §5.6, §7.11–§7.13.

### 7.15 Local positive charges and curve reconstruction

Apply the framed-charge lemma of §6.1a to the anisotropic family once the four-dimensional support,
vacuum and normalized mass bounds supply its disc and collar hypotheses. Keep relative Euler
integrality on arbitrary discs and all five laws for continuous discs, including zero off `Z`,
multiplication by signed proper degree and empty additivity. Derive the coefficient equation from
the Newton identities, then construct a `J_N`-holomorphic root multigraph and its normalization
across collisions, with branch multiplicities. Separately identify every local charge of the
fields with the oriented local intersection number, ramification and boundary framing included,
before using HeegaardFloer §4.6e's positivity of intersections; construct these comparisons
independently of the reconstruction. Let `ν_norm` be the mass measure, in a fixed smooth metric on
`N_C`, of the positive normalized weak current; keep its Radon property and the normalized
compact-set mass bounds. For every compact `K` choose a compact neighbourhood `K′` and constants
`c_K, ρ_K > 0`, and prove `ν_norm(B_ρ(x)) ≥ c_K ρ²` for every `x ∈ Z ∩ K` and `0 < ρ < ρ_K`, with
balls in `K′`, directly from the fields; this density is an independent normalized estimate, not
transferred from the physical density through a degenerating dilation. The `5r` covering argument
with this single measure gives locally finite Hausdorff measure. Apply the reconstruction theorem
of §6.1 on `(N_C, J_N, Ω, Z)` and identify its normalized current through all local integer charges.
Prove compact primitive closed normalizations, total projection degree `m`, no flux lost at fibre
infinity or at artificial base boundaries, and no compact nonconstant vertical component.
*Needs:* §6.1–§6.1a, §7.10, §7.14; HeegaardFloer §4.6e.

### 7.16 The original curvature from a modulus potential

With `d^c_J f = −(1/2) df ∘ J`, `H(1) = 0` and `H′(s) = χ(s)/s`, constant where `χ = 0`, prove the
identity `χτ = d^c_J H(s) + E`, `E = 2χ(s) Re(α⁻¹ ∂̄_a α) ∘ J`. Projecting
`∇(αu₀) = (∇_a α)u₀ + α∇u₀`, with the `β` term kept, bounds `‖∇_a α‖₂` by the energy of the
normalized spinor, and Layer 5 gives `‖H(s)‖₁ ≤ Ch²` and `‖E‖₂ ≤ Ch`. Uniform `C¹` dilated geometry
and tube volume `O(a²)` give, for every compactly supported smooth two-form `ζ`,

    |∫ Φ_a*(χτ) ∧ dζ| ≤ C[(h/a)² ‖ζ‖_(C²) + (h/a) ‖ζ‖_(C¹)].

Use `∫ dB ∧ ζ = ∫ B ∧ dζ` to identify the weak limits of `T_(h,a)` and of `(2π)⁻¹ Φ_a* iF_a`, the
current of the original curvature of `E`; this comparison in `C⁻²` holds in every regime
`a → 0`, `h/a → 0`. Keep `iF_a = i(F_A − F_(A₀))/2` and the independent integral clutching
comparison `E ≃ O(Σ mC)` of §6.1c, torsion included. No anisotropic total-variation claim and no
substitution of the determinant current is made. The identification is exported as a current
statement; confinement uses the reconstructed normal cycle and its support, not this comparison.
*Needs:* §5.9, §6.1c, §7.9.

### 7.17 Uniformity and the later plane projection

Prove each of §7.7–§7.16 for all constrained fields and all early coefficient choices from their
field bounds, on compact families of geometry, incidence and gap-preserving data with finite
derivative budgets; derivatives of the coefficient presentation enter only with their proved cost.
The plane estimates of Layer 4 for all degrees and clusters remain available in their separated and
wall regimes. Their field projection is used only later, on a compact divisor window at scale `h`,
after confinement and tangential and trace control (§7.23); it is not an input before confinement.
The ordinary marked degree-one branch and the covered-torus branch below use the constructed
normal cycle. Confinement at a fixed `J` and the enlarged models for degenerate covers on walls
(§7.36) are separate.
*Needs:* §7.7–§7.16.

### 7.18 Covered tori: the torus branch

For an embedded repeated square-zero torus orthogonal to `κ`, supplied by §6.3 and §3.2, the total
normal projection degree equals its multiplicity after the no-loss theorem of §7.15. Each
nonvertical primitive component has square and `c₁` pairing zero, and singular adjunction with
Riemann–Hurwitz forces an embedded unramified cover of the torus. Its nonzero normal section
contradicts the finite-cover gap of §1.3. Exclude compact vertical components explicitly: a
connected compact holomorphic normalization in a fibre `ℂ` has constant coordinate by the maximum
principle. This is the torus branch only. Use the singular adjunction of HeegaardFloer §4.6e, for
open real four-manifolds, on compact normalized curves in `N_C`, with the compact intersection and
normal Euler class adapter; no closedness of the normal bundle is imposed.
*Needs:* §1.3, §3.2, §6.3, §7.15; HeegaardFloer §4.6e.

### 7.19 Ordinary components: the graph branch

For an ordinary component of multiplicity one the normal multicycle has total projection degree
one. Positive degrees and the absence of compact vertical components leave one primitive component
of multiplicity one. Prove that its degree-one holomorphic projection is a biholomorphism and
identify its graph with a nonzero section `v` with `D_C v = 0`. Carry every assigned point through
the extraction: the zero `y_(j,n)` within `Kh_n` of `x_j` has normal coordinate `o(a_n)`, so
`v(x_j) = 0`. The allocation `k_C = d(C)/2` makes `D_C ⊕ ev_(x_j)` an onto index-zero
normal-incidence operator by §1.3, so its kernel is zero. Exceptional spheres use
PseudoholomorphicCurveAnalysis §7.2's zero count and vanishing theorem for line bundles of degree
`−1` and index `0`; other unmarked ordinary components of index zero use admissibility. Thus the
ordinary graph is impossible too, with no square-zero, torus or Riemann–Hurwitz assumption. Prove
the marked degree-one extraction and the comparison of graph and trace, not only weak current
incidence. Together the two branches give `|n| ≤ Kh` and compact divisor windows for every
configuration at a fixed `J` and every early coefficient in `A_pre`, with the finite label
partitions kept. Uniformity is on compact families preserving incidence and the cover gap; walls
crossing degeneracies have their separate enlarged models.
*Needs:* §1.3, §3.2, §7.15; PseudoholomorphicCurveAnalysis §7.2.

### 7.20 The coarse recovery spaces

Set `h = λ⁻¹` and `j₀ = 6`. For each required finite derivative order use `j ≥ max(j₀, s − 1)` and
normalize the physical increment as `v = (hb, ζ/2)` in fixed tube and unitary frames. On the fixed
inner disc bundle `|w| ≤ 2R`, `w = n/h`, with `R > 2K + 4`, use the unweighted mixed norm
`Σ_(a+b≤j) ‖∇_C^a ∂_w^b v‖²` with density `dvol_C dw` and physical density `h² J_h dvol_C dw`; the
strong domain adds one graph derivative `(∂_w, h∇_C)` and the target has the `j`-th mixed norm. On
the exterior subtract the canonical vacuum reference field in its clutched bundle. Choose
bounded-overlap charts on `h`-balls and cutoffs with `|(h∇)^a η|` bounded, and use the supremum of
their local `j`-th semiclassical `L²` norms with normalized density `h⁻⁴ dvol_X`, together with mixed
unscaled horizontal derivatives in a fixed tube and the ordinary unscaled `H^j` norm away from the
tube, adding one `h∇` graph derivative in the domain. Keep the global `E_(r,j+1)` and `F_(r,j)`
components in domain and target, so that the supremum does not discard total mass. Define the
patched spaces as completions with matching cutoffs, frames, covariant derivatives and global
fields, and prove cutoff and gauge equivalence, multiplication, trace and evaluation and
norm-transfer estimates at the declared finite budgets, with commutator losses and losses from high
`σ`-derivatives. The unweighted exterior allows small nonlocalized bulk corrections, and no
exponential decay of a bulk field is built into membership. For the initial graph use the low
uniformly local semiclassical version at `j₀ = 6`, with every horizontal `∇_C` replaced by `h∇_C`;
call these `X_low` and `Y_low`, and prove their gauge, cutoff and model comparisons from the
rescaled equations. Higher unscaled restrictions `X_j`, `Y_j` are outputs of the ladder, not
hypotheses on raw fields. The same mixed completion formulas define `X_ℓ`, `Y_ℓ` and their low
semiclassical versions for every integer `ℓ ≥ 0`, so the base estimate of §7.26 is well typed. The
working nonlinear and trace level stays `j ≥ 6`; no `H⁰` algebra or `C⁰` embedding is assumed, and
the microscopic `C⁰` controls come from the separate low theorem at `j₀ = 6`.
*Needs:* §7.1, §7.3, §7.19.

### 7.21 Finite requirement templates

For each requested working level `j ≥ 6`, parameter order `v` and jet order two, construct finite
requirement templates of regularity and loss for the physical section, the vortex and moving-bundle
charts, the principal normal and three-band parametrices, the level-zero range and commutator
induction, the nonlinear projected estimates, traces, the local fixed-`W` stabilization and the
parameter implicit function theorem. A template specifies orders of input and output words,
coefficient regularity, finite geometry derivatives and possible slots of `h`-loss; derive it by
formal differentiation and the intended estimate structure, without assuming the estimate or a
higher uniform bound on the solution. Products enumerate Leibniz partitions, compositions Faà di
Bruno partitions; derivatives of inverses use `−A⁻¹(DA)A⁻¹`, and changes of target keep `(DT)S`.
Separate the highest unknown derivatives, absorbed on the left, from lower controlled inputs. Prove
that this finite dependency expansion terminates and take its maxima to define integers
`J_an(j, v)` and `G_an(j, v)`; no cap is guessed. A template supplies the order to request; it is
not the inverse, range theorem or estimate being proved.
*Needs:* §7.20.

### 7.22 Raw-to-vortex low control and the classification of confined limits

At points of the confined tubes rescale both base and normal variables by `h` in physical unitary
frames and the fixed field normalization, with charge-one gauges and the pullback of the reference
connection. Derive the full eight-real-component flat limiting curvature and Dirac equations from
the physical section, including its gauge row and the normalization in which the transverse
equation is `∂̄_a α = 0`, `*iF_a = (1 − |α|²)/8`. In the unit flat metric `h²r = 1/2` gives
`D_a^flat χ = 0` and `2F_a⁺ = ½ q_flat(χ) − iω_flat/8` with the reference gauge equation, where
`q_flat` is the quadratic map of Layer 0 on the normalized flat spinor, so that
`q_flat(α, 0) = i|α|²ω_flat/4`. Verify every pullback factor and the Kähler and Clifford
intertwiners. Specify the extracted class by uniform field and curvature bounds and all local
derivative bounds at the chosen orders, uniformly bounded transverse charge and energy on each base
slice, quantitative transverse confinement of the zero divisor, transverse vacuum, tail and growth
bounds, and the horizontal energy and positivity-defect estimates; prove these from Layer 5 and
the anisotropic extraction for all fields of the early coefficient family. They do not follow from
local finite energy alone.

Prove compactness in charge-one gauges, identify the pointed limiting equations on
`ℂ_base × ℂ_normal`, and classify the limits of exactly this class. The `β` estimate of Layer 5
makes the limiting `β` vanish; derive `F_a^(0,2) = 0` and `∂̄_a α = 0` from the flat equations,
with any further vanishing justified by its Kähler and Weitzenböck cutoff and boundary estimates.
The limiting zero divisor is holomorphic with bounded transverse degree and confined normal support,
so its symmetric coefficients are bounded entire functions of the base and hence constant. Prove
that the scalar and gauge normalization and the transverse vacuum conditions identify the whole
solution, not only its divisor, with a base-independent framed degree-`m` plane vortex: construct
the ratio of log-moduli across equal divisor zeros, prove its boundedness and transverse vacuum
normalization, and apply the elliptic maximum and cutoff argument on `ℂ²` to the difference
equation, with every boundary and growth step. Neither a slab zero set nor bounded rescaled
derivatives alone gives translation invariance. Convert local compactness and this classification
into convergence in the patched low semiclassical norms, with `h∇_C σ → 0` and transverse error
`f → 0`, keeping exterior matching, global mass and gauge transitions; the microscopic `C⁰`
smallness comes from this low theorem at `j₀ = 6`. No bound on `f/h` and no higher unscaled bound
on `σ` is an input.
*Needs:* §4.4, §4.7, §5.2, §7.14, §7.19–§7.20.

**Checks.**
- With `h = (2r)^(−1/2)`, `h²r = 1/2`, and the transverse curvature coefficient `r/4` of §4.7
  becomes `h²r/4 = 1/8` after rescaling both variables by `h`, matching the plane equation.

### 7.23 The fibre trace and the field projection

After the classification construct the fibre trace and exterior extension estimates at the required
higher finite orders, and use the compact-window slice and tubular theorem of Layer 4 to obtain a
smooth `H³/G₄` field projection and divisor coordinates. Prove that its domain contains the
low-controlled restrictions with the stated tangential and trace bounds before applying it.
Constants and radius depend on the compact divisor window; construct all gauge, frame and parameter
laws there. This projection supplies the moving vortex coordinates of the following sections;
Layer 4's estimates for all degrees and clusters and for enlarged walls keep their own hypotheses.
*Needs:* §4.4–§4.5, §7.22.

### 7.24 The early compressed fast block

Construct the early compressed fast block on the moving range, kernel and cokernel bundles, with
their symmetric collision charts and the low-controlled field domain. Prove the level-zero onto and
range statements and the inverse identities on the selected fast complement, then the full
semiclassical commutator induction through every level `0, …, j₀ = 6` and every further selected
finite level. An `H⁶` inverse does not imply an `H⁰` inverse, and `H⁰` is not an algebra. Prove
compressed coercivity and adjoint and range control, with normal, exterior and gauge matching; full
paired ellipticity alone does not imply invertibility of the compression. Track `DΠ(σ) h∇σ` and
all bundle, target and frame transition terms. Construct the low exact fast graph with its moving
target coordinates and norm bounds, before higher unscaled derivatives or `f = O(h)`. Its merely
low-controlled derivative is not yet a uniformly bounded normalized slow inverse.
*Needs:* §7.5, §7.20–§7.23.

### 7.25 The principal slow family and the nonlinear base estimate

Freeze the normal vortex at each divisor value with `f = 0` and compute the full paired normal and
tangential family at `η = hξ` on its moving bundles. Construct the principal normalized slow Schur
family from those frozen blocks, its compressed inverse, range and adjoint and its intrinsic target
charts, independently of the derivative of the exact fast graph. Prove absorption with lower norms
in the low band `|ξ| ≤ c/h`, coercivity with range and adjoint bounds on the compact annulus
`c ≤ h|ξ| ≤ C₀`, and Clifford coercivity in the high band `h|ξ| ≥ C₀`, with every commutator of
projections, frames, gauges and cutoffs. Estimates at the ends do not supply the middle band or a
compressed inverse.

For the nonlinear normalized equation use `h⁻¹ Π(σ) S_h(σ, f)` in the moving cokernel bundle. There
`Π(σ) L_F(σ) f = 0` removes the leading linear fast term before differentiating; keep `Q_σ(f)/h`,
the horizontal and gauge terms and every derivative of `Π` and of the target connection, and derive
the cancellations and tame remainders from that equation and the principal family. Differentiating
the exact graph too early produces `Π(DL_F)f/h`, and a bound depending on `‖f‖/h` is not the uniform
base estimate that proves it. Keep the complete physical section and the `(DT)S` terms, also at
nonzero retained obstruction; `h∇_C` is of order one on the low domain. After the uniform nonlinear
ladder and the rates `f = O(h)`, `f − hf₁ = O(h²)` (§7.26), differentiate the moving-bundle fast
graph, keeping every projection derivative and the terms `Π(DL_F)f/h`, and prove the exact-graph
normalized linear and adjoint a priori estimates with bounded coefficients and lower norms. The
exact-graph family is thus an output of the rates. Its local fixed-`W` expression is
`T_h = h⁻¹(D_h − C_FS,h A_h⁻¹ B_h)`, with all range-coordinate derivatives.
*Needs:* §7.5, §7.24.

### 7.26 The uniform finite regularity ladder and the rates

Define the input class of the ladder before any parameter extension: abstract low-controlled ambient
fields with `S_h(σ, f) = I_obs κ`, or its explicitly bounded normalized source version, with bounded
`h⁻¹` source, retained coefficients, compact divisor image and the microscopic smallness of §7.22;
the existence of the later coarse extension is not an input. For every selected finite `ℓ` derive,
from the nonlinear projected equation, the principal family and the fast equation, a tame estimate
for `A_ℓ = ‖σ‖_(H^(ℓ+1)) + h⁻¹ ‖f‖_(X_ℓ)` with proved lower-level terms and a small `δ_ℓ A_ℓ`. Any lift
of a source or obstruction is stated in the moving bundle charts, not in the later global fixed-`W`
identification. The base `ℓ = 0` has no earlier `A`: prove
`A₀ ≤ K₀(1 + ‖σ‖₂ + ‖h⁻¹ S_h‖_(Y₀)) + δ₀ A₀` with `δ₀ ≤ 1/2`, from the low-control smallness and the
bounded `L²` norm of the divisor, so that `h⁻¹f` is an output. The absorptions
`‖f²/h‖ ≤ ‖f‖_∞ ‖f/h‖` and `‖h(∇σ)²‖ ≤ ‖h∇σ‖_∞ ‖∇σ‖` are representative; prove every physical,
projection and exterior term and all higher tame commutators. No higher unscaled norm and no
bootstrap constant growing in `h` may destroy a rate. Induct through the finite orders computed from
the templates of §7.21. Then prove the higher unscaled restrictions of the fast inverse and graph:
in the moving fast complement define `f₁^mov` by its compressed leading equation and prove
`f = O(h)` and `f − h f₁^mov(σ) = O(h²)` at working level `j`, keeping `h∇f₁^mov` and the required
`H^(j+2)` control of `σ`. After the local fixed-`W` coordinates of §7.6 are chosen, prove the transport
of bundle and field coordinates to their `f₁`, including the induced shift of the slow coordinate
and all parameter and target residual derivatives, and only then use the rates in that chart.
Neither conclusion follows from Taylor expansion at fixed frequency.
*Needs:* §7.21–§7.25.

### 7.27 Leading zeros and the onto inverse

Only after the rates, prove the normalized leading equation and the compact covering of leading
zeros. Use the independent all-frequency a priori estimate and the comparison of the limiting
kernel and cokernel of `D₀` to prove that the stabilized normalized slow family is Fredholm of
index zero and uniformly invertible on the selected complement; prove the principal and range
homotopy and the finite exact-sequence index count, or the adjoint and range surjectivity argument,
since a stability inequality alone is insufficient. Obtain both inverse identities and the parameter
implicit function theorem over open ambient neighbourhoods of the retained `p`, keeping `κ₀`. Jet
derivatives in the parameters belong to this smooth coarse extension, not to an arbitrary
parametrization of its possibly singular finite-obstruction zeros. Recover `σ₁`, `f₂` and all
required remainders after the finite ladder and the extension, separately from the formal profile
construction; no fine Newton uniqueness, selected `N_prof`, tolerance or regular count is an input.
*Needs:* §7.6, §7.25–§7.26; Mathlib `ContinuousLinearMap.IsFredholm`.

### 7.28 The verified ledger at the selected orders

At the selected orders prove the primitive compressed range and inverse, the three-band, nonlinear
ladder, exact-graph and stabilized inverse and implicit-function estimates, then verify that their
coefficient demands and `h`-losses satisfy the templates. Include the first derivative of `f₁`, the
second in its fast residual, the third in the next slow remainder and all trace, parameter and
commutator costs. Only this verified ledger gives the uniform exponents `q`, `p_quad`, `a`, `π`,
`b`, independent of the profile order `N_prof`; finite-`N` coefficients affect constants and
thresholds, not these fixed losses. The template inequalities are algebraic consequences of their
inputs; each analytic estimate is proved at its named step.
*Needs:* §7.21, §7.24–§7.27.

### 7.29 The fine normalized structured class

Predefine the fine normalized class by bounding `h⁻¹(σ − σ₀)` and `h⁻²(f − hf₁(σ))` in the
unweighted coarse low-order spaces, with parameter derivatives. Compute the formal `σ₁` and `f₂`
jets from the leading inverses and choose a fixed margin `M` above both their derivatives and the
proved jet bounds of the roots, before any truncation order `N`. Higher `h³` terms shrink after the
normalization by `h⁻²`, while `f₂` does not. Prove the fine structural Schur bounds on this class,
with all transfers from the coarse spaces and the full eight-real joint tangential and normal
symbol. Normal exponential estimates are outputs only for the localized plane profiles for which
they are proved; the global class and the canonical exterior correction are unweighted. A slow
channel `hD_C` can have inverse growth `h⁻¹`; the fine loss does not replace the uniform basic slow
estimate.
*Needs:* §4.6, §7.27–§7.28.

### 7.30 Finite corrections by slow-first recursion

Construct finite corrections at `ρ = 0` by a closed slow-first recursion in the coordinates of the
exact nonlinear family and the fixed target splitting. Taylor-expand the same physical section,
tube, frame and connection, gauges and model identifications in `n = hw`. At leading order solve the
fixed fast graph equation for `f₁`, solve the leading complementary model and keep `κ₀`. At each
order `j ≥ 2` solve the effective slow complementary equation of order `h^j` by `h^(j−1) σ_(j−1)`;
substitute the changed `σ` into the exact vortex family, into `hf₁(σ)` and into every lower fast
profile; then recompute the entire fast coefficient of order `h^j`, including the curvature of the
family and the tangential and projection terms, before cancelling it with `h^j f_j`. In the fixed
splitting `P_C L_F(σ) = O(h)`, from its central zero value and `σ − σ₀ = O(h)`, so this last fast
correction enters the slow complement only at order `h^(j+1)`; this is not the moving identity
`Π₋ L_F = 0`. At `j = 2` include the second derivative of the exact family, or its explicit affine
compensation, and compute the finite budget of the `σ₁/f₂` class. Update all retained finite
obstruction coefficients, and include the intrinsic torsion, the background curvature, the second
fundamental form, cutoff and gauge changes and every required spatial and parameter derivative.
*Needs:* §7.6, §7.27, §7.29.

### 7.31 The raw residual of a finite profile

For each prescribed finite order `N`, cancel the complementary coefficients through `N − 1` and
define `R_N^raw = S_(r,0)(Φ_N) − I_obs(p) κ_N` with `P^comp I_obs = 0`. Prove localized inner
coefficient and derivative estimates and a separate global unweighted exterior remainder, with the
cutoff radii and logarithms. Normal volume `h²` gives a gain of `h` only in physical `L²`, not in the
normalized coarse norms. Derive the raw high-order physical bound and its conversion to
`Y_(J_an)`, and the fine projection bound with its own `π_proj`; do not infer from the inner volume
that all coarse remainders are `O(h^(N+1))`. Prove `ε_N^master ≤ K_N h^(N+1−π)`, with `π` including
every loss from raw to master norm and projection, or use its norm function; uniform boundedness of
`P^comp` alone does not give `π = 0`. Differentiate the same physical section and fixed-field lift,
keeping the finite obstruction equations, the frame, permutation, gauge and clutching naturality and
`D(TS) = T(DS)Dχ + (DT)S` at `κ₀ ≠ 0`. Prove the operator and overlap estimates in compatible charts,
not only agreement of zero sets.
*Needs:* §7.30.

### 7.32 The derivative ledger of the profiles

For `N`, Sobolev order `s` and parameter order `v`, allocate a finite derivative ledger
`b_N(s, v)` from the coefficient Taylor jets, the first-order section, the unscaled tangential and
parameter derivatives and the differentiated identities for inverses and projections. Require
controlled geometry and families through that order, in addition to the forward budget, and record
the budget of the later smooth forcing separately. The allocation is a finite formula in the
coefficient and geometry orders and does not yet assert that the profiles satisfy it. For each
prescribed `N` construct the profiles, verify their ledger and prove their inverse, projected
nonlinear Lipschitz, chart radius and projector bounds on the pinned class. The formal recursion
uses the leading normal fast and slow inverses, not the full fine Schur theorem as an algorithmic
input. After the profiles and their compatible inverse and projection families are constructed,
prove their differentiated estimates through `b_N(s, v)`, with the declared constants, cutoff losses
and compact-window uniformity, differentiating identities at fixed `p` as full `p`-dependent
identities, the central model `σ₀(p)`, projections, lifts and gauge references included.
*Needs:* §7.30–§7.31.

### 7.33 Recovery stability and the master residual

Before the joint selection, prove recovery stability on a bounded normalized coarse comparison
neighbourhood: in each leading atlas window require a common bound on `σ` and `f/h` through the
selected orders, bounded normalized sources and retained coefficients, and explicit chart buffers.
The neighbourhood contains the roots by the ladder and the rates, every finite-`N` profile after its
own threshold `h_N`, and the chart and gauge segments used for comparison; prove the estimate on all
of it and on its ambient lift in finite `p`, not only at roots. The recovery loss `b` is independent
of `N`, and larger profile constants only shrink `h_N`. Where a straight segment leaves the domain,
construct buffered paths and overlap comparisons with the same bounds. Type
`R_N^raw = S_(r,0)(Φ_N) − I_obs κ_N`, `ε_N^coarse = ‖R_N^raw‖_(Y_(J_an))` and
`ε_N^fine = ‖P^comp R_N^raw‖_(F_(r,s−1))`, and use `ε_N^master = max(ε_N^coarse, ε_N^fine)` or a proved
equivalent patched norm; prove the embeddings and the projection and source transfers, since the
fine projected norm alone controls neither raw higher derivatives nor the removed obstruction. On
the comparison neighbourhood derive `E`-distance at most `K_rec,N ε_N^master`, with
`K_G = h⁻¹(K_PC + K_CF K_F K_PF)` and `K_rec = T_E[(1 + K_graph) C_S K_G + K_F K_PF]`, enlarged for
the charts and gauges, where `K_PF` and `K_PC` have domain `Y_(J_an)`. These coarse estimates, not the
fine inverse, determine the recovery loss.
*Needs:* §7.26–§7.27, §7.31–§7.32.

### 7.34 Exponent conditions and the joint witness

If `C_r ≤ K h^(−q)`, `L_r^quad ≤ K h^(−p_quad)`, `δ_r ≥ k h^a`, `ε_N^master ≤ K_N h^(N+1−π)` and
`K_rec ≤ K h^(−b)`, with `π` the total loss from raw to master, require `N + 1 > 2q + p_quad + π`,
`N + 1 > q + a + π` and `N + 1 − π − b > max(a, q + p_quad)`. The fine baseline residual is at most
`ε_N^master` by definition, and `π` is not merely the projector exponent `π_proj`; keep the higher
derivative and norm-transfer losses in the master bound or use the norm functions. Prove a joint
finite witness: `N`, its finite allocation of derivatives and geometry, and a common large-`r`
threshold meeting both the contraction conditions and `K_rec,N ε_N < γ_r` for the same constructed
data, uniformly for every solution and every `a ∈ A_pre`. Neither separate limits nor increasing `N`
against an unspecified `N`-dependent `γ` proves this witness, and only then is the selected profile
used, with its fine inverse, in the baseline contraction and the recovery. In the polynomial route
prove that `q`, `p_quad`, `a`, `π` and `b` depend only on the fixed finite analysis orders, the coarse
pinned class and the finite geometry, not on `N_prof`; choose `N` above the three inequalities, then
shrink `h` after all its finite constants and budgets. If a higher residual norm forces an
`N`-dependent `b`, prove its growth and a joint witness instead; the alternative route through norm
functions must also prove existence.
*Needs:* §7.28, §7.31–§7.33.

**Checks.**
- With `q = p_quad = a = 1`, `π = 0` and `b = 3`, the conditions read `N ≥ 3`, `N ≥ 2` and
  `N − 2 > 2`, so `N = 5` is the least admissible order. The first two alone allow `N = 3`, where
  the recovery distance `K_rec ε_N ~ h^(N+1−π−b) = h` exceeds the uniqueness radius
  `γ_r ~ min(h^a, h^(q+p_quad)) = h²`.

### 7.35 The baseline contraction

Use the fixed-field finite-rank stabilization and the same physical reference section. Let `P_r^comp`
be the bounded projection onto the full stabilized infinite-dimensional complementary range,
including the fast and slow-complement channels and killing `I_obs(p)O`; `Π₋` remains only the
moving slow normal-model projection. Translate the corrected graft to the origin without silently
changing the reference gauge operator. Solve on the selected closed complement of the kernel,
equivalently `im Q_r`, keeping the finite kernel parameters. Define `L_r = P_r^comp DS_(r,0)(0)` and
prove `L_r Q_r = Id` and `Q_r L_r = Id`, with `C_r = max(1, ‖Q_r‖)`; its coordinate operator is
`L_r Dχ` for the field chart `χ`, and the chart derivative and complement identifications enter the
inverse bound. Its slow block is the Schur derivative of this same fixed-target section and fast
graph. Set `e_r = P_r^comp S_(r,0)(0)`, let `ε_r⁰` be its supremum on the compact parameter set, and
define `N_r(x) = P_r^comp[S_(r,0)(x) − S_(r,0)(0)] − L_r x`, with `P_r^comp` fixed as `x` varies, so
`N_r(0) = 0`. Construct `L_r^quad ≥ 1` with

    ‖N_r(x) − N_r(y)‖ ≤ (L_r^quad/2)(‖x‖ + ‖y‖) ‖x − y‖

on a chart ball of radius `δ_r > 0`, and prove `2C_r² L_r^quad ε_r⁰ < 1/4` and
`2C_r ε_r⁰ < δ_r/4` for all selected `r`, uniformly on the compact windows at fixed `J`. These are
quantitative outputs for the constructed operators, not assumed rates. Confinement at fixed `J`
supplies the covered and coincident sectors; the path-wall models control crossings of degeneracies
and do not feed this inverse.
*Needs:* §7.27, §7.32–§7.34.

### 7.36 The reference structure on `X` and the unforced local degree

In an embedded symplectic square-zero torus `C ⊂ X` choose its topologically trivial normal line, a
complex structure compatible with the area form, and a unitary flat connection with irrational
holonomy of infinite image. Normalize the model `ω_N = π*ω_C + d((ρ²/2)α)`, `α = dθ + A`, and
identify the full ambient bilinear tensors and the normal symplectic fibres along `C`, not only
their pullbacks to `TC`, using SymplecticGeometry/CotangentLagrangian C4's relative first-jet Moser
theorem for that identification. This roadmap owns the flat connection and coupling, the
installation and extension of a compatible integrable local `J` in `X`, the realization of
permitted normal Cauchy–Riemann jets, and the transport of the canonical `Spinᶜ` structure and the
integral line by clutching. Do not assume a square lattice without its area-preserving comparison.
Prove that all finite-cover and power flat lines are nontrivial, and construct the divisor bundles
`⊕_(j=1)^m N^j`, their leading complex inverses and degree `+1`. Separately prove the finite-`r`
global exterior vacuum inverse, isolation and excision, and the comparison of the Seiberg–Witten
and complex-model determinant orientations, before using this degree; the early model orientation
uses Layer 0, SeibergWittenTheory and HeegaardFloer's determinant theory, and the full count
comparison is Layer 9's. For arbitrary admissible normal germs prove the enlarged cover-wall models
and their oriented dictionary of branches and weights, with all real twists and signs, without any
SW = Gr input. Ordinary components and products need their incidence, determinant and excision
laws. Choose the resulting reference `J_ref` count-admissible by relative genericity away from its
fixed flat germ: prove that any compact simple curve in that germ is the zero section, by finite
projection and the nontrivial pulled-back flat line, and that every other relevant simple image has
an injective piece in the region of variation. Apply the localized genericity of HeegaardFloer and
AnalyticStableMaps there and the explicit cover operators on the fixed torus. Instantiate the
inverse correspondence of this layer at `J_ref`, and prove uniformity on every compact
gap-preserving family used. Different normal labels are not assumed to connect to the reference
through such a family; they use the enlarged wall models and their isolation and degree
comparison.
*Needs:* §0.1, §1.3, §2.1, §7.35; SymplecticGeometry/CotangentLagrangian C4; SeibergWittenTheory
SW7.1; HeegaardFloer §2.2 and §4.4; AnalyticStableMaps §2.18–§2.21.

### 7.37 Quantitative unforced recovery

Put `γ_r = min(δ_r/2, (2C_r L_r^quad)⁻¹)`. Confinement at fixed `J`, the strong ambient
coordinates, the early fast graph, the normalized covering by leading zeros, the uniform basic slow
stability and the jet estimates give reconstruction in the pinned class for all unforced
constrained solutions and all `a ∈ A_pre`. Compare with the selected profile through the `K_rec`
bound and the joint witness, obtaining `‖x‖ < γ_r` in the `E` norm. The baseline contraction gives
`x₀(p)` with `‖x₀‖ ≤ 2C_r ε_r⁰ < γ_r/2`, and uniqueness in the larger ball at the same `p` identifies
the recovered root with `x₀`. Construct ambient neighbourhoods in the gauge quotient, open footprints
in the total family of zeros of the equation, and continuous `p` and `x` with stabilizer, refinement
and line-section laws. The initial coarse landing is independent of fine uniqueness, regular cutdown
counts and the forcing tolerance; bifurcation windows crossing degeneracies are separate path data.
*Needs:* §7.19, §7.33–§7.35.

### 7.38 Recovery persistence at fixed `r`

For each selected `r` use the compact unforced constrained sector, the open union of total charts
and its strict landing margin to construct `η_r^rec > 0`. Apply SeibergWittenTheory SW5.4's proper
solution projection over a compact wall-free set of perturbations, in the `H^s` gauge topology.
Use the early threshold `ℓ_F` of §7.13 for forward and slicing estimates, proved for every
`ℓ ≥ ℓ_F`. After the profile order and all correction demands are fixed, choose a common finite order
`ℓ_late ≥ ℓ_F` meeting them, use it for the late correction and recovery estimates, and prove its
continuous embedding into the required fixed-`r` Sobolev norm. Every later response, persistence,
`τ_r` and regular-selection step uses `ℓ = ℓ_late` and this `C^ℓ` norm; the early forward theorem
keeps its quantification over every `ℓ ≥ ℓ_F`. Shrink `η_r^rec ≤ 1` in this norm to use the common
forcing family. For a sequence `ρ_n → 0` in that norm, fixed-`r` gauge and elliptic estimates give
strong `H^s` convergence after gauge, the finite-`r` rescaled chart norm being equivalent; with the
continuity of the ambient point sections and the compact auxiliary parameter window, the limit lies
in the unforced constrained sector and in an open chart with `‖x‖ < γ_r/2`. So every constrained
solution with `‖ρ‖_(C^ℓ_late) < η_r^rec` lands in the same union of charts with `‖x‖ < γ_r`; if the
unforced sector is empty, prove emptiness nearby by the same properness argument. Shrink
`η_r^rec` within the wall gap and the domains of the fixed sections and charts. This is a positive
radius at fixed `r`, not a rate uniform in `r` and not a substitute for §7.37.
*Needs:* §6.3, §7.37; SeibergWittenTheory SW5.4.

### 7.39 The unforced finite models

Construct the remaining realization of the curvature cokernel and `O_r = 1 − P^comp`, with all finite
coordinate norms. At a fixed admissible `J` the model windows have the covered and coincident
sectors supplied by confinement; the enlarged wall models serve the path comparisons. On each
compact window define the full section

    F_r(p, ρ, a) = (O_r S_(r,ρ)(p, x_r(p, ρ)),
                    s_(r,a,ρ)(χ_r(p, x_r(p, ρ); ρ))) ∈ O_r ⊕ ⊕_j (E_(x_j) ⊗ U_(x_j)),

with local frames and transition laws, keeping `(DT)F` on boundary windows. When `d = 2k` its real
target rank equals `dim p`. The unforced finite model, the comparison of the ambient charge-one line
and incidence, and the early orientation give a common isolating boundary and
`b_r⁰ = inf_boundary ‖F_r(p, 0, 0)‖ > 0`; recovery and `A_pre` are constructed before `b_r⁰`.
*Needs:* §6.3, §7.35–§7.38.

### 7.40 Forcing budgets and the tolerance

For the preliminary complementary solve let `B_comp` bound `P^comp(0, −λ⁻²ρ, 0)`; contraction gives
`‖x(ρ) − x(0)‖ ≤ 2C_r B_comp ‖ρ‖`. Prove bounds `B_obs` and `B_sec,dir` for direct obstruction and
section forcing, and `D_obs`, `D_sec` for their `x`-derivatives through the realization `χ_r`,
including the normalized four-dimensional evaluation cost `λ²` and the gauge, line and parameter
derivatives. Choose `B_r ≥ 1` and `B_comp` dominating `B_obs + B_sec,dir + 2C_r(D_obs + D_sec)B_comp`
and every coordinate and realization bound, so that `‖F_r(p, ρ, a) − F_r(p, 0, a)‖ ≤ B_r ‖ρ‖`
uniformly on `A_pre`. Choose a smaller coefficient ball `A_late ⊂ int A_pre` with
`‖F_r(p, 0, a) − F_r(p, 0, 0)‖ ≤ H_r|a| < b_r⁰/4` there, and the curvature budget
`B_r ‖ρ‖ < b_r⁰/4`; these bound the full obstruction-plus-point section, not only its obstruction
coordinate. Define

    τ_r = min(h, η_r^rec/2, 1, [16 C_r² L_r^quad (1 + B_r)]⁻¹,
              δ_r/[8 C_r (1 + B_r)], b_r⁰/[4(1 + B_r)]),

and prove the norm embedding from the smooth curvature-parameter space into these target maps and
the boundary separation estimate that makes this tolerance valid.
*Needs:* §7.35, §7.38–§7.39.

### 7.41 The contraction with forcing

For `‖ρ‖_(C^ℓ) < τ_r` put `g_(r,ρ) = P_r^comp(0, −λ⁻²ρ, 0)`, so that the complementary residual is
`e_r + g_(r,ρ)`. Set `ε_Newton,r = ε_r⁰ + B_r τ_r` and `R_Newton,r = 2C_r ε_Newton,r`. Prove
`R_Newton,r < δ_r` and `2C_r² L_r^quad ε_Newton,r < 1`, and that `−Q_r(e_r + g_(r,ρ) + N_r(·))`
preserves and contracts that ball; construct the unique infinite-dimensional correction with all
parameter and completion laws. The finite-dimensional obstruction equation remains to be solved and
counted: a right inverse on the complementary range is not surjectivity of the full operator. Prove
`R_Newton,r < γ_r`. If two complementary roots have the same finite `p` and norms below `γ_r`, their
difference satisfies `‖x − y‖ ≤ (C_r L_r^quad/2)(‖x‖ + ‖y‖)‖x − y‖` with coefficient below `1/2`, so
they agree; this larger uniqueness region identifies the roots supplied by recovery with the
constructed branch.
*Needs:* §7.35, §7.37, §7.40.

**Checks.**
- With `ε_Newton,r ≤ ε_r⁰ + B_r τ_r` and the term `[16 C_r² L_r^quad (1 + B_r)]⁻¹` of `τ_r`,
  `2C_r² L_r^quad B_r τ_r ≤ 1/8`, and with `2C_r² L_r^quad ε_r⁰ < 1/4` this gives
  `2C_r² L_r^quad ε_Newton,r < 3/8 < 1`; a tolerance without the factor `(1 + B_r)` would not
  control the forcing term when `B_r` is large.

### 7.42 Inverse charts and covered tori

For regular components of multiplicity one and transverse point data construct genuine inverse
charts. For covered tori solve the finite obstruction problem and keep its oriented local degree.
Prove all compact-window estimates for norms, projections, errors and recovery, and the gauge
covariance and overlap laws that Layer 8 needs. Uniformity refers to the specified bounded geometry,
the finite cutoffs on covers, area and multiplicity and the compact model parameter sets, with the
confined covered and coincident models at fixed `J` and the separately constructed enlarged wall
models in path applications.
*Needs:* §7.36–§7.41.

### Examples

- For an ordinary embedded sphere of square `−1` with `e = PD[S]`, the graft is one degree-one
  vortex along `S`, the normal operator has index zero and no kernel by §7.19, and the construction
  gives exactly one solution up to gauge for large `r`.
- For a square-zero torus of multiplicity `m` with a flat normal line of irrational holonomy
  (§7.36), every power `N^j` is nontrivial, the divisor bundles have no holomorphic sections, and
  the finite model has local degree `+1`.

### Dependencies

Layers 0–6; SeibergWittenTheory SW4–SW7; HeegaardFloer Layers 2 and 4; PseudoholomorphicCurveAnalysis
§3.1 and §7.2; AnalyticStableMaps Layer 2; SymplecticGeometry/CotangentLagrangian C4; HopfRinow
Layers 1–2; GeometricTopology Layer 1; SpinGeometry. Mathlib: Fredholm operators, Newton's
identities, Hausdorff measure and Vitali covering.

## Layer 8: exhaustiveness, uniqueness, local degrees and determinant lines

### 8.1 Exhaustiveness and uniqueness

For `good_J(e)`, every solution in the selected ambient constrained sector with
`‖ρ‖_(C^ℓ) < τ_r` lies in the union of the inverse charts and lands at complementary norm below `γ_r`,
by the unforced recovery and the fixed-`r` persistence of §7.37–§7.38 (Taubes, *GR = SW*). Uniqueness
in the larger ball identifies its complementary coordinate with the solution constructed at the same
finite `p`; the finite obstruction equation remains the zero condition. Construct the overlap,
refinement, choice and gauge laws so that different chart images are neither omitted nor counted
twice. For covered tori use the independently constructed oriented finite local degree
`w_label(m)`, not a literal bijection and not a degree extracted from an SW = Gr formula.
*Needs:* §7.36–§7.42.

### 8.2 Regular curvature data and the constrained count

After `τ_r` and `A_late` are chosen, realize curvature perturbations by SeibergWittenTheory's
universal derivative and choose wall-free regular curvature data inside `τ_r` (Taubes, *GR = SW*).
Only then restrict the early ambient line sections of §6.3 to the smooth finite-dimensional moduli
space and choose arbitrarily small transverse coefficients in `A_late`. Prove the representative
theorem for `μ^k` and its controlled homotopy to the incidence model of the gluing, keeping both
`b_r⁰/4` budgets and the low-`α` support. Unconstrained regularity alone gives no transversality of
evaluation at fixed points. The whole constrained boundary stays free of zeros, the total recovery
theorem excludes missing solutions, and the oriented local degrees give the compact constrained
count. All directions are induced by curvature and section variations; no unproved Kuranishi
perturbation is used. A selected large-`r` sequence suffices, and the prescribed ray `η_r` is not
asserted to be regular. This regular count precedes the equality of the invariants in each branch.
*Needs:* §6.3, §7.40–§7.42, §8.1; SeibergWittenTheory SW6.1–SW6.3 and SW7.2.

### 8.3 Determinant lines and the universal divisor line

Construct coherent isomorphisms between the gauge-fixed Seiberg–Witten determinant lines, the
normal Cauchy–Riemann and incidence lines of ordinary components, the vortex deformation
determinants and the auxiliary gauge and domain factors (Taubes, *GR = SW*). Track the target
order, the charge-one point insertion, the permutations of sources and components, the complex
orientations and the homology orientation of Layer 0. Construct the weighted universal divisor
Hermitian line `D` over `X` times each configuration and parameter model, with fibre `O(Σ m_a C_a)`.
Pin it by the weighted universal zero divisor, not by its fibres: construct its canonical local
section and zero multiplicities, the oriented relative Thom and clutching class supported on that
divisor, and prove that its image in the integral `H²(X × parameter)` is `c₁(D)`, equivalently the
integral class Poincaré dual to the weighted universal divisor wherever that notation applies with
the declared relative and proper supports. Prove gluing and refinement and oriented compatibility
with families and bifurcations for this full class, including components pulled back from the
parameter base; fibrewise isomorphisms alone do not determine it. Construct the slants `c₁(D)/[x]`
of degree two and `c₁(D)/γ` of degree one for `γ ∈ H₁(X; ℤ)`, with cross and evaluation,
representative and naturality laws and no division by multiplicity. For the fixed twist `E` and
SeibergWittenTheory's charge-one gauge line `U`, compare under the vortex map as normalized pairs
and lines `D ≃ pr_X E ⊗ U`, equivalently `D ⊗ pr_X E⁻¹ ≃ U`, with `c₁(D) = pr_X e + c₁(U)`
including the components on the parameter base; the universal `α` is a section of `pr_X E ⊗ U`.
Prove the full comparison of zero divisors and clutching, not only of fibre classes; `pr_X e`
contributes zero to both slants, which gives the comparison with `μ` and `ν` without a factor two.
Prove the comparison of point incidence and Euler classes with `μ^k`. Construct the weighted loop
incidence class: the universal curve has dimension `d + 2`, so meeting a target loop has
codimension one on the `d`-dimensional configuration moduli, and multiple torus components
contribute their divisor multiplicities. These are definite geometric and class statements; the
count theorem below is limited to point insertions. The determinant sign and degree theorems fix
the weights and the sign of the point count, and the kernel correspondence cannot replace them.
*Needs:* Layer 0, §2.1, §7.36, §8.1–§8.2; SeibergWittenTheory SW7.1–SW7.3; HeegaardFloer §2.2;
CharacteristicClasses (Thom classes); AlgebraicTopology Layer 6 (slant and cross products).

**Checks.**
- The class `pr_X e` lies in the Künneth summand `H²(X) ⊗ H⁰(B)` of the parameter space `B`, so
  its slant with a point class `[x] ∈ H₀(X)` or a loop class `γ ∈ H₁(X)` is zero, and
  `c₁(D)/[x] = c₁(U)/[x] = μ`. Over a one-point parameter space the slant lies in `H²(pt) = 0`, as the
  point class of a zero-dimensional moduli space must. Slanting the universal determinant line, whose
  class is `2c₁(U)` plus pulled-back terms, would give `2μ`, the class excluded in the conventions.

### Examples

- For `X` with `b₂⁺ > 1` and `E` trivial, the configuration space of the class `0` is the empty
  configuration, `D` is trivial, and the count is the single canonical solution with sign `+1`
  (§9.1).

### Dependencies

Layers 0, 2, 6 and 7; SeibergWittenTheory SW6–SW7; HeegaardFloer §2.2; CharacteristicClasses;
AlgebraicTopology Layer 6.

## Layer 9: point-count correspondence and the minimal product chamber

### 9.1 `SW⁰ = Gr` when `b₂⁺ > 1`

For `b₂⁺ > 1`, a Hermitian line `E` and the canonical homology orientation of §0.1, prove

    SW⁰_X(s_ω ⊗ E) = Gr_(J,ω)(PD c₁(E))

(Taubes, *GR = SW*; announced in Taubes, *The Seiberg–Witten and Gromov invariants*). Split the
line labels by `good_J(e)` at the chosen count-admissible `J`. For bad labels use the zero-zero
statement of §6.2. For good labels use the regular curvature and insertion data of §8.2, the local
degrees, the complete guarded exhaustiveness of §8.1 and the comparison of determinant and divisor
lines of §8.3. For `d = 2k` use exactly `k` charge-one point classes; for `d < 0` prove that the
regular count is empty and that `Gr` vanishes. For `E` trivial construct the canonical large-`r`
solution, its uniqueness and the determinant normalization `+1`, matching the empty configuration.
Prove the vanishing for nonpositive area and for nontrivial torsion labels; real Chern pairings do
not identify a torsion line with the vacuum. This theorem compares point-only invariants; it does
not identify the full exterior invariant with insertions from `H₁` with curve insertions.
*Needs:* §0.1–§0.3, §3.3, §6.2, §8.1–§8.3; SeibergWittenTheory SW8.

**Checks.**
- For `E` trivial both sides are `1`: the empty configuration on the curve side, and on the
  Seiberg–Witten side the unique large-`r` solution, with `α` nowhere zero, counted `+1` in the
  canonical homology orientation (Taubes, *The Seiberg–Witten invariants and symplectic forms*).
  For `E = K` the two sides are then `±1`, with the sign `(−1)^((1−b₁+b⁺)/2)` of §0.2.

### 9.2 Choice independence after the comparison

After the point equality of §9.1, construct the naturality under isomorphisms of lines and `Spinᶜ`
structures, under oriented diffeomorphisms and in compact symplectic families. Derive that the
fixed-`J` weighted count is independent of `J` and of the point data, and natural in compact
symplectic families, in this `b₂⁺ > 1` scope, by applying the equality at both endpoints and the
invariance of SeibergWittenTheory SW8.3, including when exceptional configurations change. This
corollary uses no classification of paths through exceptional degenerations and is no input to the
point equality. Define `Gr_(X,ω)` on the comparison labels as this common endpoint value.
*Needs:* §9.1; SeibergWittenTheory SW8.3.

### 9.3 The large-`r` chamber when `b₂⁺ = 1`

For `b₂⁺ = 1` fix the positive harmonic line through `ω` and use SeibergWittenTheory's wall
coordinate `w(g, η) = ⟨harm⁺(F_ref − η), iω_g⟩`. For `F_ref = F_(A₀) + 2F_(a_ref)` and normalized
positive `ω`, derive

    w(g, η_r + ρ) = (r/4)‖ω‖₂² − 4π⟨eω, [X]⟩ + ⟨iρ, ω⟩₂

up to the chosen positive normalization of `ω_g`, so that the controlled large-`r` data lie in
`C₊ = {w > 0}`. Prove the uniform wall gap, define the real cohomological coordinate
`Δ = ⟨l − [iη/(2π)], ω_g⟩` and prove `w = −2πΔ`, interpreting a nonclosed `η` by harmonic
projection; so `Δ < 0` is `C₊` in this convention. The large-`r` chamber is identified by the
displayed calculation; no sign or scale identification with a chamber coordinate of a cited source
is presumed, and this calculation does not replace the comparison of determinant and homology
orientations.
*Needs:* §5.1; SeibergWittenTheory SW6.2 and SW10.

**Checks.**
- At `ρ = 0` and `η = 0`, `F_ref` represents `−2πi l` because `c₁(L)_ℝ = [iF_A/(2π)]`, so
  `w(g, 0) = ⟨−2πi l, iω⟩ = −2π l · [ω_g] = −2πΔ`, as claimed. For `e = 0` and `ρ = 0`,
  `w(g, η_r) = (r/4)‖ω‖₂² > 0`.

### 9.4 The minimal product theorem

Let `X = S¹ × Y_φ` be the symplectic product with a mapping torus `Y_φ` of a closed connected
oriented surface with `b₁(Y_φ) = 1`, and `E = p*E_Y`. Prove that its integral intersection form is
even and `b₂⁺ = 1`, so that it has no class of square `−1` and is minimal, and that `d(e) = 0`
integrally. In the large-`r` chamber `C₊` prove

    SW⁰_(X,C₊)(s_Ω ⊗ p*E_Y) = Gr_(J,Ω)(PD p*c₁(E_Y)).

Run the same quantitative forward, inverse and regularized degree argument in this fixed wall-free
chamber, with no exceptional-sphere case, and compare its canonical orientation; the forward
existence theorem needs no hypothesis on `b₂⁺` (Taubes, *SW ⇒ Gr*, Theorem 1.3, p. 852, and its
remark on `b₂⁺ = 1`, p. 847). Construct the variation within the chamber and the product symplectic
deformation that Layer 11 needs. There is
no general nonminimal `b₂⁺ = 1` equality here, and the full product insertion, support and wall
application is Layer 10's, not an extension of this point theorem to curve insertions from `H₁`.
*Needs:* §9.1's argument (Layers 5–8), §9.3, §10.1; Tau Ceti
`TauCeti.SmoothMappingTorus.apply_self_sub_apply_canonical_eq`.

**Checks.**
- For `b₁(Y_φ) = 1`, `b₂(X) = b₁(Y) + b₂(Y) = 2` and the signature of `S¹ × Y_φ` is `0`, so
  `b₂⁺ = 1`. Modulo torsion `H²(X; ℤ)` has the basis of §10.4: `v`, pulled back from `Y` and
  pairing to one with the fibre, and `t = [ds ∧ dt]`. They form a hyperbolic pair
  (`v² = t² = 0`, `v · t = 1`), whose form is even. A pullback label is `e = av` modulo torsion and
  `κ = (2g − 2)v`, so `e² = a²v² = 0` and `κe = (2g − 2)a v² = 0`, and `d(e) = 0`.

### 9.5 Choice independence on the minimal product

After the minimal `b₂⁺ = 1` point equality for pullback labels of dimension zero in this fixed
chamber, derive the independence of the endpoint `J` and the point data, and naturality in compact
symplectic product families, from that equality and SeibergWittenTheory's chamber-preserving
invariance. This is a consequence of §9.4, not an input to it, not a consequence of the `b₂⁺ > 1`
theorem and not a general nonminimal `b₂⁺ = 1` statement. Define `Gr_Ω` on these labels as this
common endpoint value; the notation asserts no further comparison.
*Needs:* §9.4; SeibergWittenTheory SW8.3.

### Examples

- For a K3 surface, `κ = 0` and `Gr(0) = SW⁰(s_ω) = 1`. For the class `F` of an elliptic fibre,
  `d(F) = F² = 0`, and both invariants vanish because `0` is the only class with nonzero
  Seiberg–Witten invariant on a K3 surface: the weighted count of square-zero tori in the class `F`
  is zero for a count-admissible `J`.

### Dependencies

Layers 0–8; SeibergWittenTheory SW6.2, SW8 and SW10; Layer 10 (§10.1) for the product geometry.
Tau Ceti: the chamber arithmetic of `S¹ × Y_φ`.

## Layer 10: product `Spinᶜ` support, all insertions and the fixed-cone wall application

### 10.1 Product geometry and the canonical lift

For a closed connected oriented three-manifold `Y` let `X = (ℝ/ℤ)_s × Y`, oriented by `ds` followed
by `Y`, with the product metric `ds² + g_Y` and unit `T = ∂_s`. Construct the product of a
three-dimensional `Spinᶜ` lift with the trivial first line; the product metric and reference lift
for an arbitrary `Y` need neither a surface fibration nor a vertical symplectic form. In the surface
suspension case consume SymplecticGeometry S0–S2's smooth quotient and seam tensors (in Tau Ceti:
`TauCeti.SmoothMappingTorus.suspensionForm`, `TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure`,
`TauCeti.SmoothMappingTorus.seamAlmostComplexStructure`). When `Y = Y_φ` for an area-preserving
diffeomorphism of a closed connected oriented surface `F` of genus `g`, instantiate its primitive
`dt`, the closed vertical form `ω_v`, `V = ker dt`, `Ω = ds ∧ dt + ω_v` and a seam-compatible block
`J` in real dimension four; choose `R` by `dt(R) = 1`, `ι_R ω_v = 0` and `J∂_s = R`. No Hamiltonian
condition on `φ` is imposed. Prove that the canonical lift `s_Ω` is the pullback of the lift on `Y`
of the oriented plane field: construct `θ ↦ [exp(θe₁e₂/2), exp(iθ/2)]` in `Spinᶜ(3)`, its
stabilization with the line first and the `U(2)` and Clifford intertwiner of associated bundles; at
`θ = 2π` both signs change. The equality `K_X = p*K_Y` of determinants alone does not prove equality
of the lifts. For arbitrary `Y` construct a reference plane field from a nowhere-zero vector field,
the Euler and section obstruction on a finite three-dimensional CW model and smooth approximation,
and lift its `SO(2)` reduction by the same formula; this is a frame application, not a
three-dimensional gauge invariant. Prove `b₂⁺(X) = b₁(Y)` from the off-diagonal product Poincaré
pairing, with all cross and cap signs fixed.
*Needs:* SymplecticGeometry S0–S2; FourManifolds §4.1; SpinGeometry; AlgebraicTopology Layers 4
and 6; Tau Ceti `TauCeti.SmoothMappingTorus.suspensionForm`.

**Checks.**
- At `θ = 2π`, `exp(πe₁e₂) = −1` in `Spin(3)` and `exp(iπ) = −1`, so the pair is `(−1, −1)`, the
  identity of `Spinᶜ(3) = Spin(3) ×_(±1) U(1)`: the loop closes only because both factors change
  sign. A lift using `exp(iθ)` would not close up.

### 10.2 Zero-perturbation energy

For an arbitrary `Spinᶜ` structure on `X`, determinant `L`, `l = c₁(L)`, and any smooth unperturbed
solution `F_A⁺ = q(ψ)`, `D_A⁺ψ = 0`, construct the product Levi-Civita splitting

    D_full = c(ds)∇_T + B_A,
    D_full² = −∇_T² + B_A² + (1/2) c₂(ds ∧ ι_T F_A).

The horizontal `B_A⁺` is not the full chiral Dirac operator. Derive the mixed half-determinant
curvature term and the formal adjoints directly; a compatible-connection correction proportional to
`ds ∧ d ds` vanishes on the product. For imaginary `F_A = i(ds ∧ a + b)` prove the real exterior
identity

    2⟨ds ∧ ι_T F_A, F_A⁺⟩ dvol = |ι_T F_A|² dvol + (1/2)(iF_A) ∧ (iF_A).

The normalization of the `q`-adjoint gives the integrated identity

    0 = ‖∇_T ψ‖₂² + ‖B_A⁺ ψ‖₂² + ‖ι_T F_A‖₂² + 2π²⟨l², [X]⟩.

Prove it first for smooth solutions, then through SeibergWittenTheory's bootstrap for Sobolev
solutions. It assumes zero perturbation, not arbitrary curvature forcing, and no genericity or prior
pullback label. Since `χ(X) = σ(X) = 0`, `d = ⟨l², [X]⟩/4 ≥ 0` forces `l² = 0` and `ι_T F_A = 0`, and
Bianchi and Cartan then make `F_A` a basic closed two-form. For a fixed-point-free circle action
and a perturbation pulled back from the quotient, the integrated identity is Baldridge,
*Seiberg–Witten invariants, orbifolds, and circle actions*, Theorem 15, from which its Theorem A
(§4.1 of the arXiv version) derives the pullback support.
*Needs:* §10.1; SeibergWittenTheory SW1.4, SW3.2 and SW5.3; SpinGeometry.

**Checks.**
- With `F = i(ds ∧ a + b)`, `ι_T F = ia`, `(iF) ∧ (iF) = 2 ds ∧ a ∧ b`, and
  `2⟨ds ∧ a, (ds ∧ a + b)⁺⟩ dvol = |a|² dvol + ds ∧ a ∧ b`, since `⟨x, *y⟩ dvol = x ∧ y` and
  `ds ∧ a ∧ ds ∧ a = 0`: both sides equal `|a|² dvol + ds ∧ a ∧ b`.
- By SeibergWittenTheory SW1.4, `∫ F_A ∧ F_A = −4π²⟨l², [X]⟩`, so `∫ (1/2)(iF_A) ∧ (iF_A)` is
  `2π²⟨l², [X]⟩`, the last term of the integrated identity.

### 10.3 Integral pullback and empty neighbourhoods

Construct the integral decomposition `H²(X; ℤ) = p*H²(Y; ℤ) ⊕ ([ds] ∪ p*H¹(Y; ℤ))`. Its cross
quotient is torsion-free, so real pullback of `l` implies integral pullback. Relative to a pulled-back
reference write `s = s₀ ⊗ E`; `cross(l) = 2 cross(c₁(E))` and freeness imply `E ≃ p*E_Y`, two-torsion
included. Construct the upgrade to a smooth unitary line isomorphism and the full comparison of
lifts and torsors. Basic curvature does not make the connection descend: flat vertical holonomy is
kept. For a nonpullback twist with `d ≥ 0` the unperturbed moduli space is therefore empty; its
nonzero real cross class implies `l⁺ ≠ 0`, since `l⁺ = 0` and `l² ≥ 0` would force `l_ℝ = 0`.
SeibergWittenTheory SW5.4's proper solution projection gives an open empty wall-free neighbourhood of
perturbations, where every allowed `μ` and `ν` pairing vanishes. Chamber and family invariance
transport these values; they do not make every other parameter of the chamber empty. If `d < 0` the
regular invariants vanish by dimension. For `b₁(Y) > 1`, `b₂⁺(X) > 1` and all nonpullback insertion
components vanish globally. For every pullback `E = p*E_Y` and canonical `K = p*K_Y` prove
`e² = κe = 0` by naturality of the integral cup product and `H⁴(Y; ℤ) = 0`; so `d = 0` and all
positive-degree `μ` and `ν` insertions vanish in the pullback sector. The complete product
exterior invariant thus reduces to the pullback point invariant, through the energy and
empty-neighbourhood theorem, with no general SW = Gr theorem with `H₁` insertions.
*Needs:* §10.1–§10.2; SeibergWittenTheory SW5.4, SW8.2–SW8.3; AlgebraicTopology §5.1 and Layer 6
(Künneth, cup products); SmoothBundlesConnections Layer 6.

### 10.4 Mapping-torus chambers with `b₁(Y) = 1` and wall values

Let `F` be connected of genus `g`, `b₁(Y_φ) = 1`, `v ∈ H²(Y; ℤ)` a lift with `⟨v, [F]⟩ = 1`,
`t = [ds ∧ dt]` and `[Ω] = t + Lv` with `L > 0`, keeping every torsion label. Modulo torsion write
`e = av + ct`, `κ = (2g − 2)v` and `q = a + 1 − g`; `c` is the coefficient of `t`, distinct from the
Betti numbers. The identities `l = 2qv + 2ct`, `d = 2cq` and `⟨lΩ, [X]⟩ = 2(q + Lc)`, and the sign of
`q + Lc` equal to that of `c` for nonpullback `c ≠ 0` with `d ≥ 0`, are Tau Ceti's
(`TauCeti.SmoothMappingTorus.isOfFinAddOrder_two_smul_sub_sub`,
`TauCeti.SmoothMappingTorus.apply_self_sub_apply_canonical_eq`,
`TauCeti.SmoothMappingTorus.apply_two_smul_sub_add_mul_apply_eq`,
`TauCeti.SmoothMappingTorus.sign_apply_two_smul_sub_add_mul_apply`). Construct the basis on `X`
from the mapping torus. The unperturbed empty neighbourhood lies in `C₋` for `c > 0` and in `C₊` for
`c < 0`, because `w(g, 0) = −2π l · [ω_g]`; the source-positive convention oriented relative to `l⁺`
is not the same fixed-cone label, and the large-`r` data of §9.3 lie in `C₊`. With the product
homology orientation `h_prod = e₀ ∧ i[ds] ∧ i[dt] ∧ e₊`, construct the charge-one Picard and slant
coordinates and the wall class `u = q ν_s ν_t`, and apply SeibergWittenTheory SW10's direct-Hodge
wall theorem in exactly this orientation. For `c > 0` and `q > 0` the `C₊` point value is `q`, and
the exterior component of degree two is `det(⟨α_j, γ_i⟩)` with `α = (ds, dt)`, only when `d ≥ 2`; for
`c > 0` and `q = 0` only `d = 0` occurs and its point wall value is `0`. For `c < 0` and `d ≥ 0` all
`C₊` components vanish by the empty neighbourhood, and the opposite chamber is not inferred to
vanish. For `d < 0` all regular components vanish by dimension. For `c = 0` the point value comes
from Layers 9 and 11, and the components with positive `H₁` degree vanish because `d = 0`. Construct
these line, slant and determinant comparisons, then transport to the canonical orientation by
§11.2's determinant and Wang map; the values are not given in an unidentified homology orientation.
The product theorem thus treats the full insertion invariant by energy, the wall theorem and
dimension. It supplies no three-dimensional gauge definition, no descent of connections on
nonproduct orbifold circle bundles and no nonminimal symplectic `b₂⁺ = 1` curve theorem.
*Needs:* §9.3, §10.1–§10.3; SeibergWittenTheory SW9–SW10; Tau Ceti
`TauCeti.SmoothMappingTorus.apply_two_smul_sub_add_mul_apply_eq`.

**Checks.**
- For `g = 2` and `e = 3v + t`: `q = 2`, `c = 1`, `d = 2cq = 4` and `⟨lΩ, [X]⟩ = 2(2 + L) > 0`,
  the sign of `c`; directly, `e² = 2ac = 6` and `κe = (2g − 2)c = 2` give `d = 4`. For `g = 2` and
  `e = t`, `q = −1` and `d = −2 < 0`, so all regular components vanish by dimension.

### Examples

- For `Y = T³` as the mapping torus of the identity of `T²`, `b₁(Y) = 3 > 1`, `X = T⁴` has
  `b₂⁺ = 3`, and by §10.3 the invariant of `T⁴` is supported on pullback labels with `d = 0`.

### Dependencies

Layer 9; SymplecticGeometry S0–S2; SeibergWittenTheory SW1.4, SW3, SW5, SW8–SW10; FourManifolds
§4.1; SpinGeometry; AlgebraicTopology Layers 4–6; SmoothBundlesConnections Layer 6. Tau Ceti: the
symplectic suspension and the chamber arithmetic.

## Layer 11: orbit localization, orientation and degenerate return maps

### 11.1 Horizontal limiting cycles and normal return operators

For every positive compact closed block-`J` cycle in a pulled-back class, use
`PD_X(p*e_Y) = [S¹_s] × PD_Y(e_Y)` with the plus sign of cross and cap and `⟨ω_v, PD p*e_Y⟩ = 0`.
Positivity of `ω_v` on complex tangent planes makes each component horizontal (Tau Ceti's
`TauCeti.SmoothMappingTorus.integralTopForm_mpullback_mpullback_snd_fiberForm_eq_zero_iff`). Prove
that the resulting compact embedded connected images are `S¹ × γ` for primitive suspension orbits
`γ`, with all distinctions between covers, images and multiplicities; a nonembedded map has only
derivative-horizontality until its covering statement is proved (Tau Ceti's
`TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero` for immersed
curves). This classification is constructed in the product application, without a general
image-factorization theorem.

Assume first that `φ` is strongly nondegenerate: no positive iterate has a return eigenvalue `1`. For
a period cutoff `N`, prove the precise version through `2N` that also controls the `±1` twists and
covers through `N`. Compactness and isolation make each relevant fixed set finite, and genericity of
`J` does not change `φ`. Compare the normal operator of each orbit torus with the `s`-independent
`D_C = ∂_s + A_C`, `A_C` self-adjoint. Its twists antiperiodic in `s` have no kernel by
`D*D = −∂_s² + A_C²`, and the positive determinant needs an invertible homotopy to the complex
reference; the twists periodic in `s` compare with `det(I − P_C)` and `det(I + P_C)`. The kernel
statements are Tau Ceti's (`TauCeti.orbitTorusOperator`,
`TauCeti.eq_zero_of_orbitTorusOperator_eq_zero_of_antiperiodic`,
`TauCeti.exists_ne_zero_orbitTorusOperator_eq_zero_iff_det_eq_zero`). Prove the absolute reference
signs and all finite-cover and trivialization laws, with HeegaardFloer's convention
`CZ = −μ_RS`. After this determinant comparison the local factors of rank two are: positive
hyperbolic, label `(−,0)`, `1 − x`; negative hyperbolic, label `(+,1)`, `1 + x`; elliptic, label
`(+,0)`, `(1 − x)⁻¹`; the matching of these labels with the signed iterates of the return map is Tau
Ceti's `TauCeti.X_mul_derivative_torusWeightSeries_of_det_eq_one`. The three factors, the signs of
the iterates by orbit type and the matching of the types with these labels are Ionel–Parker,
*Gromov invariants and symplectic maps*, Lemma 3.2, (3.9) and the paragraph after (3.12),
pp. 11–13 of the arXiv version. The primitive real period, the
integer winding in `t`, the homology divisibility, the covering multiplicity and Taubes's image
multiplicity remain distinct; prove which coincide in the chosen suspension coordinates. A
logarithmic `1/m` is not a torus weight.
*Needs:* §2.1–§2.2, §10.1; SymplecticGeometry S2; HeegaardFloer §3.4; Tau Ceti
`TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero`,
`TauCeti.orbitTorusOperator`, `TauCeti.X_mul_derivative_torusWeightSeries_of_det_eq_one`.

**Checks.**
- For an elliptic `P` of rotation angle `θ ∉ 2πℚ`, `det(1 − P^k) = 2 − 2cos kθ > 0` for all `k ≥ 1`,
  so `t f′/f = Σ_(k≥1) t^k = t/(1 − t)` and `f = (1 − t)⁻¹`, the series `f_(+,0)`. For a negative
  hyperbolic `P`, `det(1 − P^k)` has sign `(−1)^(k+1)`, giving `t f′/f = t/(1 + t)` and `f = 1 + t`,
  the series `f_(+,1)`.

### 11.2 Determinant and Wang orientation comparison

Consume the canonical determinant orientation of `δ₀` and `δ_ω` and the positive target-block
comparison of §0.1. For `X = S¹_s × Y_φ` construct the map of determinant lines from this canonical
complex deformation to the specified product Hodge and Wang model. With `s`-invariant geometric data,
split the Fourier modes in `s`; prove that paired nonzero modes carry their canonical even real
complex determinant orientations, by a uniform elliptic inverse on high modes and finite paired
stabilization, without multiplying infinitely many formal signs. On the remaining `Y` block construct
the parametrized fibrewise Hodge contraction and the mapping-torus gluing to `Cone(1 − φ_#)`,
including the determinant maps of exact sequences, the real monodromy and all constant, gauge and
positive harmonic factors. For `P = φ*` on `H¹(F; ℝ)` and `A = I − P`, compare the exact sequence of
the fundamental matrix and endpoints of the periodic ODE with the finite complex of `A`. For
`ker A ≠ 0` keep its full determinant line, the Wang kernel and cokernel and `V/ker A → im A`,
generalized eigenvalue one and Jordan data included; do not choose an unproved semisimple complement
or take the sign of a zero determinant. Consume MorseNovikov Layer 4's determinant and exact-sequence
algebra and Layer 6's mapping-torus chain model; the comparison of the complex elliptic orientation
with the real Wang orientation is constructed here. When `b₁(Y) = 1`, `A` is invertible (Tau Ceti's
`TauCeti.MappingTorus.finrank_homology_one_eq_one_iff`); with the product basis `h_prod`, prove
`h_can = sgn(det(I − P)) h_prod`. Fix every boundary-order and scalar sign by these maps and the
Kähler calibration on `S¹ × S¹ × S²`: the `H¹` frame `(ds, dt)` and the `H⁰ ⊕ H⁺` frame `(1, ω_u)` are
complex-positive for the displayed `J` and `J′`; compare these frames with SeibergWittenTheory's
ordered Hodge orientation. The sign is not chosen to fit a zeta coefficient. Apply it to every
product-oriented wall value of §10.4: the canonical `C₊` point value for `c > 0`, `q > 0` is
`sgn(det(I − P)) q`, with the same factor on the allowed exterior determinant component, and the
vanishing cases are unchanged. For `b₁(Y) > 1` perform the full determinant-line transport before any
numerical identification with `ℤ`. The normalization tests are Tau Ceti's: the integral Wang torsion
order `|det(I − P)|` without fixed `H¹` (`TauCeti.MappingTorus.card_torsion_homology_one_eq_natAbs_det`),
the reciprocal-polynomial identity `p′(1) = g p(1)` for `p(t) = det(I − tP)`
(`SymplecticGroup.derivative_eval_one_charpolyRev`) and the coarse coefficients
`det(I − P)(a + 1 − g)` for `a ≥ 2g − 1` (`SymplecticGroup.coeff_coe_charpolyRev_mul_mk_one_sq`)
of `p(t)/(1 − t)²`, which for `det(I − P) = ±1` is the Gromov series of Ionel–Parker, Theorem 5.1.
Keep individual torsion labels separate before the coarse specialization. A wall difference is not a
single-chamber pullback value without a proved vanishing in the opposite chamber.
*Needs:* §0.1, §10.1–§10.4; MorseNovikov Layers 4 and 6; SeibergWittenTheory SW7.1 and SW10; Tau
Ceti `TauCeti.MappingTorus.finrank_homology_one_eq_one_iff`,
`TauCeti.MappingTorus.card_torsion_homology_one_eq_natAbs_det`,
`SymplecticGroup.derivative_eval_one_charpolyRev`, `SymplecticGroup.coeff_coe_charpolyRev_mul_mk_one_sq`.

**Checks.**
- The Anosov map `P = [[2, 1], [1, 1]]` on `T²` (Tau Ceti's `TauCeti.catMap`) has every iterate
  nondegenerate, `det(I − P) = −1` and
  `ζ(t) = (1 − 3t + t²)/(1 − t)² = 1 − t − 2t² − 3t³ − ⋯`; the canonical orientation is opposite to
  the product orientation, and the vacuum coefficient is `1`. With `g = 1` the coarse coefficients
  `det(I − P)(a + 1 − g) = −a` for `a ≥ 1` match `−1, −2, −3`. Taking `h_can = h_prod` would flip
  every sign.

### 11.3 Generic-to-block count localization and the zeta identity

Construct the common geometry of bounded-area block limits, the comparisons of determinants, local
degrees and excision, and the compatible algebra of cutoffs and orbit series, without using either
branch's SW = Gr theorem. For the minimal `b₁(Y) = 1`, `d = 0` lane use its pulled-back class and
the integral decomposition of §10.3; the `b₁(Y) > 1` lane also obtains its labels from Layer 10's
global support theorem. In both lanes use the semipositivity of `ω_v` only at the block limit, with
the integral pullback label, to identify horizontal components; nearby generic `J` need not be
semipositive, and the block `J` may have vertical fibres of negative index. Then construct two
independent generic-to-block applications: for `b₁(Y) > 1` use only the core point comparison of
§9.1 and its invariance §9.2; for the minimal pullback `b₁(Y) = 1`, `d = 0` scope use only §9.4 and
§9.5. Each proves compact constrained localization, finite exhaustion by orbit neighbourhoods,
weighted local degrees, no double counting and cutoff compatibility; neither equality is a
prerequisite of the other branch.

Use MorseNovikov Layer 1 for `H = H₁(Y; ℤ)` and `N(h) = ∫_h dt`, keeping torsion and a noninjective
period map. Choose the closed one-form `α = −dt`, so that `−α♯` is the suspension flow, with period
homomorphism `P_α(h) = ∫_h α`; then `N = −P_α`. Keep this period homomorphism distinct from the
monodromy `P = φ*` of §11.2, and construct the explicit inversion of exponents wherever the opposite
period convention is used. Construct the support-compatible series maps for each positive orbit
class. MorseNovikov Layer 5 supplies the all-iterate signed logarithm, product and integrality theorem
(in Tau Ceti, `TauCeti.NovikovSeries.orbitZeta` with `TauCeti.NovikovSeries.orbitZeta_eq_eulerProduct`
and `TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct`); prove the determinant comparison
of the torus and return normal operators before identifying its factors. For each of the two branch
applications, with its own point comparison and the orientation map of §11.2, prove the
coefficientwise integral identity of the point series with the zeta function, in the `b₁(Y) > 1` and
the minimal pullback `b₁(Y) = 1` scopes. In one variable, for the multiples of the section class
when `det(I − P) = ±1` and for the Gromov series built from Ruan–Tian invariants, the identity of
the curve series with the Lefschetz zeta function is Ionel–Parker, Theorem 0.1, proved in their §4,
and the factorization of that zeta function over periodic orbits is their (3.10). The series are
indexed by integral line and curve labels,
the canonical vacuum coefficient for `E` trivial is `+1`, and torsion labels are kept.
*Needs:* §2.3, §9.1–§9.5, §10.3, §11.1–§11.2; MorseNovikov Layers 1 and 5; Tau Ceti
`TauCeti.NovikovSeries.orbitZeta`, `TauCeti.NovikovSeries.orbitZeta_eq_eulerProduct`.

**Checks.**
- A periodic orbit of period `d` has class `h` with `N(h) = ∫_h dt = d > 0` and `P_α(h) = −d`; using
  `P_α` as the exponent without inversion would put every orbit at negative period, outside the
  finite-below support.

### 11.4 Degenerate return maps through controlled perturbations

For an arbitrary area-preserving `φ` of the closed surface, construct Hamiltonian perturbations `φ_ε`
with every iterate relevant to a prescribed cutoff nondegenerate, including relative endpoint
versions. Prove that these local return perturbations are realizable among area-preserving maps by
Hamiltonian jets and a countable Baire construction, with control of the index of compact fixed sets;
a generic perturbation of `J` alone is insufficient. Construct the suspension diffeomorphism and
isotopy and the closed symplectic forms under that perturbation, their canonical `Spinᶜ` and line
labels, period and exponent maps and orientation transport, in a fixed positive cone and chamber when
`b₂⁺ = 1`. Construct the common symplectic-family geometry and the compactness, label, cutoff and
refinement laws, and prove the deformation comparison of the count in each branch using only that
branch's point comparison (Layers 8–9) and invariance.

Compare the nondegenerate orbit expansion with the homological Lefschetz series of MorseNovikov
Layer 6's mapping-torus chain, trace and local-index theorem (§6.4). For degeneracies use the index of
compact isolated fixed sets, or Hamiltonian perturbation with neighbourhoods whose boundaries are free
of fixed points, and define the extension of the homological zeta function independently of a product
over primitive orbits. MorseNovikov supplies the homological and dynamical calculation; this roadmap
supplies its symplectic and Seiberg–Witten deformation and the comparison of local degrees of curves.
Prove independence of the perturbation and convergence of the completed series. Construct the
univariate period specialization to the homology determinant formula, and the version refined by
`H₁` only with the equivariant-lift and support hypotheses. No unrestricted pushforward of exponents
and no orientation-free integer equality is used. Keep the common Hamiltonian return, label,
orientation and homological-series construction separate from the two branch-specific deformation
adapters; each invokes only its own point comparison and invariance and gives its own degeneration
identity.
*Needs:* §11.1–§11.3; MorseNovikov Layer 6 (§6.4–§6.5); SymplecticGeometry S0–S2.

**Checks.**
- For `φ` the identity of `T²`, every point is fixed and the return map is degenerate. The
  homological Lefschetz series (Ionel–Parker, Lemma 3.1) is
  `det(I − tP)/(1 − t)² = (1 − t)²/(1 − t)² = 1` for `P = I`, so every
  nonvacuum coefficient of the specialized series vanishes; an orbit product over the degenerate
  fixed set is undefined, which is why the extension is defined homologically.

### Examples

- For the Anosov map of §11.2, `b₁(Y_φ) = 1` and the specialization of the zeta function by period
  is `1 − t − 2t² − 3t³ − ⋯`, with vacuum coefficient `1`; §11.3 identifies these coefficients with
  the point counts of `S¹ × Y_φ` specialized in the same way.

### Dependencies

Layers 0, 2 and 9–10; MorseNovikov Layers 1 and 4–6; SymplecticGeometry S0–S2; HeegaardFloer §3.4;
SeibergWittenTheory SW7 and SW10. Tau Ceti: horizontal curves and orbit tori in suspensions, the
orbit-torus normal operator, the label identities, the Wang torsion and Betti criterion, the
symplectic reciprocal polynomial, the Anosov matrix and the orbit zeta Euler product.

## Scope and ownership

**This roadmap owns** Taubes's weighted count of embedded pseudoholomorphic curves at a fixed
count-admissible `J`: the configuration space, `Exc_J` and `good_J`, the embedded normal operators and
their counting application, the admissibility of `J`, the four-twist labels from determinant signs,
the assembly of the count, bounded-window compactness with the restricted image-decomposition
adapter, the geometric input of the good-curve structure theorem and the path theorem (Layers 1–3).
It owns the canonical homology orientation from the complex deformation, charge conjugation and the
point nonvanishing (Layer 0); the plane-vortex existence theorem for every divisor, the moduli space,
the Banach gauge group, the flux identity, the Fredholm theory at a vortex and its compact-window and
weighted estimates (Layer 4); the large-`r` forward bounds, the Hermitian curvature theorem,
monotonicity, localization and the cutoff currents (Layer 5); reconstruction from positive cohomology
assignments on open tamed four-manifolds, framed charges, the physical inputs, the line bundle of the
limit, the bad-class vanishing and the point cutdowns (Layer 6); the inverse construction, from the
norms through the contraction with forcing, including the uniform large-`r` inverse, radius and cost
estimates, the `U(1)`-equivariant disc foliation with its global patching, and the flat coupling,
`J` installation and `Spinᶜ` clutching at a square-zero torus (Layer 7); exhaustiveness, the regular
constrained count and the universal divisor line with its slants (Layer 8); `SW⁰ = Gr` for `b₂⁺ > 1`
and for minimal symplectic products in the large-`r` chamber, with the choice independence that
follows (Layer 9); the product support, energy and wall application (Layer 10); and the
four-dimensional orbit localization, the comparison of the complex elliptic orientation with the
Wang orientation, the zeta identities and the degenerate return maps (Layer 11).

**Already in Tau Ceti and consumed here.** These are named in the supplier contracts below and not
planned again.

- The eight local series, their unit property, their coefficient and product expansions and the ray
  series (§2.2–§2.3).
- The intersection algebra of canonical cycles and of good cycles through generic points (§3.2,
  §6.2); the geometric hypotheses that feed them remain targets here.
- Of the plane-vortex theory (Layer 4): the real field coordinates, the equation, its linearization
  and the deformation complex pointwise; the reference fields and the affine Sobolev field spaces; the
  smooth framed gauge group and its action; the gauge-fixed operator and its formal adjoint at any
  field with their Weitzenböck formulas; the vacuum operator, its adjoint, its inverse on Schwartz
  and tempered fields and its Sobolev mapping properties; the exterior lower bound for the adjoint
  and the vanishing of its smooth `L²` kernel at a vortex; the scalar equation and the maximum
  principle; exponential decay and integrability of the modulus defect and the curvature; finite
  energy; the local factorization and finiteness of zeros; uniqueness for sections differing by a
  nowhere-vanishing factor; the reconstruction from a scalar solution and its end framing; the
  dilation laws.
- The pointwise algebra of the Seiberg–Witten equations: the Clifford map, the quadratic
  endomorphism and two-form, the sign change under charge conjugation, the Clifford projections
  `P_α`, `P_β` with `q` on the splitting, the principal symbol of `δ₀` with its complex structure
  `J′`, and the abelian deformation operator `T` (§0.1, §0.2, §5.1).
- The symplectic suspension of a surface map, its block almost complex structures, periodic tori,
  vertical area and the theorem that horizontal compact curves fill orbit tori (§10.1, §11.1), which
  implement SymplecticGeometry S0–S2.
- The kernels of the twisted orbit-torus normal operators and the matching of the four-twist labels
  with the signed iterates of the return map (§11.1).
- The chamber arithmetic of `S¹ × Y_φ` with `b₁ = 1` (§10.4); the Wang torsion order and the
  criterion `b₁(Y_φ) = 1`; the reciprocal characteristic polynomial of a symplectic matrix and the
  coarse coefficients of the Lefschetz zeta function; the numerical data of the Anosov matrix
  (§11.2); the orbit zeta function and its Euler product (§11.3), which implement part of MorseNovikov
  Layer 5.

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds
no second carrier.

- *Four-dimensional Seiberg–Witten theory*:
  [SeibergWittenTheory](../SeibergWittenTheory/README.md) SW1–SW11 (rank-four `Spinᶜ` bundles and
  determinant connections, the quadratic map and Dirac operator, the Sobolev gauge quotient,
  compactness of bounded families, universal curvature perturbations, determinant orientations, the
  charge-one point and loop classes, the full exterior-form invariant with its chamber invariance and
  signed wall theorem). The full invariant with insertions from `H₁` is SeibergWittenTheory's; the
  comparison here is point-only, except for the product application of Layer 10. Large-`r`
  concentration, vortices and `Gr` are constructed here.
- *`Spinᶜ` lifts, twists and Wu identities*: [FourManifolds](../FourManifolds/README.md) Layer 4.
  *Associated bundles, metrics and connections, integral line classes*:
  [SmoothBundlesConnections](../SmoothBundlesConnections/README.md) Layers 1–4 and 6, with the
  comparison of standard and dual-character Chern conventions. *Generic Clifford modules and Dirac
  operators*: [SpinGeometry](../SpinGeometry/README.md).
- *Generic Cauchy–Riemann and Dirac analysis, Sobolev, elliptic and Fredholm theory, determinant
  lines, implicit-function and Sard theorems*: [HeegaardFloer](../HeegaardFloer/README.md) Layer 2,
  §3.4, §4.4 and §4.6e, [IndexTheory](../IndexTheory/README.md),
  [PseudodifferentialOperators](../PseudodifferentialOperators/README.md) and
  [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) Layer 5. The embedded counting, plane
  and large-`r` applications are this roadmap's.
- *Cauchy–Riemann operators on surfaces*:
  [PseudoholomorphicCurveAnalysis](../PseudoholomorphicCurveAnalysis/README.md) §3.1 (the Hölder
  Cauchy–Green operator), §6.2–§6.3 (real Cauchy–Riemann operators on bundles over closed surfaces,
  their Fredholm, adjoint and cokernel theory) and §7.2 (Riemann–Roch with the zero count and
  vanishing theorem for line bundles).
- *Simple curves, quotients, incidence and stable-map compactness on compact targets*:
  [AnalyticStableMaps](../AnalyticStableMaps/README.md) Layers 0–3, used after the class, genus and
  component bounds of §3.1; the restricted Taubes-window image-decomposition adapter is §3.1's.
- *Smooth CW models, tubes and fundamental classes, cross, cup, cap and duality, line, Thom and
  clutching classes, forms, metrics and finite-dimensional orientation comparisons*:
  [GeometricTopology](../GeometricTopology/README.md) Layer 1,
  [AlgebraicTopology](../AlgebraicTopology/README.md) Layers 4–8,
  [CharacteristicClasses](../CharacteristicClasses/README.md) and
  [DifferentialGeometry](../DifferentialGeometry/README.md).
- *Completed group rings, determinant and exact-sequence algebra, signed iterates and local indices,
  continuation and mapping-torus Lefschetz and homological zeta functions*:
  [MorseNovikov](../MorseNovikov/README.md) Layers 1 and 4–6. The four-dimensional holomorphic
  localization and the determinant and Wang application are Layer 11's.
- *Relative Poincaré and Moser lemmas, the ambient first-jet identity and the comparison of symplectic
  normal germs*: [SymplecticGeometry/CotangentLagrangian](../SymplecticGeometry/CotangentLagrangian/README.md)
  C4. §7.36 supplies the flat coupling, the identification of full tensors, the `J` and `Spinᶜ`
  application and the finite-`r` analytic comparison.
- *Smooth symplectic suspensions, seam and block tensors and the compact horizontal-image theorem*:
  [SymplecticGeometry](../SymplecticGeometry/README.md) S0–S2. Layers 10–11 instantiate the surface
  case and construct the four-dimensional `Spinᶜ`, energy, orientation and count comparisons.
- *The metric exponential map and its natural local domains*:
  [HopfRinow](../../Completed/HopfRinow/README.md) Layers 1–2. With PseudoholomorphicCurveAnalysis
  §3.1 and HeegaardFloer §4.6e's local disc theorem with prescribed centre and first jet, these
  supply §7.8's choice of a `J`-holomorphic transverse disc foliation; the global parameter,
  equivariance and tube comparison is constructed there.

## Exact supplier contracts

### From Mathlib

- `PowerSeries`, `PowerSeries.invOfUnit` and `PowerSeries.coeff_mul`: the local series and their
  inverses and coefficient convolution (Conventions, §2.2).
- `ContinuousLinearMap.IsFredholm`: Fredholm operators between Banach spaces (§4.3, §7.27).
- `TemperedDistribution.MemSobolev`: the Bessel-potential Sobolev classes of tempered distributions
  underlying the vortex field spaces (§4.1).
- `Multiset` and `Sym`: effective divisors of degree `m` on `ℂ` and the symmetric product (§4.4).
- `MvPolynomial.psum`, `MvPolynomial.esymm` and `MvPolynomial.mul_esymm_eq_sum`: power sums,
  elementary symmetric polynomials and Newton's identities (§7.11).
- `MeasureTheory.Measure.hausdorffMeasure` and `Vitali.exists_disjoint_subfamily_covering_enlargement`:
  Hausdorff measure and the `5r` covering lemma (§5.4, §6.1, §6.1b, §7.15).
- `Matrix.charpolyRev`: `det(1 − tP)` (§11.2).
- `Circle`: the unit circle of `ℂ`, the values of gauge transformations (§4.1).

### From Tau Ceti

- **Four-twist series** (`TauCeti/Geometry/Symplectic/JHolomorphic/TorusWeight.lean`):
  `TauCeti.torusWeightSeries` (the series `f_(σ,i)`, `σ = true` for `+`), `TauCeti.torusWeight`
  (its coefficients), `TauCeti.isUnit_torusWeightSeries`, `TauCeti.coeff_prod_torusWeightSeries`
  (the coefficient of a product of local series as a sum over multiplicity distributions),
  `TauCeti.rayTorusWeightSeries`, `TauCeti.coeff_rayTorusWeightSeries` and
  `TauCeti.coeff_tprod_expand_torusWeightSeries` (the ray series through finite cutoffs). Assumed:
  exactly the series of §2.2, with integer coefficients.
- **Cycle algebra** (`JHolomorphic/CanonicalCycle.lean`, `JHolomorphic/GoodCycle.lean`):
  `TauCeti.IsCanonicalCycle` with `TauCeti.IsCanonicalCycle.mult_eq_one_of_apply_self_neg`,
  `TauCeti.IsCanonicalCycle.apply_eq_zero_of_ne`,
  `TauCeti.IsCanonicalCycle.apply_self_eq_zero_of_one_lt_mult`,
  `TauCeti.IsCanonicalCycle.apply_canonical_eq_zero_of_one_lt_mult`,
  `TauCeti.IsCanonicalCycle.apply_canonical_sum_eq_apply_self`,
  `TauCeti.IsCanonicalCycle.exists_eq_of_apply_canonical_neg`,
  `TauCeti.IsCanonicalCycle.apply_sum_eq_zero_or_eq_neg_one`; `TauCeti.IsGoodCycle` with
  `TauCeti.IsGoodCycle.singularity_eq_zero`, `TauCeti.IsGoodCycle.apply_eq_zero`,
  `TauCeti.IsGoodCycle.mult_eq_one_of_apply_self_neg`,
  `TauCeti.IsGoodCycle.apply_self_eq_zero_of_one_lt_mult`,
  `TauCeti.IsGoodCycle.apply_canonical_eq_zero_of_one_lt_mult`,
  `TauCeti.IsGoodCycle.apply_self_sub_apply_canonical_eq`, `TauCeti.IsGoodCycle.existsUnique_mem`,
  `TauCeti.IsGoodCycle.eq_empty_of_one_lt_mult`; and `TauCeti.sum_mul_apply_self_sub_apply_canonical_le`.
  Assumed: statements about a symmetric integral bilinear form and finitely many classes, whose
  hypotheses (positive multiplicities, nonnegative mutual intersections, the index inequalities, the
  exceptional-sphere conditions, the class of the cycle) are what §3.2 and §6.2 prove geometrically.
- **Pseudoholomorphic maps** (`Geometry/Symplectic/Manifold/JHolomorphic.lean`):
  `TauCeti.IsPseudoholomorphic`, for maps of almost complex manifolds (§1.1, §6.1).
- **Plane vortices** (`TauCeti/Analysis/PDE/Vortex/`): `TauCeti.Vortex.equation`,
  `TauCeti.Vortex.sectionValue`, `TauCeti.Vortex.energyDensity`, `TauCeti.Vortex.linearizedEquation`,
  `TauCeti.Vortex.linearizedEquation_gaugeDirection`, `TauCeti.Vortex.gaugeAdjoint`,
  `TauCeti.Vortex.integral_mul_gaugeAdjoint`, `TauCeti.Vortex.gaugeFixedOperator`,
  `TauCeti.Vortex.gaugeFixedAdjoint`, `TauCeti.Vortex.referenceField`, `TauCeti.Vortex.sobolevFields`,
  `TauCeti.Vortex.framedFieldSpace`, `TauCeti.Vortex.framedFieldSpace_eq`,
  `TauCeti.Vortex.framedGaugeGroup`, `TauCeti.Vortex.gaugeTransform`,
  `TauCeti.Vortex.energyDensity_gaugeTransform`, `TauCeti.Vortex.tendsto_sectionValue_gaugeTransform`,
  `TauCeti.Vortex.vacuumOperator`, `TauCeti.Vortex.vacuumAdjoint`,
  `TauCeti.Vortex.vacuumAdjoint_vacuumOperator`, `TauCeti.Vortex.integral_norm_sq_vacuumOperator`,
  `TauCeti.Vortex.temperedVacuumOperatorEquiv`, `TauCeti.Vortex.memSobolev_temperedVacuumOperator_iff`,
  `TauCeti.Vortex.exists_exterior_integral_norm_sq_gaugeFixedAdjoint_ge`,
  `TauCeti.Vortex.eq_zero_of_memLp_of_gaugeFixedAdjoint_eq_zero`,
  `TauCeti.Vortex.laplacian_log_normSq_of_equation_eq_zero`,
  `TauCeti.Vortex.exists_one_sub_normSq_le_mul_exp`, `TauCeti.Vortex.exists_abs_curvature_le_mul_exp`,
  `TauCeti.Vortex.integrable_curvature`, `TauCeti.Vortex.integrable_energyDensity`,
  `TauCeti.Vortex.exists_contDiffAt_section_eq_pow_mul`,
  `TauCeti.Vortex.finite_setOfPred_section_eq_zero`,
  `TauCeti.Vortex.exists_eq_phaseGauge_of_forall_section_eq_mul`, `TauCeti.Vortex.amplitudeField`,
  `TauCeti.Vortex.equation_amplitudeField_eq_zero_iff`,
  `TauCeti.Vortex.tendsto_sectionValue_amplitudeField_mul_inv_phase_iff`,
  `TauCeti.Vortex.coupledEquation`, `TauCeti.Vortex.coupledEquation_dilateField`,
  `TauCeti.Vortex.equation_dilateField_inv_sqrt`. Assumed: the normalization `α = 2(p + iq)`,
  `*iF_a = (1 − |α|²)/8`, the coefficient metric `|b|² + |δα|²/4` and the convention
  `∂̄_a α = (∇₁α + i∇₂α)/2`, which are those of Layer 4. `Suggested.lean` states the classification
  of §4.4 on these carriers.
- **Pointwise Seiberg–Witten algebra** (`TauCeti/Analysis/PDE/SeibergWitten/`):
  `TauCeti.SeibergWitten.quadraticEnd`, `TauCeti.SeibergWitten.quadraticEnd_map`,
  `TauCeti.SeibergWitten.quadraticEndPolar_map_map`, `TauCeti.SeibergWitten.quadraticTwoForm`,
  `TauCeti.SeibergWitten.cliffordProjection`, `TauCeti.SeibergWitten.isStarProjection_cliffordProjection`,
  `TauCeti.SeibergWitten.bivectorExterior_apply_of_cliffordProjection_apply_eq_self`,
  `TauCeti.SeibergWitten.coe_quadraticTwoForm_of_cliffordProjection_apply_eq_self`,
  `TauCeti.SeibergWitten.coe_quadraticTwoForm_add_of_cliffordProjection`,
  `TauCeti.SeibergWitten.deformationSymbol`, `TauCeti.SeibergWitten.deformationComplexStructure`,
  `TauCeti.SeibergWitten.deformationSymbol_comp_toLinearMap`,
  `TauCeti.SeibergWitten.two_inv_smul_sub_deformationComplexStructure_deformationSymbol`,
  `TauCeti.SeibergWitten.abelianDeformationOperator`. Assumed: the conventions of SeibergWittenTheory
  recorded in the Conventions above (`q = τ(ψψ*)/4`, imaginary forms indexed by real forms).
- **Suspensions and orbit tori** (`Geometry/Symplectic/Manifold/Suspension/`,
  `JHolomorphic/OrbitTorus/`): `TauCeti.SmoothMappingTorus.suspensionForm`,
  `TauCeti.SmoothMappingTorus.suspensionAlmostComplexStructure`,
  `TauCeti.SmoothMappingTorus.seamAlmostComplexStructure`,
  `TauCeti.SmoothMappingTorus.integralTopForm_mpullback_mpullback_snd_fiberForm_eq_zero_iff`,
  `TauCeti.SmoothMappingTorus.range_eq_range_orbitTorus_of_integralTopForm_eq_zero`,
  `TauCeti.orbitTorusOperator`, `TauCeti.eq_zero_of_orbitTorusOperator_eq_zero_of_antiperiodic`,
  `TauCeti.exists_ne_zero_orbitTorusOperator_eq_zero_iff_det_eq_zero`,
  `TauCeti.X_mul_derivative_torusWeightSeries_of_det_eq_one`. Assumed: `X_φ = (ℝ/ℤ)_s × Y_φ` with
  `Ω = ds ∧ dt + σ_v`, block structures with `J∂_s = T`, and the normal operator
  `∂_s + J₀∂_t + S(t)` in a unitary trivialization, as in §10.1 and §11.1.
- **Chambers, Wang torsion and zeta functions**: `TauCeti.SmoothMappingTorus.isOfFinAddOrder_two_smul_sub_sub`,
  `TauCeti.SmoothMappingTorus.apply_self_sub_apply_canonical_eq`,
  `TauCeti.SmoothMappingTorus.apply_two_smul_sub_add_mul_apply_eq`,
  `TauCeti.SmoothMappingTorus.sign_apply_two_smul_sub_add_mul_apply` (§10.4);
  `TauCeti.MappingTorus.finrank_homology_one_eq_one_iff`,
  `TauCeti.MappingTorus.card_torsion_homology_one_eq_natAbs_det`,
  `SymplecticGroup.derivative_eval_one_charpolyRev`, `SymplecticGroup.coeff_coe_charpolyRev_mul_mk_one_sq`,
  `TauCeti.catMap` (§11.2); `TauCeti.NovikovSeries.orbitZeta`,
  `TauCeti.NovikovSeries.orbitZeta_eq_eulerProduct`,
  `TauCeti.NovikovSeries.orbitZeta_eq_mapRingHom_eulerProduct` (§11.3). Assumed: the basis
  `v, t` with `⟨v, [F]⟩ = 1`, `t = [ds ∧ dt]`, `κ = (2g − 2)v` modulo torsion, and singular homology
  with integer coefficients for the Wang statements.

### From TauCetiRoadmap.SeibergWittenTheory

SW1–SW11, with the items SW1.2, SW1.4, SW3.2, SW3.4, SW4.1, SW4.4, SW4.5 (the irreducible `H^s`
configuration quotient), SW5.2–SW5.4 (weak maximum, bootstrap, compactness and the proper solution
projection), SW6.1–SW6.3 (universal regularity, reducibles and chambers, Sard–Smale), SW7.1 (the
determinant orientation with its zero-order homotopy to the ordered real `T` and complex Dirac
factors), SW7.2 (the charge-one universal line and the point class `μ`), SW7.3, SW8.2–SW8.3
(insertions, invariance and chambers), SW9–SW10 (Picard families and the signed wall formula) and
SW11.1–SW11.3 (canonical lift, twists and dimension, the symplectic interface). Assumed: the
conventions recorded above; the comparison of §0.3 is made against them.

### From TauCetiRoadmap.FourManifolds

Layer 4 (§4.1–§4.2): `Spinᶜ` lifts and twists with two-torsion, and the Wu identities.

### From TauCetiRoadmap.SmoothBundlesConnections

Layers 1–4 and 6: associated bundles, metrics, connections and gauge, integral line classes and
the classification of circle bundles by the first Chern class (§B6.2), with the dual-character
Chern–Weil convention compared to the standard one.

### From TauCetiRoadmap.SpinGeometry

Generic Clifford modules and bundles (Layers 1–3) and Dirac operators with their curvature and
Weitzenböck formulas (Layer 6).

### From TauCetiRoadmap.HeegaardFloer

Layer 2 (§2.1 sharp finite-dimensional Sard, §2.2 generic Fredholm maps, sections and determinant
lines), §3.4 (Maslov and Conley–Zehnder conventions and determinant
lines, with `CZ = −μ_RS`), §4.2 and §4.4 (local theory and transversality of `J`-holomorphic
curves), §4.6b (simple maps) and §4.6e (positive local intersections, the local disc theorem with
prescribed centre and first jet, and singular adjunction for simple curves in real four-manifolds).

### From TauCetiRoadmap.IndexTheory

Hilbert Fredholm connectors, symbol classes and the analytic index, and the Euler, signature and
Dolbeault applications (Layers 1–2 and 7), as SeibergWittenTheory consumes them.

### From TauCetiRoadmap.PseudodifferentialOperators

Global bundles, Sobolev mapping estimates, parametrices and Fredholm realizations, and changes of
order (Layers 1 and 4–7).

### From TauCetiRoadmap.ComplexKahlerGeometry

Layer 5 (§5.1 pointwise algebra and densities, §5.4 the compact-bundle Sobolev scale, §5.7
Laplace-type estimates and the real Hodge theorem).

### From TauCetiRoadmap.PseudoholomorphicCurveAnalysis

§3.1 (Cauchy and Beurling operators, the Hölder Cauchy–Green operator), Layers 4–5 (weak
pseudoholomorphic maps and bootstrapping), §6.2–§6.3 (real Cauchy–Riemann
operators on bundles over closed surfaces with their Fredholm, adjoint and cokernel theory) and §7.2
(Riemann–Roch, with the zero count and vanishing theorem for line bundles used for spheres of degree
`−1`).

### From TauCetiRoadmap.AnalyticStableMaps

Layer 0 (§0.5 normalization through a simple curve), Layer 2 (§2.9–§2.21: the generic-`J` theorems,
the smooth-`J` passage, incidence and relative families, arbitrary-target localization) and Layer 3
(§3.7 Gromov compactness), on compact targets.

### From TauCetiRoadmap.GeometricTopology

Layer 1: collars, gluing and tubular neighbourhoods (§1.5).

### From TauCetiRoadmap.AlgebraicTopology

Layers 4–8: CW models, the Künneth theorem (§5.1), cohomology with cup, cross, cap and slant
products (§6.2), orientation classes of compact subsets and fundamental classes (§6.3), duality
(§6.4) and finite CW models of smooth manifolds (§8.7).

### From TauCetiRoadmap.CharacteristicClasses

C2–C3: integral Chern, Euler and Stiefel–Whitney classes, Thom and Gysin theory and the relative
Euler classes of sections, with their Whitney-sum and normal self-intersection comparisons.

### From TauCetiRoadmap.DifferentialGeometry

Differential forms, metrics, Hodge star and currents on manifolds, and finite-dimensional orientation
comparisons.

### From TauCetiRoadmap.MorseNovikov

Layer 1 (completed group rings for `H = H₁(Y; ℤ)` with a noninjective period map), Layer 4 (§4.1
determinant lines and based torsion, exact sequences), Layer 5 (orbit multiplicities, local
indices, the zeta series and its integrality) and Layer 6 (§6.4 the mapping-torus chain, trace and
local-index theorem; §6.5 the Lefschetz signature).

### From TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian

C4: the relative Poincaré lemma, the relative first-jet Moser theorem and the comparison of
symplectic normal germs.

### From TauCetiRoadmap.SymplecticGeometry

S0–S2: the smooth symplectic suspension of a symplectomorphism, its seam-compatible block
structures and periodic images, and the compact horizontal-image theorem.

### From TauCetiRoadmap.HopfRinow

Layers 1–2: the exponential map of a smooth metric, normal neighbourhoods and their natural domains.

## References

- C. H. Taubes, *The Seiberg–Witten invariants and symplectic forms*, Math. Res. Lett. 1 (1994),
  809–822.
- C. H. Taubes, *The Seiberg–Witten and Gromov invariants*, Math. Res. Lett. 2 (1995), 221–238. Its
  unweighted definition does not specify all the torus weights of Layer 2.
- C. H. Taubes, *SW ⇒ Gr: From the Seiberg–Witten equations to pseudo-holomorphic curves*, J. Amer.
  Math. Soc. 9 (1996), 845–918, [doi:10.1090/S0894-0347-96-00211-1](https://doi.org/10.1090/S0894-0347-96-00211-1).
- C. H. Taubes, *Gr ⇒ SW: From pseudo-holomorphic curves to Seiberg–Witten solutions*, J.
  Differential Geom. 51 (1999), 203–334, [doi:10.4310/jdg/1214425068](https://doi.org/10.4310/jdg/1214425068).
- C. H. Taubes, *GR = SW: Counting curves and connections*, J. Differential Geom. 52 (1999), 453–609,
  [doi:10.4310/jdg/1214425348](https://doi.org/10.4310/jdg/1214425348).
- C. H. Taubes, *Counting pseudo-holomorphic submanifolds in dimension 4*, J. Differential Geom. 44
  (1996), 818–893, [doi:10.4310/jdg/1214459411](https://doi.org/10.4310/jdg/1214459411): the weighted
  embedded-curve invariant.
- C. H. Taubes, *Arbitrary N-vortex solutions to the first order Ginzburg–Landau equations*, Comm.
  Math. Phys. 72 (1980), 277–292, [doi:10.1007/BF01197552](https://doi.org/10.1007/BF01197552): the
  classification of plane vortices (§4.4).
- D. McDuff, *Lectures on Gromov invariants for symplectic 4-manifolds*,
  [arXiv:dg-ga/9606005](https://arxiv.org/abs/dg-ga/9606005): the modified invariant `Gr′`
  (Definition 3.2), the two-torus count (Lemma 5.1) and the eight torus series (§5.2), in the
  numbering of the arXiv version.
- E.-N. Ionel and T. H. Parker, *Gromov invariants and symplectic maps*, Math. Ann. 314 (1999),
  [arXiv:dg-ga/9703013](https://arxiv.org/abs/dg-ga/9703013): the Gromov series of a symplectic
  mapping torus and the orbit factorization of the Lefschetz zeta function (§11.1–§11.4), in the
  numbering of the arXiv version.
- S. Baldridge, *Seiberg–Witten invariants, orbifolds, and circle actions*, Trans. Amer. Math. Soc.
  355 (2003), 1669–1697, [arXiv:math/0107092](https://arxiv.org/abs/math/0107092): the energy
  identity and pullback support for circle actions (§10.2), in the numbering of the arXiv version.
