import Mathlib

/-!
# Isocrystals, vector bundles and Banach–Colmez spaces: representative target signatures

The README is the definitive specification. These are suggested forms for a subset of its
mathematics, not an exhaustive checklist. The definitions below bundle existing algebraic and
categorical data; the statements fix the Frobenius, degree and cohomological conventions.
The relative curve, standard blocks, integral models, geometric cohomology, tilted coherent
heart and Banach–Colmez realizations are specified in the README. The absolute curve, coherent
and bundle GAGA, and extended-Robba equivalences use PrismaticCohomologyPartIII §7.0's
`FilteredBundle.schemeCurve`, `FilteredBundle.analyticEquivalence`,
`FilteredBundle.robbaEquivalence` and `FilteredBundle.untiltCompletion`; the README specifies
their general-coefficient and relative extensions.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject TensorProduct

universe u v w

namespace TauCeti.FFBundles

/-! ## Layer VB0: finite general-coefficient isocrystals -/

instance equivInvPair (R : Type u) [CommRing R] (σ : R ≃+* R) :
    RingHomInvPair σ.toRingHom σ.symm.toRingHom := RingHomInvPair.of_ringEquiv σ

instance equivInvPairSymm (R : Type u) [CommRing R] (σ : R ≃+* R) :
    RingHomInvPair σ.symm.toRingHom σ.toRingHom := RingHomInvPair.of_ringEquiv σ.symm

/-! ## Finite general-coefficient isocrystals -/

/-- The specified coefficient automorphism is part of the object type. -/
structure FiniteIsocrystal (L : Type u) [Field L] (σ : L ≃+* L) where
  V : Type u
  [addCommGroup : AddCommGroup V]
  [module : Module L V]
  [finite : Module.Finite L V]
  frobenius : V ≃ₛₗ[σ.toRingHom] V

attribute [instance] FiniteIsocrystal.addCommGroup FiniteIsocrystal.module
  FiniteIsocrystal.finite

namespace FiniteIsocrystal

variable {L : Type u} [Field L] {σ : L ≃+* L}

/-- L-linear maps satisfying the actual Frobenius intertwining equation.
Their additive and E-linear structures use coefficients fixed by σ. They are
not generally an L-vector subspace of the space of L-linear maps. -/
structure Hom (D D' : FiniteIsocrystal L σ) where
  linearMap : D.V →ₗ[L] D'.V
  intertwines : ∀ x, D'.frobenius (linearMap x) = linearMap (D.frobenius x)

/-- A linear equivalence with the intertwining equation, not just an
equivalence of underlying vector spaces. -/
structure Equiv (D D' : FiniteIsocrystal L σ) where
  linearEquiv : D.V ≃ₗ[L] D'.V
  intertwines : ∀ x, D'.frobenius (linearEquiv x) = linearEquiv (D.frobenius x)

/-- Schur's theorem for an irreducible finite isocrystal, over its fixed coefficient field.
The simplicity condition concerns Frobenius-stable subspaces. -/
theorem isocrystalEndDivision {D : FiniteIsocrystal L σ} [Nontrivial D.V]
    (simple : ∀ P : Submodule L D.V,
      (∀ x ∈ P, D.frobenius x ∈ P) → P = ⊥ ∨ P = ⊤)
    (f : Hom D D) (hf : f.linearMap ≠ 0) :
    ∃ g : Hom D D, g.linearMap.comp f.linearMap = LinearMap.id ∧
      f.linearMap.comp g.linearMap = LinearMap.id := by
  sorry

end FiniteIsocrystal

namespace FiniteIsocrystal

/-- The Witt specialization retains the supplied semilinear Frobenius on the same carrier. -/
abbrev toWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p]
    (D : FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k)) : WittVector.Isocrystal p k D.V where
  toModule := inferInstance
  frob := D.frobenius

/-- A finite Witt isocrystal gives the general-coefficient bundled carrier. -/
def ofWitt (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] (V : Type u) [AddCommGroup V] [WittVector.Isocrystal p k V]
    [Module.Finite (FractionRing (WittVector p k)) V] :
    FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k) where
  V := V
  frobenius := WittVector.Isocrystal.frobenius p k

end FiniteIsocrystal

-- Check: finiteIsocrystal_witt
/-- The carrier comparison transports CrystallineCohomology §CR.4.7's Witt blocks and
classification through the finite Witt specialization, preserving Frobenius and rank.
VB0's mixed-characteristic comparison transports the ramified and q-Frobenius classification
from PadicDifferentialEquationsAndRigidCohomology §RD.1.32; its equal-characteristic
classification over k((π)) is a separate VB0 target. -/
theorem dieudonneManinIsocrystals
    (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p]
    [PerfectRing k p] [IsAlgClosed k]
    (D : FiniteIsocrystal (FractionRing (WittVector p k))
      (WittVector.FractionRing.frobenius p k)) :
    letI := D.toWitt p k
    Nonempty (FiniteIsocrystal.Equiv D (FiniteIsocrystal.ofWitt p k D.V)) ∧
      (WittVector.Isocrystal.frobenius p k : D.V → D.V) = D.frobenius ∧
      Module.finrank (FractionRing (WittVector p k))
        (FiniteIsocrystal.ofWitt p k D.V).V =
          Module.finrank (FractionRing (WittVector p k)) D.V := by
  sorry

/-! ## Layer VB1: algebraic Frobenius modules and cohomology -/

/-- Finite projective Frobenius modules over a specified ring and automorphism.
The absolute geometric specialization is the finite projective source of
PrismaticCohomologyPartIII §7.0's `FilteredBundle.robbaEquivalence`; this interface also
carries general coefficients and integral models. Its semilinear equivalence expresses
invertible Frobenius linearization; annular topologies are specified in the README. -/
structure RobbaPhiModule (R : Type u) [CommRing R] (φ : R ≃+* R) where
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module R M]
  [finite : Module.Finite R M]
  [projective : Module.Projective R M]
  frobenius : M ≃ₛₗ[φ.toRingHom] M

attribute [instance] RobbaPhiModule.addCommGroup RobbaPhiModule.module
  RobbaPhiModule.finite RobbaPhiModule.projective

namespace RobbaPhiModule

variable {R : Type u} [CommRing R] {φ : R ≃+* R}

structure Hom (M N : RobbaPhiModule R φ) where
  linearMap : M.M →ₗ[R] N.M
  intertwines : ∀ x, N.frobenius (linearMap x) = linearMap (M.frobenius x)

/-- The rank-one trivial Frobenius module, independent of any Bézout theorem. -/
def trivial (R : Type u) [CommRing R] (φ : R ≃+* R) : RobbaPhiModule R φ where
  M := R
  frobenius := φ.toSemilinearEquiv

/-- Scalar extension has the compatible coefficient Frobenius and its inverse on pure tensors. -/
theorem tensorFrobenius (A : Type u) [CommRing A] [Algebra A R] (ψ : A ≃+* A)
    (compatible : ∀ a, φ (algebraMap A R a) = algebraMap A R (ψ a))
    (N : RobbaPhiModule A ψ) :
    ∃ F : (R ⊗[A] N.M) ≃ₛₗ[φ.toRingHom] (R ⊗[A] N.M),
      (∀ r n, F (r ⊗ₜ[A] n) = φ r ⊗ₜ[A] N.frobenius n) ∧
      (∀ r n, F.symm (r ⊗ₜ[A] n) = φ.symm r ⊗ₜ[A] N.frobenius.symm n) := by
  sorry

/-- An integral finite projective model with an intertwining scalar-extension equivalence.
A is the specified integral coefficient ring, with its compatible automorphism ψ. -/
structure GlobalEtaleModel (A : Type u) [CommRing A] [Algebra A R]
    (ψ : A ≃+* A) (D : RobbaPhiModule R φ) where
  compatible : ∀ a, φ (algebraMap A R a) = algebraMap A R (ψ a)
  integral : RobbaPhiModule A ψ
  scalarExtension : R ⊗[A] integral.M ≃ₗ[R] D.M
  intertwines : ∀ r n,
    D.frobenius (scalarExtension (r ⊗ₜ[A] n)) =
      scalarExtension (φ r ⊗ₜ[A] integral.frobenius n)

/-- Global étaleness is existence of the specified integral model. -/
def isGloballyEtale (A : Type u) [CommRing A] [Algebra A R]
    (ψ : A ≃+* A) (D : RobbaPhiModule R φ) : Prop :=
  Nonempty (GlobalEtaleModel A ψ D)

end RobbaPhiModule

section FrobeniusCohomology
variable {E : Type u} [Field E] {M : Type u} [AddCommGroup M] [Module E M]

namespace FrobeniusComplex
/-- Degree-zero Frobenius invariants, with the E-linear differential φ − 1. -/
def H0 (φ : M →ₗ[E] M) : Submodule E M := (φ - LinearMap.id).ker
/-- Degree-one Frobenius coinvariants. -/
abbrev H1 (φ : M →ₗ[E] M) : Type u := M ⧸ (φ - LinearMap.id).range

/-- Intertwiners induce the kernel and quotient maps in the target
"Two-term Frobenius complex for curve cohomology", with their vector formulas. -/
theorem mapCohomology {N : Type u} [AddCommGroup N] [Module E N]
    (φ : M →ₗ[E] M) (ψ : N →ₗ[E] N) (f : M →ₗ[E] N)
    (intertwines : ∀ x, ψ (f x) = f (φ x)) :
    ∃ f₀ : H0 φ →ₗ[E] H0 ψ, ∃ f₁ : H1 φ →ₗ[E] H1 ψ,
      (∀ x, (f₀ x).val = f x.val) ∧
      ∀ x : M, f₁ (Submodule.Quotient.mk x) = Submodule.Quotient.mk (f x) := by
  sorry

end FrobeniusComplex
end FrobeniusCohomology

/-! ## Layer VB2: twisted invariants, actions and HN data -/

section TwistedInvariants

variable {E : Type u} [Field E] {M : Type u} [AddCommGroup M] [Module E M]

/-- The algebraic kernel underlying Γ_n. Its Banach topology needs the annular
norm theorem specified in the README; the algebraic construction does not assert it.
The annular checks twistedInvariant_change_radius and twistedInvariant_not_exact_norm
concern those canonical Banach topologies. -/
def TwistedInvariant (φ : M →ₗ[E] M) (π : E) (n : ℤ) : Submodule E M :=
  (φ - (π ^ n) • LinearMap.id).ker

-- Check: twistedInvariant_n_zero
/-- Weight zero agrees with ordinary Frobenius invariants. -/
example (φ : M →ₗ[E] M) (π : E) :
    TwistedInvariant φ π 0 = FrobeniusComplex.H0 φ := by
  simp [TwistedInvariant, FrobeniusComplex.H0]

-- Check: twistedInvariant_sign
/-- Multiplication by π has weight +1, fixing the sign of the twist. -/
example (π : E) (hπ : π ≠ 0) (hπ2 : π ^ 2 ≠ 1) :
    TwistedInvariant (π • (LinearMap.id : E →ₗ[E] E)) π 1 = ⊤ ∧
      (π • (LinearMap.id : E →ₗ[E] E) - π⁻¹ • LinearMap.id).ker = ⊥ := by
  constructor
  · simp [TwistedInvariant]
  · apply LinearMap.ker_eq_bot.mpr
    intro x y hxy
    have hne : π - π⁻¹ ≠ 0 := by
      intro h
      apply hπ2
      have heq : π = π⁻¹ := sub_eq_zero.mp h
      calc
        π ^ 2 = π * π := pow_two π
        _ = π * π⁻¹ := congrArg (π * ·) heq
        _ = 1 := mul_inv_cancel₀ hπ
    have hmul : (π - π⁻¹) * x = (π - π⁻¹) * y := by
      simpa only [LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.id_apply,
        smul_eq_mul, sub_mul] using hxy
    exact mul_left_cancel₀ hne hmul
end TwistedInvariants

section ContinuousActions

variable (E R M G : Type u) [Field E] [CommRing R] [Algebra E R]
  [AddCommGroup M] [Module E M] [Module R M] [IsScalarTower E R M]
  [TopologicalSpace M] [Group G] [TopologicalSpace G]

structure ContinuousPhiAction (φ : M ≃ₗ[E] M) where
  coefficients : G →* (R ≃ₐ[E] R)
  action : G →* (M ≃ₗ[E] M)
  semilinear : ∀ (g : G) (a : R) (x : M),
    action g (a • x) = coefficients g a • action g x
  commutes : ∀ (g : G) (x : M), φ (action g x) = action g (φ x)
  continuous : Continuous (fun gx : G × M => action gx.1 gx.2)

/-- The restriction in "Continuous profinite actions on Frobenius modules"
is continuous on every weight space with its induced topology. -/
theorem ContinuousPhiAction.restrictInvariants_continuous {φ : M ≃ₗ[E] M}
    (A : ContinuousPhiAction E R M G φ) (π : E) (n : ℤ) :
    ∃ ρ : G →* (TwistedInvariant φ.toLinearMap π n ≃ₗ[E]
      TwistedInvariant φ.toLinearMap π n),
      (∀ g x, (ρ g x).val = A.action g x.val) ∧
      Continuous (fun gx : G × TwistedInvariant φ.toLinearMap π n => ρ gx.1 gx.2) := by
  sorry

end ContinuousActions

structure HNPolygon where
  pieces : List (ℕ × ℤ)
  positive : ∀ p ∈ pieces, 0 < p.1
  decreasing : pieces.Pairwise (fun a b => (a.2 : ℚ) / a.1 > (b.2 : ℚ) / b.1)

namespace HNPolygon

/-- The empty polygon records the rank-zero object. -/
def zero : HNPolygon where
  pieces := []
  positive := by simp
  decreasing := by simp

def vertices (P : HNPolygon) : List (ℕ × ℤ) :=
  P.pieces.scanl (fun a b => (a.1 + b.1, a.2 + b.2)) (0, 0)

def totalRank (P : HNPolygon) : ℕ := (P.pieces.map Prod.fst).sum
def totalDegree (P : HNPolygon) : ℤ := (P.pieces.map Prod.snd).sum

def slopeMultiplicity (P : HNPolygon) (s : ℚ) : ℕ :=
  ((P.pieces.filter (fun a => (a.2 : ℚ) / a.1 = s)).map Prod.fst).sum

/-- The polygon endpoint records total rank and total degree. -/
theorem endpoint (P : HNPolygon) : P.vertices.getLast! = (P.totalRank, P.totalDegree) := by
  sorry

-- Check: hnPolygon_half
/-- A half-slope block has horizontal length two. -/
example (P : HNPolygon) (h : P.pieces = [(2, 1)]) :
    P.vertices = [(0, 0), (2, 1)] ∧ P.totalRank = 2 ∧ P.totalDegree = 1 ∧
      P.slopeMultiplicity (1/2) = 2 := by
  norm_num [vertices, totalRank, totalDegree, slopeMultiplicity, h]

-- Checks: hnPolygon_split, hnPolygon_not_slope_only
/-- Opposite rank-one slopes do not produce a horizontal polygon. -/
example (P : HNPolygon) (h : P.pieces = [(1, 1), (1, -1)]) :
    P.vertices = [(0, 0), (1, 1), (2, 0)] ∧
      P.slopeMultiplicity 1 = 1 ∧ P.slopeMultiplicity 0 = 0 := by
  norm_num [vertices, totalRank, totalDegree, slopeMultiplicity, h]
end HNPolygon
end TauCeti.FFBundles

namespace TauCeti.BanachColmez

/-! ## Layer VB3: presentations and curvature in a supplied abelian category -/

section Presentations
variable {K : Type u} [Field K]
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Both exact sequences retain their actual arrows, Y and their endpoints. -/
structure BCPresentation (constant : ModuleCat K ⥤ C) (V : ℕ → C) (W : C) where
  dim : ℕ
  V₁ : ModuleCat K
  V₂ : ModuleCat K
  finite₁ : FiniteDimensional K V₁
  finite₂ : FiniteDimensional K V₂
  Y : C
  first : ShortComplex C
  second : ShortComplex C
  firstLeft : first.X₁ ≅ constant.obj V₁
  firstMiddle : first.X₂ ≅ Y
  firstRight : first.X₃ ≅ V dim
  secondLeft : second.X₁ ≅ constant.obj V₂
  secondMiddle : second.X₂ ≅ Y
  secondRight : second.X₃ ≅ W
  firstExact : first.ShortExact
  secondExact : second.ShortExact
namespace BCPresentation
variable {constant : ModuleCat K ⥤ C} {V : ℕ → C} {W : C}
def height (P : BCPresentation constant V W) : ℤ :=
  (Module.finrank K P.V₁ : ℤ) - (Module.finrank K P.V₂ : ℤ)
/-- The stabilization target of "Finite-Dimensional Banach–Colmez presentations"
preserves both exact sequences and their dimension-height data. -/
theorem stabilize [constant.Additive] (P : BCPresentation constant V W) (T : ModuleCat K)
    [FiniteDimensional K T] :
    ∃ Q : BCPresentation constant V W, Q.dim = P.dim ∧ Q.height = P.height ∧
      Module.finrank K Q.V₁ = Module.finrank K P.V₁ + Module.finrank K T ∧
      Module.finrank K Q.V₂ = Module.finrank K P.V₂ + Module.finrank K T := by
  sorry

end BCPresentation
end Presentations

section Curvature
variable {C : Type u} [Category.{v} C] [Abelian C]
/-- Finite iterated extensions of the additive generator. -/
inductive AffineClosure (Ga : C) : C → Prop
  | zero : AffineClosure Ga 0
  | iso {X Y : C} : AffineClosure Ga X → (X ≅ Y) → AffineClosure Ga Y
  | step (s : ShortComplex C) : s.ShortExact → AffineClosure Ga s.X₁ →
      (s.X₃ ≅ Ga) → AffineClosure Ga s.X₂
namespace BCCurvature
def positive (Ga W : C) : Prop := ∀ f : W ⟶ Ga, f = 0
def nonnegative (BdRplus W : C) : Prop := ∀ f : W ⟶ BdRplus, f = 0
def affine (Ga W : C) : Prop := AffineClosure Ga W
/-- Powers are the specified finite powers of the period object. -/
def negative (powers : ℕ → C) (W : C) : Prop :=
  ∃ d, ∃ f : W ⟶ powers d, Mono f
/-- BdRplus-modules and their restriction-of-scalars functor are supplied. -/
def nonpositive {D : Type u} [Category.{v} D] (forget : D ⥤ C) (W : C) : Prop :=
  ∃ M : D, ∃ f : W ⟶ forget.obj M, Mono f
/-- The isomorphism invariance target of "Curvature" preserves all five predicates. -/
theorem iso (Ga BdRplus : C) (powers : ℕ → C)
    {D : Type u} [Category.{v} D] (forget : D ⥤ C) {X Y : C} (e : X ≅ Y) :
    (positive Ga X ↔ positive Ga Y) ∧
    (nonnegative BdRplus X ↔ nonnegative BdRplus Y) ∧
    (affine Ga X ↔ affine Ga Y) ∧
    (negative powers X ↔ negative powers Y) ∧
    (nonpositive forget X ↔ nonpositive forget Y) := by sorry
end BCCurvature

/-- The strict-sign part of "Curvature subobjects and quotients": monomorphisms
preserve negative curvature and epimorphisms preserve positive curvature. -/
theorem CurvatureSubquotients (Ga : C) (powers : ℕ → C) {U W Q : C}
    (i : U ⟶ W) [Mono i] (q : W ⟶ Q) [Epi q] :
    (BCCurvature.negative powers W → BCCurvature.negative powers U) ∧
    (BCCurvature.positive Ga W → BCCurvature.positive Ga Q) := by
  sorry
end Curvature

section Filtration
variable {K : Type u} [Field K]
variable {S : Type u} [Category.{v} S]
variable (W : S ⥤ ModuleCat K) (B : ℕ → S ⥤ ModuleCat K)
variable (D : S ⥤ ModuleCat K) (a : S)
/-- Submodule-valued component of the actual subfunctors. -/
structure BCCanonicalFiltration where
  positivePart : Submodule K (W.obj a)
  nonnegativePart : Submodule K (W.obj a)
  nested : positivePart ≤ nonnegativePart
namespace BCCanonicalFiltration
/-- Intersect kernels of *natural VS maps*, not all linear maps at C. -/
def positive : Submodule K (W.obj a) :=
  ⨅ (m : ℕ), ⨅ f : W ⟶ B (m + 1), LinearMap.ker (f.app a).hom
def nonnegative : Submodule K (W.obj a) :=
  ⨅ f : W ⟶ D, LinearMap.ker (f.app a).hom
/-- The map target of "Canonical curvature filtration": natural transformations
preserve both intersections of kernels, componentwise. -/
theorem map (W' : S ⥤ ModuleCat K) (f : W ⟶ W') :
    (positive W B a).map (f.app a).hom ≤ positive W' B a ∧
    (nonnegative W D a).map (f.app a).hom ≤ nonnegative W' D a := by
  sorry

end BCCanonicalFiltration
end Filtration

/-! ## Layers VB3–VB4: contracting quotients and the lattice obstruction -/

section Contraction
variable {X : Type u} [TopologicalSpace X] [QuasiSeparatedSpace X]

/-- The target "Quotients by contracting automorphisms" (FS II.2.17),
with the restriction of γ to its moved locus supplied as δ.
Generalizations have the orientation y ⤳ x. The orbit relation and quotient topology
are Mathlib's, and ℤ has its discrete topology. Quasiseparatedness together with the
compact-closure hypothesis encodes tautness; AdicSpacesPartII R0.0 supplies local spectrality. -/
theorem ContractingActionLemma (γ : X ≃ₜ X)
    (δ : {x : X // γ x ≠ x} ≃ₜ {x : X // γ x ≠ x})
    (restriction : ∀ x, (δ x).val = γ x.val)
    (locallySpectral : ∀ x : X, ∃ U : Set X,
      x ∈ U ∧ IsOpen U ∧ SpectralSpace U)
    (taut : ∀ U : Set X, IsOpen U → IsCompact U → IsCompact (closure U))
    (chains : ∀ x y z : X, Specializes y x → Specializes z x →
      Specializes y z ∨ Specializes z y)
    (fixedSpectral : SpectralSpace (Function.fixedPoints γ))
    (contracts : ∀ x : X, ∀ U : Set X, IsOpen U → Function.fixedPoints γ ⊆ U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^n) x ∈ U)
    (escapes : ∀ x : {x : X // γ x ≠ x}, ∀ U : Set X, IsOpen U → IsCompact U →
      ∃ N : ℕ, ∀ n : ℕ, N ≤ n → (γ^(-(n : ℤ))) x.val ∉ U) :
    IsClosed (Function.fixedPoints γ) ∧
    (∀ x : {x : X // γ x ≠ x}, ∀ n : ℤ, (δ^n) x = x → n = 0) ∧
    Topology.IsClosedEmbedding
      (fun z : {x : X // γ x ≠ x} × ℤ => (z.1, (δ^z.2) z.1)) ∧
    SpectralSpace (Quotient (MulAction.orbitRel (Subgroup.zpowers δ)
      {x : X // γ x ≠ x})) := by
  sorry
end Contraction

section LatticeMonodromy
variable {R Kp V : Type u} [CommRing R] [NormedField Kp] [Algebra R Kp]
variable [NormedAddCommGroup V] [NormedSpace Kp V]
variable [Module R V] [IsScalarTower R Kp V] [Nontrivial V]
/-- The obstruction in "Pure models and purity loci": a scalar of nonunit norm
cannot preserve a bounded spanning lattice. -/
theorem no_bounded_stable_lattice (p : Kp) (hp : p ≠ 0) (hnorm : ‖p‖ ≠ 1) :
    ¬ ∃ N : Submodule R V, Bornology.IsBounded (N : Set V) ∧
      Submodule.span Kp (N : Set V) = ⊤ ∧
      Set.BijOn (fun x : V => p • x) (N : Set V) (N : Set V) := by sorry
end LatticeMonodromy

end TauCeti.BanachColmez
