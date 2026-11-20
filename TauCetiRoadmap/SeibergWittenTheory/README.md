# Roadmap: four-dimensional Seiberg–Witten theory

**Summary.** Seiberg–Witten theory attaches integer invariants to a closed oriented smooth
four-manifold X with a Spinᶜ structure by counting solutions of the monopole equations. This roadmap
builds the theory from the equations to the wall-crossing formula. Throughout, X is nonempty,
connected, compact, without boundary, oriented and smooth, with a Riemannian metric g, and a Spinᶜ
structure is a principal lift of its oriented frame bundle, kept with its full torsor data, torsion
included. It has spinor bundles W± of complex rank two and a determinant line L, with l = c₁(L). For a
unitary connection A on L, a section ψ of W⁺ and an imaginary self-dual two-form η the equations are
F_A⁺ = q(ψ) + η and D_A⁺ψ = 0, where q(ψ) is the self-dual form that Clifford multiplication identifies
with the trace-free part of ψψ*, and D_A⁺ is the Spinᶜ Dirac operator. Maps u : X → U(1) act by
(A, ψ) ↦ (A − 2u⁻¹du, uψ), and the moduli space is the solution set modulo this action. Write b₁, b₂⁺, χ
and σ for the first Betti number, the rank of a maximal positive subspace of the intersection form, the
Euler characteristic and the signature.

The first headline theorem is compactness: for every metric and every smooth η the moduli space is
compact, and every solution satisfies `|ψ|² ≤ max(0, sup_X(2√2|η| − Scal_g))`. The second: if b₂⁺ ≥ 1,
then for generic (g, η) the moduli space has no reducible solution and is a compact smooth manifold of
dimension `d = (⟨l², [X]⟩ − 2χ − 3σ)/4`, empty when d < 0 and oriented by an orientation of
`H⁰ ⊕ H¹ ⊕ H⁺`. The third is the invariant: for d ≥ 0 and 0 ≤ r ≤ min(b₁, d) with d − r even, pairing r
loop classes and a power of the point class with the moduli space gives an integral alternating r-form on
H₁(X;ℤ)/torsion; it does not depend on (g, η) if b₂⁺ > 1, and is constant on each of two chambers if
b₂⁺ = 1. The fourth is the wall-crossing formula: if b₂⁺ = 1, d ≥ 0, 0 ≤ r ≤ min(b₁, d) and
r ≡ d ≡ b₁ mod 2, the difference
of the invariants in the two chambers is the pairing of the loop insertions with the divided power
`u^k/k!`, k = (b₁ − r)/2, on the torus `H¹(X;iℝ)/4πiH¹(X;ℤ)`, where `u = (1/2)Σ_(i<j)⟨l α_i α_j, [X]⟩ ν_i ν_j`
for an integral basis α_i of H¹(X;ℤ) and the dual torus classes ν_i. For b₁ = 0 the point invariant jumps
by ±1, the sign fixed by the homology orientation.

FourManifolds Layer 4 supplies the Spinᶜ structures, their determinant lines and their torsor of
twists; FourManifolds Layer 5, SU(2) anti-self-dual gauge theory, is separate. SpinGeometry supplies the
generic Dirac theory and IndexTheory the index theorem; ComplexKahlerGeometry and
PseudodifferentialOperators supply Sobolev, Hodge and elliptic theory on compact manifolds; HeegaardFloer
supplies generic Fredholm transversality and determinant lines; TopologicalKTheory and
CharacteristicClasses supply family indices and characteristic classes. The pointwise algebra (the group
Spinᶜ(4), its half-spin representations, Clifford multiplication by self-dual forms and the quadratic
map) is in the Tau Ceti library. The guide to the eleven layers follows.

## How to read the build

Layers 1–3 build the spinor bundles, the Spinᶜ connections, the Clifford map, the quadratic map and the
Dirac operator, and compute the index and the expected dimension. Layer 4 builds the Sobolev
configuration space, the gauge group and the quotient. Layer 5 proves unique continuation, the a priori
bounds and compactness. Layer 6 proves transversality and describes the walls and chambers. Layer 7
orients the moduli spaces and builds the universal classes. Layer 8 defines the invariant and proves its
invariance. Layers 9 and 10 compute the jump across the wall from the Dirac family over the Picard torus.
Layer 11 treats the canonical Spinᶜ structure of an almost-complex four-manifold.

Each layer ends with its examples and its dependencies, and each section's *Needs:* line lists what
its statement and its route use, item by item, so that a target proved by another route is not
blocked behind an unrelated section. Where the Tau Ceti library or Mathlib already has a carrier or a
theorem, the section names it in code font and builds on it; the supplier contracts below record what
is assumed of each. Layer 1 precedes Layers 2 and 3. In Layer 4 the integral logarithms and the global
gauge fixing precede properness. Weak unique continuation (§5.1) does not depend on transversality,
and the maximum bound (§5.2) precedes the bootstrap and compactness. Layer 6 uses Layers 4 and 5. The
orientation of the quotient (§7.1) uses Layer 4, and its rule for parametrized families precedes the
compact families of Layer 8. The wall geometry of §6.2 precedes every choice of wall-free families.
Invariance (Layer 8) does not depend on the wall computation of Layers 9 and 10. Layer 9 reuses the
generic stabilized family index before its symbol and character comparison. Layer 10 uses §5.1, §5.4,
§§6.1–6.2, Layer 7, Layer 8 and Layer 9, and supplies nothing that those layers use. The universal
Euler cancellation of §3.3a precedes the index computation of §3.3 and the character computation of
§9.4. The explicit global Coulomb gauge and the metric on the quotient (§§4.3, 4.5) precede the
classification of the universal line bundles (§7.2). §10.4 tests the conventions fixed earlier and is
not an input to their construction. Layer 11's almost-complex comparison needs only Layers 1–3; its
application to the invariant uses Layer 8. The E × ℙ¹ test of §10.4 uses the twisted canonical lift of
§11.2, which needs only Layers 1–3 and §11.1, so §11.2 is built before that test.

In the former numbering of this roadmap, section SWk.n is §k.n here, SW3.3a is §3.3a, and SWk is
Layer k.

## Conventions

1. **Standing hypotheses.** For global statements X is a nonempty, connected, compact, boundaryless,
   oriented smooth real four-manifold, on Mathlib's manifold carriers, Hausdorff and second countable,
   with a smooth Riemannian metric g. Local algebraic statements are made on an oriented real
   inner-product space V of dimension four. Local continuation statements (§5.1) are made on a
   connected open smooth four-manifold and assume no compactness.
2. **Inner products and frames.** Complex inner products are conjugate-linear in the first argument,
   as in Mathlib. The orthonormal basis of the exterior algebra attached to an orthonormal real
   coframe e¹, …, e⁴ consists of the increasing wedge monomials. Clifford multiplication satisfies
   `c(v)c(w) + c(w)c(v) = −2⟨v, w⟩` and `c(v)* = −c(v)`; in Tau Ceti's vocabulary it is a real algebra
   map from `CliffordAlgebra Q` with `Q v = −‖v‖²` whose generators act skew-adjointly.
3. **Chirality.** For a positively oriented orthonormal frame put `Γ = −c(e₁)c(e₂)c(e₃)c(e₄)`; W⁺ and W⁻
   are its +1 and −1 eigenspaces. The two-form action is `c₂(α) = Σ_(i<j) α(eᵢ, eⱼ) c(eᵢ)c(eⱼ)`, half the
   ordered double sum. With these signs anti-self-dual forms act by zero on W⁺ and self-dual forms by
   zero on W⁻ (§2.1). For an imaginary self-dual form iα the Clifford map is `C(iα) = i c₂(α)` on W⁺; as
   in Tau Ceti, an imaginary form iα is indexed by the real form α.
4. **Connections and gauge.** A connection on L is unitary, written ∇ = d + A locally with A an imaginary
   one-form. The Spinᶜ gauge group consists of the maps u : X → U(1); it acts actively and on the left by
   `(A, ψ) ↦ (A − 2u⁻¹du, uψ)`, through the weight-one action on spinors and the weight-two action on L.
   A gauge transformation of L alone need not be the square of a Spinᶜ gauge transformation.
5. **Curvature normalization.** For a unitary connection A on a line bundle, `c₁(L)_ℝ = [iF_A/(2π)]`.
   Consequently `∫_X F_A ∧ F_A = −4π²⟨l², [X]⟩`.
6. **Laplacian and harmonic projections.** The scalar Hodge Laplacian is `Δ = d*d ≥ 0`. For a metric g,
   `harm_g⁺` is the L²-orthogonal projection onto the g-harmonic self-dual two-forms, H⁺ the space of
   these forms, and imaginary forms carry the corresponding projections of their real parts.
7. **Numbers attached to (X, 𝔰).** `l² = ⟨l², [X]⟩`; δ = ind_ℂ D_A⁺ is the complex index of the Dirac
   operator; `d = (l² − 2χ − 3σ)/4 = 2δ + b₁ − 1 − b₂⁺` is the expected dimension, an integer that may
   be negative. No natural-number truncation of d is used.
8. **Orientations and signs.** Frame orientation, chirality, the order of target factors, the
   associated-line conventions, the X-first order of products on X × B with its slant product, the
   parameter-first rule for families with outward-first boundary orientation, the direct Hodge
   orientation map of §7.1 and the active left gauge action are part of the statements. They are fixed
   in §7.1, §7.3, §9.1 and §10.3 and every formula below is stated in them.
9. **Sobolev orders.** Configuration spaces use an integer Sobolev order s ≥ 3 (§4.1). Perturbations
   live in `H^s`, one order above the equation target `H^(s−1)`.
10. **Transversality theorems.** For C∞ Fredholm maps the Sard–Smale theorem used is Tau Ceti's
    `TauCeti.isMeagre_image_criticalPoints_of_isFredholm`, applied at smoothness ∞, where its threshold
    `(dim ker)² + 1` on the order of differentiability is automatic. For genuinely finite-Cᵏ families
    the sharp finite-k form of HeegaardFloer §2.1 (F0.S) with its threshold k > max(index, 0) is used
    instead, and the two thresholds are not interchanged.
11. **Names.** `Suggested.lean` declares nothing (its docstring says why); every name in code font below
    is a declaration of Mathlib or of the Tau Ceti library at the pins, and every object of this
    roadmap is described in prose.

## Layer 1: rank-four representations, bundles and connections

### 1.1 Half-spin representations

Let V be an oriented real inner-product space of dimension four, `Q v = −‖v‖²`, and ρ a Hermitian
Clifford module: a real algebra map from `CliffordAlgebra Q` to the complex endomorphisms of a
finite-dimensional complex inner-product space W whose generators act skew-adjointly. The group
Spinᶜ(4) is Tau Ceti's `CliffordAlgebra.spinCGroup`, the quotient of Spin(V) × U(1) by the central
pair (−1, −1), with determinant character `CliffordAlgebra.spinCGroup.det` sending [s, z] to z²
(`CliffordAlgebra.spinCGroup.det_mk`) and rotation `CliffordAlgebra.spinCGroup.toSpecialOrthogonal`.
FourManifolds §4.1 defines Spinᶜ(n) by the same quotient of the native Spin group of `Q v = −‖v‖²`
(SpinGeometry's geometric convention) and the circle, and builds on it the Lie group, its projection to
SO(n) and the Spinᶜ structures (supplier contracts). The chirality element is
`CliffordAlgebra.chirality`. The half-spin representations
`ρ±([s, z]) = z ρ_spin,±(s)` on the ±1-eigenspaces S± of Γ are `CliffordAlgebra.spinCGroupHalfSpinRep`,
with the descent through (−1, −1), unitarity, Clifford equivariance along the rotation, det ρ± = z²,
continuity, the comparison of Γ with the grading of the polarized (Fock) Clifford module, and the
labels of the two SU(2) factors of Spin(4) all in Tau Ceti; the list is under the supplier contracts.

Prove that ρ⁺ and ρ⁻ are smooth unitary representations of the Lie group Spinᶜ(4) of FourManifolds
§4.1 on the complex two-dimensional spaces S±, that is, smooth group homomorphisms into U(S±), and
that the odd Clifford action of V on S⁺ ⊕ S⁻ is equivariant for them along the smooth projection to
SO(4). On the Spin factor smoothness comes from Tau Ceti's smooth action of compact Spin induced by an
action of the even Clifford algebra of the positive-definite coordinate form
(`AlgHom.realCliffordSpinEvenSmoothHom`), transported to Q through an oriented orthonormal frame and
the isomorphism `CliffordAlgebra.spinGroupEquivNeg` of the Spin groups of a form and its negative;
the circle factor acts by scalars. *Needs:* FourManifolds §4.1 (the Lie group Spinᶜ(4) and its smooth
projection); Tau Ceti `CliffordAlgebra.spinCGroupHalfSpinRep`,
`CliffordAlgebra.spinCGroupHalfSpinContinuousHom`,
`CliffordAlgebra.spinCGroupHalfSpinRep_comp_halfSpinCliffordMul`, `AlgHom.realCliffordSpinEvenSmoothHom`,
`CliffordAlgebra.spinGroupEquivNeg`.

The facts fixed by the library, in the conventions of this roadmap:

- For every positively oriented orthonormal basis b, `Γ = −c(b₀)c(b₁)c(b₂)c(b₃)`; in particular Γ does
  not depend on the frame (`CliffordAlgebra.chirality_eq`). Γ² = 1 (`CliffordAlgebra.chirality_mul_self`),
  Γ anticommutes with every c(v) (`CliffordAlgebra.chirality_mul_ι`), and Γ acts self-adjointly on a
  Hermitian Clifford module (`CliffordAlgebra.isSelfAdjoint_map_chirality`).
- The descended representation is unitary (`CliffordAlgebra.inner_spinCGroupHalfSpinRep_apply_spinCGroupHalfSpinRep_apply`),
  intertwines Clifford multiplication from S± to S∓ along the rotation
  (`CliffordAlgebra.spinCGroupHalfSpinRep_comp_halfSpinCliffordMul`), and when S± has complex
  dimension two its determinant is the determinant character (`CliffordAlgebra.det_spinCGroupHalfSpinRep`).
- For the coordinate group Spin(4) and `TauCeti.realSpinFourEquivSpecialUnitaryProd` onto
  SU(2) × SU(2), an element acts trivially on S⁺ exactly when its second factor is the identity
  (`CliffordAlgebra.halfSpinRep_one_realSpinGroupEquiv_eq_one_iff_specialUnitary`), and on S⁻ exactly
  when its first factor is (`CliffordAlgebra.halfSpinRep_neg_one_realSpinGroupEquiv_eq_one_iff_specialUnitary`). The plus and minus factors are identified by this statement, not by
  their names.
- For an orthogonal complex structure J with an oriented orthonormal frame satisfying `J e₁ = e₂` and
  `J e₃ = e₄`, the +1-eigenspace of Γ in the Fock module is the even part of the exterior algebra
  (`TauCeti.AlmostComplexStructure.positiveHalfSpinors_realFockAction`).

**Checks.**
- With `c(v)² = −|v|²` the volume element `ω_ℂ = c(e₁)c(e₂)c(e₃)c(e₄)` satisfies ω_ℂ² = 1, so both
  Γ = −ω_ℂ and its negative are involutions; they differ in which half is W⁺. In the Fock model
  Λ^(0,•)ℂ² with `J e₁ = e₂`, `J e₃ = e₄`, Γ = −ω_ℂ is +1 on Λ^(0,0) ⊕ Λ^(0,2) and −1 on Λ^(0,1); the
  opposite sign would make Λ^(0,1) the positive half and make self-dual forms act by zero on it
  (§2.1).
- The class [1, −1] = [−1, 1] acts on S± by −1, with det ρ± = 1 = (−1)². The candidates
  [s, z] ↦ z² ρ_spin(s) and [s, z] ↦ ρ_spin(s) do not descend through (−1, −1), because
  ρ_spin(−1) = −1; the weight-one formula z ρ_spin(s) is the one that does.

### 1.2 The spinor bundles

Associate to the Spinᶜ lift P of FourManifolds §4.1 the Hermitian bundles `W± = P ×_(ρ±) S±` and the
determinant line `L = P ×_(z²) ℂ`, as native associated bundles of SmoothBundlesConnections §B2.1 with
the fibre metrics of §B2.2, together with specified unitary isomorphisms `det W⁺ ≃ L ≃ det W⁻` (Okonek and
Teleman, p. 3, for these bundles and their common determinant). Construct
Clifford multiplication `c : T*X → Hom_ℂ(W⁺, W⁻) ⊕ Hom_ℂ(W⁻, W⁺)`, its grading, its pullback and its
naturality under oriented isometries and their lifts. *Needs:* FourManifolds §4.1; SmoothBundlesConnections
§§B2.1–B2.2; §1.1; Tau Ceti `CliffordAlgebra.comp_chirality_eq_chirality_comp`,
`CliffordAlgebra.positiveHalfSpinorsEquiv` (pointwise naturality of the chirality splitting).

- Changing local sections of P changes the local spinor frames by ρ±, and the identifications are
  independent of the choice of intertwiner.
- Twisting P by a Hermitian line E (the torsor action of FourManifolds §4.1) gives
  `W±(P ⊗ E) ≃ W±(P) ⊗ E` and `L(P ⊗ E) ≃ L(P) ⊗ E²`.
- Distinct lifts whose determinant lines have equal c₁, because the difference class is
  two-torsion, stay distinct: every construction below takes the lift, not its determinant class.

**Checks.**
- On the Enriques surface the complex Spinᶜ structure and its twist by the order-two line E have
  isomorphic determinant lines (c₁ changes by 2c₁(E) = 0) and are different lifts (FourManifolds
  §4.1, Checks); a construction that only remembers l = c₁(L) would identify them.

### 1.3 Spinᶜ connections

Given the Levi-Civita connection and a unitary connection A on L, construct the unique Spinᶜ connection
∇_A on W = W⁺ ⊕ W⁻ compatible with both, as the connection of SmoothBundlesConnections §B3.3 induced on
the associated bundle, with its section-first native Koszul derivative. It is Hermitian, compatible
with Clifford multiplication and preserves Γ. The construction does not choose a global Spin structure
or Spin connection, which need not exist when X is not spin. The gauge action of Convention 4 is the one
Okonek and Teleman write as a right action of f = u⁻¹ (p. 4). A gauge transformation of L alone need not be the square of
a Spinᶜ gauge transformation. *Needs:* §1.2; SmoothBundlesConnections §§B3.1, B3.3, B4.1, B4.2; Tau Ceti
`CliffordAlgebra.spinCGroup.det`, `AlgHom.lieMap_realCliffordSpinEvenSmoothHom_eq` (the differential of
the spin action is the even Clifford action of the spin Lie algebra); Mathlib `CovariantDerivative`.

- `∇_(A+a) = ∇_A + (a/2) Id` for every imaginary one-form a, the factor ½ being the derivative of
  z ↦ z²; this is proved from that derivative, not assumed.
- The curvature is `R^W_A = ρ_*(R_LC) + (F_A/2) Id`, where ρ_*(R_LC) is the action, through the
  descended spin Lie algebra, of the Levi-Civita curvature on the associated Spinᶜ bundle.
- Active gauge covariance: for u : X → U(1), `∇_(Aᵘ)(uψ) = u ∇_A ψ` with `Aᵘ = A − 2u⁻¹du`, and
  `F_(Aᵘ) = F_A`. The action is compatible with composition, inverses and pullback.

**Checks.**
- For u : X → U(1), `∇_(A − 2u⁻¹du)(uψ) = du ψ + u∇_Aψ − u⁻¹du · uψ = u∇_Aψ`, using
  `∇_(A+a) = ∇_A + a/2` with a = −2u⁻¹du. With `∇_(A+a) = ∇_A + a` the same computation would force the
  gauge action `A ↦ A − u⁻¹du`, the action on L of a gauge transformation of L that need not come from
  one of W.

### 1.4 Curvature normalization

Compare the standard-character line L of §1.2 with the dual-character circle-bundle convention of
SmoothBundlesConnections §§B6.2–B6.3 and prove `c₁(L)_ℝ = [iF_A/(2π)]` (the normalization of Okonek and
Teleman, proof of Proposition 4 iii), p. 5), with its behaviour under tensor
products, duals and pullbacks and its independence of the reference connection. Consequently
`∫_X F_A ∧ F_A = −4π²⟨l², [X]⟩`. Establish the integral-period normalization of logarithmic derivatives
of circle-valued maps used in Layer 4, keeping apart the weight-one action on spinors and the
weight-two action on L. *Needs:* §1.3; SmoothBundlesConnections §§B6.2–B6.3; ComplexKahlerGeometry §5.5
(de Rham cohomology with complex coefficients).

**Checks.**
- On the tautological line O(−1) over ℂP¹ with the connection induced from the trivial bundle ℂ²,
  `∫ iF/(2π) = −1`; the opposite convention `[F/(2πi)]` would give +1.
- Write F_A = iβ with β real. Then `∫ β ∧ β = 4π²⟨l², [X]⟩`, so `‖F_A‖² = ‖β⁺‖² + ‖β⁻‖² = 2‖F_A⁺‖² − 4π²⟨l², [X]⟩`
  (the identity used in §5.2); on ℂP² with l = 3h this gives `∫ F_A ∧ F_A = −36π²`.

### Examples

- On ℝ⁴ = ℂ² with its standard metric and the trivial Spinᶜ structure, W⁺ = Λ^(0,0) ⊕ Λ^(0,2) and
  W⁻ = Λ^(0,1); for the trivial connection on L the Spinᶜ connection is the trivial connection, and
  replacing A by A + i dθ for a real function θ shifts it by (i/2) dθ.
- For X = ℂP² with the Spinᶜ structure of its complex structure, l = 3h; twisting by O(1) gives
  l = 5h, a change of 2h.

### Dependencies

FourManifolds §4.1 (the group Spinᶜ(4) as a Lie group, Spinᶜ lifts, determinant lines and the torsor of
twists); SmoothBundlesConnections §§B2.1–B2.2, B3.1, B3.3, B4.1–B4.2, B6.2–B6.3; ComplexKahlerGeometry
§5.5. Tau Ceti: Spinᶜ(4), chirality, the half-spin representations and their continuity, the smooth
action of compact Spin and its differential, the Fock comparison and the SU(2) labels.

## Layer 2: self-dual Clifford action and the quadratic map

### 2.1 Self-dual bundles and the Clifford map

The Hodge star of middle-degree forms on an oriented Riemannian four-manifold, the smooth self-dual
and anti-self-dual forms, the projections `(1 ± ⋆)/2` and the rank three of the fibres are Tau Ceti's
(`TauCeti.RoughForm.hodgeStar`, `TauCeti.SmoothForm.selfDualForms`, `TauCeti.SmoothForm.antiSelfDualForms`,
`TauCeti.SmoothForm.selfDualPart`, `TauCeti.RoughForm.two_mul_finrank_map_proj_selfDualForms`), and
ComplexKahlerGeometry §5.1 uses the same star. The pointwise star alone does not give the bundles:
construct from these forms the smooth rank-three eigenbundles
`Λ± ⊂ Λ²T*X` as smooth vector subbundles whose smooth sections are these forms, with the orthogonal
bundle projections `(1 ± ⋆)/2`. *Needs:* ComplexKahlerGeometry §5.1; Tau Ceti
`TauCeti.SmoothForm.selfDualForms`, `TauCeti.SmoothForm.selfDualPart`,
`TauCeti.RoughForm.two_mul_finrank_map_proj_selfDualForms`; Mathlib `ContMDiffVectorBundle`.

Pointwise, on a Hermitian Clifford module over V with positive half W⁺ of complex dimension two, the
Clifford map `C(iα) = i c₂(α)|W⁺` is Tau Ceti's `TauCeti.SeibergWitten.cliffordRestriction`, a real
isomorphism `TauCeti.SeibergWitten.cliffordRestrictionEquiv` from Λ⁺ onto the trace-free self-adjoint
complex endomorphisms of W⁺ (`TauCeti.traceFreeSelfAdjoint`, a genuine real subspace of the
continuous linear endomorphisms, not a matrix model), and its adjoint τ = C* for the real
Hilbert–Schmidt pairing `Re tr(T*U)` on all complex endomorphisms of W⁺ is
`TauCeti.SeibergWitten.cliffordRestrictionAdjoint`, valued in the self-dual forms. Construct the bundle
map `C : iΛ⁺ → End(W⁺)` and its adjoint τ from these through the frame and Spinᶜ naturality of the
library, and prove they are smooth bundle maps. For the complex-linear extension C_ℂ of C to `Λ⁺ ⊗ ℂ`
and the complex Hilbert–Schmidt product `tr(T*U)`, prove `C_ℂ* C_ℂ = 4 Id` and that `C_ℂ C_ℂ*` is four
times the orthogonal projection onto the trace-free endomorphisms of W⁺. *Needs:* §1.2; Tau Ceti
`TauCeti.SeibergWitten.cliffordRestriction`, `TauCeti.SeibergWitten.cliffordRestrictionEquiv`,
`TauCeti.SeibergWitten.cliffordRestrictionAdjoint`, `TauCeti.SeibergWitten.cliffordRestriction_map`,
`TauCeti.SeibergWitten.cliffordRestrictionAdjoint_conjContinuousAlgEquiv`.

The pointwise facts the library proves, with V, W and ρ as in §1.1:

- Anti-self-dual forms act by zero on W⁺ and self-dual forms by zero on W⁻
  (`CliffordAlgebra.bivectorExterior_smul_eq_zero_of_hodgeStar_eq_neg`,
  `CliffordAlgebra.bivectorExterior_smul_eq_zero_of_hodgeStar_eq_self`).
- Each C(iα) is self-adjoint and trace free (`TauCeti.SeibergWitten.isSelfAdjoint_cliffordRestriction`,
  `TauCeti.SeibergWitten.cliffordRestriction_mem_traceFreeSelfAdjoint`), and for self-dual α and β,
  `tr(C(iα)* C(iβ)) = 4⟨α, β⟩` (`TauCeti.SeibergWitten.trace_adjoint_cliffordRestriction_mul_of_hodgeStar_eq_self`).
- τ(Id) = 0 (`TauCeti.SeibergWitten.cliffordRestrictionAdjoint_one`); `τ(C(iα)) = 4α` for self-dual α
  (`TauCeti.SeibergWitten.cliffordRestrictionAdjoint_cliffordRestriction`); and
  `C(τ T) = 2 · traceFreePart(T + T*)`, four times the real orthogonal projection of T onto the
  trace-free self-adjoint endomorphisms (`TauCeti.SeibergWitten.cliffordRestriction_cliffordRestrictionAdjoint_eq_traceFreePart`).
- For self-dual α, the operator norm is `‖C(iα)‖ = √2 |α|`
  (`TauCeti.SeibergWitten.norm_cliffordRestriction_of_hodgeStar_eq_self`).
- C and τ are natural under oriented isometries of V with a Clifford intertwiner of the modules
  (`TauCeti.SeibergWitten.cliffordRestriction_map`,
  `TauCeti.SeibergWitten.cliffordRestrictionAdjoint_conjContinuousAlgEquiv`); this is their frame
  independence and Spinᶜ equivariance.

**Checks.**
- For `ω = e¹² + e³⁴`, self-dual with |ω|² = 2, `c₂(ω) = c(e₁)c(e₂) + c(e₃)c(e₄)` equals `2c(e₁)c(e₂)` on
  W⁺, because `c(e₁)c(e₂)c(e₃)c(e₄) = −1` there; so C(iω) has eigenvalues 2 and −2 on W⁺, and
  `tr(C(iω)* C(iω)) = 8 = 4|ω|²`. With the chirality of the opposite sign, c₂(ω) would vanish on the
  half called W⁺.
- The operator norm of C(iω) is 2 = √2 |ω|, while its Hilbert–Schmidt norm is `2√2 = 2|ω|`; using the
  Hilbert–Schmidt norm in place of the operator norm in §5.2 would change the constant `2√2` there to 4.

### 2.2 The quadratic endomorphism

The rank-one quadratic endomorphism `Q₀(ψ) = ψψ* − (|ψ|²/2) Id`, with ψψ* the map `v ↦ ⟨ψ, v⟩ψ`
(`InnerProductSpace.rankOne ℂ ψ ψ`), is Tau Ceti's `TauCeti.SeibergWitten.quadraticEnd`, defined on
every complex inner-product space. Its real polarization
`B(ψ, φ) = φψ* + ψφ* − Re⟨ψ, φ⟩ Id` is `TauCeti.SeibergWitten.quadraticEndPolar`, a continuous
real-bilinear map, and it is the real Fréchet derivative of Q₀. Neither Q₀ nor its derivative is
complex-linear, and the library states them as real maps. This section has no target of its own; it
fixes the notation that §2.3 and Layer 3 use. *Needs:* Tau Ceti `TauCeti.SeibergWitten.quadraticEnd`,
`TauCeti.SeibergWitten.quadraticEndPolar`.

- In complex dimension two Q₀(ψ) is trace free (`TauCeti.SeibergWitten.trace_quadraticEnd`), and it is
  the trace-free part of ψψ* (`TauCeti.SeibergWitten.quadraticEnd_eq_traceFreePart`). It is
  self-adjoint for the native adjoint (`TauCeti.SeibergWitten.isSelfAdjoint_quadraticEnd`).
- `Q₀(ψ)ψ = (|ψ|²/2)ψ` (`TauCeti.SeibergWitten.quadraticEnd_apply_self`); `Q₀(cψ) = |c|² Q₀(ψ)`, so Q₀ is
  invariant under unit phases (`TauCeti.SeibergWitten.quadraticEnd_smul`,
  `TauCeti.SeibergWitten.quadraticEnd_smul_of_norm_eq_one`).
- `Q₀(ψ + φ) = Q₀(ψ) + Q₀(φ) + B(ψ, φ)` (`TauCeti.SeibergWitten.quadraticEnd_add`), with the operator-norm
  bounds `‖Q₀(ψ)‖ = |ψ|²/2`, `‖B(ψ, φ)‖ ≤ |ψ||φ|` and the difference bound
  `TauCeti.SeibergWitten.norm_quadraticEnd_sub_le` (`TauCeti.SeibergWitten.norm_quadraticEnd`,
  `TauCeti.SeibergWitten.norm_quadraticEndPolar_le`).
- Q₀ has strict real Fréchet derivative `φ ↦ B(ψ, φ) = φψ* + ψφ* − Re⟨ψ, φ⟩ Id` at every ψ, a continuous
  real-linear endomorphism-valued map (`TauCeti.SeibergWitten.hasStrictFDerivAt_quadraticEnd`,
  `TauCeti.SeibergWitten.fderiv_quadraticEnd`), and Q₀ is smooth (`TauCeti.SeibergWitten.contDiff_quadraticEnd`).

**Checks.**
- For ψ = (1, 0) in ℂ², Q₀(ψ) = diag(½, −½): trace zero and `Q₀(ψ)ψ = ψ/2`. The variant `ψψ* − |ψ|² Id`
  gives diag(0, −1), of trace −1, and the variant `ψψ*` alone is not trace free.
- `B(ψ, iψ) = iψψ* − iψψ* − Re⟨ψ, iψ⟩ Id = 0` (`TauCeti.SeibergWitten.quadraticEndPolar_I_smul_self`): the
  derivative of Q₀ kills the infinitesimal gauge direction, as phase invariance requires; the
  complex-linear candidate `φ ↦ 2φψ*` would give `2iψψ* ≠ 0` there.

### 2.3 The quadratic two-form

Pointwise, `q(ψ) = C⁻¹Q₀(ψ) = τ(ψψ*)/4 ∈ iΛ⁺` is Tau Ceti's `TauCeti.SeibergWitten.quadraticTwoForm`.
Construct q on bundles as
a smooth real-quadratic fibre map from W⁺ to iΛ⁺, natural under bundle isomorphisms and Spinᶜ
equivariant, with `q(uψ) = q(ψ)` for every u : X → U(1). Give its bounded four-dimensional Sobolev
instantiations used in Layer 4: for every integer s ≥ 3, ψ ↦ q(ψ) is a bounded real-quadratic map from
`H^s(W⁺)` to `H^s(iΛ⁺)`, its real polarization satisfying `‖q′(ψ, φ)‖_(H^s) ≤ C_s ‖ψ‖_(H^s) ‖φ‖_(H^s)`.
*Needs:* §2.1; ComplexKahlerGeometry §5.4 (the compact-bundle Sobolev scale) and
PseudodifferentialOperators Layer 5 (P5, Sobolev products) for the instantiations; Tau Ceti
`TauCeti.SeibergWitten.quadraticTwoForm`, `TauCeti.SeibergWitten.quadraticTwoForm_positiveHalfSpinorsEquiv`.

The pointwise facts the library proves:

- `C(q(ψ)) = Q₀(ψ)`, that is q = C⁻¹ ∘ Q₀ (`TauCeti.SeibergWitten.cliffordRestriction_quadraticTwoForm`,
  `TauCeti.SeibergWitten.quadraticTwoForm_eq_symm_cliffordRestrictionEquiv`), and
  `C(q(ψ))ψ = (|ψ|²/2)ψ` (`TauCeti.SeibergWitten.cliffordRestriction_quadraticTwoForm_apply_self`).
- `q(uψ) = q(ψ)` for |u| = 1 (`TauCeti.SeibergWitten.quadraticTwoForm_smul_of_norm_eq_one`) and
  `|q(ψ)|² = |ψ|⁴/8` (`TauCeti.SeibergWitten.norm_quadraticTwoForm_sq`).
- The real derivative is the polarization `q'(ψ, φ) = τ(B(ψ, φ))/4`
  (`TauCeti.SeibergWitten.quadraticTwoFormPolar`, `TauCeti.SeibergWitten.hasFDerivAt_quadraticTwoForm`),
  so `C(dq_ψ φ) = φψ* + ψφ* − Re⟨ψ, φ⟩ Id`
  (`TauCeti.SeibergWitten.cliffordRestriction_quadraticTwoFormPolar`), and `dq_ψ(ξψ) = 0` for imaginary ξ
  (`TauCeti.SeibergWitten.quadraticTwoFormPolar_I_smul_self`); its norm is at most `|ψ||φ|/√2`
  (`TauCeti.SeibergWitten.norm_quadraticTwoFormPolar_le`).
- q and its polarization are natural under unitary Clifford intertwiners
  (`TauCeti.SeibergWitten.quadraticTwoForm_positiveHalfSpinorsEquiv`,
  `TauCeti.SeibergWitten.quadraticTwoFormPolar_positiveHalfSpinorsEquiv`).

**Checks.**
- With the Hilbert–Schmidt normalization of §2.1, `|Q₀(ψ)|²_HS = 2(|ψ|²/2)² = |ψ|⁴/2 = 4|q(ψ)|²`, so
  `|q(ψ)|² = |ψ|⁴/8`. Defining q by identifying the two-forms with endomorphisms through the
  Hilbert–Schmidt product without the factor 4 would give `|ψ|⁴/2`.
- For the unit spinor u₀ spanning the −2i-eigenline of c₂(ω), ω = e¹² + e³⁴ (the vacuum Λ^(0,0) of the
  Fock model), `Q₀(u₀) = diag(½, −½) = C(iω)/4` in the eigenbasis of C(iω), so q(u₀) = iω/4 and
  `|q(u₀)|² = |ω|²/16 = 1/8 = |u₀|⁴/8`.

### Examples

- On W⁺ = Λ^(0,0) ⊕ Λ^(0,2) for the complex structure of ℂ², the Kähler form ω acts through C(iω) by 2 on
  Λ^(0,0) and by −2 on Λ^(0,2), and a spinor ψ = (α, β) has `⟨q(ψ), ω⟩ = (|α|² − |β|²)/2` in the real
  indexing of imaginary forms (`TauCeti.SeibergWitten.inner_quadraticTwoForm`, with the two eigenline
  projections `TauCeti.SeibergWitten.cliffordProjection`).
- Charge conjugation by the quaternionic structure j of W⁺ satisfies `Q₀(jψ) = −Q₀(ψ)`
  (`TauCeti.SeibergWitten.quadraticEnd_map`), so it carries the curvature equation with perturbation η
  to the one with −η on the conjugate Spinᶜ structure.

### Dependencies

§1.2 (spinor bundles); ComplexKahlerGeometry §5.1 (the metric star on forms) and §5.4 with
PseudodifferentialOperators Layer 5 for the Sobolev instantiations of §2.3. Tau Ceti: the Hodge star and the smooth self-dual forms, the Clifford map and
its adjoint, the quadratic endomorphism and the quadratic two-form with their pointwise algebra,
derivatives and naturality. Mathlib: `InnerProductSpace.rankOne`, smooth vector bundles.

## Layer 3: Dirac operator, Weitzenböck formula and the expected dimension

### 3.1 The Dirac operator and its symbols

Define the Spinᶜ Dirac operator D_A on W = W⁺ ⊕ W⁻ by instantiating the generic Clifford-module Dirac
operator of SpinGeometry §6.1 (G6.1) on (W, c, ∇_A), and write D_A± for its chiral pieces
W± → W∓. *Needs:* §1.3; SpinGeometry §6.1; ComplexKahlerGeometry §5.4 (Sobolev and weak domains).

- In an orthonormal frame `D_A = Σ c(eᵢ) ∇_(A,eᵢ)`, and this agrees with the contraction of SpinGeometry
  §6.1 independently of the frame.
- `D_(A+a) = D_A + c(a)/2` for imaginary one-forms a, and `D_(Aᵘ)(uψ) = u D_Aψ` for u : X → U(1). By
  SpinGeometry §6.1 applied to (W, c, ∇_A), `D_A(fψ) = c(df)ψ + f D_Aψ` for real functions f.
- By SpinGeometry §6.1 applied to (W, c, ∇_A), the formal L² adjoint of D_A⁺ is D_A⁻, with the comparison
  of weak and Sobolev domains; the differential principal symbol of D_A⁺ at ξ is c(ξ), its Fourier symbol
  is ic(ξ), and the phase homotopy `e^(iπt/2)c(ξ)` joins them. Off ξ = 0 the inverse of the chiral symbol c(ξ) is
  `−c(ξ)/|ξ|²`, mapping W⁻ to W⁺.

**Checks.**
- `c(ξ) · (−c(ξ)/|ξ|²) = −c(ξ)²/|ξ|² = 1` because `c(ξ)² = −|ξ|²`; the candidate `c(ξ)/|ξ|²` gives −1.
- With `D_(A+a) = D_A + c(a)/2`, a = −2u⁻¹du and `D_A(uψ) = c(du)ψ + uD_Aψ`, one gets
  `D_(Aᵘ)(uψ) = c(du)ψ + uD_Aψ − c(u⁻¹du)uψ = uD_Aψ`.

### 3.2 The Weitzenböck formula

Prove `D_A⁻ D_A⁺ = ∇_A* ∇_A + Scal/4 + C(F_A⁺)/2` on sections of W⁺. The factor ½ in the last term comes
from the half-connection on the determinant line of §1.3; it does not change the increasing-index
convention for c₂. From this operator identity prove the pointwise, weak and integrated identities
used in Layer 5 (Witten, *Monopoles and four-manifolds*, eq. (3.1), for the integrated identity in his
normalization); in particular, if `F_A⁺ = q(ψ) + η`, then
`Re⟨D_A⁻D_A⁺ψ, ψ⟩ = Δ|ψ|²/2 + |∇_Aψ|² + Scal|ψ|²/4 + |ψ|⁴/4 + Re⟨C(η)ψ, ψ⟩/2`. *Needs:* §§1.3, 2.1, 2.3, 3.1;
SpinGeometry §§6.2–6.3 (the general square formula and the twisted Lichnerowicz formula).

**Checks.**
- After substituting F_A⁺ = q(ψ), the curvature term contributes `Re⟨C(q(ψ))ψ, ψ⟩/2 = |ψ|⁴/4`, by
  `C(q(ψ))ψ = (|ψ|²/2)ψ`. Omitting the half-connection factor would give |ψ|⁴/2.

### 3.3 The index of the Dirac operator

Construct the compact-support class of the chiral symbol of D_A⁺, the symbol triple of SpinGeometry §6.1
for (W, c, ∇_A), and its comparison with the universal associated Spinᶜ Thom character. Using the universal Euler cancellation of §3.3a, apply the cohomological index
formula of IndexTheory Layer 6 (I6) to prove
`ind_ℂ D_A⁺ = ⟨exp(l/2) Â(TX), [X]⟩ = (⟨l², [X]⟩ − σ(X))/8` (Witten, *op. cit.*, §2, the sentence before
eq. (2.5), in his normalization). The rational class exp(l/2) does not
presuppose a square root of L. The degree-four part is `l²/8 − p₁/24`, and `⟨p₁, [X]⟩ = 3σ(X)` with the
same orientation. Prove that the index does not depend on A, on the metric, on the Sobolev realization or
on the isomorphism of lifts, through the shared symbol and compact-perturbation maps. The parity of the
index of the untwisted Spin Dirac operator is not used for an arbitrary Spinᶜ twist. *Needs:* §§3.1,
3.3a; IndexTheory Layers 6–7 (I6, I7); CharacteristicClasses C6 (§§6.1–6.2: multiplicative sequences and
the Chern character) and C3 (§3.3: Pontryagin classes); the signature theorem of IndexTheory §7.2.

**Checks.**
- For a K3 surface with the Spinᶜ structure of its complex structure, l = 0 and σ = −16, so the index is
  2, the holomorphic Euler characteristic of the structure sheaf. On ℂP² with l = 3h it is (9 − 1)/8 = 1,
  again the holomorphic Euler characteristic. The variant `(l² + σ)/8` gives −2 on K3 and is not an
  integer on ℂP².

### 3.3a The universal Spinᶜ(4) comparison

Using the universal joins and subgroup-associated fibrations of CharacteristicClasses §1.1b (C1.1b),
construct the maps on finite classifying and Thom approximations induced by the homomorphism
Spin(4) × U(1) → Spinᶜ(4), whose kernel is μ₂. Construct its comparison of classifying homotopy fibres
with Bμ₂, prove that the positive-degree rational cohomology of Bμ₂ vanishes by averaging over the
finite group, and apply the cohomological Serre spectral sequence of DGFloer Layer 1, item 2, to prove
that the map of classifying spaces is a rational cohomology isomorphism; it is not a two-sheeted
covering. Consume the real torus and Borel restriction and the finite-degree rational coefficient
comparison of CharacteristicClasses §§5.2–5.3 (C5.2–C5.3), specialized to SU(2)₊ × SU(2)₋ × U(1) and its
rank-three torus. Construct the representation and root dictionary for this group, obtain injectivity
of rational restriction to the torus from that coefficient comparison, and prove that the real tangent
Euler class restricts to the root product x₁x₂. This Euler class is not a zero divisor in the
rational cohomology of B(Spin(4) × U(1)) by IndexTheory §6.3 (the case Spin(2ℓ) × U(k) with ℓ = 2, k = 1);
the rational isomorphism above carries this to BSpinᶜ(4). In torus coordinates a₊, a₋, z put
`x₁ = a₊ + a₋`, `x₂ = a₊ − a₋` and `l = 2z`; through the chirality comparison of §1.1 the half-spin
characters are `z ± a₊` on W⁺ and `z ± a₋` on W⁻. Construct their root, classifying and representation
maps and derive `ch(W⁺ − W⁻) = exp(z) ∏ⱼ 2 sinh(xⱼ/2)`. Use universal Euler cancellation to identify the
Thom character with `exp(l/2) Â⁻¹` times the ordinary Thom class. The index-character diagram
contributes `Td(TX ⊗ ℂ) = Â²`, which yields `exp(l/2) Â` in the index. The cancellation is performed
universally, before pulling back to X; no division by the Euler class on X is used. This Spinᶜ(4)
calculation is an application of the universal Euler-injectivity method of IndexTheory §§6.2–6.3, and
the same comparison supplies the fixed-product family application of §9.4. *Needs:* §1.1;
CharacteristicClasses §§1.1b, 5.2–5.3; DGFloer Layer 1, item 2; IndexTheory §§6.2–6.3; Tau Ceti
`CliffordAlgebra.trace_spinCGroupHalfSpinRep_one_sub_neg_one_mk_spinTorus` (the torus character
`tr ρ⁺ − tr ρ⁻ = z(w₁ − w₁⁻¹)(w₂ − w₂⁻¹)` on the maximal torus, with `OrthonormalBasis.spinTorus`).

**Checks.**
- `ch(W⁺) − ch(W⁻) = eᶻ(2 cosh a₊ − 2 cosh a₋)`, and with x₁ = a₊ + a₋, x₂ = a₊ − a₋,
  `4 sinh(x₁/2) sinh(x₂/2) = 2(cosh a₊ − cosh a₋)`, so the two sides agree. The determinant of W⁺ has
  character e^((z + a₊) + (z − a₊)) = e^(2z), matching l = 2z; taking l = z would make exp(l/2) the
  wrong class. In multiplicative coordinates wⱼ = e^(xⱼ/2) this is the library's
  `z(w₁ − w₁⁻¹)(w₂ − w₂⁻¹)`.
- The degree-four part of `exp(l/2) Â` is `(l/2)²/2 − p₁/24 = l²/8 − p₁/24`, which evaluates to
  `(l² − σ)/8` with ⟨p₁, [X]⟩ = 3σ.

### 3.4 The abelian deformation operator

The operator `T = (−2d*, d⁺) : iΩ¹ → iΩ⁰ ⊕ iΩ⁺` on smooth forms is Tau Ceti's
`TauCeti.SeibergWitten.abelianDeformationOperator` (imaginary forms indexed by real forms), with its
smooth kernel, the closed and coclosed one-forms (`TauCeti.SeibergWitten.ker_abelianDeformationOperator`),
and the L²-orthogonality of its range to the closed functions and the closed self-dual forms
(`TauCeti.SeibergWitten.integralTopForm_inner_abelianDeformationOperator_fst_eq_zero`,
`TauCeti.SeibergWitten.integralTopForm_inner_abelianDeformationOperator_snd_eq_zero`). On the shared
real-form Sobolev scale of ComplexKahlerGeometry §5.4, prove that T is elliptic, that its realization
`H^(s+1) → H^s` is Fredholm with kernel iH¹ and cokernel iH⁰ ⊕ iH⁺, and that its index is
`b₁ − 1 − b₂⁺ = −(χ + σ)/2`, keeping the target order and the factor −2 (Witten, *op. cit.*, §2, the
sentence before eq. (2.5)). Its principal symbol differs from Tau Ceti's
`TauCeti.SeibergWitten.deformationSymbol` by an invertible rescaling of the two target factors, so the
pointwise injectivity `TauCeti.SeibergWitten.deformationSymbol_injective` and the dimension count
4 = 1 + 3 give ellipticity. Realification of a complex Fredholm operator doubles its index, through the
kernel and cokernel identifications of Tau Ceti's `ContinuousLinearMap.index_restrictScalars_real`.
*Needs:* ComplexKahlerGeometry §§5.4, 5.7 (Sobolev scale, the real Hodge theorem and harmonic
projections); PseudodifferentialOperators Layer 6 (P6, elliptic Fredholm realizations); Tau Ceti
`TauCeti.SeibergWitten.abelianDeformationOperator`, `TauCeti.SeibergWitten.deformationSymbol_injective`,
`ContinuousLinearMap.index_restrictScalars_real`; Mathlib `ContinuousLinearMap.IsFredholm`.

**Checks.**
- On S⁴ the kernel is 0 and the cokernel is iH⁰ = iℝ, so the index is −1 = 0 − 1 − 0; on T⁴ it is
  4 − 1 − 3 = 0. A version forgetting the constant functions in the cokernel would give b₁ − b₂⁺.

### 3.5 The linearization and the expected dimension

Define `ℱ_η(A, ψ) = (F_A⁺ − q(ψ) − η, D_A⁺ψ)`. Derive the infinitesimal gauge action
`d₀ξ = (−2dξ, ξψ)`, the linearization `d₁(a, φ) = (d⁺a − dq_ψ φ, D_A⁺φ + c(a)ψ/2)`, the adjoint
`d₀*(a, φ) = −2d*a + i Im⟨ψ, φ⟩` and the parameter derivative `∂_η ℱ(h) = (−h, 0)`. *Needs:* §§2.3, 3.1,
3.4.

- At a solution `d₁d₀ = 0`; off a solution the Dirac component of d₁d₀ξ is `ξ D_A⁺ψ`.
- With target order iΩ⁰, iΩ⁺, W⁻, the gauge-fixed operator `ℒ = d₀* ⊕ d₁` is a compact zeroth-order
  perturbation of `T ⊕ (D_A⁺)_ℝ`; prove its Fredholm realizations and
  `d = ind_ℝ ℒ = (⟨l², [X]⟩ − 2χ − 3σ)/4` (Witten, *op. cit.*, §2, eqs. (2.3)–(2.5)). The index alone
  provides neither the quotient nor regularity; those are Layers 4 and 6.

**Checks.**
- `d₁d₀ξ = (−2d⁺dξ − dq_ψ(ξψ), −c(dξ)ψ + D_A⁺(ξψ)) = (0, ξD_A⁺ψ)`, using `d⁺d = 0`, `dq_ψ(ξψ) = 0` for
  imaginary ξ and `D_A⁺(ξψ) = c(dξ)ψ + ξD_A⁺ψ`.
- `ind_ℝ ℒ = 2δ + b₁ − 1 − b₂⁺` and `2δ = (l² − σ)/4`; since `χ + σ = 2 − 2b₁ + 2b₂⁺`, this equals
  `(l² − 2χ − 3σ)/4`. For K3 with l = 0 it is 0; for ℂP² with l = h it is −2.

### Examples

- For a K3 surface with the Spinᶜ structure of its complex structure, δ = 2, ind T = −4 and d = 0.
- For ℂP² with l = 3h, δ = 1, ind T = −2 and d = 0; with l = h, δ = 0 and d = −2.

### Dependencies

Layers 1–2; SpinGeometry §§6.1–6.3; IndexTheory Layers 6–7; CharacteristicClasses §§1.1b, 3.3, 5.2–5.3,
6.1–6.2; DGFloer Layer 1, item 2; ComplexKahlerGeometry §§5.4, 5.7; PseudodifferentialOperators Layer 6.
Tau Ceti: the torus character of the half-spin representations, the smooth abelian deformation operator
with its kernel and range orthogonality, its pointwise symbol, and the doubling of the index under
realification. Mathlib: Fredholm operators.

## Layer 4: the Sobolev gauge action, global Coulomb gauge and the quotient

### 4.1 Sobolev completions

Fix a smooth reference connection A₀ on L. For each integer s ≥ 3 define the configuration space
`C_s = (A₀ + H^s(iT*X)) × H^s(W⁺)`, the gauge group `G_(s+1) = H^(s+1)(X, U(1))` (the orders of Okonek
and Teleman, p. 4) and the perturbation
space `P_s = H^s(iΛ⁺)`, on the compact-bundle Sobolev scale of ComplexKahlerGeometry §5.4. The equation
ℱ of §3.5 takes values in `H^(s−1)(iΛ⁺ ⊕ W⁻)`, one order below the perturbation parameter. Since
s + 1 ≥ 4 > 2, elements of `H^(s+1)` have continuous representatives, and the condition |u| = 1 is
imposed on them. *Needs:* §§2.3, 3.5; ComplexKahlerGeometry §5.4; PseudodifferentialOperators Layer 5
(P5: the Sobolev algebra, product and multilinear coefficient estimates on the shared carrier).

- G_(s+1) is a Banach Lie group: construct the local logarithm and exponential charts, prove
  completeness and separability, and the smoothness of multiplication and inversion.
- The action of G_(s+1) on C_s is smooth and real.
- From P5's estimates construct their instantiations for the gauge group and the sections used here:
  the estimates for exp, log and dlog, the superposition estimates, the smoothness of ℱ and of its
  derivatives of §3.5 on C_s × P_s, and the comparison of weak and strong solutions with Sobolev
  coefficients. These are nonlinear estimates proved here; they do not follow from a theorem stated
  only for smooth coefficients.

### 4.2 Integral logarithmic derivatives

For a smooth map u : X → U(1) prove that `dlog u = u⁻¹du` is closed with periods in 2πiℤ, and conversely
that every smooth closed imaginary one-form with periods in 2πiℤ is dlog u for a smooth u, constructed by
path integration. Prove the Sobolev version for `u ∈ G_(s+1)` by local logarithms and approximation;
identify the component group of G_(s+1) with H¹(X;ℤ) (Okonek and Teleman, proof of Lemma 5, p. 6, for
smooth gauge transformations), and the integral harmonic one-forms with a lattice
in the harmonic forms. Through the finite CW and integral–de Rham comparisons prove that this lattice is
discrete and of full rank b₁. On connected X the kernel of dlog is the constants. H¹(X;ℤ) is torsion
free; the torsion of the Spinᶜ torsor is kept in the lift (§1.2) and is not lost by using H¹(X;ℤ) for
gauge transformations. *Needs:* §§1.4, 4.1; AlgebraicTopology Layers 6–8 (cohomology, products, CW
comparison); GeometricTopology Layer 1; Tau Ceti `TauCeti.mem_exactForms_one_iff_periodHom_eq_zero`
and `TauCeti.exists_mextDeriv_eq_of_forall_pathIntegral_eq_zero` (a closed one-form with vanishing
periods is exact).

**Checks.**
- On S¹ × S³ with angle θ, `u = e^(iθ)` has `dlog u = i dθ`, with period 2πi over the circle, so the
  class `dθ/(2π)` is integral and primitive; `e^(iθ/2)`, whose logarithmic derivative has period πi, is
  not a well-defined map on the circle.

### 4.3 Global Coulomb gauge

Write a connection form as `a = h + df + d*β` (harmonic, exact and coexact parts). Solve `Δξ = (d*a)/2`
for a mean-zero imaginary function ξ and put u = exp ξ, so that `d*(a − 2dξ) = 0`. Spinᶜ gauge
transformations in the identity component act on the harmonic part trivially, and the large ones
translate it by −4πiH¹(X;ℤ). Prove that the quotient of the harmonic part is the torus
`H¹(X;iℝ)/(4πiH¹(X;ℤ))` (Okonek and Teleman, §4.1, p. 10, where in the units of the ordinary lattice it
is `H¹(X; ℝ)/2H¹(X; ℤ)`). Choose a compact closed parallelotope of the lattice for subsequence arguments; no
continuous global selector is claimed. Give the estimates for ξ and its uniqueness modulo constants and
the lattice. Allowing all gauge transformations of L would give the different lattice
2πiH¹(X;ℤ) and is not the quotient taken here. *Needs:* §§4.1–4.2; ComplexKahlerGeometry §5.7 (Hodge
decomposition, harmonic projections and Green operators).

Fix x₀ ∈ X and choose integral harmonic real one-forms α₁, …, α_b, a basis of the lattice, with based
smooth gauge transformations u_j, `u_j(x₀) = 1` and `dlog u_j = 2πiα_j`. Let
`E₀ = {f ∈ H^(s+1)(X; iℝ) : f(x₀) = 0}`; evaluation at x₀ is continuous. Compare the mean-zero Green
solution ξ with `ξ₀ = ξ − ξ(x₀)`, a bounded linear normalization, and prove the decomposition
`G_(s+1) ≃ S¹ × ℤ^b × E₀`, `u = c (∏_j u_j^(n_j)) exp f` with `c = u(x₀)`. The mean-zero exponential
subgroup is not the based subgroup. The map `(a, ψ) ↦ (a − 2dξ₀(a), exp(ξ₀(a)) ψ)` gives a smooth global
quotient by exp E₀, with inverse given by exp(−ξ₀). Its Coulomb slice is `ℋ¹_i × B × F`, where ℋ¹_i is
the imaginary harmonic one-forms, B the closed subspace of coexact one-forms in H^s and `F = H^s(W⁺)`.
Prove the comparison of the Hodge images with closed subspaces and their separability; separability
does not follow from the Hilbert space structure alone.

**Checks.**
- `d*(a − 2dξ) = d*a − 2Δξ = 0`; the equation `Δξ = d*a/2` is solvable because `∫_X d*a = 0`, and its
  solution is unique up to a constant.
- On S¹ × S³, `u = e^(iθ)` changes A by `−2u⁻¹du = −2i dθ = −4πiα` with α = dθ/(2π), so the harmonic part
  `4πi t α` moves t to t − 1 and the quotient is a circle of period 4πα; the gauge transformations of L
  alone (A ↦ A − u⁻¹du) would give period 2πα, a circle that the quotient here double covers.

### 4.4 Local slices

Prove `d₀*d₀ = 4Δ + |ψ|²` on imaginary functions, with energy `⟨d₀*d₀ξ, ξ⟩ = 4‖dξ‖² + ∫_X |ψ|²|ξ|²`. If ψ is
not identically zero, prove coercivity of this operator from a Poincaré inequality, a region where ψ
does not vanish and Rellich compactness; obtain its H¹ variational inverse and its elliptic inverse
`H^(s−1) → H^(s+1)`. Apply Mathlib's implicit function theorem
(`HasStrictFDerivAt.implicitFunctionOfComplemented`) to the Coulomb map to construct local slices
`ker d₀*` and compatible transition charts. At ψ = 0 invert only on mean-zero functions and keep the
residual constant circle. No uniform invertibility as ψ tends to zero is claimed. *Needs:* §§3.5, 4.1;
ComplexKahlerGeometry §5.7 (Rellich compactness, the scalar Laplacian and its Green operator); Mathlib
`HasStrictFDerivAt.implicitFunctionOfComplemented`.

**Checks.**
- At ψ = 0 the operator is 4Δ, whose kernel is the constants, so it is invertible only on mean-zero
  functions. When |ψ| is a constant ε > 0 (a constant spinor on T⁴ with trivial W⁺, say), `4Δ + ε²` is
  invertible with lowest eigenvalue ε², which tends to 0 with ε: there is no uniform inverse.

### 4.5 Properness and the quotient

If `x_n → x` and `u_n x_n → y` in C_s, the connection components force `dlog u_n` to converge in H^s. Fix
its eventually constant integral harmonic class, divide by one representative, write the remaining
gauge transformation as a constant phase times exp ξ_n with ξ_n vanishing at x₀, and prove convergence
in `H^(s+1)`; compactness of S¹ handles the phases. Derive properness of the action in the metrizable
models of configurations and gauge transformations. *Needs:* §§4.1–4.4.

- The stabilizer of an irreducible configuration (ψ ≢ 0) is trivial; a reducible configuration (ψ ≡ 0)
  has stabilizer exactly the constant circle. The based gauge group `G⁰ = {u : u(x₀) = 1}` acts freely,
  also at configurations with zero spinor.

Write `h = 4πi Σ_j t_j α_j` and `U_n ψ = (∏_j u_j^(n_j)) ψ` for n ∈ ℤ^b. Construct the Hilbert bundle
`ℰ_T = (ℝ^b × F)/((t, ψ) ∼ (t − n, U_n ψ))` over `T = ℝ^b/ℤ^b`, and its pullback ℰ over T × B, as native
vector bundles from cocycles with locally constant bounded complex-linear transitions on finitely many
evenly covered boxes of the torus. Prove `C_s/G⁰ ≃ Tot ℰ` and
`B_s* = C_s*/G_(s+1) ≃ (Tot ℰ)^× / S¹` as quotient homeomorphisms, where C_s* is the irreducible
configurations and `^×` removes the zero section. For b = 0 the torus is a point. No global
trivialization is assumed. *Needs:* §4.3; Mathlib `VectorBundle`, `Bundle.Trivialization`.

Finitely many smooth cutoffs χ_i on the torus with `Σ χ_i² = 1` and fibre coordinates φ_i give a
compatible Hermitian metric `h(v, w) = Σ χ_i² ⟨φ_i(v), φ_i(w)⟩` and a closed embedding
`J(v) = (base(v), (χ_i φ_i(v))_i)` into `(T × B) × F^m`. Extend each cutoff coordinate by zero, and prove
closedness and continuity of the inverse by reconstructing v at an index with χ_i ≠ 0. Large gauge
transformations act by bounded H^s multipliers, which need not be H^s-unitary. The resulting metric d is
invariant under the scalar circle; prove that `min_(c ∈ S¹) d(v, cw)` is a metric inducing the orbit
topology. Deduce that the quotient is Hausdorff, separable, second countable and paracompact from this
metric, without a general metrization theorem for proper actions or a finite CW structure.

Construct countably many phase slices, each where one of a separating sequence of bounded complex-linear
coordinates is nonzero. Dividing by the positive fibre norm and rotating that coordinate to a positive
real number gives smooth radial and projective charts, and `B_s* ≃ B × (0, ∞) × P(ℰ_T)`. Compare the
resulting principal gauge charts with the local slices of §4.4: properness and the triviality of
irreducible stabilizers exclude remote gauge transformations after shrinking, and the unique small
gauge transformation gives smooth transitions. This constructs B_s* as a smooth Banach manifold and
C_s* → B_s* as a principal G_(s+1)-bundle. The residual circle is not free on the zero section; no
effective μ₂ quotient and no orbifold structure at reducibles follows.

**Checks.**
- A configuration (A, 0) is fixed by every constant u ∈ S¹ (du = 0); for ψ ≢ 0, uψ = ψ forces u = 1 where
  ψ ≠ 0 and du = 0 on X, so u = 1 on connected X. A based u with du = 0 is constant and equal to 1, so G⁰
  acts freely even at (A, 0).
- For (t, ψ) ∼ (t − n, U_nψ): the gauge transformation `∏ u_j^(n_j)` changes the harmonic part by
  `−2 · 2πi Σ n_j α_j`, that is t ↦ t − n, and the spinor by U_n, as the identification requires.

### Examples

- For b₁ = 0 (ℂP², K3) the torus is a point, G_(s+1) ≃ S¹ × E₀, and B_s* is `B × (0, ∞) × P(F)`.
- For X = S¹ × S³ the torus is the circle `H¹(X; iℝ)/4πiH¹(X; ℤ)` and ℰ_T is the bundle over it obtained by
  gluing the ends of `[0, 1] × F` by multiplication with e^(iθ).

### Dependencies

Layers 2–3; ComplexKahlerGeometry §§5.4, 5.7; PseudodifferentialOperators Layer 5; AlgebraicTopology
Layers 6–8; GeometricTopology Layer 1. Tau Ceti: periods and exactness of closed one-forms. Mathlib:
the implicit function theorem, vector bundles and trivializations.

## Layer 5: four-dimensional continuation and compactness

### 5.1 Weak unique continuation for Dirac-type operators

On a connected open smooth Riemannian four-manifold, let D₀ be a smooth Dirac-type operator on a
finite-rank Hermitian Clifford module and V a locally essentially bounded endomorphism. Prove that an
`L²_loc` distributional solution of `(D₀ + V)χ = 0` that vanishes on a nonempty open set vanishes
everywhere, and the chiral version through the full graded operator (Booß-Bavnbek, Marcolli and Wang,
*Weak UCP and perturbed monopole equations*, Theorem 2.7, p. 8, from the product form of Lemma 2.2,
p. 5, the Carleman estimate of Lemma 2.4, p. 7, and the perturbed Carleman estimate of the Appendix,
pp. 18–21). The proof is owned here, including the local regularity L² → H¹, the passage through density
and cutoffs, and the local Carleman estimate. *Needs:* §3.1 (Dirac-type operators on Clifford modules,
SpinGeometry §6.1); ComplexKahlerGeometry §5.4 (local Sobolev spaces); PseudodifferentialOperators
Layer 6 (local elliptic regularity).

The route, whose steps are targets here: for a sufficiently small annulus thickness 0 < T ≤ T₀ write
`D₀ = c(dt)(∂_t + B_t + C_t)` on a fixed-density L² slice space, with B_t self-adjoint elliptic and C_t
skew-adjoint of order zero, absorbing any symmetric zeroth-order part into B_t. Prove the Gårding and
commutator bound for `−∂_t B_t + [B_t, C_t]` and the Carleman estimate
`R ∫ e^(R(T−t)²) |v|² ≤ C ∫ e^(R(T−t)²) |D₀v|²` for H¹ sections in the annular support class, vanishing
for t < 0 and for t ≥ 0.9T, with the corresponding slice and compact support. Give uniform bounds on the
coefficients, choose T₀ so that the small-T cross term is absorbed, and quantify R ≥ R₀ for the
unperturbed estimate. Then absorb V by taking `R > 2C‖V‖²_∞`, use a cutoff with derivative supported in
0.8T ≤ t ≤ 0.9T, compare with t ≤ T/2, and propagate along tangent balls by connectedness. Aronszajn's
theorem for scalar operators is not a proof for systems; this first-order argument proves the system
statement.

**Checks.**
- From `R∫w|v|² ≤ C∫w|D₀v|² ≤ 2C∫w|(D₀ + V)v|² + 2C‖V‖²_∞∫w|v|²` the perturbed estimate follows with
  constant `R − 2C‖V‖²_∞`, positive exactly when `R > 2C‖V‖²_∞`.

### 5.2 The weak maximum principle and energy bounds

From §3.2 derive, first weakly, for `f = |ψ|²` and a solution with `F_A⁺ = q(ψ) + η`,
`0 = Δf/2 + |∇_Aψ|² + Scal f/4 + f²/4 + Re⟨C(η)ψ, ψ⟩/2`. With `‖C(η)‖ = √2|η|` (Tau Ceti
`TauCeti.SeibergWitten.norm_cliffordRestriction_of_hodgeStar_eq_self`), test against `(f − B)₊` to obtain
`‖ψ‖²_∞ ≤ max(0, sup_X(2√2|η| − Scal))`; for η = 0 and Scal > 0 this is the vanishing of ψ derived from
the integrated identity (Witten, *op. cit.*, §3, eq. (3.1) and the paragraph after it). Initial `H^s`
spinors are not assumed to be C². Give the bounds on F_A⁺ and `‖F_A‖²_2 = 2‖F_A⁺‖²_2 − 4π²⟨l², [X]⟩`,
uniformly over compact smooth families of metrics and
perturbations with bounded norms. *Needs:* §§1.4, 2.1, 3.2, 4.1; ComplexKahlerGeometry §5.4 (weak
derivatives and test functions).

**Checks.**
- At a maximum of f, Δf ≥ 0 with Δ = d*d, so `0 ≥ Scal f/4 + f²/4 − √2|η|f/2`, that is
  `f ≤ 2√2|η| − Scal` wherever f > 0. With η = 0 and positive scalar curvature, ψ = 0; on a flat T⁴ with
  η = 0, ψ = 0 as well.
- `‖F_A‖² = ‖F_A⁺‖² + ‖F_A⁻‖²` and `‖F_A⁺‖² − ‖F_A⁻‖² = 4π²⟨l², [X]⟩` (§1.4); on ℂP² with l = 3h,
  `‖F_A‖² = 2‖F_A⁺‖² − 36π²`.

### 5.3 The global bootstrap

Prove the kernel-projected estimate `‖a‖_(W^(1,p)) ≤ C(‖d⁺a‖_p + ‖d*a‖_p + ‖harm(a)‖)` for 1 < p < ∞, on
imaginary one-forms. Combine §4.3 and §5.2 to bound the Coulomb representative a in W^(1,p) for every
finite p, then ψ in W^(1,p) from the Dirac equation for the fixed reference connection. With p = 6:
η ∈ H³ embeds in W^(1,6), the products put a and ψ in W^(2,6), hence in C^(1,α) with bounded first
derivatives; the quadratic terms then have H² bounds, giving H³, and H⁴ through multiplication in H³.
Iterate to H^(s+1) for η ∈ H^s. No embedding `H³ → W^(2,p)` with p > 4, which is false in dimension four,
is used. Prove the comparisons of weak-coefficient regularity and of kernels and cokernels at every
step. *Needs:* §§3.4, 4.1, 4.3, 5.2; PseudodifferentialOperators Layers 5–6 (L^p and Sobolev estimates,
elliptic regularity); ComplexKahlerGeometry §5.7.

**Checks.**
- In dimension four `H³ = W^(3,2) ⊂ W^(1,q)` for every finite q (since 1/2 − 2/4 = 0), and
  `H³ ⊂ W^(2,q)` exactly for q ≤ 4 (since 1/2 − 1/4 = 1/4), so the step through W^(1,6) is legitimate and
  `H³ ⊂ W^(2,6)` is not.

### 5.4 Compactness

For perturbations η_n converging in H^s, take the global Coulomb representatives of solutions, use the
uniform `H^(s+1)` bounds of §5.3 to obtain strong H^s convergence of a subsequence by Rellich
compactness, and pass to the limit through ℱ. For smooth η the representatives are smooth, by
iteration. Prove the uniformity, and the identifications of the bundles, over compact families of
metrics. Conclude that the projection from the solutions modulo gauge to P_s is proper, and that its
restriction to irreducible solutions is proper over every compact set of parameters admitting no
reducible solution (Okonek and Teleman, Proposition 4 i), p. 4, for the properness of the projection to
the parameters). This is abelian
global compactness: no Uhlenbeck convergence away from points and no SU(2) compactification of
FourManifolds Layer 5 is involved. *Needs:* §§4.3, 4.5, 5.2, 5.3; ComplexKahlerGeometry §5.7 (Rellich).

### Examples

- On a K3 surface with a Ricci-flat metric, or T⁴ with a flat metric, and η = 0, the bound of §5.2
  forces ψ = 0 for every solution (Scal = 0), so all solutions are reducible; for T⁴ with l = 0 they are
  the flat connections modulo gauge, the torus `H¹(T⁴; iℝ)/4πiH¹(T⁴; ℤ)`.
- With a metric of positive scalar curvature (ℂP² with the Fubini–Study metric) and η = 0 all solutions
  are reducible.

### Dependencies

Layers 1–4; SpinGeometry §6.1; ComplexKahlerGeometry §§5.4, 5.7; PseudodifferentialOperators Layers 5–6.
Tau Ceti: the operator norm of the Clifford map. FourManifolds Layer 5 is not used.

## Layer 6: universal regularity, wall geometry and generic choices

### 6.1 Universal cokernel elimination

At an irreducible solution, first realize the slice derivative as an operator H¹ → L². Prove that ℒ is
Fredholm by comparing it with its smooth principal part up to a compact lower-order term, and use
`d₁d₀ = 0` and the scalar inverse of §4.4 to identify its slice cokernel. Let (β, χ) be an L² annihilator
of the universal linearization, in which η also varies. Arbitrary smooth variations of η give β = 0.
Variations of the imaginary one-form a then give `Re⟨c(a)ψ, χ⟩ = 0` for all a; where ψ(x) ≠ 0 the map
`a ↦ c(a)ψ(x)` is a real isomorphism from `iT*_xX` onto `W⁻_x` (Tau Ceti `CliffordAlgebra.cliffordMulEquiv`,
with `|c(v)ψ| = |v||ψ|` by `CliffordAlgebra.norm_map_ι_apply`; both spaces have real rank four), so χ
vanishes on a nonempty open set. Spinor variations give `D_A⁻χ = 0` weakly, and §5.1 forces χ = 0. The
closed range and the finite-dimensional cokernel of the Fredholm operator, not density alone, provide
finitely many smooth perturbation directions and a bounded split right inverse. Transfer the argument
to `H^s → H^(s−1)` through the comparison of kernels and cokernels with Sobolev coefficients; a
high-order Sobolev dual is not identified with L² without it. Construct the universal zero set as a
Banach manifold and its projection to the perturbations as a Fredholm map of integer index d
(Okonek and Teleman, Proposition 4 ii) and its proof, pp. 4–5).
*Needs:* §§3.5, 4.4, 4.5, 5.1, 5.3; PseudodifferentialOperators Layer 6; Tau Ceti
`CliffordAlgebra.cliffordMulEquiv`, `CliffordAlgebra.norm_map_ι_apply`; Mathlib
`ContinuousLinearMap.IsFredholm`, `HasStrictFDerivAt.implicitFunctionOfComplemented`.

**Checks.**
- In the Fock model with ψ the vacuum, `c(e₁)ψ, c(e₂)ψ, c(e₃)ψ, c(e₄)ψ` are, up to a common positive
  factor, `ε₁, iε₁, ε₂, iε₂`, a real basis of W⁻ = Λ^(0,1); at a zero of ψ the map is zero, which is why the
  argument needs the open set where ψ does not vanish and then unique continuation.

### 6.2 Reducibles, walls and chambers

Prove that the equations with parameters (g, η) have a reducible solution exactly when
`harm_g⁺(F_(A₀) − η) = 0`, that this condition does not depend on the reference connection A₀, and that
`η ↦ harm_g⁺ η` is surjective onto H⁺_g. For fixed g the wall is an affine subspace of codimension b₂⁺,
also when l is a torsion class (Okonek and Teleman, Definition 3 and Proposition 4 iii) and vi),
pp. 4–6); on it the reducible solutions modulo gauge form a torsor for `H¹(X; iℝ)/4πiH¹(X; ℤ)`, each
with stabilizer S¹. Construct the dependence of the wall on the metric.
*Needs:* §§1.4, 4.3, 4.5; ComplexKahlerGeometry §5.7 (harmonic self-dual forms and the Hodge
comparison).

If b₂⁺ = 1, choose a component of the positive cone of H²(X; ℝ) and, for each metric, the unit g-harmonic
self-dual form ω_g in that component. Define the wall function

    w(g, η) = ⟨harm_g⁺(F_(A₀) − η), iω_g⟩_(L²) = −2π (l − [iη/(2π)]) · [ω_g],

and the chambers `C₊ = {w > 0}` and `C₋ = {w < 0}`. When η is not closed, its displayed class means the
self-dual harmonic projection of η under the de Rham and Hodge comparison, not a class attached to an
arbitrary non-closed form. With `b = [iη/(2π)]`, C₊ and C₋ are the chambers `C_(H₀,±)` of Okonek and
Teleman (Definition 7, p. 8), where H₀ is the component containing [ω_g]. Prove that C₊ and C₋ are the
two components of the complement of the wall in the space of parameters, over the contractible space
of metrics, by trivializing the oriented line of
positive harmonic forms and its surjective affine perturbation map. If b₂⁺ = 0, no density of wall-free
parameters and no independence of the invariant is claimed.

**Checks.**
- With F_(A₀) = −2πi λ + (exact), λ harmonic representing l, the pairing is
  `⟨−2πi λ, iω_g⟩ = −2π ∫ λ ∧ ω_g = −2π l · [ω_g]`, and with η = iη′ the perturbation contributes
  `−∫ η′ ∧ ω_g = 2π [iη/(2π)] · [ω_g]`; the sign of each term is part of the convention.
- On ℂP² with l = 3h, the Fubini–Study metric and η = 0, w = −6π h·[ω_g] < 0 for ω_g a positive multiple of
  the Kähler class: the pair lies in C₋. The family `η = −irω_g` has `∂w/∂r = |ω_g|²_(L²) = 1 > 0` and
  reaches C₊ for r > 6π h·[ω_g].

### 6.3 Sard–Smale and smooth regular parameters

Prove that the universal maps on fixed-base Sobolev spaces are C∞, from their bounded multilinear and
superposition formulas. Construct countable charts on complete Banach models, split kernels and the
comparison of the Fredholm projection in these charts, and apply Tau Ceti's
`TauCeti.isMeagre_image_criticalPoints_of_isFredholm` at smoothness ∞, where its threshold
`(dim ker)² + 1` is automatic; assemble the critical images by a countable union through the target
charts. This is a manifold and application adapter for the library's smooth theorem. The regular
wall-free parameters form an open set, by compactness and uniform right inverses, dense in the
wall-free open set by that Sard–Smale theorem. When b₂⁺ ≥ 1 the complement of the wall is itself open
and dense. Density of smooth parameters inside an open regular neighbourhood gives smooth regular
parameters; for density in a chosen finite Cʳ seminorm neighbourhood, work at an integer Sobolev order
m > r + 2 and compare the same operator across the completions. When a genuinely
finite-Cᵏ theorem is used, the sharp interface k > max(index, 0) of HeegaardFloer §2.1 (F0.S) is kept,
with an explicit budget of derivatives for the application (Convention 10). At a regular wall-free
parameter the moduli space is a compact manifold of dimension d ≥ 0 (Okonek and Teleman, p. 7, the
paragraph before Definition 6); when d < 0 it is empty, and no truncated natural-number dimension is
used. *Needs:*
§§4.1, 5.4, 6.1, 6.2; HeegaardFloer §§2.1–2.2 (F0.S, F0.0: manifold, bundle and relative adapters); Tau
Ceti `TauCeti.isMeagre_image_criticalPoints_of_isFredholm`,
`TauCeti.dense_compl_image_criticalPoints_of_isFredholm`.

**Checks.**
- A surjective Fredholm map of negative index between Banach spaces does not exist (the kernel would have
  negative dimension), so for d < 0 a regular moduli space is empty; the convention `max(d, 0)` would
  instead assign it dimension 0.

### Examples

- On a K3 surface (b₂⁺ = 3) the wall has codimension three in the perturbations for each metric, so a
  generic path of parameters misses it.
- On ℂP² (b₂⁺ = 1, b₁ = 0) the parameter space is cut by the hypersurface w = 0 into C₊ and C₋, and on the
  wall the reducible solution modulo gauge is a single point with stabilizer S¹.

### Dependencies

Layers 3–5; ComplexKahlerGeometry §5.7; PseudodifferentialOperators Layer 6; HeegaardFloer §§2.1–2.2.
Tau Ceti: Clifford multiplication by covectors on a nonzero half-spinor, and the smooth Sard–Smale
theorem. Mathlib: Fredholm operators and the implicit function theorem.

## Layer 7: determinant orientations and integral universal classes

### 7.1 Orientation of the determinant line

The determinant line of a single Fredholm operator, `det(ker) ⊗ det(coker)*`, is Tau Ceti's
`LinearMap.detLine`, one-dimensional by `ContinuousLinearMap.IsFredholm.finrank_detLine`. Apply the
generic construction of determinant lines of Fredholm families of HeegaardFloer §2.2 (F0.0) and §3.4
(F1.4) to the real family ℒ, through actual finite-dimensional stabilizations of the range (Tau Ceti
`ContinuousLinearMap.IsFredholm.exists_stabilization_kernel_coordinates`). Scale the ψ-dependent
zeroth-order terms to zero, and construct the coherent comparison of determinant lines with the ordered
sum `T ⊕ (D_A⁺)_ℝ`. Prove that a complex-linear Fredholm family carries its complex orientation
continuously, compatibly with complex-linear stabilization, with the exact sequences of kernels and
cokernels, with realification and with the direct-sum maps of determinant lines. *Needs:* §§3.4, 3.5,
4.5; HeegaardFloer §§2.2, 3.4; Tau Ceti `LinearMap.detLine`,
`ContinuousLinearMap.IsFredholm.finrank_detLine`,
`ContinuousLinearMap.IsFredholm.exists_stabilization_kernel_coordinates`.

A homology orientation is an orientation of `H⁰(X; ℝ) ⊕ H¹(X; ℝ) ⊕ H⁺(X; ℝ)`, transported to imaginary
coefficients by multiplication by +i. The positive constant gauge generator is e₀ = i · 1. If b₂⁺ = 1, take
the positive harmonic form ω_g of §6.2, put e₊ = iω_g, and choose the orientation h of iH¹ for which
`e₀ ∧ h ∧ e₊` is the given homology orientation. Orient
`det T = det(iH¹) ⊗ det(iH⁰ ⊕ iH⁺)*` by declaring `h ⊗ (e₀ ∧ e₊)*` positive under this direct map of
orientation torsors, with no further Koszul reordering. For general b₂⁺ use an oriented ordered frame of
iH⁺ in place of e₊. Transport H⁺ over the space of metrics through the contractible space of maximal
positive subspaces and its Hodge realization. Compare the actual block −2d* through an explicit map of
kernels and cokernels. Cancel the
gauge-orbit directions with the positive operator d₀*d₀; the remaining complex factors have even real
rank. Prove invariance under gauge transformations, large ones included, descent to the quotient of §4.5,
compatibility with pullback, and the sign change under reversal of the homology orientation (Okonek and
Teleman, p. 7, the paragraph before Definition 6, which orients the moduli space by the complex
orientation of the Dirac index and an orientation of `det H¹ ⊗ (det H⁺)*`, and the Remark after
Definition 8, p. 9, for the sign change). *Needs:* §6.2; ComplexKahlerGeometry §5.7.

For a family over a positively oriented path parameter s use `det ℒ^par ≃ det(ℝ_s) ⊗ det ℒ`, with the
parameter first, and orient boundaries outward-normal first, so that the oriented boundary of a regular
path of moduli spaces is M₁ − M₀. Prove compatibility with collars, exact sequences, gluing and finite
stabilization before Layers 8 and 10 use these rules.

**Checks.**
- For `[0, 1] × M` with M oriented of dimension d, parameter first: at s = 1 the outward normal is ∂_s and
  the boundary orientation o satisfies `∂_s ∧ o = ∂_s ∧ o_M`, so o = o_M; at s = 0 it is −o_M. The
  boundary is M₁ − M₀. Placing the parameter last would give `(−1)^d (M₁ − M₀)`.
- Reversing the homology orientation with h fixed reverses e₀ ∧ h ∧ e₊, hence the orientation of det T and
  of every moduli space; the invariant changes sign (§8.3).

### 7.2 The charge-one universal line

For a fixed x₀ ∈ X, the based gauge group `G⁰ = {u : u(x₀) = 1}` gives the circle bundle
`P₀ = C_s*/G⁰ → B_s*`, with right action `[x] · z = [z⁻¹ · x]`. Its standard-character line is the
diagonal quotient `(x, v) ∼ (u · x, u(x₀) v)`. Construct its principal and associated charts and define
μ as the first Chern class of this line (Okonek and Teleman, the Remark after Lemma 5, p. 7, for the
circle bundle of the based gauge group, and Definition 6, p. 7, for its powers as the point
insertion). For a variable point y ∈ X construct the line U over X × B_s* by
`(x, y, v) ∼ (u · x, y, u(y) v)`. Joint evaluation is continuous at finite Sobolev order, so U is first a
topological line, with smooth dependence on the configuration at fixed y; no jointly C∞ evaluation on
`H^(s+1)(X, U(1))` is claimed. On smooth finite-dimensional moduli spaces and families, construct the
smooth bundle comparison by elliptic regularity in the parameters and ordinary smoothing of bundles.
*Needs:* §§4.3, 4.5; TopologicalKTheory T1 and T1.6a (the fixed-rank universal complex line Gr₁∞ and its
finite stages); CharacteristicClasses §1.5 (the integral cohomology of ℂP^∞ and its generator).

- Construct the integral class of the based line on B_s* from countable slice covers, a locally finite
  partition of unity and the resulting numerable classifying map into Gr₁∞.
- Construct c₁(U) on the actual product X × B_s*: X is compact metrizable and B_s* separable metrizable
  (§4.5), so the product is metrizable and paracompact. Refine to a countable cover by principal gauge
  slices V_j, Picard torus boxes included; their representatives trivialize U over X × V_j by evaluating
  gauge transformations at y. Pull back the locally finite partition from B_s* and apply the same
  finite-support projective classifier on the product.
- U restricted to {x₀} × B_s* is the based line, so its class there is μ. Neither construction asserts a
  finite CW type for B_s* or a classification by singular H² of line bundles on arbitrary spaces.

Through §4.5 identify P₀ with the nonzero vectors of ℰ. The standard-character relation
`(v, w) ∼ (cv, cw)` sends [v, w] to the complex-linear functional f on ℂv with f(v) = w, which identifies
the line with the dual tautological line O(1). On a countable phase cover choose a subordinate locally
finite partition ρ_j; writing `p = s_j(b) · z_j(p)`, the finite-support coordinates
`a_j(p) = √ρ_j(b) · conj(z_j(p))` satisfy `a(p · z) = z⁻¹ a(p)`. Prove that the resulting projective map
factors locally through the finite stages of the fixed-rank union of TopologicalKTheory T1.6a. The line
is the pullback of the dual tautological bundle; composing with a fixed coordinatewise conjugation
classifies it against the tautological bundle itself. Prove independence of the choices and refinements,
and the normalization `⟨c₁(O(1)), [ℂP¹]⟩ = +1` on the complex-oriented projective line. No homeomorphism
of norm-topology Hilbert projective space with the weak-topology ℂP^∞ is used.

**Checks.**
- For `p · z = s_j(b) z_j(p) z`, `a_j(p · z) = √ρ_j(b) · conj(z_j(p)) z⁻¹ = z⁻¹ a_j(p)` because |z| = 1; with
  `a_j = √ρ_j z_j` instead the map would transform by z and classify the dual line, reversing the sign
  of μ.

### 7.3 Determinant and slant comparisons

Prove that the universal determinant line on X × B_s* is `pr_X* L ⊗ U²`, so that its point class is 2μ and
its loop slant is twice the charge-one slant. Order products X first: for γ ∈ H₁(X; ℤ) define
`ν(γ) = c₁(U)/γ ∈ H¹(B_s*; ℤ)` by `⟨ν(γ), σ⟩ = ⟨c₁(U), γ × σ⟩` for the actual chain cross product and
evaluation (Okonek and Teleman, Lemma 5, p. 6, for the classes ν(l); §4.1, p. 12, for the Künneth
decomposition in which the determinant line carries twice the charge-one class). Through degree-one
universal coefficients identify these classes with their integer evaluations on loops in B_s*. *Needs:*
§7.2; AlgebraicTopology Layer 6 (cross products, the Eilenberg–Zilber and Alexander–Whitney maps,
universal coefficients); Tau Ceti `TauCeti.singularCross`, `TopCat.integralCohomology`.

- ν(γ) does not depend on the cycle representing γ, is additive and natural, vanishes on torsion, and is
  compatible with changes of Sobolev completion; μ does not depend on the base point.
- Product order and slant signs are pinned by the Eilenberg–Zilber and Alexander–Whitney comparison, not
  by an unexplained identification of the determinant line with the spinor line.
- The integral classes and their bundles extend over every wall-free regular cobordism of parameters.
  No principal residual circle over the coarse quotient with reducibles is claimed: that circle action
  has fixed points there.

**Checks.**
- The fibre of the universal determinant line at (y, [A, ψ]) is L_y with gauge action by u(y)², which is
  the weight of `pr_X* L ⊗ U²`; restricted to {x₀} × B_s*, where L_(x₀) is a fixed vector space, its class
  is 2μ. Using the determinant line in place of U would double every insertion.

### Examples

- For b₁ = 0 every ν(γ) vanishes and the only insertions are powers of μ.
- The universal determinant line has point class 2μ and loop insertions 2ν(γ); every invariant of
  Layer 8 is stated with the charge-one classes μ and ν.

### Dependencies

Layers 3–6; HeegaardFloer §§2.2, 3.4; TopologicalKTheory T1, T1.6a; CharacteristicClasses §1.5;
AlgebraicTopology Layer 6. Tau Ceti: determinant lines of Fredholm operators, finite stabilization of
Fredholm families, singular cross products and integral cohomology.

## Layer 8: relative families and the exterior-form invariant

### 8.1 The relative parameter theorem

For a compact interval, or a given compact parameter manifold with corners of dimension q ≤ 2,
construct the bundles of metrics, configurations and targets over the parameter space with smooth local
trivializations and analytic estimates uniform over the compact parameter space. Prescribed collars
at the faces are product extensions of face families that are already regular in the ambient sense,
compatible at the corners; arbitrary data frozen off the faces do not qualify. Interior bump functions
in the parameter times the finitely many smooth curvature directions of §6.1 give universal
surjectivity. For C∞ families use finite-dimensional smooth perturbation windows and the countable-chart
smooth Sard–Smale route of §6.3, with the relative and corner adapter constructed here. For genuinely
finite-Cᵏ families prove the exact budget of derivatives before applying HeegaardFloer §§2.1–2.2 with
k > max(d + q, 0). *Needs:* §§5.4, 6.1–6.3, 7.1; HeegaardFloer §§2.1–2.2, 2.5 (F0.3: universal zero
sets and the regular-parameter projection); Tau Ceti `TauCeti.isMeagre_image_criticalPoints_of_isFredholm`.

- For a wall-free compact regular family the zero set modulo gauge is a compact neat oriented manifold
  with the prescribed boundary and corner strata (Okonek and Teleman, Proposition 4 iv)–v), pp. 4–5, for
  paths).
- Generic transverse q-families avoid the reducible wall when q < b₂⁺. When q ≥ b₂⁺, transversality does
  not guarantee avoidance, although particular families may avoid the wall; in particular b₂⁺ = 2 does not
  make every two-parameter family wall free.
- For a regular path the oriented boundary of the parametrized moduli space is M₁ − M₀ (§7.1).

**Checks.**
- The wall has codimension b₂⁺ (§6.2): for b₂⁺ = 1 a generic path meets it transversally in isolated
  points, which is why the invariant can depend on the chamber; for b₂⁺ = 2 a generic two-parameter
  family meets it in isolated points as well.

### 8.2 Full insertions of H₁

For the Spinᶜ structure P, regular wall-free parameters and an integer d ≥ 0, define for each
`0 ≤ r ≤ min(b₁, d)` with d − r even and m = (d − r)/2 the invariant

    SW^r_P(γ₁, …, γ_r) = ⟨ν(γ₁) ⌣ ⋯ ⌣ ν(γ_r) ⌣ μ^m, [M]⟩,

where M is the compact oriented moduli space, γᵢ ∈ H₁(X; ℤ), and μ and ν are the classes of §§7.2–7.3
restricted to M (Okonek and Teleman, Definition 6, p. 7, for the point and the full exterior
insertions). Construct the integer pairing on the
moduli space through the comparison of its smooth orientation (§7.1) with a fundamental class, in the
form of Tau Ceti's
`TauCeti.HomologicalOrientation`, and identify SW^r_P with Tau Ceti's insertion form
`TauCeti.HomologicalOrientation.cupInsertionForm` for β = μ^m and the inclusion of M in B_s*, composed with
ν. *Needs:* §§6.3, 7.1–7.3, 8.1; AlgebraicTopology Layer 6 (fundamental classes, cup and cap products);
Tau Ceti `TauCeti.HomologicalOrientation`, `TauCeti.HomologicalOrientation.cupInsertionForm`,
`TopCat.integralCupProd_add_self_eq_zero`.

- SW^r_P is multilinear, integral and alternating. Graded commutativity makes twice a pairing with a
  repeated degree-one class zero, and the target ℤ is torsion free, so a repeated argument gives zero with
  no division by two in cohomology (`TopCat.integralCupProd_add_self_eq_zero`). Since ν vanishes on
  torsion, SW^r_P is an integral alternating r-form on H₁(X; ℤ)/torsion.
- If d < 0 the regular moduli space is empty. If r > d or d − r is odd, the r-component is zero for
  degree reasons. For odd d the components with odd r can be nonzero; the point-only invariant is the
  component r = 0, and its vanishing for odd d is not a statement about the whole invariant.

**Checks.**
- The degrees match: ν(γᵢ) has degree 1 and μ degree 2, so the class has degree r + 2m = d = dim M.
- `ν(γ) ⌣ ν(γ) = −ν(γ) ⌣ ν(γ)` by graded commutativity, so `2⟨ν(γ)² μ^m, [M]⟩ = 0` and the pairing, an
  integer, is 0; an argument that divided ν(γ)² by two in H²(M; ℤ) would fail where H²(M; ℤ) has
  two-torsion.

### 8.3 Invariance and chambers

If b₂⁺ > 1, construct regular wall-free paths of parameters with prescribed regular collars at the ends;
avoidance of the wall in dimension one, compactness, the boundary orientation of §7.1 and the extension
of the insertion classes over the cobordism prove that every component SW^r is independent of the metric
and the perturbation (Okonek and Teleman, Proposition 4 iv)–vi), pp. 4–6, and p. 8). If b₂⁺ = 1, prove
that it is constant on each chamber (Okonek and Teleman, Definition 8, p. 9). Give the exact pullback
formulas under isomorphisms of Spinᶜ structures and under orientation-preserving diffeomorphisms, with
their induced action on H₁, and the sign change under reversal of the homology orientation. Lifts with
equal real determinant classes stay distinct. The proof uses the compact cobordisms and the relative
fundamental-class and cup identities. *Needs:* §§6.2, 7.1, 7.3, 8.1, 8.2; AlgebraicTopology Layer 6.

**Checks.**
- For a regular wall-free path with parametrized moduli space W, `∂W = M₁ − M₀` and the insertion class c
  is restricted from W, so `⟨c, [M₁]⟩ − ⟨c, [M₀]⟩ = ⟨c, ∂[W, ∂W]⟩ = 0`. Across the wall (b₂⁺ = 1) the
  class is not defined on the reducible point, W acquires the extra boundary of §10.3, and the
  difference need not vanish.

### Examples

- For b₁ = 0 only r = 0 occurs: SW⁰ = ⟨μ^(d/2), [M]⟩ for d even and 0 for d odd; for d = 0 it is the signed
  count of the points of M.
- For b₁ = 1 and d = 1 the only component is r = 1, the linear form γ ↦ ⟨ν(γ), [M]⟩ on H₁(X; ℤ)/torsion ≅ ℤ.

### Dependencies

Layers 5–7; HeegaardFloer §§2.1–2.2, 2.5; AlgebraicTopology Layer 6. Tau Ceti: manifold orientations and
fundamental classes, the integral cup product and the insertion form, and the smooth Sard–Smale theorem.

## Layer 9: Picard Dirac families and their characteristic classes

### 9.1 The Picard torus and the Poincaré line

On the reducible wall, construct the Picard torsor of §4.3 and identify it, through a reference
connection, with `T = H¹(X; iℝ)/(4πiH¹(X; ℤ))`. The torus of the ordinary gauge action on L uses the 2π
lattice; prove that the quotient map from T to it is the finite cover inducing multiplication by two on
the corresponding integral generators. Construct the homeomorphism of T with a product of circles from an
integral harmonic basis, and the integral cohomology of T as an exterior algebra by the ordinary cup and
Künneth maps. Orient T by the orientation h of §7.1 under the tangent identification
`T_[A]T ≃ iH¹(X; ℝ)`, and write [T]_h for this signed fundamental class. For b = b₁ > 0 choose an integral
harmonic basis α₁, …, α_b whose image under +i is h-positive; for b = 0, [T]_h is the signed point class
prescribed by h, which no reordering of an empty basis can change. (Okonek and Teleman, §4.1,
pp. 10 and 12, for the tori of the based gauge group and of its squares, the covering between them and
the universal lines.) *Needs:* §§4.3, 6.2, 7.1, 7.3;
AlgebraicTopology Layer 6; Tau Ceti `TauCeti.torusExteriorPowerEquiv` (the homology of a torus as an
exterior algebra), `TauCeti.singularCross`.

- Using based gauge transformations, construct the normalized charge-one Poincaré line 𝒫 on X × T,
  topologically trivial along {x₀} × T and along each X × {t}. Define `ν_T(γ) = c₁(𝒫)/γ` by the X-first
  slant of §7.3 and write `ν_i = ν_T(γ_i)` for the integral basis γ_i of H₁(X; ℤ)/torsion dual to α_i.
- For b > 0, `⟨ν_T(γ₁) ⌣ ⋯ ⌣ ν_T(γ_b), [T]_h⟩ = det(⟨α_j, γ_i⟩)` for the h-positive basis.
- The mixed class is computed by clutching: along `A_t = A_ref + 4πi t α` the gauge transformation at the
  end is u_j⁻¹ and the transition of the cylinder frame is u_j, so the curvature of 𝒫 on X × S¹ is
  `F = 2πi dt ∧ α` and `c₁ = α ∧ dt`. The X-first slant on this positive Picard loop is `+⟨α, γ⟩`. In the
  base-first order on T × X, `c₁(𝒫) = Ω = −Σ_i ν_i ⊗ α_i` for dual integral bases. This dictionary is
  proved from these maps.
- The universal Spinᶜ determinant line on X × T is `pr_X* L` tensored with the square of 𝒫. Prove that the
  resulting chiral family is the Dirac family of the half-connections, including all gauge gluing, not
  merely a family with the same scalar index.

**Checks.**
- `c₁ = [iF/(2π)] = [i · 2πi dt ∧ α/(2π)] = [−dt ∧ α] = [α ∧ dt]`, and
  `⟨α ∧ dt, γ × [S¹]⟩ = ⟨α, γ⟩`; writing the curvature as `4πi dt ∧ α`, the curvature of the determinant
  line, would double the slant.
- For b = 1 with γ dual to α, `⟨ν_T(γ), [T]_h⟩ = 1`; for b = 0 the pairing of the empty product with [T]_h
  is ±1 according to h.

### 9.2 The stabilized family index

Build the Hilbert and Sobolev bundles over the compact torus T and the continuous family of Fredholm maps
H¹ → L² given by the Dirac operators of §9.1, with first-order estimates uniform over T and weak adjoint
regularity from the shared elliptic theory. Reuse the generic finite-target stabilization and
kernel-bundle index of TopologicalKTheory T6.5: choose a finite-rank trivial bundle W making (D, W)
surjective and set `I = [ker(D, W)] − [W] ∈ K⁰(T)`. Prove independence of W, homotopy invariance,
pullback, direct sums and the comparison with tensor products and projections through these
stabilization maps. Jumps of rank are handled by the stabilized kernels; ker D is not assumed to be a
vector bundle. Construct the comparison of the C(T)-module Fredholm index of OperatorKTheory K4 (§§4.1–4.2),
through the continuous section modules of HilbertModules H5 and the Serre–Swan maps of
TopologicalKTheory, and prove that it equals the same class I. This compares existing index carriers.
*Needs:* §9.1; TopologicalKTheory T1, T6.5; OperatorKTheory
§§4.1–4.2; HilbertModules H5; ComplexKahlerGeometry §5.4; Tau Ceti
`ContinuousLinearMap.IsFredholm.exists_stabilization_kernel_coordinates`,
`ContinuousLinearMap.kernelHomeomorph` (local product charts of the stabilized kernels).

**Checks.**
- If D_t is surjective for all t, W = 0 is allowed and I = [ker D], of rank δ; if dim ker D_t jumps at one
  point, ker D is not a bundle, while ker(D, W) is one of constant rank δ + rank W.

### 9.3 The family index theorem over the Picard torus

Construct the index comparison for the product family over the fixed closed X and the compact parameter
space T. Form the relative K-theory symbol class on `T × D(T*X)` relative to `T × S(T*X)`; through uniform
vertical smoothing, continuous quantization, parametrices depending on the parameter and bounded
transforms, define its analytic index in K⁰(T), and identify it with the class I of §9.2 (Okonek and
Teleman, §4.1, p. 13, state its cohomological form for this family). Extend the
symbol-homotopy, excision, external-product and embedding and Bott normalization arguments of
IndexTheory Layers 2–5 (I2–I5) to compact parameters, proving uniform continuity of the operators,
compatibility with stabilized kernels and enlargement of supports at each step. For a fixed embedding of
X prove the parameter-relative Thom pushforward and its analytic equality; its point and Bott
normalization is the identity on K⁰(T), including tensoring with a bundle on the base. This is an
application to fixed product families owned here; it is not the scalar theorem of IndexTheory Layer 6
restated with output in K⁰(T), and it does not assume a families index theorem for variable fibres or a
KK-theoretic result. *Needs:* §§3.1, 9.2; IndexTheory Layers 2–5; PseudodifferentialOperators Layers 4–7
(P4–P7: quantization, parametrices and changes of order); TopologicalKTheory T4–T5 (Bott periodicity and
Thom classes).

### 9.4 Characteristic and integral adapters

Apply the Chern character, Thom and Gysin diagram of CharacteristicClasses C6 to the comparison of §9.3,
with the universal comparison of §3.3a, to prove `ch(I) = ∫_X Â(TX) exp(l/2 + Ω)` on T. Products on T × X
are base first, with the graded Künneth multiplication
`(α ⊗ a)(β ⊗ b) = (−1)^(deg a · deg β) αβ ⊗ ab`; compute every surviving component from the charge-one Ω
of §9.1 and the chiral symbol of §3.1. Ω is not replaced by the determinant class, twice its size.
*Needs:* §§3.3a, 9.1, 9.3; CharacteristicClasses §§6.1–6.5; Tau Ceti
`LinearMap.BilinForm.apply_eq_zero_of_alternatingMap_of_sigPos_lt_three`,
`LinearMap.BilinForm.IsCharacteristic`, `TopCat.integralCupProd_add_self_eq_zero`; Mathlib `DividedPowers`.

- If b₂⁺ = 1, every four-fold pairing `⟨a₁a₂a₃a₄, [X]⟩` of classes in H¹(X) vanishes: a nonzero alternating
  four-form on a four-dimensional subspace of H¹ would give a subspace of wedge squares of signature (3, 3)
  for the intersection form, contradicting b₂⁺ = 1. The linear algebra is Tau Ceti's
  (`LinearMap.BilinForm.apply_eq_zero_of_alternatingMap_of_sigPos_lt_three`); the target is its
  application to the cup product and the intersection form of X.
- For l characteristic and a, b ∈ H¹(X; ℤ), `⟨l a b, [X]⟩/2 ∈ ℤ`, from `(ab)² = 0` and the integral cup
  comparison; the parity statement for characteristic vectors is Tau Ceti's
  (`LinearMap.BilinForm.IsCharacteristic`).
- With `Ω = −Σ ν_i ⊗ α_i`, `c₁(I) = −u` where `u = (1/2) Σ_(i<j) ⟨l α_i α_j, [X]⟩ ν_i ν_j`; the graded square
  `Ω² = −2 Σ_(i<j) ν_i ν_j ⊗ α_i α_j` fixes the sign.
- If b₂⁺ = 1, `ch_j(I) = 0` for j ≥ 2, hence `c(I) = exp(−u)` and `s(I) = exp(+u)`, rationally and through
  the integral divided powers below (Okonek and Teleman, Lemma 13 and its proof, p. 13, with the sign of
  c₁ compared in §10.3). These are derived from the virtual bundle I.
- Divided powers on the integral exterior algebra of the torus: for `u = Σ_(i<j) a_ij ν_i ν_j` with integer
  a_ij, the coefficient of each monomial in u^k/k! is the signed sum over the unordered decompositions of
  its index set into k disjoint pairs, so u^k/k! is an integral class, defined without dividing by k! in
  integral cohomology. These classes are the values at u of a divided-power structure, in the sense of
  Mathlib's `DividedPowers`, on the ideal of positive-degree classes of the commutative ring of
  even-degree integral cohomology of T; it is constructed here, and it is unique because that ring is
  torsion free. Fix the hyperplane, universal-line and determinant orientations before
  identifying any polynomial of a source with these classes.

**Checks.**
- `Ω² = Σ_(i,j) (ν_i ⊗ α_i)(ν_j ⊗ α_j) = −Σ_(i,j) ν_iν_j ⊗ α_iα_j`, and the terms (i, j) and (j, i) are equal
  while ν_i² = 0, so `Ω² = −2Σ_(i<j) ν_iν_j ⊗ α_iα_j`. The ungraded product would give the opposite sign
  and c₁(I) = +u.
- The part of `exp(l/2) exp(Ω)` of degree (2, 4) is `(l/2) · Ω²/2 = −Σ_(i<j) ν_iν_j ⊗ lα_iα_j/2`, so
  `c₁(I) = ch₁(I) = −u`. The terms of degree (2k, 4) for k ≥ 2 come from Ω⁴/24 alone and involve four-fold
  products, which vanish when b₂⁺ = 1.
- For b = 4 and u = Σ_(i<j) a_ij ν_iν_j, `u²/2 = (a₁₂a₃₄ − a₁₃a₂₄ + a₁₄a₂₃) ν₁ν₂ν₃ν₄`, the Pfaffian; for
  `u = ν₁ν₂ + ν₃ν₄`, u² = 2ν₁ν₂ν₃ν₄ and u²/2 = ν₁ν₂ν₃ν₄ is primitive.
- On T⁴, where b₂⁺ = 3, `⟨α₁α₂α₃α₄, [T⁴]⟩ = 1`: the vanishing of four-fold pairings needs b₂⁺ = 1.

### Examples

- On E × ℙ¹ with E an elliptic curve (b₁ = 2, b₂⁺ = 1) and the twist of §10.4, ⟨lα₁α₂, [X]⟩ = 2n, so
  u = nν₁ν₂, c(I) = 1 − nν₁ν₂ and s(I) = 1 + nν₁ν₂.
- For b₁ = 0, T is a point, Ω = 0, I is the integer δ and u = 0.

### Dependencies

§§3.1, 3.3a, Layers 4, 6, 7; TopologicalKTheory T1, T4–T6.5; OperatorKTheory §§4.1–4.2; HilbertModules
H5; IndexTheory Layers 2–5; PseudodifferentialOperators Layers 4–7; CharacteristicClasses C6;
AlgebraicTopology Layer 6. Tau Ceti: the homology of tori, cross products and integral cup products,
finite stabilization of Fredholm families, the algebra of alternating four-forms and of characteristic
vectors.

## Layer 10: real blowup and the geometric wall-crossing formula

### 10.1 The parametrized real blowup

For a generic one-parameter family of parameters crossing the wall of §6.2 when b₂⁺ = 1, construct the
compact real blowup of the spinor: triples (A, ρ, φ) with ρ ≥ 0, ‖φ‖_(L²) = 1 and ψ = ρφ, satisfying
`D_Aφ = 0` and `F_A⁺ = ρ² q(φ) + η_t` (Okonek and Teleman, §4.2, pp. 16–17, for the real
blowup of the reducible locus in the spinor direction, and the proof of Proposition 15, p. 15, for the
projectivized finite-dimensional reductions). Keep the residual weight-one circle and the actual gauge
action; the reducibles at ρ = 0 lie over the Picard torus, where the Dirac kernels may jump. *Needs:* §§4.4, 4.5, 5.1, 5.4, 6.1, 6.2, 9.1.

- Slices are built from the nonzero normalized φ, with the tangent constraint of the norm condition and
  the scalar gauge inverse.
- Compactness: bound ρ by the norm of the original spinor, apply Layer 5 to A and ψ, and apply uniform
  Dirac estimates to φ with ‖φ‖ = 1, including the limits with ρ = 0.
- Universal regularity handles the norm constraint explicitly: its Lagrange multiplier in the cokernel
  gives `D_A⁻χ = λφ`; Clifford variations make χ vanish where φ ≠ 0, hence λ = 0 there, and weak unique
  continuation (§5.1) gives χ = 0.
- Construct the finite-dimensional equivariant obstruction reductions, with properness and regularity
  at the boundary strata, the maps back to the unblown quotient, the boundary of normalized spinors, the
  compatibility at corners and the gluing of local reductions. Jumping kernels are not replaced
  wholesale by a bundle of constant rank, and regularity is not inferred from that of the unblown
  irreducible equation.

The crossing is transverse: `dw/ds ≠ 0`, the derivative including the harmonic and metric terms when g
varies. Compute the local sign in a crossing at constant metric with fixed coexact reference data and
`η′_s = −iω_g`, so that the harmonic curvature target has positive derivative a > 0 and s increases from
C₋ to C₊. Construct generic choices of the fixed reference data that make the full stabilized boundary
obstruction representative regular, and prove that such crossings can be joined to arbitrary regular
endpoints in the chambers by the wall-free relative theorem (§8.1) and chamber invariance (§8.3). A route
through crossings with varying data must instead construct the triangular block elimination that
preserves the determinant orientation; a varying path is not assumed to have zero W-component in its
s-column. At ρ = 0 construct the slice of normalized spinors directly, with the positive pairing
`G_φ(iφ) = 1` of phase and gauge; the unblown slice equation is not divided by ρ² with a claim of smooth
extension. The smooth boundary coordinate is ρ, not ρ². *Needs:* §§7.1, 8.1, 8.3.

**Checks.**
- Along `η_s = η₀ − isω_g` at constant metric, `∂w/∂s = ⟨harm⁺(iω_g), iω_g⟩ = ‖ω_g‖² = 1 > 0` (§6.2), so s
  increases from C₋ to C₊; the opposite direction `+iω_g` would reverse every sign below.

### 10.2 The projectivized obstruction representative

Through a common stabilization write the Dirac index as K − W with finite-rank complex bundles over T,
and construct the boundary model over P(K), with its line of spinors and the obstruction section.
Prove its comparison with W ⊗ O(1), the Euler representative and the determinant orientation through the
intertwiners from the finite-dimensional model of Okonek and Teleman (proof of Proposition 15, p. 15)
to the geometric one, and prove `μ|_Z = ζ = c₁(O(1))` and
`ν|_Z = π*ν_T` from the associated-line and X-first slant maps of Layer 7. Prove independence of the
stabilization, of refinements and of choices, by equivariant reduction homotopies and oriented
bordisms. For ζ = c₁(O(1)), in the convention where P(K) is the bundle of lines, use the ordinary
projective bundle and Gysin theory to prove

    π_!(c_top(W ⊗ O(1)) ζ^m) = s_(m − ind_ℂ D + 1)(K − W)   for m ≥ 0, with s_j = 0 for j < 0.

This is Proposition 15 of Okonek and Teleman (p. 14), whose p_k is s_(k−δ+1) here. Enlarge the
stabilization so that K has positive rank when P(K) is used; negative virtual indices are
tracked through the same recurrence, not through a projective space of negative rank. *Needs:* §§7.2,
7.3, 9.1–9.4, 10.1; CharacteristicClasses §§2.4–2.5 and C3 (§3.1: Gysin maps, fibre integration and
Leray–Hirsch).

**Checks.**
- With W = 0 and rank K = k, `π_!(ζ^m) = s_(m−k+1)(K)`, which is 1 for m = k − 1 (a projective space of lines
  has degree one on the fibre) and 0 for m < k − 1.
- In general `c_top(W ⊗ O(1)) = Σ_j c_j(W) ζ^(w−j)` with w = rank W, so
  `π_!(c_top(W ⊗ O(1)) ζ^m) = Σ_j c_j(W) s_(w−j+m−k+1)(K) = [c(W) s(K)]_(m−δ+1) = s_(m−δ+1)(K − W)` with
  δ = k − w.

### 10.3 The signed wall-crossing formula

Assume b₂⁺ = 1, and put b = b₁(X), δ = ind_ℂ D_A⁺ and d = b + 2δ − 2. For d ≥ 0, `0 ≤ r ≤ min(b, d)` and
r ≡ d ≡ b mod 2, put m = (d − r)/2, k = (b − r)/2 and λ = γ₁ ∧ ⋯ ∧ γ_r. In the conventions fixed above (the
chambers C±, the direct Hodge map, the left gauge action, the X-first slant and the parameter-first rule)
prove

    SW^r_+(λ) − SW^r_−(λ) = ⟨ν_T(λ) s_k(I), [T]_h⟩ = ⟨ν_T(λ) u^k/k!, [T]_h⟩,

where the left side pairs ν(λ)μ^m as in §8.2, `u = −c₁(I)` and the divided power is the integral class of
§9.4 (Okonek and Teleman, Theorem 16 with Proposition 14, pp. 14–16). Their right-hand side
`⟨λ ∧ exp(−u_c), l_O₁⟩` is computed from `c₁(index) = +u_c` (p. 13); with the graded Künneth sign of §9.4,
`c₁(I) = −u`, and their k-th term differs from the one displayed here by (−1)^k. Outside these ranges of
degree and parity both invariants, hence their difference, vanish as in §8.2; the right-hand side is not
asserted there. No negative power of the point class and no projective space of negative rank is used.
Construct the comparison of the analytic and the finite-dimensional determinant lines that proves the
sign, rather than taking the formula as an assumption. *Needs:* §§8.2, 8.3, 9.4, 10.1, 10.2.

For a complex stabilization K − W, use the same h-orientation of T (for b = 0 its signed point class), and
orient the regular Euler representative `Z ⊂ T × P(K)` by the full obstruction derivative with its
complex normal W ⊗ O(1), allowing torus and projective directions to mix. In normalized polar
coordinates ψ = ρz use the complex orientation, in the order radial, positive phase, projective tangent.
Eliminate the nonzero modes by the determinant maps of §7.1 and the complex block of the W-normal, of even
real rank, with positive cancellation of the gauge direction. With harmonic equation
`F = a(s − s_c) + b₀ρ² + …` and a > 0, put `v = ∂_ρ − (F_ρ/a)∂_s`. Prove that the frame
(v, Z, phase, s-normal, W-normal) has positive determinant relative to (s, ρ, phase, W-normal, Z): moving
Z crosses two real directions and an even-dimensional W block. Hence the parametrized zero set is oriented
by `v ∧ o_Z` and its boundary over the wall is −Z. Extend μ and ν and prove `∂W = M₊ − M₋ − Z`, so that
Stokes's theorem and the Gysin recurrence of §10.2 give the displayed positive coefficient. Reconcile this
finite-dimensional calculation with the normalized slices, the complex stabilization and its exact
sequences, and the direct Hodge map, including compactness and the regularization of relative families.

Prove compatibility with reversal of the positive cone, reversal of the homology orientation, change of
basis of H₁ and the covering of the Picard torus of determinant gauge transformations by that of spinor
gauge transformations. The formula is not identified with a chamber of Taubes's large-parameter
perturbation or with a positive chamber of Baldridge, and no assertion of horizontal support for a
three-manifold Y with b₁(Y) = 1 is part of it.

**Checks.**
- The degrees match: ν_T(λ) has degree r and u^k/k! degree 2k = b − r = dim T. On the left,
  m − δ + 1 = (d − r)/2 − δ + 1 = (b − r)/2 = k, which is the Segre index produced by §10.2.

### 10.4 Normalization tests

Prove the following identities through the determinant and slant maps above (§§7.1, 7.3, 10.3).

- For b = 0, d ≥ 0 and the homology orientation e₀ ∧ e₊, the jump in the allowed component r = 0 is +1;
  for the opposite homology orientation it is −1.
- Reversing the positive cone with the homology orientation fixed swaps C₊ and C₋ and reverses the
  Hodge-induced orientation of T; reversing the homology orientation changes the sign of every invariant
  and of the corresponding pairing on T. (Okonek and Teleman, the Remark after Definition 8, p. 9, state
  the corresponding rules with the orientation of H¹ held fixed instead.)
- On the complex-oriented ruled surface E × ℙ¹ with E an elliptic curve, twist the canonical lift by
  N ⊠ O(n − 1) with deg N = m₀ > 0 and n > 0. With x and y the pullbacks of the point classes of the two
  factors, l = 2(m₀x + ny), δ = m₀n and d = 2m₀n. Choose α₁, α₂ dual on E with `⟨α₁α₂, [E]⟩ = 1` and the
  homology orientation `e₀ ∧ iα₁ ∧ iα₂ ∧ e₊`. Then u = nν₁ν₂, the jump of `ν₁ν₂μ^(m₀n−1)` is 1 and the
  jump of `μ^(m₀n)` is n; both insertions have total degree d. Construct the product, Dirac-symbol and
  character comparisons this test needs without importing a holomorphic computation of the moduli space or
  a chamber label from another convention.

*Needs:* §§7.1, 7.3, 9.4, 10.3, 11.2.

**Checks.**
- For E × ℙ¹: κ = −2y, e = m₀x + (n − 1)y, `l = −κ + 2e = 2m₀x + 2ny`, `l² = 8m₀n`, σ = 0, so δ = m₀n and
  `d = b + 2δ − 2 = 2m₀n`; also `d = e² − κe = 2m₀(n − 1) + 2m₀ = 2m₀n` (§11.2).
- `⟨lα₁α₂, [X]⟩ = ⟨l · x, [X]⟩ = 2n`, so u = nν₁ν₂. For r = 2, k = 0 and the jump is
  `⟨ν_T(γ₁)ν_T(γ₂), [T]_h⟩ = det(⟨α_j, γ_i⟩) = 1`; for r = 0, k = 1 and the jump is `⟨u, [T]_h⟩ = n`.

### Examples

- For ℂP² with l = (2j + 1)h and j ≥ 1: b = 0, δ = j(j + 1)/2 and d = j² + j − 2 ≥ 0, so the point invariant
  jumps by ±1 across the wall, according to the homology orientation.

### Dependencies

Layers 5–9 (§§5.1, 5.4, 6.1–6.2, Layer 7, §§8.1–8.3, Layer 9); §11.2 for the normalization test on
E × ℙ¹; CharacteristicClasses §§2.4–2.5, 3.1. Layer 10 supplies nothing that Layers 5–9 use.

## Layer 11: canonical almost-complex examples and the symplectic interface

### 11.1 The canonical lift

On an almost-complex four-manifold whose almost-complex orientation is the given one, with a compatible
metric, define the canonical line `K = Λ^(2,0)T*X` and construct the canonical Spinᶜ lift from the
reduction to U(2), through the homomorphism U(2) → Spinᶜ(4), constructed here, that covers the inclusion
U(2) ⊂ SO(4) and whose composite with the determinant character is the determinant of U(2) (Okonek and
Teleman, §5, p. 22, for the canonical structure of a Kähler surface). Prove `W⁺_can = Λ^(0,0) ⊕ Λ^(0,2) ≃ 1 ⊕ K⁻¹`, `W⁻_can = Λ^(0,1)` and `L_can ≃ K⁻¹`, with the
Clifford and exterior intertwiner (for the splitting of W⁺ on a Kähler surface, Witten, *op. cit.*, §4,
first paragraph). The comparison with K⁻¹ is complex linear and Hermitian; it is not
claimed holomorphic when J is not integrable. *Needs:* §§1.1–1.2; FourManifolds §4.1 (Spinᶜ lifts and
their determinant lines); Tau Ceti `TauCeti.AlmostComplexStructure.realFockAction`,
`TauCeti.AlmostComplexStructure.positiveHalfSpinors_realFockAction`,
`TauCeti.AlmostComplexStructure.kahlerForm`.

The pointwise statements are Tau Ceti's: for an orthogonal complex structure J with an oriented
orthonormal frame satisfying `J e₁ = e₂`, `J e₃ = e₄`, the positive half of the Fock module is the even
exterior algebra (`TauCeti.AlmostComplexStructure.positiveHalfSpinors_realFockAction`); the Kähler
form is `ω = e¹² + e³⁴` (`TauCeti.AlmostComplexStructure.kahlerForm_eq_ιMulti_add_ιMulti`) with
`|ω|² = dim V/2 = 2` (`TauCeti.AlmostComplexStructure.norm_kahlerForm_sq`); and c₂(ω) acts by `i(2p − 2)` on
the degree-p part, so by −2i on 1 and +2i on Λ^(0,2) ≃ K⁻¹
(`TauCeti.AlmostComplexStructure.realFockAction_bivectorExterior_of_mem_exteriorPower`,
`TauCeti.AlmostComplexStructure.realFockAction_bivectorExterior_apply_one`).

**Checks.**
- In the Fock model the vacuum 1 spans the −2i-eigenline of c₂(ω) and lies in W⁺ (Γ = +1 there), and the
  degree-one part is the 0-eigenspace and lies in W⁻; the sign convention Γ = +c(e₁)c(e₂)c(e₃)c(e₄) would
  put Λ^(0,1) in W⁺, on which ω acts by zero.

### 11.2 Twists and dimension

For every Hermitian line E construct the twisted lift, with `W⁺_E ≃ E ⊕ K⁻¹E` and `L_E ≃ K⁻¹E²`, keeping its
full torsor class e = c₁(E), torsion included (Okonek and Teleman, §5, p. 22, for a Kähler surface). With κ = c₁(K) prove `l = −κ + 2e` and
`d = ⟨e² − κe, [X]⟩`. Derive `κ² = 2χ + 3σ` from the complex-to-real comparisons
`p₁(TX) = c₁(T^(1,0)X)² − 2c₂(T^(1,0)X)`, the equality of c₂(T^(1,0)X) with the Euler class of TX, the Euler
pairing and the signed signature theorem. Compare the chiral symbol with the almost-complex Dolbeault symbol and the characteristic
pairing `ch(E) Td(T^(1,0)X)`. No square root of a general determinant line is inferred.
*Needs:* §§1.2, 3.3, 3.5, 11.1; FourManifolds §4.1 (the torsor of twists); CharacteristicClasses §§3.2–3.3
(Chern and Pontryagin classes); IndexTheory §§7.2–7.3 (the signature theorem and the Dolbeault
operator).

**Checks.**
- On ℂP², κ = −3h and κ² = 9 = 2 · 3 + 3 · 1; on K3, κ = 0 = 2 · 24 + 3 · (−16). The variant `κ² = 2χ − 3σ`
  fails on ℂP².
- With l = −κ + 2e, `d = (l² − 2χ − 3σ)/4 = (κ² − 4κe + 4e² − κ²)/4 = e² − κe`, and
  `δ = (l² − σ)/8 = (e² − κe)/2 + (κ² + χ)/12`, the Riemann–Roch number of E when J is integrable.

### 11.3 The symplectic interface

Package the structures of this roadmap (the canonical lift and its twists, the gauge conventions, the
perturbation and chamber data, the orientations and the full insertion invariants) as the interface
consumed by a symplectic application. A special canonical connection, a formula `D = √2(∂̄ + ∂̄*)` or a
parallel section of the trivial summand needs its own precise hypotheses on integrability, torsion and
connection, stated where it is used. The canonical representation and the expected dimension do not
prove existence or nonvanishing of solutions, simple type, SW = Gr or a weighted series of tori.
*Needs:* §§8.2–8.3, 10.3, 11.1–11.2.

### Examples

- For ℂP² with its complex structure, K = O(−3), the canonical lift has l = 3h and d = 0; twisting by O(1)
  gives e = h, l = 5h and `d = ⟨h² + 3h², [ℂP²]⟩ = 4`.
- For a K3 surface κ = 0, so the canonical lift has l = 0 and d = 0, and the twist by E has d = e².

### Dependencies

Layers 1, 3 and 8, §10.3; FourManifolds §4.1; CharacteristicClasses §§3.2–3.3; IndexTheory §§7.2–7.3.
Tau Ceti: the Fock module of an orthogonal complex structure, its chirality splitting, the Kähler form
and the eigenvalues of its Clifford action. Layer 11 is independent of the wall-crossing construction;
its application to the invariant uses Layer 8.

## Downstream consumers

- [TaubesGromov](../TaubesGromov/README.md) consumes Layers 1–11: the Spinᶜ bundles and connections, q and
  the Dirac operator, the Sobolev gauge quotient, compactness, the curvature perturbations, the
  orientations, the charge-one classes, the full invariant, the wall-crossing formula and the symplectic
  interface of §11.3.

## Scope and ownership

**This roadmap owns** the four-dimensional Seiberg–Witten theory of a closed oriented smooth
four-manifold with a Spinᶜ structure, as specified above: the smoothness of the half-spin
representations on the Lie group Spinᶜ(4) (§1.1); the spinor bundles, Spinᶜ connections and the curvature
normalization (§§1.2–1.4); the self-dual bundles and the bundle maps C, τ and q (§§2.1, 2.3); the Spinᶜ
Dirac operator, its Weitzenböck formula and index, and the universal Spinᶜ(4) comparison as applications
of the generic theory (§§3.1–3.3a); the Fredholm theory of the abelian deformation operator and of the
linearization, and the expected dimension (§§3.4–3.5); the Sobolev gauge group, the integral logarithms,
the global Coulomb gauge, the local slices and the quotient with its metric and smooth structure
(Layer 4); weak unique continuation for Dirac-type operators, the a priori bounds, the bootstrap and
compactness (Layer 5); transversality, walls and chambers (Layer 6); determinant orientations and the
universal classes μ and ν (Layer 7); the relative families, the full exterior-form invariant and its
invariance (Layer 8); the Picard torus, the stabilized Dirac family index, its family index theorem for
the fixed product T × X and its characteristic classes (Layer 9); the real blowup, the projectivized
obstruction model and the wall-crossing formula with its normalizations (Layer 10); and the canonical
Spinᶜ structures of almost-complex four-manifolds with the symplectic interface (Layer 11). The rank-four
Spinᶜ applications of the generic theories and the nonlinear abelian gauge analysis are this roadmap's.

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap uses it and builds no
second carrier.

- *Spinᶜ structures*: FourManifolds Layer 4 (§4.1) owns the group Spinᶜ(n) as a Lie group, the principal
  lifts of a fixed oriented frame bundle, the determinant character and line, the H²-torsor of lifts and
  twisting by lines. No Seiberg–Witten moduli statement is inferred from the classification of lifts.
- *SU(2) anti-self-dual gauge theory*: FourManifolds Layer 5, with its effective μ₂ quotient, its bubbling
  compactification and its continuation theorem off the reducible diagonal, which are different from the
  abelian theory here and are not used.
- *Generic Clifford and Dirac geometry*: SpinGeometry Layer 6 (G6), including the general square formula.
  The quaternionic parity of the untwisted spin Dirac operator is not applied to an arbitrary Spinᶜ twist.
- *The scalar index theorem*: IndexTheory Layers 1–7 (I1–I7), including the universal Euler-injectivity
  method (§§6.2–6.3) and the signature theorem (§7.2).
- *Bundles, connections and line classes*: SmoothBundlesConnections Layers 1–4 and 6 (B1–B4, B6).
- *Hodge theory and Sobolev spaces on compact manifolds*: ComplexKahlerGeometry Layer 5 (K5a, §§5.1, 5.4,
  5.5, 5.7); pseudodifferential operators, Sobolev products and parametrices: PseudodifferentialOperators
  Layers 1 and 4–7 (P1, P4–P7).
- *Generic Fredholm transversality and determinant lines*: HeegaardFloer Layer 2 (F0) and §3.4 (F1.4).
  The two-dimensional Cauchy–Riemann continuation theorem there is not a four-dimensional Dirac theorem
  and is not used.
- *Topology*: AlgebraicTopology Layers 6–8; CharacteristicClasses C1–C3, §§5.2–5.3 and C6; GeometricTopology
  Layer 1; the cohomological Serre spectral sequence of DGFloer Layer 1, item 2.
- *K-theory and Fredholm indices of families*: TopologicalKTheory T1, T4–T6.5 (T6.5's elliptic proof is
  specific to the projective transfer; Layer 9 builds the fixed-four-manifold application rather than
  inferring it from a numerical index or from a families theorem for variable fibres); OperatorKTheory K4
  (§§4.1–4.2) and HilbertModules H5.
- *The pointwise algebra*: the Tau Ceti library. The sections whose statements it proves name its
  declarations in place, and the supplier contracts list them; this roadmap does not state them again.

Each generic theory above is consumed once, and each comparison of it with the Seiberg–Witten
application is constructed here.

| § | Statement | Owner at the pins |
|---|---|---|
| 1.1 | Spinᶜ(4), its determinant and rotation; chirality and its identities; the half-spin representations with descent, unitarity, Clifford equivariance, det ρ± = z² and continuity; the SU(2) labels; the Fock comparison | Tau Ceti (`CliffordAlgebra.spinCGroup`, `CliffordAlgebra.chirality`, `CliffordAlgebra.spinCGroupHalfSpinRep` and the lemmas listed in §1.1) |
| 2.1 | Pointwise C and τ, their trace, adjoint, Hilbert–Schmidt and operator-norm identities, the action of Λ± on W∓ and W±, naturality; the Hodge star and the smooth self-dual forms | Tau Ceti (`TauCeti.SeibergWitten.cliffordRestriction`, `TauCeti.SeibergWitten.cliffordRestrictionAdjoint`, `TauCeti.SmoothForm.selfDualForms`) |
| 2.2 | Q₀ with all its stated properties and its real derivative | Tau Ceti (`TauCeti.SeibergWitten.quadraticEnd`, `TauCeti.SeibergWitten.hasStrictFDerivAt_quadraticEnd`) |
| 2.3 | Pointwise q, its identities, derivative, bounds and naturality | Tau Ceti (`TauCeti.SeibergWitten.quadraticTwoForm`) |
| 3.3a | The torus character of W⁺ − W⁻ | Tau Ceti (`CliffordAlgebra.trace_spinCGroupHalfSpinRep_one_sub_neg_one_mk_spinTorus`) |
| 3.4 | T on smooth forms, its smooth kernel and the orthogonality of its range; doubling of the index under realification | Tau Ceti (`TauCeti.SeibergWitten.abelianDeformationOperator`, `ContinuousLinearMap.index_restrictScalars_real`) |
| 9.4 | The linear algebra of alternating four-forms and of characteristic vectors | Tau Ceti (`LinearMap.BilinForm.apply_eq_zero_of_alternatingMap_of_sigPos_lt_three`, `LinearMap.BilinForm.IsCharacteristic`) |
| 11.1 | Pointwise canonical Spinᶜ algebra: the Fock chirality splitting, the Kähler form and its eigenvalues | Tau Ceti (`TauCeti.AlmostComplexStructure.positiveHalfSpinors_realFockAction`, `TauCeti.AlmostComplexStructure.realFockAction_bivectorExterior_apply_one`) |

**Not in scope.** Three-dimensional monopole Floer theory, Taubes's large-parameter and vortex
correspondence, weighted counts of pseudoholomorphic tori and zeta-function formulas for mapping tori
are not part of this roadmap; TaubesGromov builds the large-parameter correspondence and the weighted
counts on the invariants defined here. The Sobolev gauge groups at critical regularity on Euclidean
domains are YangMillsConnectionsAndCaloricGauge's; the abelian gauge group on a closed four-manifold is
Layer 4's.

Other roadmaps cite sections of this roadmap by the labels of its former numbering:

| Former label | Now |
|---|---|
| SW1 | Layer 1 |
| SW1.2 | §1.2 |
| SW1.4 | §1.4 |
| SW2 | Layer 2 |
| SW3 | Layer 3 |
| SW3.2 | §3.2 |
| SW3.3a | §3.3a |
| SW3.4 | §3.4 |
| SW4 | Layer 4 |
| SW4.1 | §4.1 |
| SW4.4 | §4.4 |
| SW4.5 | §4.5 |
| SW5 | Layer 5 |
| SW5.3 | §5.3 |
| SW5.4 | §5.4 |
| SW6 | Layer 6 |
| SW6.1 | §6.1 |
| SW6.2 | §6.2 |
| SW7 | Layer 7 |
| SW7.1 | §7.1 |
| SW7.2 | §7.2 |
| SW8 | Layer 8 |
| SW8.3 | §8.3 |
| SW9 | Layer 9 |
| SW10 | Layer 10 |
| SW11 | Layer 11 |
| SW11.1 | §11.1 |
| SW11.2 | §11.2 |

## Exact supplier contracts

### From Mathlib

- `ContinuousLinearMap.IsFredholm` (`Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean`): a bounded
  operator with closed range, finite-dimensional kernel, finitely generated cokernel and a closed
  complement of its kernel; `LinearMap.index`, the index of a linear map
  (`Mathlib/Algebra/Module/LinearMap/Index.lean`).
- The implicit function theorem `HasStrictFDerivAt.implicitFunctionOfComplemented`
  (`Mathlib/Analysis/Calculus/Implicit.lean`), for a strictly differentiable map between complete spaces
  with surjective derivative whose kernel has a closed complement (§§4.4, 6.1).
- `InnerProductSpace.rankOne` (`v ↦ ⟨y, v⟩x` for `rankOne x y`), the native adjoint
  `ContinuousLinearMap.adjoint` and `LinearMap.trace` (§2.2).
- Vector bundles and smooth vector bundles: `VectorBundle`, `ContMDiffVectorBundle`,
  `Bundle.Trivialization` (§§2.1, 4.5), with their sections and covariant derivatives
  (`CovariantDerivative`, `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/Basic.lean`; §1.3).
- `DividedPowers` (`Mathlib/RingTheory/DividedPowers/Basic.lean`): a divided-power structure on an ideal
  of a commutative semiring, with the standard axioms on sums, products and composites (§9.4).

### From Tau Ceti

All the declarations below are proved at the pin.

- *Spinᶜ(4) and its half-spin representations* (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinC.lean`,
  `…/Spin/HalfSpin.lean`, `TauCeti/Topology/Algebra/CliffordAlgebra/Spin/HalfSpin.lean`):
  `CliffordAlgebra.spinCGroup` (the quotient of Spin × U(1) by {1, (−1, −1)}, for any nonzero real
  quadratic form), `CliffordAlgebra.spinCGroup.det` with `CliffordAlgebra.spinCGroup.det_mk`
  (`det [s, z] = z²`), `CliffordAlgebra.spinCGroup.toSpecialOrthogonal`;
  `CliffordAlgebra.spinCGroupHalfSpinRep` (the descended representation `[s, z] ↦ z ρ(s)` on an eigenspace
  of the chirality), `CliffordAlgebra.inner_spinCGroupHalfSpinRep_apply_spinCGroupHalfSpinRep_apply`
  (unitarity, for a Hermitian Clifford module), `CliffordAlgebra.spinCGroupHalfSpinRep_comp_halfSpinCliffordMul`
  (Clifford equivariance along the rotation), `CliffordAlgebra.det_spinCGroupHalfSpinRep` (determinant z²
  on a two-dimensional eigenspace), `CliffordAlgebra.spinCGroupHalfSpinContinuousHom` (continuity). No
  smooth structure on Spinᶜ(4) is assumed from the library.
- *Smooth actions of compact Spin* (`TauCeti/Geometry/Lie/CliffordAlgebra/Spin/EvenRepresentation.lean`,
  `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Neg.lean`): `AlgHom.realCliffordSpinEvenSmoothHom` (for a
  real algebra map from the even Clifford algebra of the positive-definite coordinate form on ℝⁿ into a
  finite-dimensional real normed algebra, the induced smooth homomorphism from the compact Spin group into
  its units), `AlgHom.lieMap_realCliffordSpinEvenSmoothHom_eq` (its differential is the even action on
  the quadratic Clifford elements that form the spin Lie algebra); `CliffordAlgebra.spinGroupEquivNeg`
  (the Spin groups of Q and −Q are isomorphic through Mathlib's `CliffordAlgebra.evenEquivEvenNeg`).
- *Chirality* (`TauCeti/LinearAlgebra/CliffordAlgebra/Chirality.lean`, `…/HalfSpinor.lean`):
  `CliffordAlgebra.chirality`, `CliffordAlgebra.chirality_eq` (Γ = −c(b₀)c(b₁)c(b₂)c(b₃) for every positively
  oriented orthonormal basis, when `Q v = −‖v‖²`), `CliffordAlgebra.chirality_mul_self`,
  `CliffordAlgebra.chirality_mul_ι`, `CliffordAlgebra.isSelfAdjoint_map_chirality`,
  `CliffordAlgebra.comp_chirality_eq_chirality_comp`, `CliffordAlgebra.positiveHalfSpinorsEquiv`,
  `CliffordAlgebra.bivectorExterior_smul_eq_zero_of_hodgeStar_eq_neg`,
  `CliffordAlgebra.bivectorExterior_smul_eq_zero_of_hodgeStar_eq_self`; `CliffordAlgebra.cliffordMulEquiv`
  (v ↦ c(v)ψ as a real isomorphism onto the opposite half for ψ ≠ 0 in a two-dimensional half) and
  `CliffordAlgebra.norm_map_ι_apply` (`|c(v)ψ| = |v||ψ|`).
- *SU(2) labels* (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Four.lean`, `…/Real/Chirality.lean`):
  `TauCeti.realSpinFourEquivSpecialUnitaryProd`,
  `CliffordAlgebra.halfSpinRep_one_realSpinGroupEquiv_eq_one_iff_specialUnitary`,
  `CliffordAlgebra.halfSpinRep_neg_one_realSpinGroupEquiv_eq_one_iff_specialUnitary`.
- *Torus characters* (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/TorusCharacter.lean`):
  `OrthonormalBasis.spinTorus`, `CliffordAlgebra.trace_spinCGroupHalfSpinRep_one_sub_neg_one_mk_spinTorus`.
- *The Clifford map, the quadratic maps and their naturality* (`TauCeti/Analysis/PDE/SeibergWitten/`), in
  `TauCeti.SeibergWitten`, on an oriented real inner-product space of dimension four with a Hermitian
  Clifford module whose positive half has complex dimension two: `cliffordRestriction`,
  `cliffordRestrictionEquiv`, `cliffordRestrictionAdjoint`, `isSelfAdjoint_cliffordRestriction`,
  `cliffordRestriction_mem_traceFreeSelfAdjoint`, `trace_adjoint_cliffordRestriction_mul_of_hodgeStar_eq_self`,
  `cliffordRestrictionAdjoint_one`, `cliffordRestrictionAdjoint_cliffordRestriction`,
  `cliffordRestriction_cliffordRestrictionAdjoint_eq_traceFreePart`,
  `norm_cliffordRestriction_of_hodgeStar_eq_self`, `cliffordRestriction_map`,
  `cliffordRestrictionAdjoint_conjContinuousAlgEquiv`; on any complex inner-product space `quadraticEnd`,
  `quadraticEndPolar`, `trace_quadraticEnd`, `quadraticEnd_eq_traceFreePart`, `isSelfAdjoint_quadraticEnd`,
  `quadraticEnd_apply_self`, `quadraticEnd_smul`, `quadraticEnd_smul_of_norm_eq_one`, `quadraticEnd_add`,
  `norm_quadraticEnd`, `norm_quadraticEndPolar_le`, `norm_quadraticEnd_sub_le`,
  `quadraticEndPolar_I_smul_self`, `hasStrictFDerivAt_quadraticEnd`, `fderiv_quadraticEnd`,
  `contDiff_quadraticEnd`, `quadraticEnd_map`; and `quadraticTwoForm`, `quadraticTwoFormPolar`,
  `cliffordRestriction_quadraticTwoForm`, `quadraticTwoForm_eq_symm_cliffordRestrictionEquiv`,
  `cliffordRestriction_quadraticTwoForm_apply_self`, `quadraticTwoForm_smul_of_norm_eq_one`,
  `norm_quadraticTwoForm_sq`, `hasFDerivAt_quadraticTwoForm`, `cliffordRestriction_quadraticTwoFormPolar`,
  `quadraticTwoFormPolar_I_smul_self`, `norm_quadraticTwoFormPolar_le`,
  `quadraticTwoForm_positiveHalfSpinorsEquiv`, `quadraticTwoFormPolar_positiveHalfSpinorsEquiv`,
  `cliffordProjection`, `inner_quadraticTwoForm`. The trace-free self-adjoint endomorphisms are
  `TauCeti.traceFreeSelfAdjoint`.
- *The abelian deformation operator* (`TauCeti/Analysis/PDE/SeibergWitten/AbelianDeformation.lean`,
  `…/DeformationSymbol.lean`): `TauCeti.SeibergWitten.abelianDeformationOperator` (smooth forms, a smooth
  Riemannian metric), `TauCeti.SeibergWitten.ker_abelianDeformationOperator`,
  `TauCeti.SeibergWitten.integralTopForm_inner_abelianDeformationOperator_fst_eq_zero`,
  `TauCeti.SeibergWitten.integralTopForm_inner_abelianDeformationOperator_snd_eq_zero` (on a compact
  boundaryless Hausdorff manifold); `TauCeti.SeibergWitten.deformationSymbol`,
  `TauCeti.SeibergWitten.deformationSymbol_injective`. Ellipticity of T as an operator, its Fredholm
  realizations and its index are not assumed from the library.
- *Self-dual forms* (`TauCeti/Geometry/Manifold/Riemannian/SelfDual.lean`,
  `TauCeti/Geometry/Manifold/Riemannian/HodgeStar.lean`): `TauCeti.RoughForm.hodgeStar`,
  `TauCeti.SmoothForm.selfDualForms`, `TauCeti.SmoothForm.antiSelfDualForms`, `TauCeti.SmoothForm.selfDualPart`,
  `TauCeti.RoughForm.two_mul_finrank_map_proj_selfDualForms`.
- *The Fock module of an orthogonal complex structure* (`TauCeti/RepresentationTheory/Spin/Polarization/`,
  `TauCeti/Analysis/InnerProductSpace/HodgeStar/Kahler.lean`): `TauCeti.AlmostComplexStructure.realFockAction`,
  `TauCeti.AlmostComplexStructure.positiveHalfSpinors_realFockAction`,
  `TauCeti.AlmostComplexStructure.kahlerForm`, `TauCeti.AlmostComplexStructure.kahlerForm_eq_ιMulti_add_ιMulti`,
  `TauCeti.AlmostComplexStructure.norm_kahlerForm_sq`,
  `TauCeti.AlmostComplexStructure.realFockAction_bivectorExterior_of_mem_exteriorPower`,
  `TauCeti.AlmostComplexStructure.realFockAction_bivectorExterior_apply_one`.
- *Fredholm theory* (`TauCeti/Analysis/Fredholm/`, `TauCeti/Topology/Algebra/Module/ContinuousLinearMap/Index.lean`,
  `TauCeti/LinearAlgebra/Determinant/Line.lean`, `TauCeti/Analysis/Normed/Operator/Splitting/Family.lean`):
  `TauCeti.isMeagre_image_criticalPoints_of_isFredholm` and
  `TauCeti.dense_compl_image_criticalPoints_of_isFredholm` (for a map between real Banach spaces that is Cⁿ
  and Fredholm at every point of a Lindelöf set U, with `(dim ker)² + 1 ≤ n`, the image of the critical
  points in U is meagre, and its complement dense); `ContinuousLinearMap.index_restrictScalars_real`
  (realification doubles the index); `LinearMap.detLine` and `ContinuousLinearMap.IsFredholm.finrank_detLine`
  (the determinant line of a Fredholm operator is one-dimensional);
  `ContinuousLinearMap.IsFredholm.exists_stabilization_kernel_coordinates` (a family continuous and
  Fredholm at a point has a fixed finite-dimensional stabilizer and kernel coordinate making it invertible
  nearby) and `ContinuousLinearMap.kernelHomeomorph`.
- *Cohomology* (`TauCeti/AlgebraicTopology/`): `TopCat.integralCohomology`,
  `TopCat.integralCupProd_add_self_eq_zero`, `TauCeti.singularCross`, `TauCeti.HomologicalOrientation`,
  `TauCeti.HomologicalOrientation.cupInsertionForm` (for a compact oriented manifold N with a map to X and
  β of complementary degree, the alternating integral form `(a₁, …, a_r) ↦ ⟨a₁ ⌣ ⋯ ⌣ a_r ⌣ β, f_*[N]⟩` on
  H¹(X; ℤ)), `TauCeti.torusExteriorPowerEquiv`; `TauCeti.mem_exactForms_one_iff_periodHom_eq_zero` and
  `TauCeti.exists_mextDeriv_eq_of_forall_pathIntegral_eq_zero` (on a connected manifold a closed one-form is
  exact exactly when its periods vanish).
- *Bilinear algebra* (`TauCeti/LinearAlgebra/BilinearForm/`): `LinearMap.BilinForm.apply_eq_zero_of_alternatingMap_of_sigPos_lt_three`
  (if pairings of wedge products are given by an alternating four-form and the positive index is less than
  three, they vanish), `LinearMap.BilinForm.IsCharacteristic`.

### From TauCetiRoadmap.FourManifolds

§4.1: Spinᶜ(n) as a Lie group built on the same quotient as Tau Ceti's `CliffordAlgebra.spinCGroup`, with
its smooth projection to SO(n) and determinant character; Spinᶜ structures as principal lifts of a fixed
oriented frame bundle with isomorphisms covering the identity; the determinant line, its reduction to w₂
and the free transitive action of line bundles, changing c₁ by twice the line class. Layer 5 is not used.

### From TauCetiRoadmap.SmoothBundlesConnections

§§B2.1–B2.2 (associated bundles, fibre metrics, L² sections), §§B3.1, B3.3 (principal and induced
connections), §§B4.1–B4.2 (curvature, the gauge group and active covariance), §§B6.2–B6.3 (the first Chern
class of circle bundles and rank-one Chern–Weil, with its dual-character normalization `c₁(P)_ℝ = [F/(2π)]`,
compared with the standard-character convention of §1.4).

### From TauCetiRoadmap.ComplexKahlerGeometry

§5.1 (the real Hodge star and densities), §5.4 (the compact-bundle Sobolev scale, shared by real and
complex bundles), §5.5 (de Rham cohomology with complex coefficients), §5.7 (weak elliptic regularity with
smooth coefficients, Rellich compactness, the real Hodge theorem, harmonic projections and Green operators).

### From TauCetiRoadmap.PseudodifferentialOperators

Layer 1 (P1: differential operators and symbols), Layer 4 (P4: composition, adjoints and global
quantization), Layer 5 (P5: Sobolev and Lᵖ mapping estimates, products, Rellich), Layer 6 (P6: ellipticity,
parametrices and Fredholm realizations), Layer 7 (P7: changes of order).

### From TauCetiRoadmap.SpinGeometry

Layer 6 (G6): §6.1 (the Dirac operator of a Clifford module with a compatible connection, its Leibniz
rule, the adjoint pairing of its chiral pieces with their closed domains, its symbol triple and the phase
homotopy to the Fourier symbol), §§6.2–6.3 (the general square formula and the twisted Lichnerowicz formula).

### From TauCetiRoadmap.IndexTheory

Layers 1–7 (I1–I7): in particular Layers 2–5 (symbols, the analytic index, excision, external products,
Bott normalization and embedding invariance), §6.1 (the cohomological index formula), §§6.2–6.3 (universal
symbols and cancellation by the Euler class, which is not a zero divisor for Spin(2ℓ) × U(k)), §7.2 (the signature theorem, with `σ = ⟨p₁, [X]⟩/3` in
dimension four), §7.3 (the Dolbeault operator).

### From TauCetiRoadmap.HeegaardFloer

§2.1 (F0.S: the sharp finite-dimensional Sard theorem with threshold k > max(m − n, 0)), §2.2 (F0.0: generic
Fredholm maps, sections and determinant lines on Banach manifolds and bundles), §2.5 (F0.3: universal zero
sets and the regular-parameter projection), §3.4 (F1.4: determinant lines and their orientations).

### From TauCetiRoadmap.AlgebraicTopology

Layers 6–8: ordinary cochains with cup, cross and cap products, fundamental and boundary classes of
compact oriented manifolds, the comparison of manifolds with finite CW complexes, and universal
coefficients.

### From TauCetiRoadmap.CharacteristicClasses

§1.1b (numerable joins and universal principal bundles), §1.5 (the integral cohomology of ℂP^∞), §§2.4–2.5
(Gysin maps and fibre integration), §§3.1–3.3 (Leray–Hirsch, Chern and Pontryagin classes), §§5.2–5.3 (the
torus Chern–Weil isomorphism, Borel restriction and finite-degree rational descent for compact Lie
groups), C6 (multiplicative sequences, the Chern character and the Thom correction).

### From TauCetiRoadmap.GeometricTopology

Layer 1: manifolds with boundary, gluing, tubular neighbourhoods and handles.

### From TauCetiRoadmap.DGFloer

Layer 1, item 2: the cohomological Serre spectral sequence of a Serre fibration over a path-connected
base, with local coefficients and convergence, specialized in §3.3a to the finite central kernel μ₂.

### From TauCetiRoadmap.TopologicalKTheory

T1 (continuous finite-rank bundles), T1.6a (stable carriers and the fixed-rank universal line Gr₁∞ with its
finite stages), T4–T5 (Bott periodicity and Thom classes), T6.5 (finite-bundle stabilization and the
kernel-bundle family index).

### From TauCetiRoadmap.OperatorKTheory

K4, §§4.1–4.2: Atkinson's theorem and the module index of Fredholm operators on Hilbert modules.

### From TauCetiRoadmap.HilbertModules

H5: the continuous section modules of Hilbert bundles over a compact space.

## References

Page numbers are those of the arXiv versions linked below.

- E. Witten, [*Monopoles and four-manifolds*](https://arxiv.org/abs/hep-th/9411102v1), Math. Res. Lett. 1
  (1994): §2, eqs. (2.3)–(2.5) and the sentence before (2.5), for the deformation complex, the two indices
  and the expected dimension (§§3.3–3.5); §3, eq. (3.1) and the paragraph after it, for the integrated
  Weitzenböck identity and the vanishing under positive scalar curvature (§§3.2, 5.2); §4, first
  paragraph, for the splitting of W⁺ on a Kähler surface (§11.1).
- B. Booß-Bavnbek, M. Marcolli and B.-L. Wang, [*Weak UCP and perturbed monopole
  equations*](https://arxiv.org/abs/math/0203171v1): Lemma 2.2 (p. 5), Lemma 2.4 (p. 7), Theorem 2.7 (p. 8)
  and the Appendix (pp. 18–21), the route through a Carleman estimate for perturbed Dirac operators (§5.1).
- C. Okonek and A. Teleman, [*Seiberg–Witten invariants for manifolds with b⁺ = 1, and the universal wall
  crossing formula*](https://arxiv.org/abs/alg-geom/9603003v4): pp. 3–4, for the spinor bundles, the gauge
  action and the Sobolev orders (§§1.2, 1.3, 4.1); Definition 3 and Proposition 4 (pp. 4–6), for
  properness, universal transversality, the reducibles, the curvature normalization, bordisms along paths
  and the codimension of the wall (§§1.4, 5.4, 6.1–6.2, 8.1, 8.3); Lemma 5 and the Remark after it
  (pp. 6–7), for the gauge group, the classes ν and the circle bundle of the based gauge group (§§4.2,
  7.2–7.3); p. 7 with Definition 6, for the dimension, the orientation and the point and full exterior
  insertions (§§6.3, 7.1, 7.2, 8.2); Definitions 7 and 8 with the Remarks after them (pp. 8–9), for
  the chambers and the orientation rules (§§6.2, 7.1, 8.3, 10.4); §4.1 (pp. 10–13), for the Picard tori,
  the universal lines, the Chern character of the Dirac family and Lemma 13 (§§4.3, 7.3, 9.1, 9.3, 9.4); Propositions 14 and 15 and Theorem 16 (pp. 14–16),
  for the Segre recurrence and the wall-crossing formula (§§10.2–10.3); §4.2 (pp. 16–17), for the real
  blowup (§10.1); §5 (p. 22), for the canonical Spinᶜ structure of a Kähler surface and its twists
  (§§11.1–11.2). Their first Chern class of the Dirac index (p. 13) is +u_c, without the graded Künneth
  sign of §9.4; §10.3 records the resulting factor (−1)^k. The polynomial and the boundary coefficient
  are derived from this roadmap's own classes, clutching and orientation maps before any comparison with
  the conventions of the source.
