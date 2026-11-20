import Mathlib
import TauCeti.Geometry.Contact.Standard
import TauCeti.Geometry.Contact.Hamiltonian
import TauCeti.Geometry.Contact.Contactization
import TauCeti.Geometry.Diffeomorphism.Diffeotopy.Basic

/-!
# Contact geometry and contact dynamics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, using Tau Ceti's smooth forms
(`TauCeti.SmoothForm`), contact forms (`TauCeti.SmoothForm.IsContactForm`), contact distributions
(`TauCeti.IsContactDistribution`), Reeb and contact Hamiltonian vector fields, the standard form
`dz - Σ pᵢ dqᵢ` (`TauCeti.innerProductContactForm`) and the one-jet form `dz - λ` on `T*Λ × ℝ`.

Stated here:

* the contact Darboux theorem, for contact forms with exact pullback of the standard form and for
  contact distributions (README §3.1, §3.2);
* Gray stability on a closed manifold for a smooth family of contact forms (README §3.4);
* the strict neighbourhood theorem for a closed embedded Legendrian submanifold (README §5.4);
* the Jacobi bracket of a contact form: its contact Hamiltonian vector field is the Lie bracket of
  those of its arguments, and it satisfies the Jacobi identity (README §6.1).

Not statable at the pins, and stated only in the README:

* Gray stability for a family of contact distributions, relative to a closed subset and without
  coorientation (README §3.3, §3.4): the pins have no notion of a smooth family of distributions;
* the isotropic neighbourhood theorem (README §5.2): the conformal symplectic normal bundle, a
  smooth vector bundle built from the contact line, does not exist at the pins;
* the symplectization of a contact structure on the punctured dual contact line, the lift of
  contactomorphisms to it and its bracket comparison (README §4.1, §4.2, §6.3), and the Jacobi
  bracket on sections of the contact line (README §6.2): the contact line `TM ⧸ ξ` exists only
  pointwise, not as a smooth line bundle;
* the neighbourhood theorem for a Legendrian submanifold with nontrivial contact line
  (README §5.5): first jets of a line bundle do not exist at the pins.
-/

open Module Bundle Manifold
open scoped Manifold ContDiff

noncomputable section

namespace TauCetiRoadmap.SymplecticGeometry.ContactGeometry

open TauCeti

/-! ## Layer 3: Darboux and Gray stability -/

/-- **Contact Darboux theorem for contact forms** (README §3.2). Around every point of a
`(2n+1)`-dimensional manifold without boundary, a contact form `α` is the pullback of the standard
form `dz - Σ pᵢ dqᵢ` on `ℝⁿ × ℝⁿ × ℝ` by a diffeomorphism from an open neighbourhood of the point
onto an open subset. The pullback is exact, not only up to a multiplier (Geiges, *An Introduction
to Contact Topology*). -/
theorem exists_darbouxChart_mpullback_eq
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [BoundarylessManifold I M] {n : ℕ} (hn : finrank ℝ E = 2 * n + 1)
    {α : SmoothForm I M ℝ 1} (hα : α.IsContactForm) (x : M) :
    ∃ U : Set M, IsOpen U ∧ x ∈ U ∧
      ∃ φ : M → EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) × ℝ,
        IsLocalDiffeomorphOn I 𝓘(ℝ, EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) × ℝ) ∞
          φ U ∧ Set.InjOn φ U ∧
        ∀ y ∈ U, mpullback I 𝓘(ℝ, EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) × ℝ) φ
          (innerProductContactForm (EuclideanSpace ℝ (Fin n))).1 y = α.1 y := by
  sorry

/-- **Contact Darboux theorem for contact structures** (README §3.1). Around every point of a
`(2n+1)`-dimensional manifold without boundary, a smooth contact distribution `D`, with no
coorientation or defining form chosen, is carried by a diffeomorphism from an open neighbourhood
of the point onto an open subset of `ℝⁿ × ℝⁿ × ℝ` to the kernel of the standard form
`dz - Σ pᵢ dqᵢ`: at each point `y` of the neighbourhood, `D y` is the inverse image of that kernel
under the differential of the chart (Geiges, *An Introduction to Contact Topology*). -/
theorem exists_darbouxChart_kerDistribution_eq
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [BoundarylessManifold I M] {n : ℕ} (hn : finrank ℝ E = 2 * n + 1)
    {D : Π x : M, Submodule ℝ (TangentSpace I x)} (hD : IsContactDistribution I ∞ D) (x : M) :
    ∃ U : Set M, IsOpen U ∧ x ∈ U ∧
      ∃ φ : M → EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) × ℝ,
        IsLocalDiffeomorphOn I 𝓘(ℝ, EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) × ℝ) ∞
          φ U ∧ Set.InjOn φ U ∧
        ∀ y ∈ U, D y = ((innerProductContactForm (EuclideanSpace ℝ (Fin n))).kerDistribution
          (φ y)).comap
            (mfderiv I 𝓘(ℝ, EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin n) × ℝ) φ y).toLinearMap := by
  sorry

/-- **Gray stability on a closed manifold** (README §3.4). Let `M` be compact, Hausdorff and
without boundary, and let `A` be a smooth one-form on `ℝ × M` whose restriction `αₜ` to each slice
`{t} × M`, `t ∈ [0, 1]`, is a contact form. Then there is a diffeotopy `Φ` of `M` over `[0, 1]`
and a positive function `g` with `Φₜ^* αₜ = gₜ α₀` for every `t`; in particular `Φₜ` carries the
contact distribution `ker α₀` onto `ker αₜ` (Gray, *Some global properties of contact
structures*, 1959; Geiges, *An Introduction to Contact Topology*). -/
theorem exists_diffeotopy_mpullback_eq_pos_smul
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [CompactSpace M] [T2Space M] [BoundarylessManifold I M]
    (A : SmoothForm (𝓘(ℝ).prod I) (ℝ × M) ℝ 1)
    (hA : ∀ t ∈ Set.Icc (0 : ℝ) 1, (SmoothForm.mpullback (fun x : M ↦ (t, x))
      (contMDiff_const.prodMk contMDiff_id) A).IsContactForm) :
    ∃ Φ : Diffeotopy I ∞ M, ∃ g : unitInterval → M → ℝ, (∀ t x, 0 < g t x) ∧
      ∀ (t : unitInterval) (x : M),
        mpullback I I (fun y ↦ Φ (t, y))
            (SmoothForm.mpullback (fun y : M ↦ ((t : ℝ), y))
              (contMDiff_const.prodMk contMDiff_id) A).1 x =
          g t x • (SmoothForm.mpullback (fun y : M ↦ ((0 : ℝ), y))
              (contMDiff_const.prodMk contMDiff_id) A).1 x := by
  sorry

/-! ## Layer 5: isotropic and Legendrian neighbourhoods -/

/-- **Strict Legendrian neighbourhood theorem** (README §5.4). Let `α` be a contact form on a
Hausdorff, second-countable `(2k+1)`-manifold `M` without boundary and let `ι : Λ → M` be a
smooth embedding with closed image of a `k`-manifold `Λ` without boundary, tangent to `ker α`.
Then a neighbourhood of the zero section `{(0_q, 0)}` of the one-jet space `T*Λ × ℝ` is carried
diffeomorphically onto a neighbourhood of `ι(Λ)` by a map `φ` with `φ(0_q, 0) = ι q` which pulls
`α` back exactly to the one-jet form `dz - λ`, `λ` the Liouville form of `T*Λ` (Kriegl–Michor,
*The Convenient Setting of Global Analysis*, Proposition 43.18). -/
theorem exists_mpullback_eq_contactization_of_isLegendrian
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [T2Space M] [SecondCountableTopology M] [BoundarylessManifold I M]
    {E' H' Λ : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} [TopologicalSpace Λ]
    [ChartedSpace H' Λ] [IsManifold J ∞ Λ] [BoundarylessManifold J Λ]
    (hdim : finrank ℝ E = 2 * finrank ℝ E' + 1)
    {α : SmoothForm I M ℝ 1} (hα : α.IsContactForm)
    {ι : Λ → M} (hι : IsSmoothEmbedding J I ∞ ι) (hclosed : IsClosed (Set.range ι))
    (hleg : ∀ (q : Λ) (v : TangentSpace J q), α.1 (ι q) ![mfderiv J I ι q v] = 0) :
    ∃ U : Set (CotangentBundle J Λ × ℝ), IsOpen U ∧
      (∀ q : Λ,
        (zeroSection (E' →L[ℝ] ℝ) (fun x : Λ ↦ TangentSpace J x →L[ℝ] ℝ) q, (0 : ℝ)) ∈ U) ∧
      ∃ φ : CotangentBundle J Λ × ℝ → M,
        IsLocalDiffeomorphOn ((J.prod 𝓘(ℝ, E' →L[ℝ] ℝ)).prod 𝓘(ℝ)) I ∞ φ U ∧ Set.InjOn φ U ∧
        (∀ q : Λ,
          φ (zeroSection (E' →L[ℝ] ℝ) (fun x : Λ ↦ TangentSpace J x →L[ℝ] ℝ) q, 0) = ι q) ∧
        ∀ p ∈ U, mpullback ((J.prod 𝓘(ℝ, E' →L[ℝ] ℝ)).prod 𝓘(ℝ)) I φ α.1 p =
          (CotangentBundle.liouvilleForm J Λ).contactization.1 p := by
  sorry

/-! ## Layer 6: the Jacobi bracket and the Floer boundary interface -/

/-- The **Jacobi bracket** of two functions for a one-form `α`,
`{f, g}_α = dα(X_f, X_g) + f R_α(g) - g R_α(f)`, where `X_f` is the contact Hamiltonian vector
field of `f` (`α(X_f) = f`, `ι_(X_f) dα = (R_α f) α - df`) and `R_α` the Reeb vector field
(README §6.1). For a contact form it equals `α([X_f, X_g])`. -/
def jacobiBracket {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (α : SmoothForm I M ℝ 1) (f g : M → ℝ) (x : M) : ℝ :=
  mextDeriv α.1 x ![α.contactHamiltonianVectorField f x, α.contactHamiltonianVectorField g x] +
    f x * mvfderiv I g x (α.reebVectorField x) - g x * mvfderiv I f x (α.reebVectorField x)

/-- **Contact vector fields form a Lie algebra under the Jacobi bracket** (README §6.1). For a
contact form on a manifold without boundary and smooth functions `f` and `g`, the contact
Hamiltonian vector field of `{f, g}_α` is the Lie bracket `[X_f, X_g]`. -/
theorem contactHamiltonianVectorField_jacobiBracket
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [BoundarylessManifold I M] {α : SmoothForm I M ℝ 1}
    (hα : α.IsContactForm) {f g : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hg : ContMDiff I 𝓘(ℝ) ∞ g) :
    α.contactHamiltonianVectorField (jacobiBracket α f g) =
      VectorField.mlieBracket I (α.contactHamiltonianVectorField f)
        (α.contactHamiltonianVectorField g) := by
  sorry

/-- **The Jacobi identity for the Jacobi bracket of a contact form** (README §6.1). For a contact
form on a manifold without boundary and smooth functions `f`, `g` and `h`,
`{f, {g, h}} + {g, {h, f}} + {h, {f, g}} = 0`. -/
theorem jacobiBracket_jacobi
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [BoundarylessManifold I M] {α : SmoothForm I M ℝ 1}
    (hα : α.IsContactForm) {f g h : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hg : ContMDiff I 𝓘(ℝ) ∞ g) (hh : ContMDiff I 𝓘(ℝ) ∞ h) :
    jacobiBracket α f (jacobiBracket α g h) + jacobiBracket α g (jacobiBracket α h f) +
      jacobiBracket α h (jacobiBracket α f g) = 0 := by
  sorry

end TauCetiRoadmap.SymplecticGeometry.ContactGeometry
