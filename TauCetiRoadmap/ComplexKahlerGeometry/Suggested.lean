module

public import Mathlib
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Manifold.Complex.Orientation
public import TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain
public import TauCeti.Geometry.Manifold.DeRham.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.Closed
public import TauCeti.Geometry.Manifold.DifferentialForm.AlmostComplexType
public import TauCeti.Geometry.Manifold.DifferentialForm.Dolbeault.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.MapCoeff
public import TauCeti.Geometry.Manifold.DifferentialForm.Regularity
public import TauCeti.Geometry.Manifold.DifferentialForm.Smooth
public import TauCeti.Geometry.Manifold.DifferentialForm.Wedge.Smooth.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Codifferential
public import TauCeti.Geometry.Symplectic.Manifold.JHolomorphic
public import TauCeti.Geometry.Symplectic.Manifold.Nijenhuis
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm

/-!
# Complex manifolds, Dolbeault theory and Kähler geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them (a polydisc as an open submanifold, an analytic subset of an
open set of `ℂⁿ` and its singular locus, Dolbeault and complex de Rham cohomology as quotients of
pinned submodules, the Kähler condition on a real two-form and the iterated Lefschetz wedge).
Every carrier is pinned: `TauCeti.SmoothForm`, `mextDerivₗ`, `TauCeti.SmoothForm.IsClosed`,
`TauCeti.SmoothTwoForm.Compatible`, `SmoothAlmostComplexStructure.ofComplexManifold`, `delBar`,
`typeProjection`, `nijenhuis`, `wedgeWith`, `smoothSheafCommRing`, `IsManifold.maximalAtlas`,
`TauCeti.closedForms`, `TauCeti.deRhamCohomology` and `TauCeti.SmoothForm.codifferential`.

Stated here: the Newlander–Nirenberg theorem in its local form (Layer 1); the
Dolbeault–Grothendieck lemma on a polydisc (Layer 2); the Hartogs extension theorem on an open
set of `ℂⁿ`, the Weierstrass preparation theorem with its uniqueness, the regularity, Noetherian
property and factoriality of the ring of holomorphic germs, Rückert's Nullstellensatz, Oka's
coherence theorem in its primitive relation form, Cartan's coherence theorem for the ideal of an
analytic subset in its primitive local form, and the analyticity of the singular locus (Layer
3); the Hodge theorem for real de Rham cohomology of a compact oriented Riemannian manifold
(Layer 5); finiteness of Dolbeault cohomology and Serre duality with trivial coefficients on a
compact complex manifold (Layer 5); on a compact Kähler manifold, the Hodge decomposition in its
dimension form, Hodge symmetry, the evenness of odd Betti numbers and the Hard Lefschetz theorem
(Layer 6); and the identity `b₁ = 2h^(1,0)` on a compact Riemann surface (Layer 7).

Not statable at the pins, and therefore not stated: Serre duality and the Hodge theorem with
coefficients in a holomorphic vector bundle, Koszul–Malgrange and the Chern connection, which
lack the holomorphic-bundle mixin of ComplexManifolds Milestone 7; the flat-bundle/local-system
equivalences of Layer 4, which lack that mixin and a category of finite-rank bundles with flat
connections; the Kähler identities and the Hodge–Riemann bilinear relations, which lack the
complex-linear Hodge star on `(p,q)`-forms (the pin has `TauCeti.SmoothForm.hodgeStar` for real
coefficients only) and the complex-linear integral of top forms; the Dolbeault theorem
`H^q(M, Ω^p) ≃ H^(p,q)`, which lacks the sheaf of holomorphic `p`-forms and its derived-functor
cohomology; the projective computations of Layer 7, because the pinned complex-manifold
structure on `Projectivization ℂ (Fin (n+1) → ℂ)` (`Projectivization.instIsManifold`) lives in
`TauCeti.Geometry.Manifold.Instances.Projectivization`, whose import
`TauCeti.Topology.Algebra.Projectivization` declares a second
`Projectivization.instTopologicalSpace` next to Mathlib's and cannot be imported beside
`import Mathlib` (7.1 owns the move of that structure onto Mathlib's instance); the torus, Hopf
and Iwasawa computations of Layers 7–8, whose carriers (complex tori and holomorphic quotients)
are targets of ComplexTori, ComplexManifolds and Layer 7; and the Frölicher spectral sequence:
the pin has the spectral sequence of a first-quadrant homological bicomplex,
`HomologicalComplex₂.columnFiltrationSpectralSequence` with its first-page and abutment
isomorphisms, but not the Dolbeault double complex of type forms as a `HomologicalComplex₂`,
which 8.1 constructs.

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
polydisc form is 2.3's parameter-dependent exhaustion argument). A smooth `∂̄`-closed form of
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
Chapter II, (2.7) for the Noetherian property; 3.2 and 3.4). The stalk at `x` of
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

/-- A subset `A` of an open set `U ⊆ ℂⁿ` is an **analytic subset** of `U` (Demailly, Chapter II,
(4.1)) when `A ⊆ U` and every point of `U` has an open neighbourhood `V ⊆ U` on which `A` is the
common zero set of finitely many holomorphic functions. Quantifying over all points of `U`, not
only those of `A`, makes `A` closed in `U`; the condition forces `U` to be open. The empty set
(one equation `1`) and `U` itself (no equation) are analytic in `U`; the closed unit disc is not
analytic in `ℂ`, and `{1/k : k ≥ 1}` is analytic in `ℂ ∖ {0}` but its closure is not analytic in
`ℂ`. -/
def IsAnalyticSubset {n : ℕ} (U A : Set (Fin n → ℂ)) : Prop :=
  A ⊆ U ∧ ∀ x ∈ U, ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
    ∃ (k : ℕ) (g : Fin k → (Fin n → ℂ) → ℂ), (∀ i, DifferentiableOn ℂ (g i) V) ∧
      A ∩ V = {z ∈ V | ∀ i, g i z = 0}

/-- **Cartan's coherence theorem** (Demailly, Chapter II, (4.29)), in its primitive local form:
the ideal of germs vanishing on an analytic subset `A` of an open set `U ⊆ ℂⁿ` is locally
finitely generated by sections. For every `x ∈ U` there are a neighbourhood `V ⊆ U` of `x` and
finitely many holomorphic functions `g₁, …, g_N` on `V` vanishing on `A ∩ V` such that, at every
point `y` of `V`, every analytic germ `h` at `y` vanishing on `A` near `y` is `Σ_j c_j g_j` near
`y` for analytic germs `c_j`. With Oka's theorem this is the coherence of the ideal sheaf of `A`;
by Rückert's Nullstellensatz the ideal at `y` is the radical of the ideal of any local
equations. For `A = U`, `N = 0` works; for `A = ∅`, `N = 1` and `g₁ = 1`. Instance: `A = {0} ⊂ ℂ`,
the zero set of `z²`, with `N = 1` and `g₁ = z`, not `z²`. -/
theorem cartan_coherence {n : ℕ} {U A : Set (Fin n → ℂ)} (hA : IsAnalyticSubset U A)
    {x : Fin n → ℂ} (hx : x ∈ U) :
    ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧ V ⊆ U ∧
      ∃ (N : ℕ) (g : Fin N → (Fin n → ℂ) → ℂ),
        (∀ j, DifferentiableOn ℂ (g j) V) ∧ (∀ j, ∀ z ∈ A ∩ V, g j z = 0) ∧
        ∀ y ∈ V, ∀ h : (Fin n → ℂ) → ℂ, AnalyticAt ℂ h y →
          (∀ᶠ z in 𝓝 y, z ∈ A → h z = 0) →
          ∃ c : Fin N → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (c j) y) ∧
            h =ᶠ[𝓝 y] fun z ↦ ∑ j, c j z * g j z := by
  sorry

/-- The **singular locus** of a subset `A ⊆ ℂⁿ` (Demailly, Chapter II, (4.23)): the points
`x ∈ A` that are not regular, a point being regular when near it `A` is a complex submanifold,
that is, when there are an open `V ∋ x` and a map `u : ℂⁿ → ℂᵐ` holomorphic on `V` with
surjective complex derivative at `x` and `A ∩ V = {z ∈ V | u z = 0}`. Interior points of `A` are
regular (`m = 0`). The cusp `{z² = w³}` and the cross `{z₁ z₂ = 0}` have singular locus `{0}`;
`{0} ⊂ ℂ`, the zero set of `z²`, has empty singular locus, the locus depending on the set and not
on a choice of equations. -/
def singularLocus {n : ℕ} (A : Set (Fin n → ℂ)) : Set (Fin n → ℂ) :=
  {x ∈ A | ¬ ∃ V : Set (Fin n → ℂ), IsOpen V ∧ x ∈ V ∧
    ∃ (m : ℕ) (u : (Fin n → ℂ) → Fin m → ℂ), DifferentiableOn ℂ u V ∧
      Function.Surjective (fderiv ℂ u x) ∧ A ∩ V = {z ∈ V | u z = 0}}

/-- **The singular locus of an analytic subset is analytic** (Demailly, Chapter II, (4.31)), in
its local form on an open set `U ⊆ ℂⁿ`: if `A` is an analytic subset of `U`, so is
`singularLocus A`. The route uses Cartan's theorem for local generators of the ideal of each
irreducible local component, the Jacobian minors of those generators and the intersections of
distinct components. -/
theorem isAnalyticSubset_singularLocus {n : ℕ} {U A : Set (Fin n → ℂ)}
    (hA : IsAnalyticSubset U A) : IsAnalyticSubset U (singularLocus A) := by
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

/-- **The Hodge theorem for real de Rham cohomology** (Wells, Chapter IV, §5; 5.7): on a
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
VI, (7.2), the Hodge isomorphism theorem; 5.10): on a compact complex manifold every Dolbeault
cohomology group is finite-dimensional, being the space of `∂̄`-harmonic forms of a Hermitian
metric. -/
theorem finiteDimensional_dolbeaultCohomology [T2Space M] [CompactSpace M] (p q : ℕ) :
    FiniteDimensional ℂ (DolbeaultCohomology E M p q) := by
  sorry

/-- **Serre duality with trivial coefficients** (Demailly, Chapter VI, (7.3); Wells, Chapter IV,
§5; 5.10): on a compact complex manifold of dimension `n`, the pairing of `H^(p,q)` with
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
quotient of all `k`-forms by the exact ones; a complex vector space (5.6). -/
abbrev ComplexDeRhamCohomology (k : ℕ) :=
  ↥((deRhamCocycles E M k).map (deRhamCoboundaries E M k).mkQ)

/-- A real smooth two-form `κ` on a complex manifold is a **Kähler form** when it is closed (the
pinned `SmoothForm.IsClosed`, `mextDeriv κ = 0`) and compatible with the complex structure
`J = ofComplexManifold E M` in the pinned sense `SmoothTwoForm.Compatible`: invariant under `J` in
both arguments and positive on `(v, Jv)` for `v ≠ 0`, so that `g(v, w) = κ(v, Jw)` is a
Riemannian metric. On `ℂ` with `κ = dx ∧ dy` and `J = i`, `κ(1, i) = 1 > 0`, while `−dx ∧ dy` is
closed and invariant with `κ(1, i) = −1`; on `ℂ²` the closed form
`dx₁ ∧ dy₁ + dx₂ ∧ dy₂ + ε dx₁ ∧ dx₂` with `0 < ε < 1` is positive on `(v, Jv)` but not
`J`-invariant, so the invariance clause is not implied by the other two. -/
def IsKahlerForm (κ : SmoothForm 𝓘(ℝ, E) M ℝ 2) : Prop :=
  κ.IsClosed ∧ SmoothTwoForm.Compatible κ (ofComplexManifold E M)

/-- **The Hodge decomposition, in its dimension form** (Demailly, Chapter VI, (8.5); 6.2): on a
compact Kähler manifold, the `k`-th complex Betti number is the sum of the Hodge numbers
`h^(p,k−p)` over `0 ≤ p ≤ k`. -/
theorem finrank_complexDeRhamCohomology_eq_sum_dolbeault [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (k : ℕ) :
    Module.finrank ℂ (ComplexDeRhamCohomology E M k) =
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

/-- **Hodge symmetry** (Demailly, Chapter VI, (8.5); 6.2): on a compact Kähler manifold,
complex conjugation of harmonic forms gives `h^(p,q) = h^(q,p)`. -/
theorem finrank_dolbeaultCohomology_symm [T2Space M] [CompactSpace M]
    {κ : SmoothForm 𝓘(ℝ, E) M ℝ 2} (hω : IsKahlerForm E M κ) (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E M p q) =
      Module.finrank ℂ (DolbeaultCohomology E M q p) := by
  sorry

/-- **Odd Betti numbers of a compact Kähler manifold are even** (Demailly, Chapter VI, (8.12);
6.2), from Hodge decomposition and Hodge symmetry: `b_(2k+1) = 2 Σ_(p ≤ k) h^(p,2k+1−p)`. -/
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

/-- **The Hard Lefschetz theorem** (Demailly, Chapter VI, (8.17); 6.2): on a compact Kähler
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

/-- **The genus dictionary of a compact Riemann surface** (Demailly, Chapter VI, §10.1,
(10.1)–(10.2); 7.3): on a compact Riemann surface `X` the first complex Betti number is twice the
geometric genus `h^(1,0)`. Every Hermitian metric on a curve is Kähler (6.1), so Hodge
decomposition and Hodge symmetry (6.2) give `b₁ = h^(1,0) + h^(0,1) = 2h^(1,0)`. Connectedness is
not needed: two disjoint elliptic curves give `4 = 2 · 2`, an elliptic curve `2 = 2 · 1` and
`ℂP¹` gives `0 = 2 · 0`. -/
theorem finrank_complexDeRhamCohomology_one_riemannSurface
    {X : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ, ℂ) ∞ X]
    [T2Space X] [CompactSpace X] :
    Module.finrank ℂ (ComplexDeRhamCohomology ℂ X 1) =
      2 * Module.finrank ℂ (DolbeaultCohomology ℂ X 1 0) := by
  sorry

end TauCetiRoadmap.ComplexKahlerGeometry
