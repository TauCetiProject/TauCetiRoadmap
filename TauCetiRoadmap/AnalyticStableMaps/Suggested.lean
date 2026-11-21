module

public import Mathlib
public import TauCeti.AlgebraicGeometry.Curves.NodalGluing.AuxiliaryMarks
public import TauCeti.Analysis.Complex.RiemannSurface.Degree
public import TauCeti.Geometry.Diffeomorphism.FixingSubgroup.Basic
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Symplectic.Manifold.JHolomorphic

/-!
# Analytic stable maps and their implicit atlases: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`,
and names the ones that are not statable at the pins together with the carrier each lacks.

The headline theorems are:

1. **Normalization** (§0.5): a nonconstant pseudoholomorphic map from a connected compact
   Riemann surface to an almost complex manifold factors as a simple pseudoholomorphic map
   composed with a finite holomorphic branched cover, uniquely up to biholomorphism, with
   `u_*[Σ] = d · v_*[Σ₀]` and `2 − 2g(Σ) = d(2 − 2g(Σ₀)) − R`.
2. **Stability** (§1.2): the automorphism group of a prestable map is finite exactly when
   every constant component is pointed stable.
3. **Generic regularity** (§2.9): for a residual set of smooth tame (or compatible) almost
   complex structures on a closed symplectic manifold, the unmarked smooth-simple moduli
   space of a fixed genus and class is a smooth oriented manifold of signed dimension
   `(m − 3)(2 − 2g) + 2⟨c₁, β⟩`.
4. **Compactness** (§3.7): for fixed `(g, n, β)` and a compact family of tame structures the
   coarse space of stable maps is compact Hausdorff with proper projection to the parameter
   space.
5. **Topological regularity** (§7.3): the regular locus of a thickened moduli space is open,
   a topological manifold of dimension `v + dim E`, and a topological submersion to the
   obstruction quotient (Pardon, Theorem B.1.1).
6. **The implicit atlas** (§9.1–§9.2): the thickening data form an oriented implicit atlas on
   the compact coarse space, giving the rational dual-Čech functional.

Stated here: the factorization and the uniqueness of Theorem 1, and Theorem 2, on the pinned
carriers. The domain of Theorem 1 is a compact Riemann surface given by a complex atlas, with the
pinned almost complex structure `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold`; the
branched cover is the pinned `TauCeti.RiemannSurface.FiniteHolomorphicMap`; the biholomorphism is
a complex-smooth diffeomorphism, the type returned by the pinned `biholomorphOfDegreeEqOne`. The
domain of Theorem 2 is a marked nodal curve presented by the pinned
`TauCeti.NodalGluing.FlagPairData` and `TauCeti.NodalGluing.Marking`, its arrows are the pinned
`TauCeti.NodalGluing.AuxiliaryAut` with no auxiliary label, and a constant component is pointed
stable when the pinned `Diffeomorph.fixingSubgroup` of its special points is finite. The count
form of pointed stability (at least three special points in genus zero, at least one in genus one)
needs the genus of a component, which is not at the pin; it is equivalent to the stated form by
ComplexCurveModuli D0 items 3 and 5.

Not statable at the pins, or not restated:

- Theorem 1's class identity needs the fundamental class `[Σ]` of a compact Riemann surface,
  which is not at the pin. Its genus identity, in the Euler-characteristic form
  `χ(Σ) = d · χ(Σ₀) − R`, is the pinned branched-cover formula
  `FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree` of
  `TauCeti.RiemannSurface` applied to the cover, under finite-CW-type hypotheses that no pinned
  instance supplies for compact surfaces; it is not restated, and the genus itself is not at the
  pin.
- Theorem 3 needs a topology on the smooth tame almost complex structures, in which its
  residual set is taken, and the moduli space of simple curves of genus g as a quotient of
  maps by reparametrization; neither is at the pin.
- Theorems 3 and 5 need bundle-valued Sobolev spaces `W^{k,p}(Σ, u^*TX)`; the pinned
  `TauCeti.Wkp` is scalar and real-valued on open subsets of a Euclidean space.
- Theorem 4 needs the coarse space of stable maps of genus `g` and class `β` with the
  Hausdorff-graph topology of §3.2, a quotient of the prestable maps on all nodal domains by
  their isomorphisms, and the class `β = u_*[C]`, which needs the fundamental class of each
  component; neither is at the pin.
- Theorem 5 also needs the thickened moduli spaces of §5.1–§5.2, built from Pardon's thickening
  data, and weighted Sobolev spaces on punctured surfaces; neither is at the pin.
- Theorem 6 needs the implicit-atlas structure of ImplicitAtlases §1.1 and the coarse space of
  Theorem 4; neither is in the pinned Tau Ceti.

The node-matching subspace of §2.2 and the virtual dimension of §0.1 are README targets
with their Checks; they are not stated here as stand-ins for the headlines above.
-/

@[expose] public section

namespace TauCetiRoadmap.AnalyticStableMaps

open TauCeti TauCeti.RiemannSurface TauCeti.NodalGluing
open scoped Manifold ContDiff TauCeti.ComplexManifold

universe u

/-! ## Layer 0: targets, coefficients and the analytic floor -/

/-- A map `v` from a Riemann surface to a manifold modelled on `I` is *somewhere injective* when
it has an injective point: a point `z` that is the only point of its fibre and at which the real
derivative of `v` is injective (Wendl, *Lectures on holomorphic curves*, Definition 4.5). At a
point where `v` is not differentiable the derivative is `0`, which is not injective. -/
def IsSomewhereInjective {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [TopologicalSpace H] (I : ModelWithCorners ℝ E H) {X : Type*} [TopologicalSpace X]
    [ChartedSpace H X] {S : Type*} [TopologicalSpace S] [ChartedSpace ℂ S] (v : S → X) :
    Prop :=
  ∃ z, v ⁻¹' {v z} = {z} ∧ Function.Injective (mfderiv 𝓘(ℝ, ℂ) I v z)

/-- **Normalization**, existence (§0.5): a smooth nonconstant pseudoholomorphic map `u` from a
compact connected Riemann surface `S` to a finite-dimensional Hausdorff second-countable
boundaryless manifold `X` with a smooth almost complex structure `J` factors as `u = v ∘ π`,
where `π` is a finite holomorphic map onto a compact connected Riemann surface `S₀` and `v` is
smooth, pseudoholomorphic and somewhere injective (Wendl, Proposition 4.3; McDuff–Salamon,
Proposition 2.5.1). No taming form, integrability or genericity of `J` is assumed. -/
theorem exists_isSomewhereInjective_comp_finiteHolomorphicMap
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {X : Type*} [TopologicalSpace X] [ChartedSpace H X] [IsManifold I ∞ X] [T2Space X]
    [SecondCountableTopology X] (J : SmoothAlmostComplexStructure I X)
    {S : Type u} [TopologicalSpace S] [ChartedSpace ℂ S] [IsManifold 𝓘(ℂ) ∞ S]
    [CompactSpace S] [ConnectedSpace S] [T2Space S] {u : S → X}
    (hsmooth : ContMDiff 𝓘(ℝ, ℂ) I ∞ u)
    (hu : IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ S) J u)
    (hnc : ∃ z z', u z ≠ u z') :
    ∃ (S₀ : Type u) (_ : TopologicalSpace S₀) (_ : ChartedSpace ℂ S₀)
      (_ : IsManifold 𝓘(ℂ) ∞ S₀) (_ : CompactSpace S₀) (_ : ConnectedSpace S₀)
      (_ : T2Space S₀) (π : FiniteHolomorphicMap S S₀) (v : S₀ → X),
      ContMDiff 𝓘(ℝ, ℂ) I ∞ v ∧
        IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ S₀) J v ∧
        IsSomewhereInjective I v ∧ u = v ∘ π := by
  sorry

/-- **Normalization**, uniqueness (§0.5): if `v₁ ∘ π₁ = v₂ ∘ π₂` for finite holomorphic maps
`πᵢ` from a compact connected Riemann surface `S` onto compact connected Riemann surfaces `Sᵢ`
and smooth, pseudoholomorphic, somewhere injective maps `vᵢ : Sᵢ → X`, then there is exactly
one biholomorphism `a : S₁ → S₂` with `a ∘ π₁ = π₂` and `v₂ ∘ a = v₁` (Wendl,
Proposition 4.3). -/
theorem existsUnique_biholomorph_of_isSomewhereInjective
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {X : Type*} [TopologicalSpace X] [ChartedSpace H X] [IsManifold I ∞ X] [T2Space X]
    [SecondCountableTopology X] (J : SmoothAlmostComplexStructure I X)
    {S : Type*} [TopologicalSpace S] [ChartedSpace ℂ S] [IsManifold 𝓘(ℂ) ∞ S]
    [CompactSpace S] [ConnectedSpace S] [T2Space S]
    {S₁ : Type*} [TopologicalSpace S₁] [ChartedSpace ℂ S₁] [IsManifold 𝓘(ℂ) ∞ S₁]
    [CompactSpace S₁] [ConnectedSpace S₁] [T2Space S₁]
    {S₂ : Type*} [TopologicalSpace S₂] [ChartedSpace ℂ S₂] [IsManifold 𝓘(ℂ) ∞ S₂]
    [CompactSpace S₂] [ConnectedSpace S₂] [T2Space S₂]
    (π₁ : FiniteHolomorphicMap S S₁) (π₂ : FiniteHolomorphicMap S S₂) {v₁ : S₁ → X}
    {v₂ : S₂ → X} (hs₁ : ContMDiff 𝓘(ℝ, ℂ) I ∞ v₁) (hs₂ : ContMDiff 𝓘(ℝ, ℂ) I ∞ v₂)
    (hv₁ : IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ S₁) J v₁)
    (hv₂ : IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ S₂) J v₂)
    (hi₁ : IsSomewhereInjective I v₁) (hi₂ : IsSomewhereInjective I v₂)
    (h : v₁ ∘ π₁ = v₂ ∘ π₂) :
    ∃! a : S₁ ≃ₘ⟮𝓘(ℂ), 𝓘(ℂ)⟯ S₂, a ∘ π₁ = π₂ ∧ v₂ ∘ a = v₁ := by
  sorry

/-! ## Layer 1: prestable maps and map-dependent stability -/

/-- **Stability** (§1.2): let `u` be a prestable map to a finite-dimensional Hausdorff
second-countable boundaryless manifold `X` with a smooth almost complex structure `J`, from a
nodal curve with finitely many compact connected normalization components `C i`, finitely many
flag pairs `d` and `n` ordered marks `m`: the restriction of `u` to each component is smooth and
pseudoholomorphic, and `u` takes the same value at the two points of every flag pair. The
automorphisms of the marked nodal curve (biholomorphisms of the normalization matching the flag
pairs and fixing every mark) that intertwine `u` form a finite set exactly when every component
on which `u` is constant is pointed stable, that is, has finitely many biholomorphisms fixing its
special points. No taming form, compactness of `X` or genericity of `J` is assumed (Pardon,
*An algebraic approach to virtual fundamental cycles*, Lemmas 9.2.7–9.2.8, with
ComplexCurveModuli D0 item 5 for the stable augmented domain). -/
theorem finite_isotropy_iff
    {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    {X : Type*} [TopologicalSpace X] [ChartedSpace H X] [IsManifold I ∞ X] [T2Space X]
    [SecondCountableTopology X] (J : SmoothAlmostComplexStructure I X)
    {ι Flag : Type*} [Finite ι] [Finite Flag] {C : ι → Type*} {n : ℕ}
    [∀ i, TopologicalSpace (C i)] [∀ i, ChartedSpace ℂ (C i)] [∀ i, IsManifold 𝓘(ℂ) ∞ (C i)]
    [∀ i, CompactSpace (C i)] [∀ i, ConnectedSpace (C i)] [∀ i, T2Space (C i)]
    {d : FlagPairData ι Flag C} (m : Marking d (Fin n ⊕ Empty)) (u : (Σ i, C i) → X)
    (hs : ∀ i, ContMDiff 𝓘(ℝ, ℂ) I ∞ fun z : C i ↦ u ⟨i, z⟩)
    (hu : ∀ i, IsPseudoholomorphic (SmoothAlmostComplexStructure.ofComplexManifold ℂ (C i)) J
      fun z : C i ↦ u ⟨i, z⟩)
    (hnode : ∀ f, u (fstPoint d f) = u (sndPoint d f)) :
    {e : AuxiliaryAut 𝓘(ℂ) ∞ m | u ∘ e = u}.Finite ↔
      ∀ i, (∀ z z' : C i, u ⟨i, z⟩ = u ⟨i, z'⟩) →
        (Diffeomorph.fixingSubgroup (I := 𝓘(ℂ)) (n := ∞) (m.specialPoints i) :
          Set (C i ≃ₘ⟮𝓘(ℂ), 𝓘(ℂ)⟯ C i)).Finite := by
  sorry

end TauCetiRoadmap.AnalyticStableMaps
