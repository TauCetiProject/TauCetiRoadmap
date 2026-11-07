module

public import Mathlib
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Manifold.DeRham.Wedge
public import TauCeti.Geometry.Manifold.DifferentialForm.AlmostComplexType
public import TauCeti.Geometry.Manifold.DifferentialForm.Dolbeault.Basic
public import TauCeti.Geometry.Symplectic.Manifold.JHolomorphic
public import TauCeti.Geometry.Symplectic.Manifold.Nijenhuis
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm

/-!
# Complex manifolds, Dolbeault theory, and Kähler geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them: an open polydisc, Dolbeault cohomology as a quotient of
submodules cut out by the pinned `delBar` and type projections, the Kähler condition on the real
carrier and the Lefschetz map on the pinned real de Rham cohomology. The almost complex structure
of a complex manifold is the pinned `SmoothAlmostComplexStructure.ofComplexManifold`,
multiplication by `i` on every tangent space.

Stated here: the Newlander–Nirenberg theorem in its local form (K1); the Dolbeault–Grothendieck
lemma on an open polydisc and the joint parameter-dependent `∂̄` solver (K2); Weierstrass
preparation with its uniqueness, Weierstrass division, the regularity, dimension and
factoriality of the ring of holomorphic germs, Rückert's Nullstellensatz, Oka's coherence
theorem in its primitive local form, Cartan's coherence of the reduced ideal sheaf in its
local-generator form, the Riemann extension theorem across a nowhere-dense analytic subset
and Hartogs extension across a point (K3); temperate growth
of the complex-order Bessel symbol (K5a); finiteness of Dolbeault cohomology and the dual
Hodge-diamond symmetry on a compact complex manifold (K5b.1); and, on a compact Kähler
manifold, the `∂∂̄`-lemma, the Hodge decomposition in its dimension form, Hodge symmetry, the
evenness of the odd Betti numbers and the Hard Lefschetz theorem (K6.1).

Not statable at the pins, so nothing is stated in their place:
* the Dolbeault theorem `H^q(M, Ω^p) ≃ H^(p,q)` (K2): the pins have no sheaf of holomorphic
  `p`-forms;
* the analyticity and dimension drop of the singular locus, the regular-locus manifolds and
  Hartogs extension across an analytic subset of codimension at least two (K3): the pins have
  no analytic-subset carrier with a dimension theory;
* Chern connections, Koszul–Malgrange, the flat-connection and local-system equivalences (K4)
  and Dolbeault theory and Serre duality with coefficients in a holomorphic bundle (K5b): the
  native `VectorBundle` has no holomorphic-transition mixin at the pins;
* the exponential sequence, `Pic_hol(M) ≃ H¹(M,𝒪×)` and the Chern-class identification
  (K4.P): Tau Ceti's `holomorphicStructureSheaf` is a sheaf of commutative rings, and the pins
  have no sheaf of its units and hence no `H¹(M,𝒪×)`;
* the LF space of compactly supported smooth bundle sections, its dual space of bundle
  distributions, the localized Sobolev scale on a compact manifold and the complexification and
  conjugation of real bundle distributions (K5a): the pins have no inductive-limit topology on
  spaces of smooth sections; the density line of K5a: the pins have no density carrier
  (DifferentialGeometry DG0's `Density` is a roadmap target); the imaginary-order unitary
  `H^s → L²` comparison (K5a): its construction is itself a target;
* the Serre integration pairing `H^(p,q) × H^(n−p,n−q) → ℂ` (K5b.1) and the Hodge–Riemann
  bilinear relations (K6.1): the pinned `integralTopForm` integrates real-valued top forms only;
* the Kähler identities (K6.0): the pins have the Hodge star and codifferential of real forms
  only, and no adjoints `∂*`, `∂̄*` on complex-valued forms;
* the analytic-cycle classes (K6.1): integration over the regular locus of a compact
  analytic subvariety needs the analytic-subset dimension theory and the complex-valued
  integration that the pins lack;
* the projective, torus and Hopf computations (K7): Tau Ceti's complex atlas
  `Projectivization.instIsManifold` on K7.1's carrier cannot be imported together with Mathlib,
  since both libraries declare `Projectivization.instTopologicalSpace`; the complex tori, the
  Hopf surface and the elliptic flat lines are roadmap constructions;
* the Frölicher spectral sequence and the Iwasawa-manifold computation (K8): the spectral
  sequence of the type bicomplex and the Iwasawa quotient are constructions of K8.
-/

@[expose] public noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff Topology TauCeti.ComplexManifold
open TauCeti TauCeti.SmoothAlmostComplexStructure

/-! ## Layer K1: Complex structures and type calculus -/

/-- **The Newlander–Nirenberg theorem**, local form (Webster, Math. Z. 201 (1989), 303–316).
On a boundaryless real manifold of dimension `2n`, a smooth almost complex structure `J` with
vanishing Nijenhuis tensor has holomorphic coordinates around every point: a map to `ℂⁿ` that is
a local diffeomorphism at the point and whose differential intertwines `J` with multiplication by
`i` on a neighbourhood. Such coordinates have holomorphic transitions, so they form a complex
atlas inducing `J`; the converse is the pinned `nijenhuis_ofComplexManifold`. -/
theorem newlander_nirenberg
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
    {n : ℕ} (hdim : Module.finrank ℝ E = 2 * n)
    (J : SmoothAlmostComplexStructure I M) (hJ : J.nijenhuis = 0) (x : M) :
    ∃ φ : M → (Fin n → ℂ), IsLocalDiffeomorphAt I 𝓘(ℝ, Fin n → ℂ) ∞ φ x ∧
      ∃ U ∈ 𝓝 x, IsPseudoholomorphicOn J (ofComplexManifold (Fin n → ℂ) (Fin n → ℂ)) φ U := by
  sorry

/-! ## Layer K2: Dolbeault calculus and the local lemmas -/

/-- The open polydisc in `ℂⁿ` with centre `c` and polyradius `r`, as an open subset, hence an open
complex submanifold of `Fin n → ℂ`. It is empty when some `r k ≤ 0`. -/
def polydisc {n : ℕ} (c : Fin n → ℂ) (r : Fin n → ℝ) : TopologicalSpace.Opens (Fin n → ℂ) :=
  ⟨Set.univ.pi fun k ↦ Metric.ball (c k) (r k),
    isOpen_set_pi Set.finite_univ fun _ _ ↦ Metric.isOpen_ball⟩

/-- **The Dolbeault–Grothendieck lemma on a polydisc** (Demailly, Chapter I, (3.29), for the
local lemma; the whole-polydisc form is K2's exhaustion argument). A smooth `∂̄`-closed
complex-valued form of type `(p, q+1)` on a whole open polydisc is `∂̄` of a smooth form of type
`(p, q)` on the same polydisc. -/
theorem dolbeault_grothendieck_polydisc {n : ℕ} (c : Fin n → ℂ) (r : Fin n → ℝ) (p q : ℕ)
    (φ : SmoothForm 𝓘(ℝ, Fin n → ℂ) (polydisc c r) ℂ (p + q + 1))
    (hφ : φ.IsOfType (ofComplexManifold (Fin n → ℂ) (polydisc c r)) p (q + 1))
    (hclosed : (ofComplexManifold (Fin n → ℂ) (polydisc c r)).delBar φ = 0) :
    ∃ ψ : SmoothForm 𝓘(ℝ, Fin n → ℂ) (polydisc c r) ℂ (p + q),
      ψ.IsOfType (ofComplexManifold (Fin n → ℂ) (polydisc c r)) p q ∧
        (ofComplexManifold (Fin n → ℂ) (polydisc c r)).delBar ψ = φ := by
  sorry

/-- K2's joint parameter-dependent one-variable solver. For a finite-dimensional
smooth parameter manifold `P`, an open complex parameter domain `Q` in a
finite-dimensional complex space and an open plane domain `Ω`, every jointly smooth
`f` on `P × Q × Ω` that is holomorphic in the complex parameters has a jointly smooth
`u`, holomorphic in the complex parameters, with `∂̄_z u = f`, where
`∂̄_z = (∂_x + i ∂_y)/2` is written with the real Fréchet derivative in `z`. `Q` is
not assumed to be a polydisc, connected or bounded. -/
theorem exists_mixed_parameter_dbar_solution
    {EP HP P E : Type*}
    [NormedAddCommGroup EP] [NormedSpace ℝ EP] [FiniteDimensional ℝ EP]
    [TopologicalSpace HP] (I : ModelWithCorners ℝ EP HP) [I.Boundaryless]
    [TopologicalSpace P] [ChartedSpace HP P] [IsManifold I ∞ P]
    [T2Space P] [SecondCountableTopology P]
    [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (Q : Set E) (Ω : Set ℂ) (hQ : IsOpen Q) (hΩ : IsOpen Ω)
    (f : (P × E) × ℂ → ℂ)
    (hf : ContMDiffOn ((I.prod 𝓘(ℝ, E)).prod 𝓘(ℝ, ℂ)) 𝓘(ℝ, ℂ) ∞ f
      ((Set.univ ×ˢ Q) ×ˢ Ω))
    (hfhol : ∀ p z, z ∈ Ω → DifferentiableOn ℂ (fun q => f ((p, q), z)) Q) :
    ∃ u : (P × E) × ℂ → ℂ,
      ContMDiffOn ((I.prod 𝓘(ℝ, E)).prod 𝓘(ℝ, ℂ)) 𝓘(ℝ, ℂ) ∞ u
        ((Set.univ ×ˢ Q) ×ˢ Ω) ∧
      (∀ p z, z ∈ Ω → DifferentiableOn ℂ (fun q => u ((p, q), z)) Q) ∧
      (∀ p q, q ∈ Q → ∀ z, z ∈ Ω →
        (fderiv ℝ (fun w => u ((p, q), w)) z 1 +
          Complex.I * fderiv ℝ (fun w => u ((p, q), w)) z Complex.I) / 2 =
          f ((p, q), z)) := by
  sorry

/-! ## Layer K3: Analytic germs and subvarieties -/

section Germs

/-- **The Weierstrass preparation theorem** (Demailly, Chapter II, (2.1)). Let `f` be holomorphic
near `0` in `ℂⁿ × ℂ` and let `w ↦ f(0, w)` vanish to order exactly `d` at `0`. Then near `0`,
`f = u · (w^d + a_(d−1)(z) w^(d−1) + ⋯ + a₀(z))` with `u` holomorphic and nonvanishing at `0`
and holomorphic coefficients `a_i` vanishing at `0`. -/
theorem weierstrass_preparation {n d : ℕ} {f : (Fin n → ℂ) × ℂ → ℂ} (hf : AnalyticAt ℂ f 0)
    (hlow : ∀ i < d, iteratedDeriv i (fun w ↦ f (0, w)) 0 = 0)
    (hd : iteratedDeriv d (fun w ↦ f (0, w)) 0 ≠ 0) :
    ∃ (u : (Fin n → ℂ) × ℂ → ℂ) (a : Fin d → (Fin n → ℂ) → ℂ),
      AnalyticAt ℂ u 0 ∧ u 0 ≠ 0 ∧ (∀ i, AnalyticAt ℂ (a i) 0 ∧ a i 0 = 0) ∧
        ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
          f zw = u zw * (zw.2 ^ d + ∑ i : Fin d, a i zw.1 * zw.2 ^ (i : ℕ)) := by
  sorry

/-- **Uniqueness in Weierstrass preparation** (Demailly, Chapter II, (2.3)–(2.4): the
uniqueness of the Weierstrass division, applied to the division of one Weierstrass polynomial
by the other): two factorizations of the same germ as a unit times a Weierstrass polynomial of
degree `d` have the same unit germ and the same coefficient germs. -/
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

/-- **The Weierstrass division theorem** (Demailly, Chapter II, (2.3)). If `g` is holomorphic
near `0` in `ℂⁿ × ℂ` and `w ↦ g(0, w)` vanishes to order exactly `d` at `0`, then every germ `f`
holomorphic at `0` is `q · g + r` near `0`, with `q` holomorphic at `0` and `r` a polynomial in
`w` of degree less than `d` whose coefficients are holomorphic at `0`. -/
theorem weierstrass_division {n d : ℕ} {g f : (Fin n → ℂ) × ℂ → ℂ} (hg : AnalyticAt ℂ g 0)
    (hlow : ∀ i < d, iteratedDeriv i (fun w ↦ g (0, w)) 0 = 0)
    (hd : iteratedDeriv d (fun w ↦ g (0, w)) 0 ≠ 0) (hf : AnalyticAt ℂ f 0) :
    ∃ (q : (Fin n → ℂ) × ℂ → ℂ) (r : Fin d → (Fin n → ℂ) → ℂ),
      AnalyticAt ℂ q 0 ∧ (∀ i, AnalyticAt ℂ (r i) 0) ∧
        ∀ᶠ zw in 𝓝 (0 : (Fin n → ℂ) × ℂ),
          f zw = q zw * g zw + ∑ i : Fin d, r i zw.1 * zw.2 ^ (i : ℕ) := by
  sorry

/-- **Rückert's Nullstellensatz** (Demailly, Chapter II, (4.22), there called Hilbert's
Nullstellensatz for the ring of germs). If `g` and `f₁, …, f_k` are
holomorphic at `x ∈ ℂⁿ` and `g` vanishes near `x` on the common zero set of the `f_i`, then a
power of `g` lies in the ideal generated by the `f_i` in the ring of holomorphic germs at `x`. -/
theorem ruckert_nullstellensatz {n k : ℕ} {f : Fin k → (Fin n → ℂ) → ℂ}
    {g : (Fin n → ℂ) → ℂ} {x : Fin n → ℂ} (hf : ∀ i, AnalyticAt ℂ (f i) x)
    (hg : AnalyticAt ℂ g x) (hvan : ∀ᶠ y in 𝓝 x, (∀ i, f i y = 0) → g y = 0) :
    ∃ (m : ℕ) (h : Fin k → (Fin n → ℂ) → ℂ), (∀ i, AnalyticAt ℂ (h i) x) ∧
      (fun y ↦ g y ^ m) =ᶠ[𝓝 x] fun y ↦ ∑ i, h i y * f i y := by
  sorry

/-- **Oka's coherence theorem**, primitive local form (Demailly, Chapter II, (3.19)). For
holomorphic functions `f₁, …, f_k` on an open `U ⊆ ℂⁿ` and `x ∈ U`, there are a neighbourhood
`V` of `x` and finitely many holomorphic relation vectors `r_j` on `V`, `∑_i r_(j,i) f_i = 0`,
whose germs generate the module of germs of relations `∑_i a_i f_i = 0` at every point of `V`. -/
theorem oka_coherence {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {f : Fin k → (Fin n → ℂ) → ℂ} (hf : ∀ i, AnalyticOnNhd ℂ (f i) U) {x : Fin n → ℂ}
    (hx : x ∈ U) :
    ∃ V ∈ 𝓝 x, ∃ (m : ℕ) (r : Fin m → Fin k → (Fin n → ℂ) → ℂ),
      (∀ j i, AnalyticOnNhd ℂ (r j i) V) ∧ (∀ j, ∀ y ∈ V, ∑ i, r j i y * f i y = 0) ∧
      ∀ y ∈ V, ∀ a : Fin k → (Fin n → ℂ) → ℂ, (∀ i, AnalyticAt ℂ (a i) y) →
        (fun z ↦ ∑ i, a i z * f i z) =ᶠ[𝓝 y] 0 →
        ∃ b : Fin m → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (b j) y) ∧
          ∀ i, a i =ᶠ[𝓝 y] fun z ↦ ∑ j, b j z * r j i z := by
  sorry

/-- **Cartan's coherence theorem for the reduced ideal sheaf**, in its local-generator form
(Demailly, Chapter II, (4.29)). Let `A` be the common zero set of holomorphic functions
`f₁, …, f_k` on an open `U ⊆ ℂⁿ` and `x ∈ U`. There are a neighbourhood `V` of `x` and finitely
many holomorphic functions `g_j` on `V` vanishing on `A` whose germs generate, at every point
`y` of `V`, the ideal of germs at `y` vanishing on `A`. -/
theorem cartan_coherence_reducedIdeal {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {f : Fin k → (Fin n → ℂ) → ℂ} (hf : ∀ i, AnalyticOnNhd ℂ (f i) U) {x : Fin n → ℂ}
    (hx : x ∈ U) :
    ∃ V ∈ 𝓝 x, ∃ (m : ℕ) (g : Fin m → (Fin n → ℂ) → ℂ),
      (∀ j, AnalyticOnNhd ℂ (g j) V) ∧ (∀ j, ∀ y ∈ V, (∀ i, f i y = 0) → g j y = 0) ∧
      ∀ y ∈ V, ∀ h : (Fin n → ℂ) → ℂ, AnalyticAt ℂ h y →
        (∀ᶠ z in 𝓝 y, (∀ i, f i z = 0) → h z = 0) →
        ∃ b : Fin m → (Fin n → ℂ) → ℂ, (∀ j, AnalyticAt ℂ (b j) y) ∧
          h =ᶠ[𝓝 y] fun z ↦ ∑ j, b j z * g j z := by
  sorry

/-- **The Riemann extension theorem** (Demailly, Chapter II, (4.2)). Let `A` be the common
zero set of holomorphic functions `g₁, …, g_k` on an open `U ⊆ ℂⁿ`, with empty interior. A
function holomorphic on `U ∖ A` and locally bounded near every point of `U` extends to a
holomorphic function on `U`. On `ℂ` with `A = {0}`, `1/z` shows that boundedness is needed. -/
theorem riemann_extension {n k : ℕ} {U : Set (Fin n → ℂ)} (hU : IsOpen U)
    {g : Fin k → (Fin n → ℂ) → ℂ} (hg : ∀ i, AnalyticOnNhd ℂ (g i) U)
    (hA : interior {z ∈ U | ∀ i, g i z = 0} = ∅) {f : (Fin n → ℂ) → ℂ}
    (hf : DifferentiableOn ℂ f (U \ {z | ∀ i, g i z = 0}))
    (hbdd : ∀ x ∈ U, ∃ V ∈ 𝓝 x, ∃ C : ℝ, ∀ z ∈ V \ {z | ∀ i, g i z = 0}, ‖f z‖ ≤ C) :
    ∃ F : (Fin n → ℂ) → ℂ, DifferentiableOn ℂ F U ∧
      Set.EqOn F f (U \ {z | ∀ i, g i z = 0}) := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- **The ring of holomorphic germs is a regular local ring of dimension `n`** (Demailly,
Chapter II, (2.7) for the Noetherian property; K3.HolomorphicStalk). The stalk at `x` of
Mathlib's sheaf of complex-smooth, that is holomorphic, functions on a complex manifold of
dimension `n = dim_ℂ E` (the stalk of Tau Ceti's `holomorphicStructureSheaf`, through the
pinned `smoothStalkIso`) is a Noetherian local ring whose maximal ideal is generated by `n`
elements, the coordinate germs, and its Krull dimension is `n`. -/
theorem isRegularLocalRing_holomorphicStalk (x : M) :
    IsRegularLocalRing ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) ∧
      ringKrullDim ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) =
        Module.finrank ℂ E := by
  sorry

/-- **The ring of holomorphic germs is factorial** (Demailly, Chapter II, (2.10)): it is a domain
in which every nonzero germ factors into irreducible germs, uniquely up to units and order. -/
theorem uniqueFactorizationMonoid_holomorphicStalk (x : M) :
    ∃ _ : IsDomain ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x),
      UniqueFactorizationMonoid ((smoothSheafCommRing 𝓘(ℂ, E) 𝓘(ℂ) M ℂ).presheaf.stalk x) := by
  sorry

/-- K3's Hartogs extension across a point: on a complex manifold of complex
dimension at least two, a function holomorphic off a point extends to a
holomorphic function on the whole manifold. This is the analytic input of
K7.2.TautologicalIncidence; in dimension one `1/z` has no extension, which the
dimension hypothesis excludes. -/
theorem hartogs_extension_across_point
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (hE : 2 ≤ Module.finrank ℂ E)
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]
    (p : M) (f : M → ℂ) (hf : MDifferentiableOn 𝓘(ℂ, E) 𝓘(ℂ, ℂ) f {p}ᶜ) :
    ∃ g : M → ℂ, MDifferentiable 𝓘(ℂ, E) 𝓘(ℂ, ℂ) g ∧ Set.EqOn g f {p}ᶜ := by
  sorry

end Germs

/-! ## Layer K5a: Real and complex-coefficient analysis on real manifolds -/

section ComplexOrderSymbol

variable (n : ℕ)

/-- The complex-order Bessel symbol `(1 + ‖ζ‖²)^(z/2)` in Mathlib's Fourier variable
`ζ` (2π phase), written through the real logarithm so that `z` is a complex order. -/
def complexBesselSymbol (z : ℂ) (ζ : EuclideanSpace ℝ (Fin n)) : ℂ :=
  Complex.exp ((z / 2) * (Real.log (1 + ‖ζ‖ ^ (2 : ℕ)) : ℂ))

/-- The complex-order Bessel symbol has temperate growth for every complex order,
so it defines Fourier multipliers on Schwartz functions and tempered distributions. -/
theorem complexBesselSymbol_temperate (z : ℂ) :
    (complexBesselSymbol n z).HasTemperateGrowth := by sorry

end ComplexOrderSymbol

/-! ## Layer K5b: Compact Dolbeault Hodge theory -/

section Dolbeault

variable (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  (M : Type*) [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- The `∂̄`-closed smooth complex-valued forms of type `(p, q)` on a complex manifold, for its
almost complex structure `ofComplexManifold E M`: the kernel of `delBar` intersected with the
range of the type projection onto type `(p, q)` in degree `p + q`. -/
def dolbeaultCocycles (p q : ℕ) : Submodule ℂ (SmoothForm 𝓘(ℝ, E) M ℂ (p + q)) :=
  LinearMap.ker ((ofComplexManifold E M).delBar (F := ℂ) (k := p + q)) ⊓
    LinearMap.range ((ofComplexManifold E M).typeProjection (F := ℂ) (k := p + q) p q)

/-- The `∂̄`-exact forms of type `(p, q)`: `0` when `q = 0`, and otherwise the image under
`delBar` of the forms of type `(p, q − 1)`. -/
def dolbeaultCoboundaries : (p q : ℕ) → Submodule ℂ (SmoothForm 𝓘(ℝ, E) M ℂ (p + q))
  | _, 0 => ⊥
  | p, q + 1 =>
    (LinearMap.range ((ofComplexManifold E M).typeProjection (F := ℂ) (k := p + q) p q)).map
      ((ofComplexManifold E M).delBar (F := ℂ) (k := p + q))

/-- Dolbeault cohomology `H^(p,q)_∂̄(M)` of a complex manifold: `∂̄`-closed forms of type `(p, q)`
modulo `∂̄`-exact ones, realized as the image of the closed forms in the quotient of all
`(p+q)`-forms by the exact ones; a complex vector space. -/
abbrev DolbeaultCohomology (p q : ℕ) : Type _ :=
  ↥((dolbeaultCocycles E M p q).map (dolbeaultCoboundaries E M p q).mkQ)

/-- **Finiteness of the Hodge numbers** (Demailly, Chapter VI, (7.2)). On a compact complex manifold every Dolbeault cohomology group is finite-dimensional:
for any Hermitian metric it is isomorphic to the kernel of an elliptic Laplacian. -/
theorem finiteDimensional_dolbeaultCohomology [T2Space M] [CompactSpace M] (p q : ℕ) :
    FiniteDimensional ℂ (DolbeaultCohomology E M p q) := by
  sorry

/-- **The dual Hodge-diamond symmetry** from Serre duality (Demailly, Chapter VI, (7.3) and
(8.12)). On a compact complex manifold of complex dimension `n`, for `p, q ≤ n`,
`h^(p,q) = h^(n−p,n−q)`. No Kähler hypothesis is needed. -/
theorem finrank_dolbeaultCohomology_serre [T2Space M] [CompactSpace M] {p q : ℕ}
    (hp : p ≤ Module.finrank ℂ E) (hq : q ≤ Module.finrank ℂ E) :
    Module.finrank ℂ (DolbeaultCohomology E M p q) =
      Module.finrank ℂ
        (DolbeaultCohomology E M (Module.finrank ℂ E - p) (Module.finrank ℂ E - q)) := by
  sorry

end Dolbeault

/-! ## Layer K6.0: Local Kähler and curvature identities -/

section KahlerCondition

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The Kähler condition on the real carrier: a closed real two-form compatible with a smooth
almost complex structure (invariant and positive on complex lines) whose Nijenhuis tensor
vanishes. Through Newlander–Nirenberg it is a Kähler metric on the induced complex manifold. -/
def IsKahler (form : SmoothTwoForm I M) (J : SmoothAlmostComplexStructure I M) : Prop :=
  form.IsClosed ∧ form.Compatible J ∧ J.nijenhuis = 0

end KahlerCondition

/-! ## Layer K6.1: Compact Kähler Hodge theory -/

section CompactKahlerComplex

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace E M]
  [IsManifold 𝓘(ℂ, E) ∞ M]

/-- **The `∂∂̄`-lemma** (Demailly, Chapter VI, (8.6)). On a compact Kähler manifold, a complex-valued form of type `(p+1, q+1)` that is
`d`-exact is `∂∂̄` of a form of type `(p, q)`. -/
theorem del_delBar_lemma {κ : SmoothTwoForm 𝓘(ℝ, E) M} (hκ : IsKahler κ (ofComplexManifold E M))
    {p q : ℕ} (α : SmoothForm 𝓘(ℝ, E) M ℂ (p + q + 2))
    (hα : α.IsOfType (ofComplexManifold E M) (p + 1) (q + 1))
    (hexact : ∃ β : SmoothForm 𝓘(ℝ, E) M ℂ (p + q + 1),
      mextDerivₗ 𝓘(ℝ, E) (F := ℂ) (p + q + 1) β = α) :
    ∃ γ : SmoothForm 𝓘(ℝ, E) M ℂ (p + q), γ.IsOfType (ofComplexManifold E M) p q ∧
      (ofComplexManifold E M).del ((ofComplexManifold E M).delBar γ) = α := by
  sorry

/-- **The Hodge decomposition, in its dimension form** (Demailly, Chapter VI, (8.5) and
(8.12)). On a compact Kähler manifold the `k`-th real Betti number is the sum of the
Hodge numbers `h^(p,k−p)`, `0 ≤ p ≤ k`. -/
theorem finrank_deRhamCohomology_eq_sum_dolbeault {κ : SmoothTwoForm 𝓘(ℝ, E) M}
    (hκ : IsKahler κ (ofComplexManifold E M)) (k : ℕ) :
    Module.finrank ℝ (deRhamCohomology 𝓘(ℝ, E) M k) =
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

/-- **Hodge symmetry** (Demailly, Chapter VI, (8.5) and (8.12)): on a compact
Kähler manifold `h^(p,q) = h^(q,p)`. The Hopf surface, with `h^(0,1) = 1` and `h^(1,0) = 0`,
shows that the Kähler hypothesis is needed. -/
theorem finrank_dolbeaultCohomology_symm {κ : SmoothTwoForm 𝓘(ℝ, E) M}
    (hκ : IsKahler κ (ofComplexManifold E M)) (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E M p q) =
      Module.finrank ℂ (DolbeaultCohomology E M q p) := by
  sorry

end CompactKahlerComplex

section CompactKahlerReal

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- **The odd Betti numbers of a compact Kähler manifold are even** (Demailly, Chapter VI,
(8.12)), from the Hodge decomposition and Hodge symmetry. The closed annulus, a compact Kähler
manifold with boundary and `b₁ = 1`, shows that the boundaryless hypothesis is needed. -/
theorem even_finrank_deRhamCohomology_odd (form : SmoothTwoForm I M)
    (J : SmoothAlmostComplexStructure I M) (hK : IsKahler form J) (k : ℕ) :
    Even (Module.finrank ℝ (deRhamCohomology I M (2 * k + 1))) := by
  sorry

/-- The `j`-th power of the Lefschetz map `a ↦ a ∧ c` of a degree-two de Rham class `c`, from
`H^k_dR(M)` to `H^(k+2j)_dR(M)`. -/
def lefschetzMap (c : deRhamCohomology I M 2) (k : ℕ) :
    (j : ℕ) → deRhamCohomology I M k →ₗ[ℝ] deRhamCohomology I M (k + 2 * j)
  | 0 => LinearMap.id
  | j + 1 => (deRhamCohomology.wedge I M (k + 2 * j) 2).flip c ∘ₗ lefschetzMap c k j

/-- **The Hard Lefschetz theorem** (Demailly, Chapter VI, (8.17), stated there with complex
coefficients). On a compact Kähler manifold of real dimension `2n` with Kähler form `ω`, for `k ≤ n`
the map `a ↦ a ∧ [ω]^(n−k)` from `H^k_dR(M)` to `H^(2n−k)_dR(M)` is an isomorphism. -/
theorem hard_lefschetz {n : ℕ} (hdim : Module.finrank ℝ E = 2 * n) (form : SmoothTwoForm I M)
    (J : SmoothAlmostComplexStructure I M) (hK : IsKahler form J) {k : ℕ} (hk : k ≤ n) :
    Function.Bijective (lefschetzMap (deRhamCohomology.mk I 2 ⟨form, (mem_closedForms I form).mpr ((SmoothForm.isClosed_def form).mp hK.1)⟩) k (n - k)) := by
  sorry

end CompactKahlerReal

end TauCetiRoadmap.ComplexKahlerGeometry
