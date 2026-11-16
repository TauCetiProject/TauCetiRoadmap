# Roadmap: traces on C*-algebras and their trace ideals

**Summary.** Build the theory of traces on C*-algebras in Dixmier's sense, additive and
positively homogeneous maps `τ : B₊ → [0,∞]` with `τ(x*x) = τ(xx*)` that are typically unbounded,
on Mathlib's `NonUnitalCStarAlgebra`, its continuous functional calculus and
`LowerSemicontinuousOn`, on the von Neumann algebra theory of VonNeumannAlgebras (normal
semifinite traces, left Hilbert algebras with their canonical weights, tracial `Lᵖ`) and on the
K-theory of OperatorKTheory. Layer Tr1 develops the domain ideals `𝔫_τ ⊇ 𝔪_τ` with the linear
extension of `τ`, lower semicontinuity with Combes's theorem, Dixmier's semifiniteness, density
and matrix amplification. Layer Tr2 builds the GNS Hilbert algebra of a lower semicontinuous
trace and proves Dixmier's normal-extension theorem: a semifinite lower semicontinuous trace is
`τ̄ ∘ π_τ` for a faithful normal semifinite trace `τ̄` on `π_τ(B)''`, and these traces correspond
to the quasi-equivalence classes of normal representations. Layer Tr3 develops the trace ideals
`J_p = {b ∈ B : τ(|b|^p) < ∞}`, `1 ≤ p < ∞`, identified with `B ∩ Lᵖ(π_τ(B)'', τ̄)`: Banach
*-ideals for `‖b‖ + τ(|b|^p)^{1/p}` with Hölder's inequality, monotonicity in `p`, the endpoints
`J₁ = 𝔪_τ` and `J₂ = 𝔫_τ`, matrix amplification and the cyclic multilinear trace forms. Layer Tr4
proves that the inclusions `J_p ⊆ B` induce isomorphisms on `K₀` and `K₁`, constructs the positive
homomorphism `τ_* : K₀(B) → ℝ` of every densely defined trace, factors it through `J₁` for lower
semicontinuous traces, and proves that on AF algebras `τ ↦ τ_*` is a bijection from the densely
defined lower semicontinuous traces onto the positive homomorphisms `K₀(A) → ℝ`. The running
examples are the canonical trace on the compact operators (Schatten classes), Radon measures on
`C₀(X)` (`C₀(X) ∩ Lᵖ(μ)`), the τ-compact operators of a semifinite von Neumann algebra
(`N ∩ Lᵖ(N,τ)`) and Dixmier traces (densely defined, not lower semicontinuous, with zero pairing).
[Suggested.lean](Suggested.lean) states the Tr1–Tr3 headlines that are statable at the pinned
libraries; its docstring records which carriers the remaining statements lack.

## Scope and ownership

This roadmap owns, in four layers cited as Tr1–Tr4 (subsection `k.n` of layer Tr`k` is
Tr`k.n`):

- Tr1: traces on C*-algebras in Dixmier's sense and their faithfulness; the cone `𝔪_τ⁺`, the
  ideals `𝔫_τ` and `𝔪_τ`, the linear extension of `τ` to `𝔪_τ` with its trace property, unitary
  invariance, bounded traces as positive tracial functionals, pullback, sums and directed
  suprema; lower semicontinuity with Combes's theorem for traces; Dixmier's semifiniteness,
  density of the domain and its comparison with the Pedersen ideal; the lower semicontinuous
  regularization of a densely defined trace; the amplified traces `τ_n` on `M_n(B)`.
- Tr2: the GNS data `(H_τ, Λ_τ, π_τ, π_τᵒᵖ, J_τ)` of a trace; the Hilbert algebra `Λ_τ(𝔫_τ)` of a
  lower semicontinuous trace; the von Neumann algebra `M_τ = π_τ(B)''` with its natural trace
  `τ̄`; the normal-extension theorem `τ = τ̄ ∘ π_τ` on `B₊`, its uniqueness for densely defined
  traces and the identification `H_τ ≅ L²(M_τ, τ̄)`; normal representations and Dixmier's
  correspondence.
- Tr3: the trace ideals `J_p`, `1 ≤ p < ∞`, with their gauges and Banach *-algebra norms,
  Hölder's inequality, monotonicity, the endpoints, cyclicity, matrix amplification, the cyclic
  multilinear trace forms, and the examples of Tr3.4, including the τ-compact operators of a
  semifinite von Neumann algebra.
- Tr4: the `K₀` and `K₁` isomorphisms induced by `J_p ⊆ B`; the trace homomorphism `τ_*` of a
  densely defined trace with its comparisons; the classification of the densely defined lower
  semicontinuous traces of an AF algebra by `τ_*`.

It leaves the following to the named owners and consumes them by section.

- **VonNeumannAlgebras** owns the GNS construction of bounded positive functionals and faithful
  representations (V0), the bicommutant and Kaplansky theorems (V1), traces on finite-dimensional
  algebras (V3), normal functionals and normality (V4), normal semifinite traces
  (`IsNormalSemifiniteTrace`) with faithfulness, semifiniteness, finite-trace projection
  exhaustion and the `L²` of a faithful normal semifinite trace (V6), polar decomposition of
  closed affiliated operators (V10.ClosedOperators, V10.Affiliation), the tracial `Lᵖ(M,τ)`,
  `1 ≤ p < ∞`, with completeness, Hölder, adjoints, bounded left and right multiplication,
  `L² = GNS` and `L¹ = M_*` (V10.TracialLp), and left Hilbert algebras with their commutants,
  full closures, Tomita's theorem and canonical normal semifinite faithful weights (V11). Tr2–Tr3
  apply these to `M_τ`; nothing about von Neumann algebras is restated.
- **NoncommutativeIntegration** owns Hölder's inequality with constant one (its §1.4), the
  identification `Lᵖ(B(H), Tr) = S_p` (§1.5), and `Lᵖ`–`L^q` duality with the cyclicity of the
  trace pairing (§2.1). Exponents below `1` are not used here: the trace ideals are built for
  `1 ≤ p < ∞`.
- **CStarAlgebras** owns approximate units (C1.4), positive contractive right approximate
  identities inside algebraic left ideals (C1.5), and the compact operators and the Pedersen ideal
  `Ped(B)`, the smallest dense two-sided ideal (C1.6).
- **AmenableTracesOnCStarAlgebras** owns tracial states and the GNS data of a tracial state (its
  §§1.1 and 1.4). A bounded trace is the restriction to `B₊` of a positive tracial functional
  (Tr1.1), and Tr2.2 compares the two GNS constructions; the approximation properties of tracial
  states stay there.
- **OperatorKTheory** owns `K₀` and `K₁` (K1–K2), the pairing of a positive tracial functional
  with `K₀` and its compact-operator example (K1.5), continuity of `K₀` under inductive limits
  (K2.3), and the K-theory of dense inverse-closed subalgebras with its Banach-norm sufficient
  condition (K3.5). Tr4.1 applies K3.5 to `J_p`; Tr4.2 extends K1.5 to densely defined traces.
- **NoncommutativeGeometry** owns cyclic cocycles with their pairings with idempotents and
  invertibles (N1–N2), the Schatten-class characters of Fredholm modules (N3) and the Dixmier
  traces of `L^(1,∞)` (N4). Tr4.2 compares `τ_*` with N2's degree-zero pairing and computes it for
  Dixmier traces.
- **CStarClassification** owns AF algebras with their presentations (its Layer 2) and the unital
  comparison `T(A) ≅ S(K₀(A),[1])` (its §3.4); Tr4.3 extends the latter to densely defined lower
  semicontinuous traces on arbitrary AF algebras.
- **OperatorTheory/OperatorIdeals** owns the trace-class, Hilbert–Schmidt and Schatten families
  (its Part B), consumed in the compact-operator example.

Outside this roadmap: non-tracial weights on C*-algebras (lower semicontinuous and KMS weights)
and their modular theory, quasitraces, the topology of the cone of lower semicontinuous traces,
Cuntz comparison of positive elements, and group actions on traces.

## Conventions

- **Algebras.** `B` is a complex C*-algebra, Mathlib's `NonUnitalCStarAlgebra`, with its
  `StarOrderedRing` order; no unit, separability or simplicity is assumed. `B₊ = {x : 0 ≤ x}`.
  `B^†` is the forced unitization `Unitization ℂ B`, also for unital `B`, as in OperatorKTheory's
  `K₀` of a nonunital algebra.
- **Traces.** A trace is a map `τ : B → [0,∞]` (`ℝ≥0∞`), of which only the values on `B₊` matter,
  that is additive and positively homogeneous on `B₊` with `0·∞ = 0` and satisfies
  `τ(x*x) = τ(xx*)` for every `x ∈ B` (Dixmier 1963, Définition 2, p. 224). This is the
  convention of VonNeumannAlgebras V6's `IsNormalSemifiniteTrace`. The zero map is a trace. A trace
  is faithful if `τ(x) = 0` with `x ∈ B₊` forces `x = 0`. Witness: on `ℂ²`, `τ(a,b) = 2a + ∞·b`
  (with `∞·0 = 0`) is a trace with `𝔪_τ = ℂ ⊕ 0`; homogeneity at `c = 0` forces `τ(0) = 0` although
  `τ(0,1) = ∞`.
- **Domains.** `𝔪_τ⁺ = {x ∈ B₊ : τ(x) < ∞}`, `𝔫_τ = {x ∈ B : τ(x*x) < ∞}` and
  `𝔪_τ = span_ℂ 𝔪_τ⁺`; the linear extension of `τ` to `𝔪_τ` (Tr1.1) is again written `τ`.
  Witness: for the canonical trace on `K(ℓ²)`, `diag(1/n)` lies in `𝔫_Tr` (`Σ 1/n² < ∞`) and not in
  `𝔪_Tr` (`Σ 1/n = ∞`).
- **Lower semicontinuity, semifiniteness, density.** `τ` is lower semicontinuous if it is
  `LowerSemicontinuousOn` the set `B₊` for the norm topology. `τ` is semifinite if
  `τ(x) = sup{τ(y) : y ∈ B₊, y ≤ x, τ(y) < ∞}` for every `x ∈ B₊` (Dixmier 1963, Définition 2,
  p. 224). `τ` is densely defined if `𝔪_τ⁺` is dense in `B₊`. For lower semicontinuous traces
  density implies semifiniteness (Tr1.2), not conversely; without lower semicontinuity neither
  implies the other. Witnesses: `τ(f) = ∫₀¹ f(t) t⁻¹ dt` on `C[0,1]` is lower semicontinuous and
  semifinite but not densely defined, since every `f ∈ 𝔪_τ⁺` has `f(0) = 0`; on `c₀`, the map
  `τ(f) = Σ f(n)` for finitely supported `f ≥ 0` and `τ(f) = ∞` otherwise is a densely defined
  trace that is neither lower semicontinuous nor semifinite, since `f = (1/n²)` has `τ(f) = ∞`
  while its finitely supported minorants have trace at most `π²/6`.
- **Powers, gauges and norms.** `|b| = (b*b)^{1/2}` is Mathlib's `CFC.abs`, and `|b|^p` is
  `CFC.nnrpow (CFC.abs b) p` for `p ∈ ℝ≥0`. The trace gauge is `‖b‖_{τ,p} = τ(|b|^p)^{1/p} ∈ [0,∞]`,
  the trace ideal is `J_p = {b : ‖b‖_{τ,p} < ∞}`, and `J_p` carries the norm
  `|||b|||_p = ‖b‖ + ‖b‖_{τ,p}`. Exponents satisfy `1 ≤ p < ∞`; Hölder exponents satisfy
  `1/r = 1/p + 1/q` with `r ≥ 1`. On `M_n(B)`, `J_p` is normed through the amplified trace `τ_n`,
  not by the sum of the entry norms; the two are equivalent (Tr3.3). Witness: on `M₂(ℂ)` with
  `Tr`, `x = [[1,1],[0,0]]` has `|x|` with eigenvalues `√2` and `0`, so `‖x‖_{Tr,1} = √2`, strictly
  between its largest entry gauge `1` and the sum `2` of its entry gauges.
- **Hilbert spaces.** Inner products are conjugate-linear in the first variable. For a trace,
  `⟪Λ_τ(x), Λ_τ(y)⟫ = τ(x*y)` for `x, y ∈ 𝔫_τ`, `π_τ(a)Λ_τ(x) = Λ_τ(ax)`,
  `π_τᵒᵖ(bᵒᵖ)Λ_τ(x) = Λ_τ(xb)` and `J_τΛ_τ(x) = Λ_τ(x*)`. Witness: for `(M₂(ℂ), Tr)`,
  `⟪Λ(e₁₂), Λ(e₁₂)⟫ = Tr(e₂₁e₁₂) = 1`, `⟪Λ(e₁₁), Λ(e₁₂)⟫ = Tr(e₁₂) = 0`,
  `π_Trᵒᵖ(e₁₂ᵒᵖ)Λ(e₁₁) = Λ(e₁₂)` and `J(Λ(e₁₂)) = Λ(e₂₁)`.
- **Von Neumann algebras.** `M_τ = π_τ(B)''` is Tau Ceti's
  `VonNeumannAlgebra.adjoin (Set.range π_τ)`. Normality of a trace on a von Neumann algebra is V6's
  monotone-net condition on the strong operator topology. A normal trace satisfies the
  additivity, homogeneity, trace and normality clauses of V6's `IsNormalSemifiniteTrace`;
  semifiniteness is a separate clause.
- **K-theory.** `K₀` and `K₁` are OperatorKTheory's, with the forced unitization for nonunital
  algebras; for `J_p` they are the Banach-algebra groups of K3.5 (idempotents and invertibles of
  matrices over `J_p^†`). For a densely defined trace, `τ_*([e] − [f]) = τ_n(e) − τ_n(f)` for
  projections `e, f ∈ M_n(B)` (Tr4.2). Witness: `Tr_*` sends the class of a rank-one projection of
  `K` to `1`, and the normalized trace `Tr/n` of `M_n(ℂ)` sends it to `1/n`.

## Exact supplier contracts

### From Mathlib

At Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:

- `NonUnitalCStarAlgebra` and `CStarAlgebra` with their `StarOrderedRing` orders; the instances
  `IsSelfAdjoint.instNonUnitalContinuousFunctionalCalculus`
  (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Instances.lean`) and
  `CStarAlgebra.instNonnegSpectrumClass'`
  (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Basic.lean`).
- `CFC.abs` and `CFC.abs_nnrpow_two`
  (`Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Abs.lean`); `CFC.nnrpow` with
  its notation `a ^ (p : ℝ≥0)`, `CFC.sqrt`, `CFC.nnrpow_one` and `CFC.nnrpow_two`
  (`Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean`);
  `NonUnitalStarAlgHom.map_cfcₙ`
  (`Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Unique.lean`), which carries
  `|b|^p` along `π_τ`.
- `LowerSemicontinuousOn` (`Mathlib/Topology/Semicontinuity/Defs.lean`).
- `CStarAlgebra.approximateUnit` and `Filter.IsIncreasingApproximateUnit`
  (`Mathlib/Analysis/CStarAlgebra/ApproximateUnit.lean`).
- `PositiveContinuousLinearMap` with notation `B →P[ℂ] ℂ`
  (`Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Positive.lean`), for Combes's theorem and
  bounded traces; `PositiveLinearMap.GNS` (`Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`)
  for the bounded comparison of Tr2.2; `geometric_hahn_banach_point_closed`
  (`Mathlib/Analysis/LocallyConvex/Separation.lean`) for Combes's theorem.
- `VonNeumannAlgebra` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean`) and the strong operator
  topology through `ContinuousLinearMap.toPointwiseConvergenceCLM`, as in V6's normality predicate.
- `CStarMatrix` with its `NonUnitalCStarAlgebra`, `PartialOrder` and `StarOrderedRing` (spectral
  order) instances on square matrices (`Mathlib/Analysis/CStarAlgebra/CStarMatrix.lean`);
  `IsStarProjection` (`Mathlib/Algebra/Star/StarProjection.lean`).
- `Unitization ℂ B`; `C₀(X, ℂ)` with its `NonUnitalCStarAlgebra` instance
  (`Mathlib/Analysis/CStarAlgebra/ContinuousMap.lean`), `MeasureTheory.lintegral` and
  `MeasureTheory.MemLp` for the measure examples; `IsCompactOperator`.

Mathlib has no trace on a C*-algebra with infinite values, no GNS construction for such a trace, no
Hilbert algebra and no trace ideal.

### From Tau Ceti

At Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`:

- `NonUnitalStarAlgHom.IsNondegenerate`, `NonUnitalStarAlgHom.isNondegenerate_iff_tendsto` and
  `NonUnitalStarAlgHom.multiplierExtension`
  (`TauCeti/Analysis/CStarAlgebra/Representation/Nondegenerate.lean`): nondegeneracy of `π_τ`, its
  strong convergence along an increasing approximate unit, and the extension of a nondegenerate
  representation to multipliers.
- `VonNeumannAlgebra.adjoin` (`TauCeti/Analysis/VonNeumannAlgebra/Adjoin.lean`): the von Neumann
  algebra generated by a set of operators, the double commutant of the set and its adjoints.
- `PositiveLinearMap.toGNS` and `PositiveLinearMap.denseRange_toGNS`
  (`TauCeti/Analysis/CStarAlgebra/GNS.lean`) for the bounded comparison of Tr2.2.
- `TauCeti.OperatorIdealFamily.traceClass` and `TauCeti.OperatorIdealFamily.schatten`
  (`TauCeti/Analysis/OperatorIdeal/Family/TraceClass.lean` and `…/Family/Schatten.lean`) for the
  compact-operator examples, and `TauCeti.dixmierTrace`
  (`TauCeti/Analysis/OperatorIdeal/Family/DixmierTrace.lean`) for the Dixmier-trace check of Tr4.2.

Tau Ceti has no trace on a C*-algebra in the sense above, no Hilbert algebra and no tracial `Lᵖ`.

### From TauCetiRoadmap.VonNeumannAlgebras

- V0: GNS of positive functionals; automatic boundedness of positive functionals.
- V1: the bicommutant theorem and Kaplansky density.
- V3: the traces of finite-dimensional C*-algebras (for Tr4.3).
- V4: normal positive functionals, their equality from agreement on a strongly dense
  *-subalgebra, and normal representations; V4.Core: the canonical trace on the trace class of
  `B(H)`.
- V6: `IsNormalSemifiniteTrace`, faithfulness, semifiniteness and its equivalent forms,
  finite-trace projection exhaustion, and the `L²` of a faithful normal semifinite trace with
  `JΛ(x) = Λ(x*)` and `JMJ = M'`.
- V10.ClosedOperators and V10.Affiliation: polar decompositions in `M_τ`.
- V10.TracialLp: `Lᵖ(M,τ)` for a faithful normal semifinite trace, `1 ≤ p < ∞`, with completeness,
  Hölder, adjoints, bounded left and right multiplication, `L² = GNS` and `L¹ = M_*`.
- V11: left Hilbert algebras `𝔄`, their left von Neumann algebra `R_l(𝔄)`, their full closure `𝔄''`
  with `R_l(𝔄'') = R_l(𝔄)`, Tomita's theorem `J R_l(𝔄) J = R_l(𝔄)'` for full left Hilbert
  algebras, and the canonical normal semifinite faithful weight on `R_l(𝔄)` with
  `φ(π_l(ξ)*π_l(ξ)) = ‖ξ‖²` for left-bounded `ξ`, with its recovery theorem (Takesaki II,
  VII.2.5–VII.2.6, as cited there).

### From TauCetiRoadmap.NoncommutativeIntegration

§1.4 Hölder's inequality with constant one; §1.5 `Lᵖ(B(H), Tr) = S_p`; §2.1 `Lᵖ`–`L^q` duality and
the cyclicity `τ(xy) = τ(yx)` for `x ∈ Lᵖ`, `y ∈ L^q`, `1/p + 1/q = 1`.

### From TauCetiRoadmap.CStarAlgebras

C1.4 approximate units; C1.5 the positive contractive right approximate identities
`e_{F,δ} = b_F(δ + b_F)⁻¹`, `b_F = Σ_{x ∈ F} x*x`, inside an algebraic left ideal; C1.6 the
compact operators and the Pedersen ideal with its minimality and the identifications
`Ped(K(ℓ²))` = finite rank and `Ped(C₀(X)) = C_c(X)`.

### From TauCetiRoadmap.AmenableTracesOnCStarAlgebras

§1.1 tracial states; §1.4 the GNS data of a tracial state, with its vector trace.

### From TauCetiRoadmap.OperatorKTheory

K1–K2: `K₀`, `K₁`, the forced unitization, functoriality and Murray–von Neumann equivalence; K1.5
the pairing `τ_*` of a positive tracial functional and its compact-operator example; K2.3
continuity of `K₀` under inductive limits; K3.5: the inclusion of a dense *-subalgebra that is a
Banach algebra for a norm `|||·||| ≥ ‖·‖` with `|||xy||| ≤ C(‖x‖|||y||| + |||x|||‖y‖)` induces
isomorphisms on `K₀` and `K₁`, with the unitization normed by `|||a + λ1||| = |||a||| + |λ|`; the
Bott class `β = [p] − [p(∞)]` of `C₀(ℝ²)` from its Conventions.

### From TauCetiRoadmap.NoncommutativeGeometry

N2: the degree-zero pairing `⟨[e],[φ]⟩ = (φ#Tr)(e)` of a trace with idempotents, in its relative
unitization form, and the degree-two pairing of the Bott class; N3: the Schatten-class trace forms
of Fredholm modules; N4: Dixmier traces on `L^(1,∞)`.

### From TauCetiRoadmap.CStarClassification

Layer 2: AF algebras as closures of increasing unions of finite-dimensional C*-subalgebras, with
their presentations; §3.4: `T(A) ≅ S(K₀(A),[1])` for unital AF algebras.

### From TauCetiRoadmap.OperatorTheory

OperatorIdeals Part B: the trace class, the Hilbert–Schmidt class and the Schatten classes `S_p`,
`1 ≤ p < ∞`.

## How to read the build

Tr1 is C*-algebraic: it fixes traces, their domains, the three regularity notions and the matrix
amplification, without a Hilbert space. Tr2 turns a lower semicontinuous trace into a Hilbert
algebra and, through VonNeumannAlgebras V11, into a von Neumann algebra with a faithful normal
semifinite trace; its normal-extension theorem is the bridge that Tr3 crosses. Tr3 pulls the
tracial `Lᵖ` of VonNeumannAlgebras V10.TracialLp back along `π_τ` to obtain the trace ideals and
their norms. Tr4 feeds Tr3 into OperatorKTheory K3.5 and constructs the trace homomorphism. The
layers are sequential, except that the construction of `τ_*` in Tr4.2 uses only Tr1 (it works
for densely defined traces, lower semicontinuous or not); its comparison with `J₁` uses Tr3 and
Tr4.1. Each layer ends with its dependencies.

## Layer Tr1: traces, domains and lower semicontinuity

### 1.1 Traces and their domain ideals (Tr1.1)

Define traces and faithfulness as in Conventions (Dixmier 1963, Définition 2, p. 224). Prove
(Dixmier 1963, Lemme 3, p. 226):

- `τ` is monotone on `B₊`, and `𝔪_τ⁺` is a hereditary convex cone: `0 ≤ y ≤ x ∈ 𝔪_τ⁺` gives
  `y ∈ 𝔪_τ⁺`.
- `𝔫_τ` is a two-sided self-adjoint ideal. It is a left ideal because `x*a*ax ≤ ‖a‖²x*x`, it is
  self-adjoint by the trace identity, hence also a right ideal, and it is a subspace by
  `(x + y)*(x + y) ≤ 2(x*x + y*y)`.
- `𝔪_τ = span{y*x : x, y ∈ 𝔫_τ}` is a two-sided self-adjoint ideal with `𝔪_τ ∩ B₊ = 𝔪_τ⁺`, by
  the polarization `4y*x = Σ_{k=0}^{3} iᵏ (x + iᵏy)*(x + iᵏy)`.
- `τ` extends uniquely to a complex-linear functional on `𝔪_τ`, real on self-adjoint elements and
  nonnegative on `𝔪_τ⁺`; it satisfies `τ(xz) = τ(zx)` for `x ∈ 𝔪_τ`, `z ∈ B`, and
  `τ(y*x) = τ(xy*)` for `x, y ∈ 𝔫_τ`.
- Unitary invariance: `τ(uxu*) = τ(x)` for `x ∈ B₊` and every unitary `u` of `B^†`, by the trace
  identity at `z = x^{1/2}u*`.
- Bounded traces: `τ` is finite on `B₊` iff it is the restriction to `B₊` of a positive linear
  functional `ω` with `ω(ab) = ω(ba)`; such an `ω` is bounded (VonNeumannAlgebras V0) and is the
  positive tracial functional of OperatorKTheory K1.5. The tracial states of
  AmenableTracesOnCStarAlgebras §1.1 are the bounded traces with
  `sup{τ(x) : x ∈ B₊, ‖x‖ ≤ 1} = 1`.
- Constructions: for a star homomorphism `φ : A → B`, `τ ∘ φ` is a trace on `A`, faithful when `τ`
  is faithful and `φ` is injective; restriction to a C*-subalgebra; sums, multiples by `c ∈ [0,∞)`
  and suprema of upward directed families of traces are traces.

*Needs:* Mathlib `CFC.sqrt` and the `StarOrderedRing` order, `Unitization ℂ B`; VonNeumannAlgebras
V0 for the boundedness of positive functionals.

**Checks.**

- On `M₂(ℂ)` the positive functional `x ↦ x₁₁` is not a trace: `x = e₁₂` gives `x*x = e₂₂ ↦ 0`
  and `xx* = e₁₁ ↦ 1`. `Tr` is a trace with `𝔪_Tr = 𝔫_Tr = M₂(ℂ)`.
- For the Lebesgue trace `τ(f) = ∫ f dt` on `C₀(ℝ)`, `f(t) = (1 + t²)^{−1/2}` lies in `𝔫_τ`
  (`∫ f² = π`) and in `B₊`, but not in `𝔪_τ⁺` (`∫ f = ∞`), so `𝔪_τ ∩ B₊ = 𝔪_τ⁺` excludes it from
  `𝔪_τ`. The function `e^{−t²}` lies in `𝔪_τ⁺` (`∫ e^{−t²} = √π`) but not in
  `Ped(C₀(ℝ)) = C_c(ℝ)`, so `𝔪_τ` can be strictly larger than the Pedersen ideal.

### 1.2 Lower semicontinuity, semifiniteness and density (Tr1.2)

- Lower semicontinuity: for a lower semicontinuous trace and an increasing net `x_i → x` in
  norm, `τ(x_i) → τ(x)` (Dixmier 1963, Remarque 2, p. 225); `x ↦ τ(x*x)` and `x ↦ τ(|x|^p)` are
  lower semicontinuous on `B`, as compositions with the norm-continuous maps `x ↦ x*x` and
  `x ↦ |x|^p`.
- Combes's theorem for traces: a trace is lower semicontinuous iff
  `τ(x) = sup{ω(x) : ω ∈ B →P[ℂ] ℂ, ω ≤ τ on B₊}` for every `x ∈ B₊` (Thomsen [KMS],
  Theorem 1.1.1; Kustermans–Vaes, Theorem 1.6; both for lower semicontinuous weights, of which
  traces are a case). The supremum of continuous functions is lower semicontinuous; the converse
  separates by `geometric_hahn_banach_point_closed`.
- Density: `𝔪_τ⁺` is dense in `B₊` iff `𝔪_τ` is dense in `B` iff `𝔫_τ` is dense in `B`. Route:
  for dense `𝔫_τ`, CStarAlgebras C1.5's right approximate identity `e = e_{F,δ}` inside the left
  ideal `𝔫_τ` satisfies `e ≤ δ⁻¹b_F ∈ 𝔪_τ⁺`, and for `x ∈ B₊` the elements
  `x^{1/2}ex^{1/2} ∈ 𝔪_τ⁺` converge to `x`. A densely defined trace is finite on `Ped(B)`, since
  `𝔪_τ` is a dense two-sided ideal and `Ped(B)` is the smallest one (C1.6).
- For a lower semicontinuous trace, densely defined implies semifinite (Dixmier 1963,
  Remarque 3, pp. 227–228); the converse fails (Conventions, witness on `C[0,1]`).
- Lower semicontinuous regularization (Thomsen [WTK], Proposition 4.12): a densely defined trace
  `τ` has a densely defined lower semicontinuous trace `τ̃ ≤ τ` that dominates every lower
  semicontinuous trace below `τ`; `τ̃ = τ` iff `τ` is lower semicontinuous.
- Reduction to the closed domain: for a lower semicontinuous trace, the norm closure `I_τ` of
  `𝔪_τ` is a closed two-sided ideal, `τ` restricts to a densely defined lower semicontinuous trace
  on `I_τ`, and `τ(x) = ∞` for `x ∈ B₊ \ I_τ`.

*Needs:* Tr1.1; CStarAlgebras C1.5–C1.6; Mathlib `LowerSemicontinuousOn`, continuity of the
continuous functional calculus, `geometric_hahn_banach_point_closed`.

**Checks.**

- The `c₀` trace of Conventions is not lower semicontinuous at `f = (1/n²)`: the truncations
  `f_k` converge to `f` in norm with `τ(f_k) ≤ π²/6 < ∞ = τ(f)`. Its regularization is
  `τ̃(f) = Σ f(n)`.
- For a point `x₀` of a locally compact space `X`, the map equal to `0` on
  `{f ∈ C₀(X)₊ : f(x₀) = 0}` and to `∞` on the other positive functions is a trace; it is lower
  semicontinuous, since `{τ > s} = {f ≥ 0 : f(x₀) > 0}` is open for every `s ∈ [0,∞)`, and not
  semifinite, since a positive `f` with `f(x₀) > 0` has only minorants of trace `0` or `∞`.
- Combes's supremum needs nontracial functionals: the positive functionals below `Tr` on
  `K(ℓ²)` are `x ↦ Tr(ρx)` with `ρ` trace class and `0 ≤ ρ ≤ 1`, their supremum at `x ≥ 0` is
  `Tr(x)` (take `ρ` a finite-rank projection), and none is tracial unless `ρ = 0`, since `K(ℓ²)`
  has no nonzero positive tracial functional (OperatorKTheory K1.5).

### 1.3 Matrix amplification (Tr1.3)

For `n ≥ 1` define `τ_n(x) = Σ_i τ(x_ii)` on `M_n(B)₊`, with `M_n(B)` Mathlib's
`CStarMatrix (Fin n) (Fin n) B`. Prove that `τ_n` is a trace that is lower semicontinuous,
densely defined or faithful when `τ` is, with `𝔫_{τ_n} = M_n(𝔫_τ)` and
`𝔪_{τ_n} = M_n(𝔪_τ)` (Thomsen [WTK], Lemma 3.1 (e)–(f)); that `τ_n(x) = Σ_i τ(x_ii)` for
`x ∈ 𝔪_{τ_n}`; that `τ_{n+m}(diag(x, y)) = τ_n(x) + τ_m(y)`; and that `τ_n(uxu*) = τ_n(x)` for
unitary scalar matrices `u`. For a densely defined `τ`, every projection of `M_n(B)` lies in
`M_n(𝔪_τ)` (Thomsen [WTK], Lemma 4.11): approximate the projection `e` within `1/2` by a
self-adjoint `x ∈ 𝔪_{τ_n}`, so that `e/2 ≤ exe ∈ 𝔪_{τ_n}⁺`.

*Needs:* Tr1.1–Tr1.2; Mathlib `CStarMatrix` and its spectral order.

**Checks.**

- For `x = [[a, b], [0, 0]]`, `x*x` has diagonal entries `a*a` and `b*b`, so `x ∈ 𝔫_{τ₂}` iff
  `a, b ∈ 𝔫_τ`, while `xx*` has the single nonzero entry `aa* + bb*`.
- For `B = ℂ` and `τ = id`, `τ_n` is `Tr` on `M_n(ℂ)`, and the projection
  `[[1/2, 1/2], [1/2, 1/2]]` has `τ₂ = 1` although neither diagonal entry is `1`.

### Examples

- `K(H)` with the canonical trace: `Tr(x) = Σ_i ⟪e_i, xe_i⟫ ∈ [0,∞]` on `K(H)₊` for any Hilbert
  basis (VonNeumannAlgebras V4.Core's trace on the trace class, with value `∞` off it) is
  faithful, lower semicontinuous and densely defined, with `𝔪_Tr` the trace class and `𝔫_Tr` the
  Hilbert–Schmidt operators (OperatorIdeals Part B).
- `C₀(X)` with a positive Radon measure `μ` on a locally compact Hausdorff space: `τ_μ(f) = ∫ f dμ`
  is lower semicontinuous (Fatou), densely defined (finite on `C_c(X) = Ped(C₀(X))`), and faithful
  iff the support of `μ` is `X`.
- Bounded traces: positive tracial functionals, tracial states, and `Tr` on `M_n(ℂ)`.

### Dependencies

Mathlib `NonUnitalCStarAlgebra`, continuous functional calculus, `LowerSemicontinuousOn`,
`CStarMatrix`, `Unitization`, `geometric_hahn_banach_point_closed`; VonNeumannAlgebras V0, V4.Core;
CStarAlgebras C1.5–C1.6; AmenableTracesOnCStarAlgebras §1.1; OperatorTheory/OperatorIdeals Part B.

## Layer Tr2: the GNS Hilbert algebra and the normal extension

### 2.1 GNS data and the Hilbert algebra of a trace (Tr2.1)

For a trace `τ`, the set `N_τ = {x ∈ 𝔫_τ : τ(x*x) = 0}` is a two-sided ideal (Tr1.1). Let `H_τ`
be the completion of `𝔫_τ/N_τ` for `⟪Λ(x), Λ(y)⟫ = τ(x*y)`, with `Λ_τ : 𝔫_τ → H_τ` the quotient
map. Construct the star representation `π_τ(a)Λ(x) = Λ(ax)` with `‖π_τ(a)‖ ≤ ‖a‖`, the right
representation `π_τᵒᵖ(bᵒᵖ)Λ(x) = Λ(xb)` with `‖π_τᵒᵖ(bᵒᵖ)‖ ≤ ‖b‖` (by the trace identity), and the
conjugate-linear isometric involution `J_τΛ(x) = Λ(x*)` with `J_τπ_τ(a)J_τ = π_τᵒᵖ((a*)ᵒᵖ)`;
`π_τ(B)` and `π_τᵒᵖ(Bᵒᵖ)` commute. For a lower semicontinuous trace prove:

- `Λ_τ` is closed: if `x_k → x` in norm with `x_k ∈ 𝔫_τ` and `Λ(x_k) → ξ`, then `x ∈ 𝔫_τ` and
  `Λ(x) = ξ`, since `τ((x − x_k)*(x − x_k)) ≤ liminf_m ‖Λ(x_m) − Λ(x_k)‖²` by lower
  semicontinuity of `y ↦ τ(y*y)` (Kustermans–Vaes, Proposition 1.7, for lower semicontinuous
  weights).
- C1.5's net `e` inside `𝔫_τ` is a two-sided approximate identity for `𝔫_τ` (`𝔫_τ` is
  self-adjoint), and `Λ(ex) → Λ(x)`, `Λ(xe) → Λ(x)` for `x ∈ 𝔫_τ`: for instance
  `‖Λ(xe − x)‖² = τ(x(1 − e)²x*) ≤ τ(xx*) − τ(xex*)`, and `τ(xex*) → τ(xx*)` by lower
  semicontinuity and monotonicity. Hence `π_τ` and `π_τᵒᵖ` are nondegenerate (Tau Ceti
  `NonUnitalStarAlgHom.IsNondegenerate`).
- `𝔄_τ = Λ_τ(𝔫_τ)`, with `Λ(x)Λ(y) = Λ(xy)` and `Λ(x)♯ = Λ(x*)`, is a Hilbert algebra:
  `⟪Λ(x)♯, Λ(y)♯⟫ = ⟪Λ(y), Λ(x)⟫`, `⟪Λ(x)Λ(y), Λ(z)⟫ = ⟪Λ(y), Λ(x)♯Λ(z)⟫`, left multiplications are
  bounded, and `𝔄_τ²` is dense in `𝔄_τ` (Dixmier 1963, Définition 3, p. 229, and Lemme 5,
  pp. 230–231, where `(x, y) ↦ τ(y*x)` is the bitrace of `τ`). Its involution is isometric, so
  `𝔄_τ` is a left Hilbert algebra in V11's sense whose closed involution is `J_τ`.
- The left von Neumann algebra of `𝔄_τ` is `M_τ = π_τ(B)''`, its right von Neumann algebra is
  `π_τᵒᵖ(Bᵒᵖ)'' = M_τ'`, and `J_τ M_τ J_τ = M_τ'` (V11's Tomita theorem for the full closure of
  `𝔄_τ`, with `R_l(𝔄_τ'') = R_l(𝔄_τ)`).

*Needs:* Tr1.1–Tr1.2; CStarAlgebras C1.5; VonNeumannAlgebras V1, V11; Tau Ceti
`NonUnitalStarAlgHom.IsNondegenerate`, `VonNeumannAlgebra.adjoin`.

**Checks.**

- For `(M₂(ℂ), Tr)`, `H_Tr` is `M₂(ℂ)` with the Hilbert–Schmidt inner product, `π_Tr` is left
  multiplication, `M_Tr ≅ M₂(ℂ)` acts on the 4-dimensional `H_Tr`, and `M_Tr'` is the right
  multiplication algebra, isomorphic to `M₂(ℂ)ᵒᵖ`.
- For the Lebesgue trace on `C₀(ℝ)`, `H_τ = L²(ℝ)`, `π_τ` is multiplication, `M_τ` is the
  multiplication algebra of `L^∞(ℝ)`, equal to its commutant, and `J_τ` is complex conjugation.
- For the `c₀` trace of Conventions, `𝔫_τ` is the finitely supported sequences and
  `H_τ = ℓ²(ℕ)`, but `Λ_τ` is not closed: the truncations of `(1/n)` converge in norm and their
  images converge in `ℓ²`, while `(1/n) ∉ 𝔫_τ`.

### 2.2 The normal extension (Tr2.2)

- The natural trace: the canonical weight `τ̄` of `𝔄_τ` on `M_τ` (V11) is a faithful normal
  semifinite trace in the sense of V6's `IsNormalSemifiniteTrace`, with
  `τ̄(π_τ(x)*π_τ(x)) = τ(x*x)` for `x ∈ 𝔫_τ` (Dixmier 1963, pp. 229–230). It is tracial because the
  involution of `𝔄_τ` is isometric: for a left-bounded `ξ` of the full closure, `J_τξ` is
  left-bounded with `π_l(J_τξ) = π_l(ξ)*`, so `τ̄(TT*) = ‖J_τξ‖² = ‖ξ‖² = τ̄(T*T)` for
  `T = π_l(ξ)`, and `T ∈ 𝔫_τ̄` iff `T* ∈ 𝔫_τ̄`.
- Normal extension theorem: for a semifinite lower semicontinuous trace, `τ̄(π_τ(x)) = τ(x)` for
  every `x ∈ B₊` (Dixmier 1963, Lemme 7, pp. 231–232, and Proposition 2 (i), p. 233).
  Consequently `τ` is faithful iff `π_τ` is injective, and
  `τ(f(x*x)) = τ(f(xx*))` for every continuous `f : [0,∞) → [0,∞)` with `f(0) = 0` (polar
  decomposition in `M_τ`, V10.ClosedOperators), in particular `τ(|x|^p) = τ(|x*|^p)`.
- Uniqueness: if `τ` is densely defined and lower semicontinuous, `τ̄` is the only normal
  semifinite trace `θ` on `M_τ` with `θ ∘ π_τ = τ` on `B₊`, and more generally two normal
  semifinite traces on `π(B)''` that agree with `τ` along a nondegenerate representation `π`
  agree on `π(B)''₊`. Route: C1.5's net `e_{F,δ}` inside `𝔪_τ⁺` increases
  with `F` and as `δ` decreases (`t ↦ t(δ + t)⁻¹` is operator monotone and decreasing in `δ`) and
  is an approximate unit of `B`, so `π_τ(e) ↑ 1` strongly; normality and the trace property give
  `θ(T) = sup_e θ(π_τ(e)^{1/2}Tπ_τ(e)^{1/2})` for `T ∈ M_τ₊`; for fixed `e` the functionals
  `T ↦ θ(π_τ(e)^{1/2}Tπ_τ(e)^{1/2})` and `T ↦ τ̄(π_τ(e)^{1/2}Tπ_τ(e)^{1/2})` are normal, bounded by
  `τ(e)‖T‖`, and agree on `π_τ(B)`, hence on `M_τ` (V1, V4).
- `L²`: `Λ_τ(x) ↦ Λ_τ̄(π_τ(x))` extends to a unitary `H_τ ≅ L²(M_τ, τ̄)` intertwining the left and
  right actions and the conjugations (V6, V10.TracialLp `L² = GNS`, V11's recovery theorem).
- Bounded comparison: for a positive tracial functional `ω`, `(H_ω, π_ω)` is Mathlib's
  `PositiveLinearMap.GNS` with its representation, and `ω̄` is the normal extension of `ω` to
  `M_ω`; for a tracial state of a unital algebra it is the vector trace of
  AmenableTracesOnCStarAlgebras §1.4.

*Needs:* Tr2.1; VonNeumannAlgebras V1, V4, V6, V10.ClosedOperators, V10.TracialLp, V11;
CStarAlgebras C1.5; Mathlib `PositiveLinearMap.GNS`, `NonUnitalStarAlgHom.map_cfcₙ` and the
order lemmas of the continuous functional calculus.

**Checks.**

- Semifiniteness is needed: for the trace of Tr1.2 that is `0` or `∞` according to `f(x₀)`,
  `𝔫_τ = {f : f(x₀) = 0}` and `τ(f*f) = 0` there, so `H_τ = 0`, `τ̄ = 0` and
  `τ̄(π_τ(f)) = 0 ≠ ∞ = τ(f)` when `f(x₀) > 0`.
- Lower semicontinuity is needed: for the `c₀` trace, `M_τ = ℓ^∞(ℕ)` on `ℓ²(ℕ)`, `τ̄` is the
  counting sum, and `τ̄(π_τ(f)) = π²/6 ≠ ∞ = τ(f)` for `f = (1/n²)`.
- Density is not needed: for `τ(f) = ∫₀¹ f(t)t⁻¹dt` on `C[0,1]`, `H_τ = L²([0,1], t⁻¹dt)`,
  `M_τ = L^∞[0,1]` by multiplication, `τ̄(g) = ∫₀¹ g(t)t⁻¹dt`, and `τ̄(π_τ(1)) = ∞ = τ(1)`.
- For `(K(ℓ²), Tr)`, `H_Tr` is the Hilbert–Schmidt operators, `M_Tr = B(ℓ²)` and `τ̄` is the
  canonical trace on `B(ℓ²)₊`.

### 2.3 Normal representations (Tr2.3)

A normal representation of `B` is a pair `(π, θ)` of a nondegenerate representation `π` of `B` on
a Hilbert space and a faithful normal trace `θ` on `π(B)''` such that `π(B) ∩ 𝔪_θ` generates
`π(B)''` as a von Neumann algebra, which makes `θ` semifinite (Dixmier 1963, p. 232); `(π, θ)`
and `(π', θ')` are quasi-equivalent if a star isomorphism `Φ : π(B)'' → π'(B)''` satisfies
`Φ ∘ π = π'` and `θ' ∘ Φ = θ` (Dixmier 1963, p. 233). Prove:

- for a nondegenerate `π` and a normal semifinite trace `θ` on `π(B)''`, `θ ∘ π` is a lower
  semicontinuous trace on `B`, because `θ` is the supremum of the bounded normal functionals
  `T ↦ θ(eTe)` over its finite-trace projections `e` (V6's exhaustion); `θ ∘ π` is semifinite when
  `π` maps a self-adjoint two-sided ideal `I` of `B` into `𝔫_θ` with strongly dense image in
  `π(B)''` (Dixmier 1963, Lemme 4, pp. 228–229, states this with `𝔪_θ` in place of `𝔫_θ`; apply it
  to `I² = span{xy : x, y ∈ I}`, which maps into `span 𝔫_θ𝔫_θ = 𝔪_θ` and has the same norm
  closure as `I` by Remarque 4, p. 228, so that its image is still strongly dense);
- `(π_τ, τ̄)` is a normal representation for every semifinite lower semicontinuous `τ`, and
  `τ ↦ [(π_τ, τ̄)]` is a bijection from the semifinite lower semicontinuous traces onto the
  quasi-equivalence classes of normal representations, with inverse `(π, θ) ↦ θ ∘ π` (Dixmier
  1963, Proposition 2 and its Corollaire, p. 233).
- Amplification: for a semifinite lower semicontinuous `τ`, the amplified trace `τ_n` of Tr1.3 is
  `(τ̄ ⊗ Tr) ∘ (π_τ ⊗ id)` on `M_n(B)₊`, where `τ̄ ⊗ Tr(T) = Σ_i τ̄(T_ii)` is a faithful normal
  semifinite trace on `M_n(M_τ)`; the ideal `M_n(𝔫_τ)` maps into `𝔫_{τ̄⊗Tr}` with strongly dense
  image, so `τ_n` is semifinite by the first item.

*Needs:* Tr2.2; VonNeumannAlgebras V1, V4, V6.

**Checks.**

- The amplification `(π_τ ⊕ π_τ, T ⊕ T ↦ τ̄(T))` is quasi-equivalent to `(π_τ, τ̄)` and induces
  `τ`, while `(π_τ, 2τ̄)` induces `2τ` and is not quasi-equivalent to `(π_τ, τ̄)` when `τ ≠ 0`.

### Dependencies

Tr1; VonNeumannAlgebras V1, V4, V6, V10.ClosedOperators, V10.TracialLp, V11; CStarAlgebras C1.5;
AmenableTracesOnCStarAlgebras §1.4; Tau Ceti `NonUnitalStarAlgHom.IsNondegenerate`,
`VonNeumannAlgebra.adjoin`; Mathlib `PositiveLinearMap.GNS`, `NonUnitalStarAlgHom.map_cfcₙ`.

## Layer Tr3: trace ideals

Throughout, `τ` is a semifinite lower semicontinuous trace and `1 ≤ p < ∞`.

### 3.1 The trace ideals and their norms (Tr3.1)

- Identification: `b ∈ J_p` iff `π_τ(b) ∈ Lᵖ(M_τ, τ̄)`, and `‖π_τ(b)‖_p = ‖b‖_{τ,p}`, because
  `|π_τ(b)|^p = π_τ(|b|^p)` (`NonUnitalStarAlgHom.map_cfcₙ`) and `τ̄ ∘ π_τ = τ` on `B₊` (Tr2.2).
- Consequently `J_p` is a two-sided self-adjoint ideal of `B` and of `B^†`, `‖·‖_{τ,p}` is a
  seminorm on `J_p` and a norm when `τ` is faithful, `‖b*‖_{τ,p} = ‖b‖_{τ,p}`, and
  `‖abc‖_{τ,p} ≤ ‖a‖‖b‖_{τ,p}‖c‖` for `a, c ∈ B^†` (V10.TracialLp's bimodule bounds through the
  unital extension of `π_τ` to `B^†`).
- `(J_p, |||·|||_p)` is a Banach *-algebra with isometric involution, and
  `|||ab|||_p ≤ ‖a‖·|||b|||_p`, `|||ab|||_p ≤ |||a|||_p·‖b‖`. Completeness route: a
  `|||·|||_p`-Cauchy sequence `(b_k)` converges in `B` to some `b`; lower semicontinuity of
  `y ↦ τ(|y|^p)` (Tr1.2) gives `τ(|b − b_k|^p) ≤ liminf_m τ(|b_m − b_k|^p)`, so `b ∈ J_p` and
  `‖b − b_k‖_{τ,p} → 0`. For `N ∩ L¹(N, τ)` with the norm `‖x‖ + τ(|x|)` this is
  Hochs–Kaad–Schemaitat, §6.2.
- `𝔪_τ ⊆ J_p`, since `τ(x^p) ≤ ‖x‖^{p−1}τ(x)` on `𝔪_τ⁺`; `J_p` is dense in `B` iff `τ` is densely
  defined (a dense `J_p` puts `|b|^p ∈ 𝔪_τ⁺` for a dense set of `b`).

*Needs:* Tr1.2, Tr2.2; VonNeumannAlgebras V10.TracialLp; Mathlib `NonUnitalStarAlgHom.map_cfcₙ`.

### 3.2 Hölder, monotonicity, endpoints and cyclicity (Tr3.2)

- Hölder: for `1/r = 1/p + 1/q` with `r ≥ 1`, `J_pJ_q ⊆ J_r` and
  `‖ab‖_{τ,r} ≤ ‖a‖_{τ,p}‖b‖_{τ,q}` (V10.TracialLp; NoncommutativeIntegration §1.4).
- Monotonicity: for `p ≤ q`, `τ(|b|^q) ≤ ‖b‖^{q−p}τ(|b|^p)` (this holds for every trace), so
  `J_p ⊆ J_q` with `‖b‖_{τ,q} ≤ ‖b‖^{1−p/q}‖b‖_{τ,p}^{p/q}` and `|||b|||_q ≤ 2|||b|||_p` (weighted
  arithmetic–geometric mean inequality).
- Endpoints: `J₂ = 𝔫_τ` with `‖b‖_{τ,2} = ‖Λ_τ(b)‖`, for every trace, since `|b|² = b*b`
  (`CFC.abs_nnrpow_two`); `J₁ = 𝔪_τ`, with `|τ(b)| ≤ ‖b‖_{τ,1}` for the linear extension. Route
  for `J₁ ⊆ 𝔪_τ`: `J₁` is self-adjoint, so the real and imaginary parts of `b ∈ J₁` lie in `J₁`,
  and a self-adjoint `h ∈ J₁` has `τ(h₊) + τ(h₋) = τ(|h|) < ∞`.
- Cyclicity: `τ(ab) = τ(ba)` for `a ∈ J_p`, `b ∈ J_q`, `1/p + 1/q = 1` (NoncommutativeIntegration
  §2.1 through Tr3.1), and for `a ∈ J₁`, `b ∈ B^†` (Tr1.1).

*Needs:* Tr3.1; VonNeumannAlgebras V10.TracialLp; NoncommutativeIntegration §§1.4, 2.1.

**Checks.**

- For `(K(ℓ²), Tr)`, `diag(1/n) ∈ J₂ \ J₁`, and `diag(n^{−1/p}) ∈ J_q` iff `q > p`.
- For the Lebesgue trace on `C₀(ℝ)`, `a = (1 + t²)^{−1/2} ∈ J₂ \ J₁` and
  `a² = (1 + t²)^{−1} ∈ J₁` with `‖a²‖_{τ,1} = π = ‖a‖_{τ,2}²`, equality in Hölder's inequality
  for `p = q = 2`.
- `‖·‖_{τ,p}` alone does not make `J_p` complete: on `C₀(ℝ)` the `‖·‖_{τ,1}`-completion of `J₁` is
  `L¹(ℝ)`, which is not contained in `C₀(ℝ)`; the C*-norm term of `|||·|||_p` keeps the limits in
  `B`. On `K(ℓ²)` the two norms are equivalent, since `‖T‖ ≤ ‖T‖_{S_p}`.

### 3.3 Matrices and multilinear trace forms (Tr3.3)

- `J_p(M_n(B), τ_n) = M_n(J_p(B, τ))` with
  `‖x_ij‖_{τ,p} ≤ ‖x‖_{τ_n,p} ≤ Σ_{i,j} ‖x_ij‖_{τ,p}`. Route: the matrix units `e_ij ∈ M_n(B^†)`
  give `x_ij ⊗ e_ij = e_ii x e_jj` and `‖y ⊗ e_ij‖_{τ_n,p} = ‖y‖_{τ,p}`. In the von Neumann algebra
  case the identification is not isometric (Hochs–Kaad–Schemaitat, §6.3).
- For every `n`, `(M_n(J_p), |||·|||_{τ_n,p})` satisfies `|||xy||| ≤ ‖x‖·|||y|||` and
  `|||xy||| ≤ |||x|||·‖y‖`, and its unitization is inverse-closed in `M_n(B^†)`: if `1 + j` with
  `j ∈ M_n(J_p)` is invertible in `M_n(B^†)`, then `(1 + j)⁻¹ = 1 − j(1 + j)⁻¹ ∈ 1 + M_n(J_p)`.
- Multilinear forms: for `m ≥ 0` and `p ≤ m + 1`, the product of `m + 1` elements of `J_p` lies in
  `J₁`, and `(a₀, …, a_m) ↦ τ(a₀a₁⋯a_m)` is a bounded `(m+1)`-linear form on `J_p` with
  `|τ(a₀⋯a_m)| ≤ Π_i ‖a_i‖_{τ,m+1}` and `τ(a_m a₀ ⋯ a_{m−1}) = τ(a₀ ⋯ a_m)` (monotonicity
  `J_p ⊆ J_{m+1}`, Hölder with all exponents `m + 1`, and the cyclicity of Tr3.2). For `B = K(H)`
  and `τ = Tr` these are the Schatten-class trace forms used in NoncommutativeGeometry N3.

*Needs:* Tr1.3, Tr3.1–Tr3.2.

**Checks.**

- The witness `x = [[1, 1], [0, 0]]` of Conventions has `‖x‖_{Tr,1} = √2` against entry gauges
  `1, 1, 0, 0`, so neither matrix bound is an equality.
- For `m = 1` and `p = 2` on `(K(ℓ²), Tr)`, `(a₀, a₁) ↦ Tr(a₀a₁)` is the Hilbert–Schmidt pairing
  `⟪a₀*, a₁⟫`. The bound `p ≤ m + 1` is needed: `a₀ = a₁ = diag(n^{−1/2})` lies in `S_3`, and
  `a₀a₁ = diag(1/n)` is not trace class.

### 3.4 Examples (Tr3.4)

- Compact operators: for `B = K(H)` and `τ = Tr`, `M_τ = B(H)`, `τ̄ = Tr`, and `J_p = S_p`
  (NoncommutativeIntegration §1.5; OperatorIdeals Part B), with `J₁` the trace class and `J₂` the
  Hilbert–Schmidt operators; `|||·|||_p` is equivalent to the Schatten norm.
- Radon measures: for `B = C₀(X)` and `τ_μ`, `M_τ` is the multiplication algebra of `L^∞(X, μ)` on
  `L²(X, μ)`, `τ̄(g) = ∫ g dμ`, and `J_p = C₀(X) ∩ Lᵖ(μ)` with `‖f‖_{τ,p} = ‖f‖_{Lᵖ(μ)}`.
- τ-compact operators: for a von Neumann algebra `N` with a faithful normal semifinite trace `τ`
  (V6), let `K_N` be the norm closure of the two-sided ideal of `N` generated by the projections of
  finite trace (Kaad–Nest–Rennie, Definition 6.1). Prove that `K_N` is a σ-weakly dense closed
  two-sided ideal of `N`; that `τ` restricted to `(K_N)₊` is a faithful densely defined lower
  semicontinuous trace (lower semicontinuity from `τ(x) = sup_e τ(exe)` over the finite-trace
  projections `e`, by normality and V6's exhaustion); that its GNS representation is the left
  action of `K_N` on V6's `L²(N, τ)`, with `M_τ = N` and `τ̄ = τ`; and that
  `J_p(K_N) = N ∩ Lᵖ(N, τ)`, because `x ∈ N` with `τ(|x|^p) < ∞` is the norm limit of
  `x·1_{[ε,∞)}(|x|)`, whose spectral projection has trace at most `ε^{−p}τ(|x|^p)`. In particular
  `J₁(K_N)` with `|||x|||₁ = ‖x‖ + τ(|x|)` is the trace ideal of Hochs–Kaad–Schemaitat, §6.2.
- Bounded traces: `J_p = B`, with `|||·|||_p` equivalent to `‖·‖`.

*Needs:* Tr3.1–Tr3.3; VonNeumannAlgebras V1, V6, V10.TracialLp; NoncommutativeIntegration §1.5;
OperatorTheory/OperatorIdeals Part B.

### Dependencies

Tr1–Tr2; VonNeumannAlgebras V1, V6, V10.TracialLp; NoncommutativeIntegration §§1.4–1.5, 2.1;
OperatorTheory/OperatorIdeals Part B; Mathlib `CFC.abs`, `CFC.nnrpow`, `CStarMatrix`.

## Layer Tr4: K-theory

### 4.1 K-theory of trace ideals (Tr4.1)

For a densely defined lower semicontinuous trace and `1 ≤ p < ∞`, `(J_p, |||·|||_p)` is a dense
*-subalgebra of `B` meeting OperatorKTheory K3.5's sufficient condition with `C = 1`, at every
matrix size (Tr3.1, Tr3.3). Prove:

- the inclusion induces isomorphisms `K₀(J_p) ≅ K₀(B)` and `K₁(J_p) ≅ K₁(B)`;
- for `1 ≤ p ≤ q < ∞` the inclusion `J_p ⊆ J_q` induces isomorphisms on `K₀` and `K₁`, compatible
  with the inclusions into `B`.

*Needs:* Tr3.1, Tr3.3; OperatorKTheory K1–K2, K3.5.

**Checks.**

- For `(K(ℓ²), Tr)`, `K₀(S_p) ≅ K₀(K) ≅ ℤ` and `K₁(S_p) = 0`.
- For the Lebesgue trace on `C₀(ℝ)`, the Cayley unitary `u(t) = (t − i)/(t + i)` of `C₀(ℝ)^†`
  generates `K₁(C₀(ℝ)) ≅ ℤ`, and `|u − 1| = 2(1 + t²)^{−1/2}` lies in `J_p` exactly for `p > 1`;
  for `p = 1` a generator of `K₁(J₁)` is `exp(2πiφ)` with `φ` continuous, equal to `0` near `−∞`
  and to `1` near `+∞`, for which `exp(2πiφ) − 1` has compact support.

### 4.2 The trace homomorphism (Tr4.2)

For a densely defined trace `τ`, lower semicontinuous or not (Thomsen [WTK], §4):

- `𝔪_τ^† = 𝔪_τ + ℂ1 ⊆ B^†` carries `τ^†(x + λ1) = τ(x) + λ`; every projection of `M_n(B^†)` is
  Murray–von Neumann equivalent in `M_n(B^†)` to a projection of `M_n(𝔪_τ^†)` (Lemma 4.10);
  `τ^†_*([e] − [f]) = τ^†_n(e) − τ^†_n(f)` for projections `e, f` of `M_n(𝔪_τ^†)` is a well-defined
  homomorphism `K₀(B^†) → ℝ` (Theorem 4.2, with Corollary 4.7 and Lemma 4.9), and `τ_*` is its
  restriction to `K₀(B) = ker(K₀(B^†) → K₀(ℂ))`.
- `τ_*([e] − [f]) = τ_n(e) − τ_n(f)` for projections `e, f ∈ M_n(B)` (formula (4.1), with
  Lemma 4.11); `τ_*` is positive on `K₀(B)₊`, and `τ_*[e] > 0` for every nonzero projection
  `e ∈ M_n(B)` when `τ` is faithful.
- Comparisons: (a) for a bounded trace, `τ_*` is OperatorKTheory K1.5's pairing of the positive
  tracial functional `τ`; (b) `τ_* = τ̃_*` for the lower semicontinuous regularization (Thomsen
  [WTK], Proposition 4.12); (c) for a lower semicontinuous `τ`, `τ_* = τ^{J₁}_* ∘ (ι_*)⁻¹`, where
  `ι : J₁ → B` is the inclusion of Tr4.1 and `τ^{J₁}_*` pairs the bounded trace `τ : J₁ → ℂ` with
  the idempotents of `M_n(J₁^†)`, which is NoncommutativeGeometry N2's degree-zero pairing in its
  relative unitization form; (d) naturality: `(τ ∘ φ)_* = τ_* ∘ φ_*` for a star homomorphism
  `φ : A → B` such that `τ ∘ φ` is densely defined; (e) `(τ + σ)_* = τ_* + σ_*` and
  `(cτ)_* = c·τ_*` for `c ∈ [0,∞)`; (f) `(τ_n)_* ∘ j_* = τ_*` for the corner embedding
  `j : B → M_n(B)`.

*Needs:* Tr1.1–Tr1.3; Tr3.2 and Tr4.1 for (c); OperatorKTheory K1–K2, K1.5; NoncommutativeGeometry
N2.

**Checks.**

- For `(K, Tr)`, `Tr_*[e] = 1` for a rank-one projection, so `Tr_*` is the inclusion
  `K₀(K) ≅ ℤ ⊆ ℝ`, as in OperatorKTheory K1.5's compact-operator example.
- Dixmier traces: for a Dixmier trace `Tr_ω` of NoncommutativeGeometry N4 (Tau Ceti
  `TauCeti.dixmierTrace`), the map equal to `Tr_ω` on the positive elements of `L^(1,∞)` and to
  `∞` on the other positive compact operators is a densely defined trace vanishing on finite-rank
  projections; hence `(Tr_ω)_* = 0` and its lower semicontinuous regularization is `0` (Thomsen
  [WTK], §4.2), although `Tr_ω ≠ 0`.
- For `(C₀(X), τ_μ)`, `τ_*[e] = ∫_X rank e(x) dμ(x)` for a projection `e ∈ M_n(C₀(X))`, which has
  compact support. For `X = ℝ²` with Lebesgue measure and the Bott class `β = [p] − [p(∞)]`,
  `τ_*(β) = 0`: a homotopy of `p` near `∞` gives a projection `q` with `[q] = [p]` and `q = p(∞)`
  outside a compact set, so `q − p(∞)` has entries in `C_c(ℝ²) ⊆ 𝔪_τ`, and
  `τ_*(β) = ∫ (Tr q(x) − Tr p(∞)) dx = 0` because both pointwise traces are `1`.
  NoncommutativeGeometry N2's degree-two cocycle pairs `β` to `1`; the degree-zero trace does not
  see it.
- `τ_*` does not determine `τ` in general: `K₀(C₀(ℝ)) = 0`, so `(τ_μ)_* = 0` for every Radon
  measure `μ` on `ℝ`.

### 4.3 AF algebras (Tr4.3)

For an AF algebra `A` (CStarClassification Layer 2), prove that `τ ↦ τ_*` is a bijection from the
densely defined lower semicontinuous traces on `A` onto the positive homomorphisms `K₀(A) → ℝ`
(Thomsen [KMS], Appendix D.1.2, Lemmas D.1.14–D.1.15): surjectivity by gluing, along an increasing
approximate unit of projections `p_n`, the bounded traces of the unital AF corners `p_nAp_n` given
by CStarClassification §3.4, as `τ(a) = sup_n τ_n(p_n a p_n)`; injectivity because a lower
semicontinuous trace on an AF algebra is determined by its values on projections. For unital `A`
the bijection restricts, under `τ_*[1] = 1`, to CStarClassification §3.4's
`T(A) ≅ S(K₀(A),[1])`.

*Needs:* Tr4.2; CStarClassification Layer 2 and §3.4; OperatorKTheory K2.3; VonNeumannAlgebras V3.

**Checks.**

- `K` is AF with `K₀(K) = ℤ`; the positive homomorphisms `k ↦ ck`, `c ≥ 0`, are the pairings of the
  traces `c·Tr`.
- The stabilized CAR algebra `M_{2^∞} ⊗ K` has `K₀ = ℤ[1/2]` with its usual order; its positive
  homomorphisms `x ↦ cx`, `c ≥ 0`, are the pairings of the multiples of `τ_CAR ⊗ Tr`.
- Outside AF algebras injectivity fails, by the `C₀(ℝ)` check of Tr4.2.

### Dependencies

Tr1–Tr3; OperatorKTheory K1–K2, K1.5, K2.3, K3.5; NoncommutativeGeometry N2, N4;
CStarClassification Layer 2 and §3.4; VonNeumannAlgebras V3; Tau Ceti `TauCeti.dixmierTrace`.

## Downstream consumers

None of the following supplies anything to this roadmap beyond the contracts above; they are the
roadmaps whose statements this one extends, and which can consume it.

- NoncommutativeGeometry: the trace forms of N3 are the case `(K(H), Tr)` of Tr3.3, and Tr4.2 (c)
  identifies `τ_*` with N2's degree-zero pairing on `J₁`; Tr3–Tr4 supply the trace-relative
  versions of these for an arbitrary semifinite lower semicontinuous trace.
- OperatorKTheory: K1.5's compact-operator example is the case `(K, Tr)` of Tr4.2.
- CStarClassification: §3.4 is the unital normalized case of Tr4.3.
- AmenableTracesOnCStarAlgebras: tracial states are the bounded normalized traces of Tr1.1, and
  their GNS data are the bounded case of Tr2.2.

## References

- Jacques Dixmier, *Traces sur les C*-algèbres*, Ann. Inst. Fourier (Grenoble) 13 (1963),
  219–262, [Numdam](https://www.numdam.org/item/AIF_1963__13_1_219_0). Chapitre I: Définition 2,
  p. 224 (traces, faithfulness, semifiniteness; Tr1.1–Tr1.2); Remarque 2, p. 225 (lower
  semicontinuity along increasing nets; Tr1.2); Lemme 3, p. 226 (the ideals `𝔫` and `𝔪`, the linear
  extension and its trace property; Tr1.1); Remarque 3, pp. 227–228 (density implies
  semifiniteness for lower semicontinuous traces, with counterexamples on `C[0,1]`; Tr1.2);
  Remarque 4 and Lemme 4, pp. 228–229 (`𝔪` and `𝔪²` have the same closure; traces `θ ∘ π`;
  Tr2.3); Définition 3, p. 229, and pp. 229–230 (bitraces, their Hilbert algebras,
  representations and natural traces; Tr2.1–Tr2.2); Lemme 5,
  pp. 230–231, and Lemmes 6–7, pp. 231–232 (Tr2.1–Tr2.2); Proposition 1 and the definition of
  normal representations, p. 232; quasi-equivalence, Proposition 2 and its Corollaire, p. 233
  (Tr2.2–Tr2.3).
- [WTK] Klaus Thomsen, *On weights, traces and K-theory*,
  [arXiv:2211.03172](https://arxiv.org/abs/2211.03172), version of 15 March 2024: Lemma 3.1 (e)–(f)
  (Tr1.3); Theorem 4.2 with Corollary 4.7, Lemmas 4.9–4.11 and formula (4.1) (Tr4.2);
  Proposition 4.12 (Tr1.2, Tr4.2); §4.2, compact operators and Dixmier traces (Tr4.2).
- [KMS] Klaus Thomsen, *An introduction to KMS weights*,
  [arXiv:2204.01125](https://arxiv.org/abs/2204.01125), version of December 2023: Theorem 1.1.1,
  Combes's theorem (Tr1.2); Appendix D.1.2, Lemmas D.1.14–D.1.15, traces on AF algebras (Tr4.3).
- Johan Kustermans and Stefaan Vaes, *Weight theory for C*-algebraic quantum groups*,
  [arXiv:math/9901063](https://arxiv.org/abs/math/9901063): Theorem 1.6, Combes's theorem
  (Tr1.2); Proposition 1.7, closedness of the GNS map and nondegeneracy of the GNS representation
  of a lower semicontinuous weight (Tr2.1); Definition 2.10 and Proposition 2.22,
  the normal extension of a weight, faithful for KMS weights, of which traces are the case of the
  trivial flow (Tr2.2).
- Peter Hochs, Jens Kaad and André Schemaitat, *Algebraic K-theory and a semifinite
  Fuglede–Kadison determinant*, Ann. K-Theory 3 (2018), 193–206,
  [arXiv:1608.07395](https://arxiv.org/abs/1608.07395): §6.2, the trace ideal `L¹_τ(N)` of a
  semifinite von Neumann algebra with the norm `‖x‖ + τ(|x|)`, and §6.3, its matrix amplification,
  isomorphic but not isometric (Tr3.1, Tr3.3–Tr3.4).
- Jens Kaad, Ryszard Nest and Adam Rennie, *KK-theory and spectral flow in von Neumann algebras*,
  [arXiv:math/0701326](https://arxiv.org/abs/math/0701326): Definition 6.1, the τ-compact
  operators, and §6, the homomorphism `τ_* : K₀(K_N) → ℝ` (Tr3.4, Tr4.2).
- John Roe, [*Lectures on K-Theory and Operator
  Algebras*](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/1/4020/files/2017/12/KTheoryNotes-1uvuwyz.pdf),
  Lectures 14–16, consumed through OperatorKTheory K3.5 (Tr4.1).
