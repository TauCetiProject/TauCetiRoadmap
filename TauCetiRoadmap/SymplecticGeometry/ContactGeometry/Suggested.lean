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
* Gray stability relative to a subset for a jointly smooth family of contact distributions, with no
  compactness and no coorientation (README §3.3), and on a closed manifold for a family of
  contact distributions and for a family of contact forms (README §3.4); joint smoothness of the
  family `ξₜ` is smoothness of the distribution `(t, x) ↦ 0 × ξₜ(x)` on `ℝ × M`;
* the strict neighbourhood theorem for an embedded Legendrian submanifold (README §5.4);
* the Jacobi bracket of a contact form: its contact Hamiltonian vector field is the Lie bracket of
  those of its arguments, and it satisfies the Jacobi identity (README §6.1).

Not statable at the pins, and stated only in the README:

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
onto an open subset. The pullback is exact, not only up to a multiplier (Courte–Guillermou,
*Introduction to symplectic and contact geometry*, Theorem 3.12; Geiges, *Contact geometry*,
Theorem 2.24). -/
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
under the differential of the chart (Courte–Guillermou, *Introduction to symplectic and contact
geometry*, Theorem 3.11). -/
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

/-- **Relative Gray stability** (README §3.3). Let `ξₜ`, `t ∈ ℝ`, be hyperplane fields on a
Hausdorff manifold `M` without boundary, jointly smooth: `(t, x) ↦ 0 × ξₜ(x)` is a smooth
distribution of rank `dim M - 1` on `ℝ × M`. Assume that for `t ∈ [0, 1]` each `ξₜ` is a contact
distribution and agrees with `ξ₀` at every point of a subset `K` (equivalently of its closure, by
continuity). Then there are an open `V ⊇ K` and a smooth `φ : [0, 1] × V → M` with `φ₀ = id`,
`φₜ = id` on `K`, each `φₜ` a diffeomorphism of `V` onto an open subset, and `dφₜ(ξ₀) = ξₜ` on `V`.
Neither compactness of `K` or `M` nor a coorientation is assumed (Courte–Guillermou, *Introduction
to symplectic and contact geometry*, Theorem 3.9, for compact `K`). -/
theorem exists_relative_isotopy_map_mfderiv_eq
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [T2Space M] [BoundarylessManifold I M]
    (ξ : ℝ → Π x : M, Submodule ℝ (TangentSpace I x))
    (hsmooth : IsContMDiffDistribution (𝓘(ℝ).prod I) ∞ (finrank ℝ E - 1)
      (fun p : ℝ × M ↦ (ξ p.1 p.2).map (LinearMap.inr ℝ ℝ E)))
    (hcontact : ∀ t ∈ Set.Icc (0 : ℝ) 1, IsContactDistribution I ∞ (ξ t))
    {K : Set M} (hagree : ∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ x ∈ K, ξ t x = ξ 0 x) :
    ∃ V : Set M, IsOpen V ∧ K ⊆ V ∧ ∃ φ : ℝ → M → M,
      ContMDiffOn (𝓘(ℝ).prod I) I ∞ (Function.uncurry φ) (Set.Icc 0 1 ×ˢ V) ∧
      (∀ x ∈ V, φ 0 x = x) ∧ (∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ x ∈ K, φ t x = x) ∧
      (∀ t ∈ Set.Icc (0 : ℝ) 1, IsLocalDiffeomorphOn I I ∞ (φ t) V ∧ Set.InjOn (φ t) V) ∧
      ∀ t ∈ Set.Icc (0 : ℝ) 1, ∀ x ∈ V,
        ξ t (φ t x) = (ξ 0 x).map (mfderiv I I (φ t) x).toLinearMap := by
  sorry

/-- **Gray stability on a closed manifold for contact distributions** (README §3.4). Let `M` be
compact, Hausdorff and without boundary, and let `ξₜ`, `t ∈ ℝ`, be hyperplane fields on `M`,
jointly smooth as in `exists_relative_isotopy_map_mfderiv_eq`, with `ξₜ` a contact distribution
for every `t ∈ [0, 1]`. Then there is a diffeotopy `Φ` of `M` over `[0, 1]` with `dΦₜ(ξ₀) = ξₜ` for
every `t`; no coorientation is assumed (Courte–Guillermou, Theorem 3.10; for cooriented structures
Geiges, *Contact geometry*, Theorem 2.20). -/
theorem exists_diffeotopy_map_mfderiv_eq
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [CompactSpace M] [T2Space M] [BoundarylessManifold I M]
    (ξ : ℝ → Π x : M, Submodule ℝ (TangentSpace I x))
    (hsmooth : IsContMDiffDistribution (𝓘(ℝ).prod I) ∞ (finrank ℝ E - 1)
      (fun p : ℝ × M ↦ (ξ p.1 p.2).map (LinearMap.inr ℝ ℝ E)))
    (hcontact : ∀ t ∈ Set.Icc (0 : ℝ) 1, IsContactDistribution I ∞ (ξ t)) :
    ∃ Φ : Diffeotopy I ∞ M, ∀ (t : unitInterval) (x : M),
      ξ t (Φ (t, x)) = (ξ 0 x).map (mfderiv I I (fun y ↦ Φ (t, y)) x).toLinearMap := by
  sorry

/-- **Gray stability on a closed manifold for contact forms** (README §3.4). Let `M` be compact,
Hausdorff and without boundary, and let `A` be a smooth one-form on `ℝ × M` whose restriction `αₜ`
to each slice `{t} × M`, `t ∈ [0, 1]`, is a contact form. Then there is a diffeotopy `Φ` of `M`
over `[0, 1]` and a positive function `g` with `Φₜ^* αₜ = gₜ α₀` for every `t`; in particular `Φₜ`
carries the contact distribution `ker α₀` onto `ker αₜ` (Geiges, *Contact geometry*, Theorem 2.20
and its proof). -/
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
smooth embedding of a `k`-manifold `Λ` without boundary, tangent to `ker α`; its image need not be
closed. Then a neighbourhood of the zero section `{(0_q, 0)}` of the one-jet space `T*Λ × ℝ` is
carried diffeomorphically onto a neighbourhood of `ι(Λ)` by a map `φ` with `φ(0_q, 0) = ι q` which
pulls `α` back exactly to the one-jet form `dz - λ`, `λ` the Liouville form of `T*Λ`
(Kriegl–Michor, *The Convenient Setting of Global Analysis*, Proposition 43.18). -/
theorem exists_mpullback_eq_contactization_of_isLegendrian
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [T2Space M] [SecondCountableTopology M] [BoundarylessManifold I M]
    {E' H' Λ : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} [TopologicalSpace Λ]
    [ChartedSpace H' Λ] [IsManifold J ∞ Λ] [BoundarylessManifold J Λ]
    (hdim : finrank ℝ E = 2 * finrank ℝ E' + 1)
    {α : SmoothForm I M ℝ 1} (hα : α.IsContactForm)
    {ι : Λ → M} (hι : IsSmoothEmbedding J I ∞ ι)
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
(README §6.1). For a contact form it equals `α([X_f, X_g])`: it is the Lie bracket of contact
vector fields transported along `f ↦ X_f`, whose inverse is contraction with `α` (Kriegl–Michor,
*The Convenient Setting of Global Analysis*, 43.15; Geiges, *Contact geometry*, Theorem 2.22). -/
def jacobiBracket {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    (α : SmoothForm I M ℝ 1) (f g : M → ℝ) (x : M) : ℝ :=
  mextDeriv α.1 x ![α.contactHamiltonianVectorField f x, α.contactHamiltonianVectorField g x] +
    f x * mvfderiv I g x (α.reebVectorField x) - g x * mvfderiv I f x (α.reebVectorField x)

/-- **Contact vector fields form a Lie algebra under the Jacobi bracket** (README §6.1). For a
contact form on a manifold without boundary and smooth functions `f` and `g`, the contact
Hamiltonian vector field of `{f, g}_α` is the Lie bracket `[X_f, X_g]` (Kriegl–Michor, 43.15;
Geiges, Theorem 2.22). -/
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
`{f, {g, h}} + {g, {h, f}} + {h, {f, g}} = 0` (Kriegl–Michor, 43.15; Geiges, Theorem 2.22). -/
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
