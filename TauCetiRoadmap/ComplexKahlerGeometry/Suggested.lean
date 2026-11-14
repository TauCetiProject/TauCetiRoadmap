module

public import Mathlib
public import TauCeti.Algebra.Module.ZLattice.Quotient
public import TauCeti.AlgebraicTopology.Cohomology.IntegralCup
public import TauCeti.Geometry.Manifold.Algebra.Quotient
public import TauCeti.Geometry.Manifold.Complex.AlmostComplexStructure
public import TauCeti.Geometry.Manifold.DeRham.Wedge
public import TauCeti.Geometry.Manifold.DifferentialForm.AlmostComplexType
public import TauCeti.Geometry.Manifold.DifferentialForm.Dolbeault.Basic
public import TauCeti.Geometry.Manifold.Instances.ComplexProjectiveSpace
public import TauCeti.Geometry.Manifold.Riemannian.Codifferential
public import TauCeti.Geometry.Symplectic.Manifold.JHolomorphic
public import TauCeti.Geometry.Symplectic.Manifold.Nijenhuis
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm

/-!
# Complex manifolds, Dolbeault theory, and Kähler geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them: an open polydisc, Dolbeault cohomology as a quotient of
submodules cut out by the pinned `delBar` and type projections, the Kähler condition on the real
carrier, the Lefschetz map on the pinned real de Rham cohomology and the cup powers of a
degree-two integral class. The almost complex structure
of a complex manifold is the pinned `SmoothAlmostComplexStructure.ofComplexManifold`,
multiplication by `i` on every tangent space.

Stated here: the Newlander–Nirenberg theorem in its local form (K1); the Dolbeault–Grothendieck
lemma on an open polydisc and the joint parameter-dependent `∂̄` solver (K2); Weierstrass
preparation with its uniqueness, Weierstrass division, the regularity, dimension and
factoriality of the ring of holomorphic germs, Rückert's Nullstellensatz, Oka's coherence
theorem in its primitive local form, Cartan's coherence of the reduced ideal sheaf in its
local-generator form, the Riemann extension theorem across a nowhere-dense analytic subset
and Hartogs extension across a point (K3); the Hodge theorem for real de Rham cohomology on a
compact oriented Riemannian manifold (K5a); finiteness of Dolbeault cohomology and the dual
Hodge-diamond symmetry on a compact complex manifold (K5b.1); and, on a compact Kähler
manifold, the `∂∂̄`-lemma, the Hodge decomposition in its dimension form, Hodge symmetry, the
evenness of the odd Betti numbers and the Hard Lefschetz theorem (K6.1); the Hodge numbers, the
Betti numbers and the integral cohomology ring of `ℂPⁿ`, on Tau Ceti's sphere-quotient model
`TauCeti.ComplexProjectiveSpace n` with its homogeneous-coordinate complex atlas, the Hodge
numbers `h^(p,q) = C(n,p) C(n,q)` of a complex torus `E / L`, on Tau Ceti's lattice quotient
`AddAction.orbitRel.Quotient L E` with its complex Lie group structure, and the genus
dictionary `h^(0,1) = h^(1,0)`, `b₁ = 2 h^(1,0)` of a compact Riemann surface (K7); and the
Frölicher inequality `b_k ≤ ∑_(p+q=k) h^(p,q)` on a compact complex manifold (K8).

Not statable at the pins, so nothing is stated in their place:
* the Dolbeault theorem `H^q(M, Ω^p) ≃ H^(p,q)` (K2): the pins have no sheaf of holomorphic
  `p`-forms;
* the analyticity and dimension drop of the singular locus, the regular-locus manifolds and
  Hartogs extension across an analytic subset of codimension at least two (K3): the pins have
  no analytic-subset carrier with a dimension theory;
* Chern connections and Koszul–Malgrange (K4) and Dolbeault theory and Serre duality with
  coefficients in a holomorphic bundle (K5b): holomorphic bundles are Mathlib's
  `ContMDiffVectorBundle ∞ F V 𝓘(ℂ, EB)`, but the pins have no Dolbeault operator `∂̄_V` on
  `V`-valued forms of type `(p, q)` (the pinned `delBar` acts on forms with a constant
  coefficient space), so neither the `(0,1)` part of a connection nor bundle-valued Dolbeault
  cohomology can be stated;
* the flat-connection and local-system equivalences (K4): the pins have covariant derivatives
  and their curvature, but no category of holomorphic vector bundles with connection and
  connection-preserving bundle maps, the source of these equivalences;
* the exponential sequence, `Pic_hol(M) ≃ H¹(M,𝒪×)`, the Chern-class identification and the
  smooth/continuous comparison `F_M` (K4.P): Tau Ceti's `holomorphicStructureSheaf` is a sheaf
  of commutative rings, and the pins have no sheaf of its units and hence no `H¹(M,𝒪×)`, and
  no tensor product of vector bundles for the group law of `Pic_hol(M)`;
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
* the planar star, codifferential and Laplacian comparisons (K6.0.PlanarHodge,
  K6.0.PlanarLaplacian): they concern complex-valued forms of finite regularity, while the pins
  have the star of real forms and the codifferential of smooth real forms only;
* the analytic-cycle classes (K6.1): integration over the regular locus of a compact
  analytic subvariety needs the analytic-subset dimension theory and the complex-valued
  integration that the pins lack;
* the projective computations on K7.1's carrier `Projectivization ℂ (Fin (n+1) → ℂ)` (K7):
  Tau Ceti's complex atlas `Projectivization.instIsManifold` cannot be imported together with
  Mathlib, since both libraries declare `Projectivization.instTopologicalSpace`; the K7
  statements below use the sphere-quotient model instead, which K7.1 compares with it;
* the sections of `O(k)` on `ℂPⁿ` and the incidence blowup (K7.2): the pins have no
  tautological line bundle on either model of `ℂPⁿ`; the Fubini–Study normalizations (K7.2):
  the Fubini–Study form is itself a K7.2 construction, glued from its chart formulas;
* the Hodge diamond of the primary Hopf surface (K7): the pins have the quotient manifold of a
  free, properly discontinuous action by `C^n` maps, over `ℝ` or `ℂ` (Mathlib's
  `MulAction.instChartedSpaceQuotient`, Tau Ceti's `instIsManifoldQuotient`), and the dilations
  `z ↦ 2^m z` act on `ℂ² ∖ {0}` through Mathlib's action of `ℂˣ` on nonzero vectors, but the
  pins do not prove the `ProperlyDiscontinuousSMul`, `IsCancelSMul` and `ContMDiffConstSMul`
  instances for that action which the quotient construction requires;
* the lattice-character lines `L_ρ` on an elliptic curve and their cohomology
  (K7.FlatDegreeZero): the pins have no holomorphic line bundle descended from a
  factor of automorphy and no Dolbeault cohomology with coefficients in a holomorphic bundle;
* the Frölicher spectral sequence, its pages and its degeneration criterion, and the
  Iwasawa-manifold computation (K8): Tau Ceti has the spectral sequence of a filtered cochain
  complex (`CochainComplex.spectralSequence`), but the filtered type complex (the type forms with
  `d = ∂ + ∂̄` as a cochain complex of ℂ-vector spaces, with its column filtration) and the Iwasawa
  quotient are constructions of K8.
-/

@[expose] public noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff Topology TauCeti.ComplexManifold
open TauCeti TauCeti.SmoothAlmostComplexStructure

/-! ## Layer 1: complex structures and type calculus (K1) -/

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

/-! ## Layer 2: Dolbeault calculus and the local lemmas (K2) -/

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

/-! ## Layer 3: analytic germs and subvarieties (K3) -/

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
Chapter II, (2.7) for the Noetherian property; regularity and the dimension are K3's deduction
from the coordinate generators of the maximal ideal and Krull's height theorem). The stalk at `x` of
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

/-- K3's Hartogs extension across a point (Demailly, Chapter I, (3.28)): on a complex manifold of
complex dimension at least two, a function holomorphic off a point extends to a
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

/-! ## Layer 5: the real Hodge theorem (5.7, K5a) -/

section RealHodge

open Bundle

/-- **The Hodge theorem for real de Rham cohomology** (Demailly, Chapter VI, (3.16)–(3.17)). On a
compact boundaryless Riemannian manifold with an orientation, of dimension `m = k + 1 + l`, the de
Rham cohomology in degree `k + 1` is finite-dimensional, and every class has exactly one closed
representative annihilated by the pinned codifferential `d* = (−1)^(m(k+2)+1) ⋆d⋆`, that is,
exactly one harmonic representative. The codifferential does not depend on the orientation. On the
circle the harmonic `1`-forms are the constant multiples of `dθ`, a line, while every `1`-form is
closed. -/
theorem hodge_theorem_deRham {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
    [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    {m k l : ℕ} (o : TauCeti.Manifold.Orientation I M (Fin m)) (hkl : k + 1 + l = m) :
    FiniteDimensional ℝ (deRhamCohomology I M (k + 1)) ∧
      ∀ c : deRhamCohomology I M (k + 1), ∃! α : closedForms I M (k + 1),
        SmoothForm.codifferential o hkl α.1 = 0 ∧ deRhamCohomology.mk I (k + 1) α = c := by
  sorry

end RealHodge

/-! ## Layer 5: Dolbeault cohomology (2.4), its finiteness and Serre duality (5.10, K5b.1) -/

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

/-! ## Layer 6: the Kähler condition (6.1, K6.0) -/

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

/-! ## Layer 6: compact Kähler Hodge theory (6.3, K6.1) -/

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

/-! ## Layer 7: projective, torus, Riemann-surface and Hopf examples (K7) -/

section ProjectiveSpace

/-- **The Hodge numbers of complex projective space** (Demailly, Chapter VI, (8.8)). On `ℂPⁿ`,
Tau Ceti's circle quotient `TauCeti.ComplexProjectiveSpace n` of the unit sphere of `ℂⁿ⁺¹` with
its homogeneous-coordinate complex atlas, `h^(p,q) = 1` when `p = q ≤ n` and `h^(p,q) = 0`
otherwise; above the complex dimension `n` there are no nonzero forms of type `(p, q)`. -/
theorem finrank_dolbeaultCohomology_complexProjectiveSpace (n p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology (Fin n → ℂ) (TauCeti.ComplexProjectiveSpace n) p q) =
      if p = q ∧ p ≤ n then 1 else 0 := by
  sorry

/-- **The Betti numbers of complex projective space** (Demailly, Chapter V, (15.10), with the de
Rham theorem). The real de Rham cohomology of `ℂPⁿ` is one-dimensional in each even degree
`k ≤ 2n` and zero in every other degree. -/
theorem finrank_deRhamCohomology_complexProjectiveSpace (n k : ℕ) :
    Module.finrank ℝ (deRhamCohomology 𝓘(ℝ, Fin n → ℂ) (TauCeti.ComplexProjectiveSpace n) k) =
      if Even k ∧ k ≤ 2 * n then 1 else 0 := by
  sorry

/-- The `k`-th cup power `u ⌣ ⋯ ⌣ u` of a degree-two integral cohomology class, for Tau Ceti's
integral cup product, with `u⁰` the unit class. -/
def integralCupPow {X : TopCat.{0}} (u : X.integralCohomology 2) :
    (k : ℕ) → X.integralCohomology (2 * k)
  | 0 => X.integralCohomologyOne
  | k + 1 => X.integralCup 2 (2 * k) (2 * (k + 1)) (by ring) u (integralCupPow u k)

/-- **The integral cohomology ring of complex projective space** (Demailly, Chapter V, (15.10)):
`H^•(ℂPⁿ; ℤ) ≅ ℤ[u]/(u^(n+1))` with `u` of degree two. Some class `u ∈ H²(ℂPⁿ; ℤ)` has cup
powers `u^k` generating `H^(2k)(ℂPⁿ; ℤ)` freely for `k ≤ n`, and the integral cohomology vanishes
in odd degrees and in degrees above `2n`. The wedge `S² ∨ S⁴` has the same groups for `n = 2`
but `u² = 0`, so the condition on cup powers is not a statement about groups alone. -/
theorem integralCohomology_complexProjectiveSpace (n : ℕ) :
    ∃ u : (TopCat.of (TauCeti.ComplexProjectiveSpace n)).integralCohomology 2,
      (∀ k ≤ n, Function.Bijective fun m : ℤ ↦ m • integralCupPow u k) ∧
      ∀ j, Odd j ∨ 2 * n < j →
        Subsingleton ((TopCat.of (TauCeti.ComplexProjectiveSpace n)).integralCohomology j) := by
  sorry

end ProjectiveSpace

/-- **The Hodge numbers of a complex torus.** Let `L` be a full lattice in a finite-dimensional
complex vector space `E` of dimension `n`; the complex torus `E / L` is Tau Ceti's orbit space
`AddAction.orbitRel.Quotient L E`, a compact complex Lie group whose charts are local inverses of
the projection. Then `h^(p,q) = C(n,p) C(n,q)`: a constant positive Hermitian form is a flat
Kähler metric on `E / L` (Demailly, Chapter VI, (4.5), p. 297), and its harmonic `(p,q)`-forms
are the translation-invariant forms `dz_I ∧ dz̄_J` with `|I| = p`, `|J| = q`; the computation is
this roadmap's own. For `n = 0` the torus is a point and `h^(0,0) = 1`; for `p > n` both sides
vanish. -/
theorem finrank_dolbeaultCohomology_complexTorus
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L] (p q : ℕ) :
    Module.finrank ℂ (DolbeaultCohomology E (AddAction.orbitRel.Quotient L E) p q) =
      (Module.finrank ℂ E).choose p * (Module.finrank ℂ E).choose q := by
  sorry

/-- **The genus dictionary of a compact Riemann surface** (Demailly, Chapter VI, (10.1)–(10.2)).
On a compact complex manifold of complex dimension one, `h^(0,1) = h^(1,0)`, the geometric genus
`g`, and the first Betti number is `2g`. No Kähler form is assumed: on a curve every positive
`(1,1)`-form is one. Connectedness is not needed, both sides being additive over components. -/
theorem finrank_dolbeaultCohomology_riemannSurface
    {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace ℂ M]
    [IsManifold 𝓘(ℂ) ∞ M] :
    Module.finrank ℂ (DolbeaultCohomology ℂ M 0 1) =
        Module.finrank ℂ (DolbeaultCohomology ℂ M 1 0) ∧
      Module.finrank ℝ (deRhamCohomology 𝓘(ℝ, ℂ) M 1) =
        2 * Module.finrank ℂ (DolbeaultCohomology ℂ M 1 0) := by
  sorry

/-! ## Layer 8: the Frölicher spectral sequence and non-Kähler comparison (K8) -/

/-- **The Frölicher inequality** (Demailly, Chapter VI, (11.2)). On a compact complex manifold,
with no Kähler hypothesis, the `k`-th real Betti number is at most the sum of the Hodge numbers
`h^(p,k−p)`, `0 ≤ p ≤ k`; equality in every degree is the degeneration of the Frölicher spectral
sequence at `E₁`. The Iwasawa manifold has `b₁ = 4 < 5 = h^(1,0) + h^(0,1)`. -/
theorem finrank_deRhamCohomology_le_sum_dolbeault
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type*} [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] (k : ℕ) :
    Module.finrank ℝ (deRhamCohomology 𝓘(ℝ, E) M k) ≤
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

end TauCetiRoadmap.ComplexKahlerGeometry
