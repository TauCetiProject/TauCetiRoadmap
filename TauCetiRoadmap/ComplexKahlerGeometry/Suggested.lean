module

public import Mathlib
public import TauCeti.Algebra.Module.ZLattice.Quotient
public import TauCeti.Geometry.Manifold.Algebra.Quotient
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Manifold.Complex.Orientation
public import TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain
public import TauCeti.Geometry.Manifold.DeRham.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.AlmostComplexType
public import TauCeti.Geometry.Manifold.DifferentialForm.Dolbeault.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.MapCoeff
public import TauCeti.Geometry.Manifold.DifferentialForm.Regularity
public import TauCeti.Geometry.Manifold.DifferentialForm.Smooth
public import TauCeti.Geometry.Manifold.DifferentialForm.Wedge.Smooth.Basic
public import TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace
public import TauCeti.Geometry.Manifold.Riemannian.Codifferential
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
`wedgeWith`, `smoothSheafCommRing`, `IsManifold.maximalAtlas`, `TauCeti.closedForms`,
`TauCeti.deRhamCohomology` and `TauCeti.SmoothForm.codifferential`, with the pinned
sphere-quotient complex projective space `TauCeti.ComplexProjectiveSpace n` and the pinned
complex-torus quotient `AddAction.orbitRel.Quotient L E` for Layer 7.

Stated here: the Newlander–Nirenberg theorem in its local form (Layer 1); the
Dolbeault–Grothendieck lemma on a polydisc (Layer 2); the Hartogs extension theorem on an open
set of `ℂⁿ`, the Weierstrass preparation theorem with its uniqueness, the regularity, Noetherian
property and factoriality of the ring of holomorphic germs, Rückert's Nullstellensatz and Oka's
coherence theorem in its primitive relation form (Layer 3); the Hodge theorem for real de Rham
cohomology of a compact oriented Riemannian manifold (Layer 5); finiteness of Dolbeault
cohomology and Serre duality with trivial coefficients on a compact complex manifold (Layer 5);
on a compact Kähler manifold, the `∂∂̄`-lemma, the Hodge decomposition in its dimension form,
Hodge symmetry, the evenness of odd Betti numbers and the Hard Lefschetz theorem (Layer 6); the
Hodge numbers of complex projective space and of complex tori (Layer 7); and the Frölicher
inequality and the Euler-characteristic identity on every compact complex manifold (Layer 8).

Not statable at the pins, and therefore not stated: Serre duality and the Hodge theorem with
coefficients in a holomorphic vector bundle, Koszul–Malgrange and the Chern connection, which
lack smooth forms with values in a vector bundle, the bundle Dolbeault operator `∂̄_E` and
connections on complex vector bundles (the pinned `del` and `delBar` act on forms with values in
a fixed normed space, and the holomorphic bundle itself is Mathlib's `ContMDiffVectorBundle`);
the Kähler identities, which lack the complex-linear Hodge star on `(p,q)`-forms (the pin has
`TauCeti.SmoothForm.hodgeStar` for real coefficients only); the Hodge–Riemann bilinear
relations, which lack the complex-linear integral of top forms: the pinned `integralTopForm` is
real and takes an orientation indexed by the exact degree, so the form `α ∧ ᾱ ∧ ω^(n−k)` of
degree `2k + 2(n − k)` would have to be cast to degree `2n` and replaced by its real part, an
ad hoc encoding; the Dolbeault theorem `H^q(M, Ω^p) ≃ H^(p,q)`, which lacks the sheaf of holomorphic `p`-forms and its derived-functor
cohomology; the statements on the Fubini–Study form of Layer 7, whose global construction from
the chart potentials `log(1 + Σ|z_j|²)` is a target of 7.2, and on the line bundles `O(k)`, which
lack the tautological bundle on `TauCeti.ComplexProjectiveSpace n`; the Hodge numbers of the
Hopf surface and of the Iwasawa manifold, whose carriers (the quotient of `ℂ² ∖ {0}` by the
contraction `z ↦ 2z` and the quotient of the complex Heisenberg group by its Gaussian-integer
lattice) need
the free and properly discontinuous action instances that the pinned quotient manifold
`TauCeti.instIsManifoldQuotient` takes, which are not at the pins and are targets of 7.3 and
8.2–8.3 (an instance with a `sorry` body is not allowed); and the Frölicher spectral sequence as
an object, which lacks the complex de Rham complex as a cochain complex with its type
filtration (the filtered-complex spectral sequence itself is the pinned
`CochainComplex.spectralSequence`).

The holomorphic-stalk statements take the manifold in `Type` because `smoothSheafCommRing`
requires its base and its coefficient ring in one universe. The real-analytic structure of a
complex manifold is not restated: it is the pinned `IsManifold.restrictScalars_of_ne_zero`.
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

/-- **Uniqueness in Weierstrass preparation** (Demailly, Chapter II, (2.3)–(2.4), the uniqueness
clause of the Weierstrass division theorem): two factorizations of the same germ have the same
unit and the same coefficient germs. -/
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

/-- **The ring of holomorphic germs is factorial** (Demailly, Chapter II, (2.10)): every nonzero
germ factors into irreducibles uniquely up to units. The stalk is a domain by the pinned
`TauCeti.holomorphicStructureSheaf.smoothStalkIsDomain`. -/
theorem uniqueFactorizationMonoid_holomorphicStalk (x : M) :
    UniqueFactorizationMonoid ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) := by
  sorry

/-- **Rückert's Nullstellensatz** (Demailly, Chapter II, (4.22)), for the ideal generated by
finitely many germs `f₁, …, f_k` at `0 ∈ ℂⁿ` (every ideal of the Noetherian stalk is of this
form): a germ `g` vanishing on the common zero set of the `f_i` near `0` has a power in the ideal,
`g^m = Σ a_i f_i` near `0` with analytic `a_i`. For `k = 0` the zero set is everything, `g`
vanishes near `0` and `m = 1` works; when the `f_i` generate the unit ideal the zero set is empty
and `m = 0` works. Instance: `f₁ = z²`, `g = z`, `m = 2`, `a₁ = 1`. -/
theorem rueckert_nullstellensatz {n k : ℕ} {f : Fin k → (Fin n → ℂ) → ℂ} {g : (Fin n → ℂ) → ℂ}
    (hf : ∀ i, AnalyticAt ℂ (f i) 0) (hg : AnalyticAt ℂ g 0)
    (hV : ∀ᶠ z in 𝓝 (0 : Fin n → ℂ), (∀ i, f i z = 0) → g z = 0) :
    ∃ (m : ℕ) (a : Fin k → (Fin n → ℂ) → ℂ), (∀ i, AnalyticAt ℂ (a i) 0) ∧
      (fun z ↦ g z ^ m) =ᶠ[𝓝 (0 : Fin n → ℂ)] fun z ↦ ∑ i, a i z * f i z := by
  sorry

/-- **Oka's coherence theorem** (Demailly, Chapter II, (3.19)), in its primitive relation form:
for holomorphic functions `f₁, …, f_k` on an open set `U ⊆ ℂⁿ` and a point `x ∈ U`, there are a
neighbourhood `V ⊆ U` of `x` and finitely many holomorphic relation vectors `g₁, …, g_N` on `V`
(`Σ_i g_j^i f_i = 0` on `V`) whose germs generate the module of relations among the germs of the
`f_i` at every point `y` of `V`: every tuple of analytic germs `h` at `y` with `Σ_i h_i f_i = 0`
near `y` is `Σ_j c_j g_j` near `y` for analytic germs `c_j`. For `k = 0` the empty tuple has no
relations and `N = 0` works. Instance: `f = (z₁, z₂)` on `ℂ²`, `N = 1`, `g₁ = (z₂, −z₁)`. -/
theorem oka_coherence {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {f : Fin k → (Fin n → ℂ) → ℂ} (hf : ∀ i, DifferentiableOn ℂ (f i) U)
    {x : Fin n → ℂ} (hx : x ∈ U) :
    ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
      ∃ (N : ℕ) (g : Fin N → Fin k → (Fin n → ℂ) → ℂ),
        (∀ j i, DifferentiableOn ℂ (g j i) V) ∧
        (∀ j, ∀ z ∈ V, ∑ i, g j i z * f i z = 0) ∧
        ∀ y ∈ V, ∀ h : Fin k → (Fin n → ℂ) → ℂ, (∀ i, AnalyticAt ℂ (h i) y) →
          (∀ᶠ z in 𝓝 y, ∑ i, h i z * f i z = 0) →
          ∃ c : Fin N → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (c j) y) ∧
            ∀ i, h i =ᶠ[𝓝 y] fun z ↦ ∑ j, c j z * g j i z := by
  sorry

end LocalAnalytic

/-! ## Layer 5: compact Hermitian elliptic theory and Serre duality (K5): the real Hodge theorem -/

section RealHodge

open Bundle

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [FiniteDimensional ℝ E] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

/-- **The Hodge theorem for real de Rham cohomology** (Wells, Chapter IV, §5; Layer 5.7): on a
compact oriented boundaryless Riemannian manifold of dimension `m = k + 1 + l`, every de Rham
class of degree `k + 1` has exactly one representative that is closed and coclosed for the pinned
codifferential `d* = (−1)^(m(k+2)+1) ⋆d⋆`, that is, exactly one harmonic representative. In
degree `0` the statement is trivial, closed functions being locally constant and `d*` being zero
on functions, so only positive degrees are stated. On the flat torus `T²` the harmonic
representatives in degree `1` are the constant-coefficient forms. -/
theorem hodge_theorem_deRham [BoundarylessManifold I M] [T2Space M] [CompactSpace M]
    {m k l : ℕ} (o : Manifold.Orientation I M (Fin m)) (hkl : k + 1 + l = m)
    (c : deRhamCohomology I M (k + 1)) :
    ∃! α : closedForms I M (k + 1),
      SmoothForm.codifferential o hkl α.1 = 0 ∧ deRhamCohomology.mk I (k + 1) α = c := by
  sorry

end RealHodge

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
VI, (7.2), the Hodge isomorphism theorem; K5b.1): on a compact complex manifold every Dolbeault
cohomology group is finite-dimensional, being the space of `∂̄`-harmonic forms of a Hermitian
metric. -/
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
`g(v, w) = κ(v, Jw)` is positive definite, which the `J`-invariance makes symmetric. On `ℂ` with
`κ = dx ∧ dy` and `J = i`, `κ(1, i) = 1 > 0`; on `ℂ²` the closed form
`dx₁ ∧ dy₁ + dx₂ ∧ dy₂ + ε dx₁ ∧ dx₂` with `0 < ε < 1` is positive on `(v, Jv)` but not
`J`-invariant, so the invariance clause is not implied by the other two. -/
def IsKahlerForm (κ : SmoothForm 𝓘(ℝ, E) M ℝ 2) : Prop :=
  mextDerivₗ 𝓘(ℝ, E) 2 κ = 0 ∧
    (∀ (x : M) (v w : TangentSpace 𝓘(ℝ, E) x),
      κ.1 x ![ofComplexManifold E M x v, ofComplexManifold E M x w] = κ.1 x ![v, w]) ∧
    ∀ (x : M) (v : TangentSpace 𝓘(ℝ, E) x), v ≠ 0 → 0 < κ.1 x ![v, ofComplexManifold E M x v]

/-- **The `∂∂̄`-lemma** (Demailly, Chapter VI, (8.6), p. 311; K6.1): on a compact Kähler
manifold, a `d`-exact form of pure type `(p+1, q+1)` is `∂∂̄v` for a smooth form `v` of type
`(p, q)`. It makes the Hodge decomposition (Demailly, Chapter VI, (8.5)) independent of the
metric. For `n = 1` and `(p, q) = (0, 0)` it says that an exact two-form on a compact Riemann
surface is `∂∂̄` of a function. The companion case of type `(p, 0)` or `(0, q)`, where the lemma
says that the form vanishes, is a README target of 6.2; on the non-Kähler Iwasawa manifold the
`d`-exact `(2,0)`-form `dz₁ ∧ dz₂ = −d(dz₃ − z₁ dz₂)` is nonzero. -/
theorem ddbar_lemma [T2Space M] [CompactSpace M] {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2}
    (hω : IsKahlerForm E M κ) {p q : ℕ} (u : SmoothForm 𝓘(ℝ, E) M ℂ (p + q + 2))
    (hu : u.IsOfType (ofComplexManifold E M) (p + 1) (q + 1))
    (hex : u ∈ deRhamCoboundaries E M (p + q + 2)) :
    ∃ v : SmoothForm 𝓘(ℝ, E) M ℂ (p + q),
      v.IsOfType (ofComplexManifold E M) p q ∧
        (ofComplexManifold E M).del ((ofComplexManifold E M).delBar v) = u := by
  sorry

/-- **The Hodge decomposition, in its dimension form** (Demailly, Chapter VI, (8.12), p. 313,
the numerical form of the canonical decomposition (8.5); K6.1): on a compact Kähler manifold,
the `k`-th complex Betti number is the sum of the Hodge numbers `h^(p,k−p)` over
`0 ≤ p ≤ k`. -/
theorem finrank_complexDeRhamCohomology_eq_sum_dolbeault [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (k : ℕ) :
    Module.finrank ℂ (ComplexDeRhamCohomology E M k) =
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

/-- **Hodge symmetry** (Demailly, Chapter VI, (8.12), p. 313, the numerical form of the
conjugation isomorphism of (8.5); K6.1): on a compact Kähler manifold, complex conjugation of
harmonic forms gives `h^(p,q) = h^(q,p)`. -/
theorem finrank_dolbeaultCohomology_symm [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E M p q) =
      Module.finrank ℂ (DolbeaultCohomology E M q p) := by
  sorry

/-- **Odd Betti numbers of a compact Kähler manifold are even** (Demailly, Chapter VI, (8.12),
p. 313; K6.1), from Hodge decomposition and Hodge symmetry. -/
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

/-! ## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7) -/

section Examples

/-- **The Hodge numbers of complex projective space** (Demailly, Chapter VI, (8.8), p. 312;
K7.2): on the pinned complex manifold `TauCeti.ComplexProjectiveSpace n`, the sphere-quotient
`ℂPⁿ` with its homogeneous-ratio atlas, `h^(p,q) = 1` when `p = q ≤ n` and `0` otherwise. For
`n = 0` the space is a point and only `h^(0,0) = 1` survives; for `n = 1`, `ℂP¹` has
`h^(0,0) = h^(1,1) = 1` and no holomorphic one-form. -/
theorem finrank_dolbeaultCohomology_complexProjectiveSpace (n p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology (Fin n → ℂ) (TauCeti.ComplexProjectiveSpace n) p q) =
      if p = q ∧ p ≤ n then 1 else 0 := by
  sorry

/-- **The Hodge numbers of a complex torus** (Demailly, Chapter VI, (4.5), p. 297, for the flat
Kähler metric whose harmonic forms are the translation-invariant ones; K7.3): for a full lattice
`L` of a complex vector space `E` of dimension `n`, the pinned complex torus
`AddAction.orbitRel.Quotient L E` has `h^(p,q) = binomial(n, p) · binomial(n, q)`. For an
elliptic curve all four Hodge numbers are `1`; for `p > n` both sides vanish. -/
theorem finrank_dolbeaultCohomology_complexTorus {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℂ E] [FiniteDimensional ℂ E] (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E (AddAction.orbitRel.Quotient L E) p q) =
      (Module.finrank ℂ E).choose p * (Module.finrank ℂ E).choose q := by
  sorry

end Examples

/-! ## Layer 8: the Frölicher spectral sequence and non-Kähler comparison (K8) -/

section Frolicher

variable (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  (M : Type*) [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- **The Frölicher inequality** (Demailly, Chapter VI, (11.2), p. 322; K8.1): on every compact
complex manifold the `k`-th complex Betti number is at most the sum of the Hodge numbers
`h^(p,k−p)`, `0 ≤ p ≤ k`, the dimension of the first page of the Hodge–Frölicher spectral
sequence in total degree `k`. On the Iwasawa manifold `b₁ = 4 < 5 = h^(1,0) + h^(0,1)`; on the
non-Kähler Hopf surface every degree is an equality. -/
theorem finrank_complexDeRhamCohomology_le_sum_dolbeault [T2Space M] [CompactSpace M] (k : ℕ) :
    Module.finrank ℂ (ComplexDeRhamCohomology E M k) ≤
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

/-- **The Euler characteristic from the Hodge numbers** (Demailly, Chapter VI, (11.7), p. 323;
K8.1): on every compact complex manifold of dimension `n`,
`Σ_(0≤k≤2n) (−1)^k b_k = Σ_(0≤p,q≤n) (−1)^(p+q) h^(p,q)`, because the alternating dimension of
each page of the Hodge–Frölicher spectral sequence is the same. On the Hopf surface both sides
are `0`, from `b = 1, 1, 0, 1, 1` and `h^(0,0) = h^(0,1) = h^(2,1) = h^(2,2) = 1`; on `ℂP¹` both
are `2`. -/
theorem sum_neg_one_pow_finrank_complexDeRhamCohomology [T2Space M] [CompactSpace M] :
    ∑ k ∈ Finset.range (2 * Module.finrank ℂ E + 1),
        (-1 : ℤ) ^ k * Module.finrank ℂ (ComplexDeRhamCohomology E M k) =
      ∑ p ∈ Finset.range (Module.finrank ℂ E + 1), ∑ q ∈ Finset.range (Module.finrank ℂ E + 1),
        (-1 : ℤ) ^ (p + q) * Module.finrank ℂ (DolbeaultCohomology E M p q) := by
  sorry

end Frolicher

end TauCetiRoadmap.ComplexKahlerGeometry
