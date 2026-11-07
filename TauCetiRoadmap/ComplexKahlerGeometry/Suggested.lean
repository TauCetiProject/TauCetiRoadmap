module

public import Mathlib
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Manifold.Complex.Orientation
public import TauCeti.Geometry.Manifold.DifferentialForm.AlmostComplexType
public import TauCeti.Geometry.Manifold.DifferentialForm.Dolbeault.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.MapCoeff
public import TauCeti.Geometry.Manifold.DifferentialForm.Regularity
public import TauCeti.Geometry.Manifold.DifferentialForm.Smooth
public import TauCeti.Geometry.Manifold.DifferentialForm.Wedge.Smooth.Basic
public import TauCeti.Geometry.Symplectic.Manifold.JHolomorphic
public import TauCeti.Geometry.Symplectic.Manifold.Nijenhuis

/-!
# Complex manifolds, Dolbeault theory and Kähler geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them (a polydisc as an open submanifold, Dolbeault and complex de
Rham cohomology as quotients of pinned submodules, the Kähler condition on a real two-form and
the iterated Lefschetz wedge). Every carrier is pinned: `TauCeti.SmoothForm`, `mextDerivₗ`,
`SmoothAlmostComplexStructure.ofComplexManifold`, `delBar`, `typeProjection`, `nijenhuis`,
`wedgeWith`, `smoothSheafCommRing` and `IsManifold.maximalAtlas`.

Stated here: the real-analytic structure of a finite-dimensional complex manifold (K3.0); the
Newlander–Nirenberg theorem in its local form (K1); the Dolbeault–Grothendieck lemma on a
polydisc (K2); the Hartogs extension theorem on an open set of `ℂⁿ`, the Weierstrass
preparation theorem and the regularity, Noetherian property and factoriality of the ring of
holomorphic germs (K3); finiteness of Dolbeault cohomology and Serre duality with trivial
coefficients on a compact complex manifold (K5b); and, on a compact Kähler manifold, the Hodge
decomposition in its dimension form, Hodge symmetry, the evenness of odd Betti numbers and the
Hard Lefschetz theorem (K6).

Not statable at the pins, and therefore not stated: Serre duality and the Hodge theorem with
coefficients in a holomorphic vector bundle, Koszul–Malgrange and the Chern connection, which
lack the holomorphic-bundle mixin of ComplexManifolds Milestone 7; the Kähler identities and the
Hodge–Riemann bilinear relations, which lack the complex-linear Hodge star on `(p,q)`-forms (the
pin has `TauCeti.SmoothForm.hodgeStar` for real coefficients only) and the complex-linear
integral of top forms; the Dolbeault theorem `H^q(M, Ω^p) ≃ H^(p,q)`, which lacks the sheaf of
holomorphic `p`-forms and its derived-functor cohomology; the projective, torus, Hopf and Iwasawa
computations of K7–K8, whose carriers (the complex-manifold structure on
`Projectivization ℂ (Fin (n+1) → ℂ)`, complex tori and holomorphic quotients) are targets of
ComplexManifolds, ComplexTori and K7; and the Frölicher spectral sequence, which lacks the
bicomplex spectral-sequence carrier of AlgebraicTopology Stage 5.0.

The holomorphic-stalk statements take the manifold in `Type` because `smoothSheafCommRing`
requires its base and its coefficient ring in one universe.
-/

public section

noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff Topology TauCeti.ComplexManifold
open TauCeti TauCeti.SmoothAlmostComplexStructure

/-! ## Layer 1: complex structures and type calculus (K1) -/

section Integrability

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M]

/-- **The Newlander–Nirenberg theorem** (Webster, Math. Z. 201 (1989), pp. 303–316), in its local
form. Let `J` be a smooth almost complex structure on a real manifold modelled on a
finite-dimensional complex vector space `E` whose Nijenhuis tensor vanishes. Then every point lies
in the source of a chart of the maximal smooth atlas that is pseudoholomorphic on its source from
`(M, J)` to `E` with its structure `ofComplexManifold E E`, multiplication by `i`: its
differential intertwines `J` with multiplication by `i`. Such charts have holomorphic transition maps, so they form the
compatible complex atlas inducing `J`; the converse is the pinned
`nijenhuis_ofComplexManifold`. -/
theorem newlander_nirenberg [IsManifold 𝓘(ℝ, E) ∞ M]
    (J : SmoothAlmostComplexStructure 𝓘(ℝ, E) M) (hJ : J.nijenhuis = 0) (x : M) :
    ∃ e ∈ IsManifold.maximalAtlas 𝓘(ℝ, E) ∞ M, x ∈ e.source ∧
      IsPseudoholomorphicOn J (ofComplexManifold E E) e e.source := by
  sorry

end Integrability

/-! ## Layer 2: Dolbeault calculus and the local lemmas (K2) -/

section Polydisc

variable {n : ℕ}

/-- The open polydisc of polyradius `r` in `ℂⁿ`, as an open subset, hence an open complex
submanifold of the model space `Fin n → ℂ`. It is empty when some `r j ≤ 0`. -/
def polydisc (r : Fin n → ℝ) : TopologicalSpace.Opens (Fin n → ℂ) where
  carrier := Set.univ.pi fun j ↦ Metric.ball 0 (r j)
  is_open' := isOpen_set_pi Set.finite_univ fun _ _ ↦ Metric.isOpen_ball

/-- **The Dolbeault–Grothendieck lemma on a polydisc** (Demailly, Chapter I, (3.29); the whole-
polydisc form is K2's parameter-dependent exhaustion argument). A smooth `∂̄`-closed form of
type `(p, q+1)` on an open polydisc of `ℂⁿ` is `∂̄` of a smooth form of type `(p, q)` on the
whole polydisc. For `n = 0` every form of positive degree vanishes and the statement is
trivial. -/
theorem dolbeault_grothendieck_polydisc (r : Fin n → ℝ) (p q : ℕ)
    (φ : SmoothForm 𝓘(ℝ, Fin n → ℂ) (polydisc r) ℂ (p + q + 1))
    (hφ : φ.IsOfType (ofComplexManifold (Fin n → ℂ) (polydisc r)) p (q + 1))
    (hclosed : (ofComplexManifold (Fin n → ℂ) (polydisc r)).delBar φ = 0) :
    ∃ ψ : SmoothForm 𝓘(ℝ, Fin n → ℂ) (polydisc r) ℂ (p + q),
      ψ.IsOfType (ofComplexManifold (Fin n → ℂ) (polydisc r)) p q ∧
        (ofComplexManifold (Fin n → ℂ) (polydisc r)).delBar ψ = φ := by
  sorry

end Polydisc

/-! ## Layer 3: analytic germs and subvarieties (K3) -/

section LocalAnalytic

/-- K3.0: a finite-dimensional complex manifold is, with the same charts, a real-analytic
manifold, because holomorphic transition maps are analytic
(`DifferentiableOn.analyticOnNhd_of_finiteDimensional`) and analyticity restricts to the real
scalars. -/
theorem realified_isManifold_analytic
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := by
  sorry

/-- **The Hartogs extension theorem** (Demailly, Chapter I, (3.28)). For `n ≥ 2`, an open set
`Ω ⊆ ℂⁿ` and a compact `K ⊆ Ω` with `Ω ∖ K` connected, every holomorphic function on `Ω ∖ K`
is the restriction of a holomorphic function on `Ω`. The connectedness hypothesis is needed: for
`K` a closed spherical shell, a function equal to `1` inside and `0` outside does not extend;
for `n = 1` the function `1/z` on `ℂ ∖ {0}` does not extend. -/
theorem hartogs_extension {n : ℕ} (hn : 2 ≤ n) {Ω K : Set (Fin n → ℂ)} (hΩ : IsOpen Ω)
    (hK : IsCompact K) (hKΩ : K ⊆ Ω) (hconn : IsConnected (Ω \ K))
    {f : (Fin n → ℂ) → ℂ} (hf : DifferentiableOn ℂ f (Ω \ K)) :
    ∃ F : (Fin n → ℂ) → ℂ, DifferentiableOn ℂ F Ω ∧ Set.EqOn F f (Ω \ K) := by
  sorry

/-- **The Weierstrass preparation theorem** (Demailly, Chapter II, (2.1)). Let `f` be holomorphic
near `0` in `ℂⁿ × ℂ` and let `w ↦ f(0, w)` vanish to order exactly `d` at `0`. Then near `0`,
`f = u · (wᵈ + a_(d−1)(z) w^(d−1) + ⋯ + a₀(z))` with `u` a holomorphic unit at `0` and
holomorphic coefficients `a_i` vanishing at `0`. For `d = 0` the polynomial is `1` and `u = f`;
for `n = 0` the coefficients are the zero germs. -/
theorem weierstrass_preparation {n d : ℕ} {f : (Fin n → ℂ) × ℂ → ℂ} (hf : AnalyticAt ℂ f 0)
    (hlow : ∀ i < d, iteratedDeriv i (fun w ↦ f (0, w)) 0 = 0)
    (hd : iteratedDeriv d (fun w ↦ f (0, w)) 0 ≠ 0) :
    ∃ (u : (Fin n → ℂ) × ℂ → ℂ) (a : Fin d → (Fin n → ℂ) → ℂ),
      AnalyticAt ℂ u 0 ∧ u 0 ≠ 0 ∧ (∀ i, AnalyticAt ℂ (a i) 0 ∧ a i 0 = 0) ∧
        ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
          f zw = u zw * (zw.2 ^ d + ∑ i : Fin d, a i zw.1 * zw.2 ^ (i : ℕ)) := by
  sorry

/-- **Uniqueness in Weierstrass preparation** (Demailly, Chapter II, (2.1)): two factorizations
of the same germ have the same unit and the same coefficient germs. -/
theorem weierstrass_preparation_unique {n d : ℕ} {f u u' : (Fin n → ℂ) × ℂ → ℂ}
    {a a' : Fin d → (Fin n → ℂ) → ℂ}
    (hu : AnalyticAt ℂ u 0) (hu0 : u 0 ≠ 0) (ha : ∀ i, AnalyticAt ℂ (a i) 0 ∧ a i 0 = 0)
    (hf : ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
      f zw = u zw * (zw.2 ^ d + ∑ i : Fin d, a i zw.1 * zw.2 ^ (i : ℕ)))
    (hu' : AnalyticAt ℂ u' 0) (hu0' : u' 0 ≠ 0)
    (ha' : ∀ i, AnalyticAt ℂ (a' i) 0 ∧ a' i 0 = 0)
    (hf' : ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
      f zw = u' zw * (zw.2 ^ d + ∑ i : Fin d, a' i zw.1 * zw.2 ^ (i : ℕ))) :
    u =ᶠ[𝓝 0] u' ∧ ∀ i, a i =ᶠ[𝓝 0] a' i := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- **The ring of holomorphic germs is a regular local ring of dimension `n`** (Demailly,
Chapter II, (2.7) for the Noetherian property; K3.HolomorphicStalk). The stalk at `x` of
Mathlib's sheaf of complex-smooth, that is holomorphic, functions on a complex manifold of
dimension `n = dim_ℂ E` is a Noetherian local ring (`smoothSheafCommRing.instLocalRing_stalk`
gives locality at the pin) whose maximal ideal is generated by the `n` coordinate germs, so its
Krull dimension is `n`. For `n = 0` the stalk is `ℂ`. -/
theorem isRegularLocalRing_holomorphicStalk (x : M) :
    IsRegularLocalRing ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) ∧
      ringKrullDim ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) =
        Module.finrank ℂ E := by
  sorry

/-- **The ring of holomorphic germs is factorial** (Demailly, Chapter II, (2.10)): it is a domain
in which every nonzero germ factors into irreducibles uniquely up to units. -/
theorem uniqueFactorizationMonoid_holomorphicStalk (x : M) :
    ∃ _ : IsDomain ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x),
      UniqueFactorizationMonoid ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) := by
  sorry

end LocalAnalytic

/-! ## Layer 5: compact Hermitian elliptic theory and Serre duality (K5) -/

section Cohomology

variable (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  (M : Type*) [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- The `∂̄`-closed smooth forms of type `(p, q)` on a complex manifold, for the pinned almost
complex structure `ofComplexManifold E M`: the kernel of `delBar` inside the image of the type
projection `typeProjection p q` in degree `p + q`. -/
def dolbeaultCocycles (p q : ℕ) : Submodule ℂ (SmoothForm 𝓘(ℝ, E) M ℂ (p + q)) :=
  LinearMap.ker ((ofComplexManifold E M).delBar (F := ℂ) (k := p + q)) ⊓
    LinearMap.range ((ofComplexManifold E M).typeProjection (F := ℂ) (k := p + q) p q)

/-- The `∂̄`-exact forms of type `(p, q)`: the image under `delBar` of the forms of type
`(p, q−1)`, and `0` when `q = 0`. -/
def dolbeaultCoboundaries : (p q : ℕ) → Submodule ℂ (SmoothForm 𝓘(ℝ, E) M ℂ (p + q))
  | _, 0 => ⊥
  | p, q + 1 =>
    (LinearMap.range ((ofComplexManifold E M).typeProjection (F := ℂ) (k := p + q) p q)).map
      ((ofComplexManifold E M).delBar (F := ℂ) (k := p + q))

/-- Dolbeault cohomology `H^(p,q)_∂̄(M)` of a complex manifold: `∂̄`-closed `(p,q)`-forms modulo
`∂̄`-exact ones, realized as the image of the cocycles in the quotient of all `(p+q)`-forms by
the coboundaries; a complex vector space. -/
abbrev DolbeaultCohomology (p q : ℕ) :=
  ↥((dolbeaultCocycles E M p q).map (dolbeaultCoboundaries E M p q).mkQ)

/-- **The Hodge theorem for Dolbeault cohomology** (Wells, Chapter IV, §§4–5; Demailly, Chapter
VI, §(7.3) and its preparation; K5b.1): on a compact complex manifold every Dolbeault cohomology
group is finite-dimensional, being the space of `∂̄`-harmonic forms of a Hermitian metric. -/
theorem finiteDimensional_dolbeaultCohomology [T2Space M] [CompactSpace M] (p q : ℕ) :
    FiniteDimensional ℂ (DolbeaultCohomology E M p q) := by
  sorry

/-- **Serre duality with trivial coefficients** (Demailly, Chapter VI, (7.3); Wells, Chapter IV,
§5; K5b.1): on a compact complex manifold of dimension `n`, the pairing of `H^(p,q)` with
`H^(n−p,n−q)` by wedge and integration is perfect, so the two groups have the same dimension. -/
theorem finrank_dolbeaultCohomology_serre [T2Space M] [CompactSpace M] {p q : ℕ}
    (hp : p ≤ Module.finrank ℂ E) (hq : q ≤ Module.finrank ℂ E) :
    Module.finrank ℂ (DolbeaultCohomology E M p q) =
      Module.finrank ℂ
        (DolbeaultCohomology E M (Module.finrank ℂ E - p) (Module.finrank ℂ E - q)) := by
  sorry

/-! ## Layer 6: Kähler identities and Hodge decomposition (K6) -/

/-- The exterior derivative of complex-valued smooth forms as a complex-linear map: the pinned
real-linear `mextDerivₗ` commutes with multiplication of the coefficients by complex scalars
(`mextDerivₗ_smul`). -/
def mextDerivℂ (k : ℕ) : SmoothForm 𝓘(ℝ, E) M ℂ k →ₗ[ℂ] SmoothForm 𝓘(ℝ, E) M ℂ (k + 1) where
  toFun := mextDerivₗ 𝓘(ℝ, E) k
  map_add' φ ψ := map_add (mextDerivₗ 𝓘(ℝ, E) k) φ ψ
  map_smul' c φ := SmoothForm.mextDerivₗ_smul c φ

/-- The closed complex-valued smooth `k`-forms. -/
def deRhamCocycles (k : ℕ) : Submodule ℂ (SmoothForm 𝓘(ℝ, E) M ℂ k) :=
  LinearMap.ker (mextDerivℂ E M k)

/-- The exact complex-valued smooth `k`-forms, `0` in degree zero. -/
def deRhamCoboundaries : (k : ℕ) → Submodule ℂ (SmoothForm 𝓘(ℝ, E) M ℂ k)
  | 0 => ⊥
  | k + 1 => LinearMap.range (mextDerivℂ E M k)

/-- Complex de Rham cohomology `H^k_dR(M; ℂ)` on the pinned form carrier with complex
coefficients: closed forms modulo exact forms, realized as the image of the closed forms in the
quotient of all `k`-forms by the exact ones; a complex vector space (K5a). -/
abbrev ComplexDeRhamCohomology (k : ℕ) :=
  ↥((deRhamCocycles E M k).map (deRhamCoboundaries E M k).mkQ)

/-- A real smooth two-form `κ` on a complex manifold is a **Kähler form** when it is closed,
invariant under the complex structure `J = ofComplexManifold E M` in both arguments, and
`g(v, w) = κ(v, Jv)` is positive definite. On `ℂ` with `κ = dx ∧ dy` and `J = i`,
`κ(1, i) = 1 > 0`. -/
def IsKahlerForm (κ : SmoothForm 𝓘(ℝ, E) M ℝ 2) : Prop :=
  mextDerivₗ 𝓘(ℝ, E) 2 κ = 0 ∧
    (∀ (x : M) (v w : TangentSpace 𝓘(ℝ, E) x),
      κ.1 x ![ofComplexManifold E M x v, ofComplexManifold E M x w] = κ.1 x ![v, w]) ∧
    ∀ (x : M) (v : TangentSpace 𝓘(ℝ, E) x), v ≠ 0 → 0 < κ.1 x ![v, ofComplexManifold E M x v]

/-- **The Hodge decomposition, in its dimension form** (Demailly, Chapter VI, (8.5); K6.1): on a
compact Kähler manifold, the `k`-th complex Betti number is the sum of the Hodge numbers
`h^(p,k−p)` over `0 ≤ p ≤ k`. -/
theorem finrank_complexDeRhamCohomology_eq_sum_dolbeault [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (k : ℕ) :
    Module.finrank ℂ (ComplexDeRhamCohomology E M k) =
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

/-- **Hodge symmetry** (Demailly, Chapter VI, (8.5); K6.1): on a compact Kähler manifold,
complex conjugation of harmonic forms gives `h^(p,q) = h^(q,p)`. -/
theorem finrank_dolbeaultCohomology_symm [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E M p q) =
      Module.finrank ℂ (DolbeaultCohomology E M q p) := by
  sorry

/-- **Odd Betti numbers of a compact Kähler manifold are even** (K6.1), from Hodge decomposition
and Hodge symmetry. -/
theorem even_finrank_complexDeRhamCohomology_odd [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (k : ℕ) :
    Even (Module.finrank ℂ (ComplexDeRhamCohomology E M (2 * k + 1))) := by
  sorry

/-- The iterated Lefschetz operator `α ↦ α ∧ κ^j` on complex-valued smooth forms, for a real
two-form `κ`, with the real scalars acting on the complex coefficients. -/
def lefschetzPow (κ : SmoothForm 𝓘(ℝ, E) M ℝ 2) {k : ℕ} :
    (j : ℕ) → SmoothForm 𝓘(ℝ, E) M ℂ k → SmoothForm 𝓘(ℝ, E) M ℂ (k + 2 * j)
  | 0, α => α
  | j + 1, α =>
    SmoothForm.wedgeWith (ContinuousLinearMap.lsmul ℝ ℝ).flip (lefschetzPow κ j α) κ

/-- **The Hard Lefschetz theorem** (Demailly, Chapter VI, (8.17); K6.1): on a compact Kähler
manifold of dimension `n` with Kähler form `κ`, for `k ≤ n` the map `α ↦ α ∧ κ^(n−k)` induces an
isomorphism `H^k_dR(M; ℂ) → H^(2n−k)_dR(M; ℂ)`; stated on forms, it sends a closed form to an exact
one only when the form is exact, and every closed form of degree `2n − k` is cohomologous to the
image of a closed `k`-form. For `k = n` the map is the identity. -/
theorem hard_lefschetz [T2Space M] [CompactSpace M] {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2}
    (hω : IsKahlerForm E M κ) {k : ℕ} (hk : k ≤ Module.finrank ℂ E) :
    (∀ α ∈ deRhamCocycles E M k,
      lefschetzPow E M κ (Module.finrank ℂ E - k) α ∈
          deRhamCoboundaries E M (k + 2 * (Module.finrank ℂ E - k)) →
        α ∈ deRhamCoboundaries E M k) ∧
    ∀ γ ∈ deRhamCocycles E M (k + 2 * (Module.finrank ℂ E - k)),
      ∃ α ∈ deRhamCocycles E M k,
        γ - lefschetzPow E M κ (Module.finrank ℂ E - k) α ∈
          deRhamCoboundaries E M (k + 2 * (Module.finrank ℂ E - k)) := by
  sorry

end Cohomology

end TauCetiRoadmap.ComplexKahlerGeometry
