import Mathlib

/-!
# CrystallineCohomology: representative target signatures

The roadmap is `README.md` in this directory; this file is not exhaustive. It records the
definitions that can be given real bodies against the pinned Mathlib and Tau Ceti, and the end
theorems and layer milestones whose carriers exist at the pins, proved by `sorry`. The heavy
objects of the roadmap (crystalline and log crystalline sites, crystals, de Rham–Witt complexes
of rings, Hyodo–Kato complexes) are README targets; the closing comment lists them.

Design choices made explicit here:
- Divided powers are Mathlib's `DividedPowers`: total operations that vanish outside the ideal,
  including in degree zero. On the ideal, `γ₀(x) = 1`; iteration uses `x ∈ I` and positive inner
  index `n`, with coefficient `uniformBell m n` and arbitrary outer index `m`. The canonical
  coefficients on `(p)` have `c₀ = 1` and `c_n = pⁿ/n! ∈ pℤ_(p)` for `n ≥ 1`, mapped to the
  algebra. Divided power morphisms are Mathlib's `DividedPowers.IsDPMorphism`.
- A Dieudonné complex is a cochain complex of abelian groups (`ModuleCat ℤ`, indexed by `ℤ`) with
  a graded endomorphism `F` satisfying `d ∘ F = p • (F ∘ d)`; `F` is not a map of complexes.
- Monoids for log structures are written multiplicatively, as in rings; fine means cancellative
  and finitely generated, and saturation is tested in Mathlib's `Algebra.GrothendieckGroup`.
- `(φ, N)`-modules are built on Mathlib's `WittVector.Isocrystal`, with `N φ = p φ N`.
-/

namespace TauCetiRoadmap.CrystallineCohomology

open Finset

universe u v

/-! ## Layer CR.1: Crystalline sites, structure sheaves and crystals -/

namespace Crystalline

open TensorProduct

/-- A connection on a `B`-module `M` relative to `A`: an additive map `∇ : M → M ⊗_B Ω¹_{B/A}`
with the Leibniz rule `∇(b m) = b ∇m + m ⊗ db`. Since `d` kills base scalars, it is automatically
`A`-linear. This is CR.1.3's shared ordinary algebraic carrier, specialized and sheafified by
ComplexComparisonPartII C5.2 and FormalConnectionsOpers F2 through imports and adapters to
this carrier and its operations. Tensor symmetry gives their
`Ω¹ ⊗ M` convention and transports the extension, curvature, tensor and Hom/dual operations. -/
structure Connection (A B M : Type*) [CommRing A] [CommRing B] [Algebra A B] [AddCommGroup M]
    [Module B M] where
  /-- The map `∇`. -/
  toFun : M →+ M ⊗[B] Ω[B⁄A]
  leibniz : ∀ (b : B) (m : M),
    toFun (b • m) = b • toFun m + m ⊗ₜ KaehlerDifferential.D A B b

/-- The trivial connection `∇ = d` on `B` itself exists. -/
example (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] :
    Nonempty (Connection A B B) := by
  refine ⟨⟨(TensorProduct.lid B Ω[B⁄A]).symm.toLinearMap.toAddMonoidHom.comp
    (KaehlerDifferential.D A B).toAddMonoidHom, ?_⟩⟩
  intro b m
  apply (TensorProduct.lid B Ω[B⁄A]).injective
  simp [Derivation.leibniz]

end Crystalline

/-! ## Layer CR.2: Crystalline direct image and global sections -/

namespace Crystalline

/-- Multiplication by `p` is injective on `ℤ_p` and fails injectivity on the identity crystalline
thickening of `Spec 𝔽_p` over `Spec ℤ_p`. These coefficient maps witness failure of exactness of
module pullback; derived global sections use acyclicity of direct images of injectives. -/
theorem pdPoint_pullback_p_boundary (p : ℕ) [Fact p.Prime] :
    Function.Injective (fun x : ℤ_[p] ↦ (p : ℤ_[p]) * x) ∧
      ¬ Function.Injective (fun x : ZMod p ↦ (p : ZMod p) * x) := by
  constructor
  · intro x y hxy
    exact mul_left_cancel₀ (Nat.cast_ne_zero.mpr (Fact.out : p.Prime).ne_zero) hxy
  · intro h
    have h01 : (0 : ZMod p) = 1 := h (by simp)
    exact zero_ne_one h01

end Crystalline

/-! ## Layer CR.4: Ordinary and relative de Rham–Witt complexes -/

namespace Crystalline

open CategoryTheory

/-- The first `r` ghost components jointly determine a truncated Witt vector over a
`p`-torsion-free ring, by cancellation in the triangular ghost equations. -/
theorem truncatedGhost_injective (p r : ℕ) [Fact p.Prime] (R : Type*) [CommRing R]
    (hR : Function.Injective (fun x : R ↦ (p : R) * x)) :
    Function.Injective (fun x : TruncatedWittVector p r R ↦
      fun i : Fin r ↦ WittVector.ghostComponent i.val x.out) := by
  sorry

/-- A Dieudonné complex (Bhatt–Lurie–Mathew, Definition 2.1.1): a cochain complex of abelian
groups with a graded endomorphism `F` satisfying `d(F x) = p F(d x)`. -/
structure DieudonneComplex (p : ℕ) where
  /-- The underlying cochain complex of abelian groups. -/
  complex : CochainComplex (ModuleCat.{u} ℤ) ℤ
  /-- The Frobenius, degree by degree. -/
  F : ∀ n, Module.End ℤ (complex.X n)
  comm : ∀ n x, (complex.d n (n + 1)).hom (F n x) = p • F (n + 1) ((complex.d n (n + 1)).hom x)

namespace DieudonneComplex

variable {p : ℕ} (M : DieudonneComplex.{u} p)

/-- Saturation (Bhatt–Lurie–Mathew, Definition 2.2.1): `M` is termwise `p`-torsion-free, `F` is
injective, and the image of `F` in degree `n` is `{x | d x ∈ p M^{n+1}}`. -/
def IsSaturated : Prop :=
  (∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x)) ∧
  (∀ n, Function.Injective (M.F n)) ∧
  ∀ n, Set.range (M.F n) =
    {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = p • y}

/-- The iterates of `F` on a saturated complex (Bhatt–Lurie–Mathew, Proposition 2.2.5). -/
theorem range_F_iterate {M : DieudonneComplex.{u} p} (hM : M.IsSaturated) (r : ℕ) (n : ℤ) :
    Set.range (M.F n)^[r] =
      {x | ∃ y : M.complex.X (n + 1), (M.complex.d n (n + 1)).hom x = (p ^ r) • y} := by
  sorry

end DieudonneComplex

/-- On a Dieudonné complex with zero differential and `p`-torsion-free terms, saturation is
bijectivity of `F`. -/
example {p : ℕ} (M : DieudonneComplex.{u} p)
    (hp : ∀ n, Function.Injective (fun x : M.complex.X n ↦ p • x))
    (hd : ∀ n, M.complex.d n (n + 1) = 0) :
    M.IsSaturated ↔ ∀ n, Function.Bijective (M.F n) := by
  constructor
  · rintro ⟨_, hi, hr⟩ n
    refine ⟨hi n, fun x ↦ ?_⟩
    have hx : x ∈ Set.range (M.F n) := by
      rw [hr n]
      exact ⟨0, by simp [hd n]⟩
    exact hx
  · intro h
    refine ⟨hp, fun n ↦ (h n).injective, fun n ↦ Set.ext fun x ↦ ?_⟩
    constructor
    · intro _
      exact ⟨0, by simp [hd n]⟩
    · intro _
      exact (h n).surjective x

end Crystalline

/-! ## Layer CR.3:duality: Trace and Poincaré duality -/

namespace Crystalline

/-- The trace-normalization sign for the Čech differential `δ + (−1)^r d` and cup
sign `(−1)^(s t)` on bidegrees `(r,s)` and `(t,u)`: `h^d = cechTraceSign d • [ω]`. -/
def cechTraceSign (d : ℕ) : ℤ := (-1) ^ (d * (d - 1) / 2)

end Crystalline

/-! ## Layer CR.5:log-algebra: Logarithmic structures -/

namespace LogCrystalline

open Algebra

/-- A commutative monoid is fine if it is integral (cancellative) and finitely generated. Fine does
not imply saturated. -/
def IsFineMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ Monoid.FG P

/-- An integral monoid `P` is saturated if `gⁿ ∈ P` with `n > 0` implies `g ∈ P` for every `g` in
the Grothendieck group `P^gp`. -/
def IsSaturatedMonoid (P : Type*) [CommMonoid P] : Prop :=
  IsCancelMul P ∧ ∀ (g : GrothendieckGroup P) (n : ℕ), n ≠ 0 →
    g ^ n ∈ Set.range (GrothendieckGroup.of (M := P)) → g ∈ Set.range (GrothendieckGroup.of (M := P))

/-- A Kummer homomorphism of integral monoids: injective, and every element of the target has a
positive power in the image. -/
def IsKummerHom {P Q : Type*} [CommMonoid P] [CommMonoid Q] [IsCancelMul P] [IsCancelMul Q] (f : P →* Q) : Prop :=
  Function.Injective f ∧ ∀ q : Q, ∃ n : ℕ, n ≠ 0 ∧ q ^ n ∈ Set.range f

/-- Fixed-ring chart data for the prelog category of DerivedDeRhamCohomology §6.20:
a commutative monoid `P` and `α : P → (A, ×)`, allowing zero images. The monoid is bundled
as Mathlib's `CommMonCat`. -/
structure PrelogRing (A : Type u) [CommRing A] where
  /-- The monoid. -/
  P : CommMonCat.{v}
  /-- The structure map. -/
  α : P →* A

/-- A prelog ring is a log ring if `α` restricts to a bijection from `α⁻¹(A^×)` onto `A^×`. -/
def PrelogRing.IsLog {A : Type u} [CommRing A] (L : PrelogRing.{u, v} A) : Prop :=
  Function.Bijective fun m : {m : L.P // IsUnit (L.α m)} ↦ (⟨L.α m, m.2⟩ : {a : A // IsUnit a})

/-- The trivial log structure `A^× → A` is a log ring. -/
example (A : Type u) [CommRing A] :
    (⟨CommMonCat.of Aˣ, Units.coeHom A⟩ : PrelogRing.{u, u} A).IsLog := by
  constructor
  · intro x y h
    apply Subtype.ext
    apply Units.ext
    exact congrArg Subtype.val h
  · intro a
    obtain ⟨u, hu⟩ := a.property
    refine ⟨⟨u, u.isUnit⟩, ?_⟩
    exact Subtype.ext hu

/-- The prelog chart `n ↦ (−1)ⁿ` is not a log ring, including in characteristic two:
`0` and `2` are distinct monoid elements with the same unit image `1`. -/
example (A : Type u) [CommRing A] :
    ¬ (⟨CommMonCat.of (Multiplicative ℕ), powersHom A (-1 : A)⟩ : PrelogRing.{u, 0} A).IsLog := by
  intro h
  let x : {m : Multiplicative ℕ // IsUnit ((powersHom A (-1 : A)) m)} :=
    ⟨Multiplicative.ofAdd 0, by simp⟩
  let y : {m : Multiplicative ℕ // IsUnit ((powersHom A (-1 : A)) m)} :=
    ⟨Multiplicative.ofAdd 2, by simp⟩
  have hxy : x = y := h.injective (Subtype.ext (by simp [x, y]))
  have hnat : (0 : ℕ) = 2 := congrArg (fun z ↦ Multiplicative.toAdd z.val) hxy
  exact (by decide : (0 : ℕ) ≠ 2) hnat

/-- The two-element idempotent chart over `ZMod 2` is already a log ring but is not integral:
its nonidentity element is `0`, and `0 * 0 = 0 * 1` violates cancellation. This is the boundary
of the integral-chart crystalline comparison in CR.DDR.6.12. -/
theorem idempotentChart_boundary :
    (⟨CommMonCat.of (ZMod 2), MonoidHom.id (ZMod 2)⟩ : PrelogRing.{0, 0} (ZMod 2)).IsLog ∧
      ¬ IsCancelMul (ZMod 2) := by
  constructor
  · exact Function.bijective_id
  · intro h
    let := h
    have hzero : (0 : ZMod 2) = 1 := mul_left_cancel (a := (0 : ZMod 2)) (by simp)
    exact zero_ne_one hzero

/-- The free chart monoid is fine and saturated (CR.5:log-algebra.1, Fine and Saturated monoids). -/
theorem nat_fine_saturated :
    IsFineMonoid (Multiplicative ℕ) ∧ IsSaturatedMonoid (Multiplicative ℕ) := by
  sorry

/-- The cusp chart separates fineness from saturation (CR.5:log-algebra.1): the groupification
contains `1 = 3 − 2`, while the monoid omits `1` and contains `2`. -/
theorem cusp_fine_not_saturated :
    IsFineMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) ∧
    ¬ IsSaturatedMonoid (Submonoid.closure
      ({Multiplicative.ofAdd 2, Multiplicative.ofAdd 3} : Set (Multiplicative ℕ))) := by
  sorry

/-- The valuation characteristic monoid is saturated but not fine (CR.5:log-algebra.1 and
CR.5.5): nonnegative rationals are closed under positive roots but not finitely generated. -/
theorem rational_saturated_not_fine :
    IsSaturatedMonoid (Multiplicative ℚ≥0) ∧ ¬ IsFineMonoid (Multiplicative ℚ≥0) := by
  sorry

/-- The `n`-th power map of `ℕ` is Kummer for `n ≠ 0`; Kummer fails for the zero map. -/
example (n : ℕ) (hn : n ≠ 0) : IsKummerHom (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) := by
  constructor
  · intro x y h
    have hnat := congrArg Multiplicative.toAdd h
    simp only [powMonoidHom_apply, toAdd_pow, nsmul_eq_mul] at hnat
    exact congrArg Multiplicative.ofAdd (Nat.eq_of_mul_eq_mul_left (Nat.pos_of_ne_zero hn) hnat)
  · intro q
    exact ⟨n, hn, q, rfl⟩

/-- The zero power map fails injectivity on the free monoid, so it is not Kummer. -/
example : ¬ IsKummerHom (powMonoidHom 0 : Multiplicative ℕ →* Multiplicative ℕ) := by
  intro h
  have heq : Multiplicative.ofAdd 0 = Multiplicative.ofAdd 1 := h.1 (by simp)
  have hnat : (0 : ℕ) = 1 := congrArg Multiplicative.toAdd heq
  norm_num at hnat

end LogCrystalline

/-! ## Layer CR.6: Hyodo–Kato complexes and semistable structure -/

namespace LogCrystalline

/-- At lengths two to one, Witt restriction sends `[t]` to `t`, while Frobenius sends it
to `t^p` on the strict smooth chart over `ZMod p` (Layer CR.6.1). -/
theorem logWitt_polynomial_R_F (p : ℕ) [Fact p.Prime] :
    (TruncatedWittVector.truncate (show 1 ≤ 2 by decide)
      (WittVector.truncate 2 (WittVector.teichmuller p
        (Polynomial.X : Polynomial (ZMod p))))).coeff ⟨0, by decide⟩ = Polynomial.X ∧
    (WittVector.truncate 1 (WittVector.frobenius (WittVector.teichmuller p
      (Polynomial.X : Polynomial (ZMod p))))).coeff ⟨0, by decide⟩ = Polynomial.X ^ p := by
  constructor
  · simp
  · rw [WittVector.coeff_truncate, WittVector.coeff_frobenius_charP,
      WittVector.teichmuller_coeff_zero]

/-- On `F_p[t]`, `V(t)` lies in the kernel of length-two restriction and outside the image
of multiplication by `p`. This witnesses why the finite log Witt exact sequence ends in a
quotient complex (Layer CR.6.1). -/
theorem logWitt_polynomial_V_not_p (p : ℕ) [Fact p.Prime] :
    let v := WittVector.truncate 2 (WittVector.verschiebung (WittVector.teichmuller p
      (Polynomial.X : Polynomial (ZMod p))))
    TruncatedWittVector.truncate (show 1 ≤ 2 by decide) v = 0 ∧
      ¬ ∃ w : TruncatedWittVector p 2 (Polynomial (ZMod p)), v = (p : _) * w := by
  sorry

/-- The length-one log Witt differential on a strict smooth polynomial chart is the ordinary
nonzero differential of its coordinate (Layer CR.6.1). -/
theorem logWitt_smooth_chart_differential (p : ℕ) [Fact p.Prime] :
    KaehlerDifferential.D (ZMod p) (Polynomial (ZMod p)) Polynomial.X ≠ 0 := by
  sorry

open WittVector
open scoped Isocrystal

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [PerfectRing k p]

/-- A `(φ, N)`-module over `K₀ = W(k)[1/p]`: an isocrystal with a `K₀`-linear monodromy operator
satisfying `N φ = p φ N`, the relation of the Hyodo–Kato operators. -/
structure PhiNModule (V : Type*) [AddCommGroup V] [Isocrystal p k V] where
  /-- The monodromy operator. -/
  N : V →ₗ[K(p, k)] V
  N_frobenius : ∀ x : V, N (Isocrystal.frobenius p k (V := V) x) =
    (p : K(p, k)) • Isocrystal.frobenius p k (V := V) (N x)

/-- Zero monodromy gives a `(φ, N)`-module (the good-reduction case). -/
example (V : Type*) [AddCommGroup V] [Isocrystal p k V] : Nonempty (PhiNModule p k V) :=
  ⟨⟨0, fun x ↦ by simp⟩⟩

/-- Nilpotence of the monodromy (Layer CR.6, *Nilpotence of Hyodo–Kato monodromy*): on a
finite-dimensional `(φ, N)`-module, `N ^ dim = 0`. -/
theorem PhiNModule.N_pow_finrank_eq_zero {V : Type*} [AddCommGroup V] [Isocrystal p k V]
    [FiniteDimensional K(p, k) V] (D : PhiNModule p k V) :
    D.N ^ Module.finrank K(p, k) V = 0 := by
  sorry

end LogCrystalline

/-!
## Definitions and constructions stated in the README

The sites, coefficient categories, envelopes, completions and cohomology functors below have their
intended signatures and APIs in the README. Their carriers are supplied by the mathematical
constructions there; this file records only the light definitions statable at the pins.


Layer CR.1: Schemes with a quasi-coherent PD ideal; Small and big crystalline sites; Morphisms and
comparisons of crystalline sites; The étale crystalline sites; Structure, quotient and PD-ideal
sheaves; Quasi-coherent and finite locally free crystals; Rational crystals and nondegenerate
F-crystals; Universal PD differentials and the PD de Rham complex; Modules with integrable
connection and their de Rham complexes; PD stratifications on a smooth lift; Integrable
topologically quasi-nilpotent connections.

Layer CR.2: Enhanced crystalline direct image and global sections; Crystalline linearization along
a smooth embedding; Linearization in a smooth ambient scheme.

Layer CR.3: The crystalline first Chern class and the hyperplane class; Crystalline cup products;
Semilinear crystalline Frobenius and linearization.

Layer CR.4: Witt schemes on locally p-nilpotent schemes; Principal p-décalage on torsion-free
complexes; Dieudonné complexes; Saturated Frobenius; Verschiebung and the differential;
Morphisms of Dieudonné complexes; Bockstein reduction of principal p-décalage; Derived p-décalage and completion; Saturation by iterated
décalage; The Verschiebung filtration; Finite Verschiebung quotient complex; Projection to the
finite quotient; Restriction between finite quotients; Frobenius on finite quotients; Verschiebung
on finite quotients; Functorial finite quotients; Completion of a saturated Dieudonné complex;
Strict Dieudonné complexes; Strict Dieudonné towers; Canonical divided powers on the Verschiebung
ideal of W_r(R); Dieudonné algebras and multiplicative quotients; Universal saturated de Rham–Witt
complex; Relative Frobenius–Verschiebung procomplexes; Initial relative de Rham–Witt complex;
Classical de Rham–Witt complex as the initial V-pro-complex; Continuous relative de Rham–Witt
complex; Nygaard filtration and divided Frobenius; Logarithmic Hodge–Witt sheaves.

Layer CR.3:duality: Proper smooth crystalline trace; Finite étale crystalline transfer and trace;
Proper smooth crystalline Gysin maps; Diagonal class and crystalline coevaluation.

Layer CR.5:log-algebra: Prelog rings; Étale log structures; Associated log structures; Inverse
image log structures; Characteristic monoids; Integral monoids; Fine monoids; Saturated monoids;
Log charts; Strict morphisms; Exact morphisms; Integral morphisms; Kummer morphisms; Kummer étale
morphisms; Log fiber products; Log smooth morphisms; Divisorial log structures; Log regular schemes; Integral
quasi-coherent log schemes; Vertical logarithmic morphisms; Log smoothness by fine models;
Valuation log structures and tilt charts; Log structures on semistable formal charts.

Layer CR.5: Logarithmic differentials; Log de Rham complexes; Absolute semistable residue maps;
Morphisms of Cartier type; Exactification of log immersions; Fine log PD envelopes; Quasi-coherent
log PD envelopes; Exact log PD thickenings; PD smooth log thickenings; Log crystalline sites;
Logarithmic crystals; Log PD stratifications; Integrable logarithmic connections; Logarithmic
quasi-nilpotence; Filtered logarithmic PD de Rham complexes; Derived p-adic log crystalline
cohomology; The induced log structure on A_cris.

Layer CR.6: Standard log Witt bases; Integral Hyodo–Kato complexes; Rational Hyodo–Kato complexes;
Hyodo–Kato Frobenius; Hyodo–Kato monodromy; Logarithmic de Rham–Witt complexes (canonical
restriction through the Frobenius-twisted Cartier intermediary, and the length-one Bockstein
differential); Finite-level log Witt quotient complexes; PD differential factorisation for the
log Witt comparison; Normalized
logarithms of units; Uniformizer-dependent Hyodo–Kato maps; Convergent logarithmic embedding complexes; Proper support on open analytic
tubes; Semistable logarithmic Witt models; Witt comparison maps with proper support.

Layer CR.7: Finite projective crystalline coefficients; Filtered Frobenius coefficients on
semistable models; Relative
crystalline direct images; Relative Gauss–Manin connections.

Layer CR.1 also includes `Crystalline.CrisFppfSite`, `Crystalline.CrisCompatibleSite`,
`Crystalline.CrisCompatibleEtaleSite` and `Crystalline.CrisCompatibleFppfSite`.
Crystalline.CrisFppfSite.group_sections takes a commutative group scheme G/X and gives the
abelian sheaf with sections G(U) on (U,T); the structure sheaf instead has sections on T.
Commutative p-divisible sheaves satisfy the same condition. The downstream internal Ext
construction is owned by AbelianSchemesAndArithmeticModuli §A4.CR.7.2.
Layer CR.6 includes log rigid Hyodo–Kato cohomology; Layer CR.5:log-algebra includes the classical
SNC Abhyankar theorem, compatible prime-to-residue-characteristic Kummer tower, universal tame
pro-cover and full tame fundamental group used in the logarithmic Abhyankar lemma. LocalPurity
§§2.1–2.2 supplies regular-local purity and codimension-two cover extension;
PurityOfBranchLocus §2.1 supplies pointwise branch purity at equal positive stalk dimensions, and
its §2.2 Scheme.Hom.etale_of_etaleAt_codimOne the global corollary for finite dominant generically
étale morphisms from normal integral to regular integral locally noetherian schemes.
CR.5:log-algebra.4's Crystalline.etale_of_genericallyEtale_codimOne is the componentwise adapter
to that corollary: a finite morphism from a normal scheme to a regular integral locally noetherian
scheme, with every source component dominant and generically étale and unramifiedness at every
codimension-one source point, is étale. Each component has a finite separable function-field
extension over the target. The adapter applies the supplied §2.2 theorem on each open and closed
normal integral component; that theorem handles dimension-zero stalks by generic étaleness.
A finite disjoint union of spectra of finite separable extensions of a field is finite étale,
with no codimension-one points on any component.
The inseparable extension F_p(t)[u]/(u^p-t) has no codimension-one points but is not étale.
For the SNC normalization the adapter invokes Scheme.Hom.etale_of_etaleAt_codimOne on every
component, which dominates the target and is generically étale since the normalization extends
a finite étale cover of the dense open.
AbhyankarLemma Layers 0–3 supplies
DVR tameness, DVR Abhyankar, codimension-one ramification and the regular-divisor theorem.
Log rigid Hyodo–Kato cohomology uses S† = Spwf(A₀[t]†), weak formal lifts, products and blow-ups,
and dagger generic fibres. The convergent comparison uses their adic completions over
Ŝ = Spf A₀⟨t⟩. The point lift is Z = S†, with t = 0 fibre Spf A₀.
The following README subsections also specify these APIs; they are names of mathematical
targets in the README, rather than declarations in this file.

CR.1.1 PD schemes and crystalline sites:
Crystalline.crisSiteMap_comp; Crystalline.cris_u_sections; Crystalline.cris_small_big;
Crystalline.cris_u_inverse_eval; Crystalline.etale_crystalline_site_toX;
Crystalline.etale_crystalline_site_structure; Crystalline.etale_crystalline_site_change;
Crystalline.crisStructure_eval; Crystalline.crisPDideal_kernel; Crystalline.crisPDideal_restrict;
Crystalline.crisSheaf_ofRestrictions; Crystalline.crisPDideal_pdPower.

CR.1.3 Differentials, connections and stratifications:
Crystalline evaluations on (X, Spec D_e) and the CR.2.3 formal coefficient comparison use
e ≥ e₀, with e₀ chosen so X factors through the finite base and the quotient PD structures
exist. Their ordinary and derived inverse limits are unchanged by restriction to this cofinal
range. For A = Z_p and I = (p²), the zero-variable example starts at e₀ = 2.
Crystalline.pdDifferentials_lift; Crystalline.pdDifferentials_dpow; Crystalline.pdDifferentials_map;
Crystalline.pdDifferentials_adjoin; Crystalline.pdDifferentials_quotient;
Crystalline.pdDifferentials_diagonal; Crystalline.pdDifferentials_completion.

CR.2.1 Crystalline cohomology and linearization:
Crystalline.RΓcrys_comp; Crystalline.RΓcrys_map; Crystalline.RΓcrys_limit.

CR.2.2 The Poincaré lemma and computation by embeddings:
Crystalline.linearization_eval; Crystalline.linearization_map;
Crystalline.linearization_augmentation; Crystalline.linearization_cohomology;
Crystalline.linearization_resolution; Crystalline.smooth_linearization_eval;
Crystalline.smooth_linearization_map; Crystalline.smooth_linearization_acyclic;
Crystalline.smooth_linearization_resolution.

CR.3.2 Base change and perfectness:
Crystalline.crysBaseChange_id; Crystalline.crysBaseChange_comp; Crystalline.crysBaseChange_natural.

CR.3.3 Products, Chern classes and the Leray spectral sequence:
Crystalline.crysChern_log; Crystalline.crysChern_add; Crystalline.crysChern_pullback;
Crystalline.crysChern_fil; Crystalline.crysChern_deRham; Crystalline.crysChern_reduction;
Crystalline.crysChern_hyperplane; Crystalline.crysCup_unit; Crystalline.crysCup_graded_comm;
Crystalline.crysCup_reduction; Crystalline.crysCup_assoc; Crystalline.crysCup_pullback;
Crystalline.crysCup_deRham; Crystalline.crysCup_external.
The cup product exists for arbitrary O_crys-modules E,F without flatness. crysCup_deRham
requires E,F to be quasi-coherent crystals, p nilpotent in A and a smooth lift Y of X over A;
it identifies the coefficient cup product with the wedge pairing on their de Rham complexes.
The multiplicative truncation Ω•_(X/S) → O_crys[0] and its coefficient analogues become
isomorphisms after Ru_*; invert these and compose with restriction to the thickening.
For X = Y = A¹_(F_p), J_crys evaluates to zero on Y but the connecting class of t in H¹(J_crys)
is nonzero and remains nonzero on cup product with 1.

CR.3.4 Frobenius:
Crystalline.crysFrobenius_semilinear; Crystalline.crysFrobenius_linearize;
Crystalline.crysFrobenius_lift; Crystalline.crysFrobenius_natural; Crystalline.crysFrobenius_cup;
Crystalline.crysFrobenius_chern; Crystalline.crysFrobenius_finite_field.

CR.4.1 Dieudonné complexes, saturation and décalage:
Crystalline.pDecalage_degree; Crystalline.pDecalage_d; Crystalline.pDecalage_map;
Crystalline.pDecalage_cohomology; Crystalline.pDecalage_filtered_colimit;
Crystalline.DieudonneComplex.F_zero; Crystalline.DieudonneComplex.F_add;
Crystalline.DieudonneComplex.d_F; Crystalline.DieudonneComplex.alphaF_ofAlpha;
Crystalline.DieudonneComplex.alphaF_natural; Crystalline.IsSaturated.p_injective;
Crystalline.IsSaturated.F_injective; Crystalline.IsSaturated.F_range;
Crystalline.DieudonneComplex.IsSaturated.smul_mem_range;
Crystalline.DieudonneComplex.F_verschiebung; Crystalline.DieudonneComplex.verschiebung_F;
Crystalline.DieudonneComplex.F_d_verschiebung; Crystalline.verschiebung_FV;
Crystalline.verschiebung_VF; Crystalline.verschiebung_d; Crystalline.verschiebung_FdV;
Crystalline.verschiebung_injective; Crystalline.pBockstein_lift; Crystalline.pBockstein_square;
Crystalline.pBockstein_decalage; Crystalline.derivedPDecalage_model;
Crystalline.derivedPDecalage_cohomology; Crystalline.derivedPDecalage_completion.

CR.4.2 The Verschiebung filtration and the finite quotients:
Crystalline.DieudonneComplex.vFiltration_zero; Crystalline.mem_vFiltration;
Crystalline.vFiltration_zero; Crystalline.vFiltration_antitone; Crystalline.vFiltration_d;
Crystalline.Wmk_surjective; Crystalline.Wmk_eq_zero; Crystalline.Wcomplex_d_mk;
Crystalline.Wprojection_apply; Crystalline.Wprojection_surjective; Crystalline.Wprojection_kernel;
Crystalline.Wrestriction_mk; Crystalline.Wrestriction_surjective;
Crystalline.Wprojection_restriction; Crystalline.WF_mk; Crystalline.WF_d;
Crystalline.WF_restriction; Crystalline.WV_mk; Crystalline.WV_d; Crystalline.WV_restriction.

CR.4.4 Inputs on Witt vectors:
Crystalline.truncatedFrobenius_truncate; Crystalline.truncatedVerschiebung_truncate;
Crystalline.truncatedVerschiebung_injective; Crystalline.truncatedFrobenius_V;
Crystalline.truncatedVerschiebung_projection; Crystalline.truncatedRestriction_kernel;
Crystalline.truncatedVerschiebung_F_charP; Crystalline.wittFrobenius_injective_of_reduced;
Crystalline.witt_p_torsionFree_of_reduced; Crystalline.wittVerschiebung_pow;
Crystalline.wittVerschiebungDividedPowers_dpow; Crystalline.wittVerschiebungDividedPowers_map;
Crystalline.wittVerschiebungDividedPowers_unique; Crystalline.wittVerschiebungDividedPowers_Fp.

CR.4.5 Dieudonné algebras and the saturated de Rham–Witt complex:
Crystalline.satDRW_lift; Crystalline.satDRW_degree0; Crystalline.satDRW_map;
Crystalline.satDRW_degree0_F; Crystalline.satDRW_unit; Crystalline.satDRW_residue_seminormal;
Crystalline.satDRW_red; Crystalline.satDRW_ofLift.

CR.4.6 The classical and the relative de Rham–Witt complex:
CR.4.6 constructs Crystalline.wittScheme r X for r ≥ 1 and p locally nilpotent on X,
with carrier (|X|, W_r(O_X)), functoriality, open restriction and composition.
Crystalline.wittScheme_affine; Crystalline.wittScheme_one; Crystalline.wittScheme_perfect.
The last identifies its perfect-scheme specialization with SchemeAndStackFoundations §0.26's
wittScheme. CR.4.6 owns Witt nilpotence and Teichmüller localization, the differential module
sheaves and descent on this carrier. CR.3:duality uses the same W_nX. At X=Spec F_p,
r=2 it is Spec Z/p²; at r=1 it is X; at X=Spec F_p[t] its principal open t≠0 has ring
W_r(F_p[t])[[t]⁻¹]=W_r(F_p[t,t⁻¹]). The polynomial ring F_p[t] is smooth but not perfect.
For X=Spec(Z/p²), which is not an F_p-scheme, the same constructor has W₁X=X;
W_r(Z/p²) satisfies p^(2r)=0 and has nilpotent projection kernel to Z/p².
Relative Frobenius–Verschiebung procomplexes for a specified A → R have W_r(A)-algebra maps
λ_r : W_r(R) → P_r⁰: λ_r composed with W_r(A → R) equals the specified coefficient map.
Restriction and F are over Witt restriction and Frobenius on A; V satisfies
V(F_A(a)·y) = a·V(y). Thus d composed with λ_r is a PD derivation over the specified W_r(A).
Crystalline.relativeDRW_lift and Crystalline.relativeDRW_lift_noRestriction both use this
algebra-map condition; the latter omits only restriction and its axioms, and its unique maps
are maps of differential graded W_r(A)-algebras.
The Check test_relativeWitt_base_compatibility takes A = R = F_p[t] and the usual
W_rΩ^*_(F_p[t]/F_p), with coefficients acting by evaluation t ↦ 0 and constant inclusion.
Its usual λ is not a W_r(A)-algebra map, so this tower is excluded from the relative category.
At length one a map from the degree-zero W_r(A) tower preserving λ and d would force dt = 0,
whereas Ω¹_(F_p[t]/F_p) is free on dt for every prime, including 2.
DiamondsAndVStacks D6.9 supplies the ring-level interface, in namespace DiamondsAndVStacks:
IsSeminormalRing (unique square/cube roots, Stacks 0EUL), IsSubintegral (ring maps),
subintegral_lift, subintegral_bijective_of_seminormal, snRing, snMap : R →+* snRing R,
snRing_seminormal, sn_lift and sn_compare. Crystalline.satDRW_residue_seminormal provides
IsSeminormalRing S_R. The degree-zero identification S_R ≃ snRing R and
Crystalline.cuspSeminormalComparison use these shared carriers and ring-map unit.
Rigidity uses a seminormal source and a reduced target. The cusp comparison identifies
snRing (F_p[t²,t³]) with F_p[t] compatibly with snMap, for every prime including 2 and 3.
The dual-number and purely inseparable field Checks distinguish the reflection from reduction
alone and from universal homeomorphisms with nontrivial residue-field extensions.
Structural properties of the classical complex on smooth F_p-algebras:
The saturation formula uses the corrected proof of Illusie I.3.21 in Illusie–Raynaud II.1.3,
p.125, as specified by Illusie's errata for p.579.
Crystalline.classicalDRW_injective; Crystalline.classicalDRW_saturated;
Crystalline.classicalDRW_restriction_kernel; Crystalline.classicalDRW_strict;
Crystalline.classicalDRW_derived_limit.
Crystalline.cuspSeminormalComparison;
Crystalline.relativeDRW_lift; Crystalline.relativeDRW_zero; Crystalline.relativeDRW_map;
Crystalline.relativeDRW_generated; Crystalline.relativeDRW_base_quotient;
Crystalline.relativeDRW_lift_noRestriction; Crystalline.classicalDRW_lift;
Crystalline.classicalDRW_zero; Crystalline.classicalDRW_one; Crystalline.classicalDRW_generated;
Crystalline.classicalDRW_map; Crystalline.classicalDRW_toRelative;
Crystalline.classicalDRW_lift_degreeZero; Crystalline.continuousWitt_eval;
Crystalline.continuousWitt_map; Crystalline.continuousWitt_operators;
Crystalline.continuousWitt_fromRelative.
The regular Noetherian F_p comparison proves regularity of F_p → R and consumes
SchemeAndStackFoundations §0.15 popescu_desingularization for a filtered presentation by
smooth algebras.

CR.4.7 Integral cohomological control:
Nygaard indices are integers. For a perfect F_p-algebra k, N^(≥i)W(k) = p^i W(k) for i ≥ 0,
and N^(≥i)W(k) = W(k) for i ≤ 0. The perfect-object Checks for derived Witt and quasiregular
semiperfect Witt control use the same nonnegative range for the formula p^i W(k).
In CR.DDR.5.21, test_acrys_structure_fp uses N^(≥i)ℤ_p = p^max(i,0)ℤ_p; at i = −1
this is ℤ_p, strictly smaller than p⁻¹ℤ_p in ℚ_p.
Crystalline.wittCohomology_bounded_torsion; Crystalline.wittCohomology_free_quotient;
Crystalline.wittCohomology_V_complete.

CR.6.4 Convergent embedding complexes and tube support:
For k perfect of characteristic p, W=W(k), K₀=W[1/p], and a fine finite-type log scheme
X/k^log, choose X^⋆ ↪ Z^⋆ over W[t]^log (chart 1 ↦ t). First form the log zero fibre
Y^⋆ = Z^⋆ ×_(W[t]^log) W^log (chart 1 ↦ 0); then complete Y^⋆ and use
T^⋆ = ]X^⋆[_(Y^⋆). With s:T^⋆ → X^⋆_ét and hypercover augmentation u,
C_rel = Ω^•_(Y^⋆/W^log) ⊗ O_(T^⋆) and
C_abs = Ω^•_(Z^⋆/W^triv) ⊗ O_(T^⋆) give Ru_*Rs_*C_rel and Ru_*Rs_*C_abs.
LogCrystalline.convergentLogComplex.relative;
LogCrystalline.convergentLogComplex.absolute;
LogCrystalline.convergentLogComplex.refinement;
LogCrystalline.convergentLogComplex.site_compare.
The last target uses separated affine embedding charts and their refinements, whose tubes
are Hausdorff strictly K₀-analytic. It identifies the Berkovich quasi-étale and adic étale
ringed topoi, analytic functions, g*, g_*, their unit, and specialization s and Rs_* through
the formal étale site. It transports support kernels on all module sheaves and bounded-below
complexes, their inclusions, special-fibre maps and the signed triangle and connecting N,
compatibly with common refinements and their cocycles. These local comparisons descend
without requiring X globally separated.
For U open in X, g:]X^⋆∖U^⋆[_(Y^⋆) ↪ T^⋆ gives f_!F=ker(F → g_*g*F),
with g*, g_* and f_! exact (DL Remark B.2). The supported realizations are
Ru_*Rs_*f_!C_rel and Ru_*Rs_*f_!C_abs on these same zero-fibre tubes.
LogCrystalline.tubeProperSupport.kernel; LogCrystalline.tubeProperSupport.whole;
LogCrystalline.tubeProperSupport.special_fibre_map.
For the standard log point over F_p, T=Sp K₀, the relative complex is K₀, and the absolute
complex adds K₀·dlog t in degree one, with zero differential. The tube formed in Z instead
is the open disc |t|<1, whose functions include nonconstant t, also for p=2.
For two points and U the first point, both sites give kernel K₀⊕0 of K₀² → K₀.
For U=X the specialization map is the identity; for U empty its source and target vanish.
The degree-q shifted injection is β ↦ (−1)^(q−1)β∧dlog t, identical under site transport.
PadicDifferentialEquationsAndRigidCohomology RD.4.42/RD.4.45 uses transport adapters of
this constant-coefficient core for TubeProperSupport and SupportedLogComplex.

CR.6.4 Sato’s homological de Rham–Witt complex:
Crystalline.SatoWitt.residue; Crystalline.SatoWitt.ordered_gr;
Crystalline.SatoWitt.absolute_map; Crystalline.SatoWitt.rational_compare.
The residue quotient is logarithmic absolute Witt forms modulo ordinary absolute Witt forms:
i_*W_rΞ^q_X ≃ W_rΩ^(q+1)_P(log X) / W_rΩ^(q+1)_P.
Rigid cohomology of smooth strata:
Crystalline.smoothStratumRigid.frame_independence; Crystalline.smoothStratumRigid.finiteDimensional;
Crystalline.smoothStratumRigid.frobenius; Crystalline.smoothStratumRigid.proper_comparison.

CR.6.5 Log rigid Hyodo–Kato cohomology:
logRigidHK_cycle uses k=F_q, A₀=W(k), the linear q-power Frobenius, and two copies of P¹_k
meeting transversely at two distinct k-rational nodes. H¹ has eigenvalues 1 and q;
N maps the q-eigenline isomorphically onto the 1-eigenline, so Nφ=qφN.
Over F₃, gluing instead along the degree-two points t²+1 and t²+t+2 gives four geometric
nodes, b₁=3 and two three-dimensional weight pieces, hence dim H¹=6.
For a split Tate curve with v_K(q)=2, the minimal regular model has two k-rational nodes;
the semilinear p-power Frobenius has φ(e₀)=e₀, φ(e₁)=pe₁ and N(e₁)=2e₀, N(e₀)=0.

CR.3:duality.1 The trace, duality and Gysin maps:
For n ≥ 1, write σ_*^r M for restriction of scalars with a • m = σ^r(a)m.
Coefficient-linear inverse Cartier is W_nΩ^d ≃ σ_*^n H^d(W_nΩ^•).
The top-cohomology projection, inverse Cartier, Ekedahl sheaf trace and coherent counit give
t_tw,n : σ_*^n RΓ_crys(X/W_n) → W_n[−2d]. Applying σ_*^(−n), then the linear map
σ_*^(−n)W_n → W_n with underlying map σ^n, gives the W_n-linear Tr^Ek_(X,n).
On underlying top-degree classes, ρ(t_tw,n(x)) = σ^(−1)(t_tw,n−1(r_n(x))) for n ≥ 2,
so the transported traces commute with Witt reduction. At n = 1 over F_(p²), the underlying
t_tw,1(a) = σ^(−1)(a) is transported to a, giving the identity trace of the point.
cechTraceSign_add; Crystalline.crysTrace_projective; Crystalline.crysTrace_reduction;
Crystalline.crysTrace_etale_local; Crystalline.crysTrace_iso; Crystalline.crysTrace_ekedahl;
Crystalline.crysTrace_frobenius; Crystalline.crysTrace_product;
Crystalline.finiteEtaleTransfer_scalar; Crystalline.finiteEtaleTransfer_projection;
Crystalline.finiteEtaleTransfer_trace; Crystalline.crysGysin_comp; Crystalline.crysGysin_projection;
Crystalline.crysGysin_trace; Crystalline.crysGysin_adjoint; Crystalline.crysGysin_frobenius;
Crystalline.crysDiagonal_action; Crystalline.crysDiagonal_triangles;
Crystalline.crysDiagonal_projective.

CR.5:log-algebra.1 Prelog rings, log structures and charts:
LogCrystalline.PrelogRing.hom_ext; LogCrystalline.PrelogRing.map_comp;
LogCrystalline.IsFineMonoid.finite_generators; LogCrystalline.IsSaturatedMonoid.root_closed;
LogCrystalline.IsSaturatedMonoid.saturation_lift; LogCrystalline.IsSaturatedMonoid.fs_integral.
CR.5:log-algebra.2–3 Kummer morphisms and Kummer étale morphisms:
LogCrystalline.IsKummer.identity; LogCrystalline.IsKummerEtale.kummer;
LogCrystalline.IsKummerEtale.logEtale; LogCrystalline.IsKummerEtale.root_chart.
SchemeAndStackFoundations §0.29 supplies absoluteFrobenius, schemeFrobeniusTwist and
relativeFrobenius. EnhancedDerivedSheaves §E2:towers.1 supplies derivedTowerLimit;
§E2.2 supplies IsReplete.derived_limits and IsReplete.milnor.

CR.5.1 Logarithmic differentials and log de Rham complexes:
DerivedDeRhamCohomology §6.20 owns the universal affine log differential module, identified by
DerivedDeRham.logCotangentH0 with H⁰ of DerivedDeRham.gabberLogCotangent, and the ordinary
exterior log dg construction used on its free prelog resolutions. CR.5.1 sheafifies these same
objects, with natural affine-chart identifications preserving d, dlog, exterior products and
the differential, compatibly with logification and canonical base-change maps. The quotient
formula presents the supplied module. CR.5.1 owns the geometric, residue, continuous and
coefficient extensions. The ordinary chart complex is distinct from the realized raw derived
log de Rham complex on general inputs.
The semistable example B = W[x,y]/(xy − p), W = W(k), uses the base
W_p^log = (Spec W, ℕ → W, 1 ↦ p). Its relative logarithmic differential module is
B·dlog x, with dlog y = −dlog x. The standard W^log carries the chart 1 ↦ 0.

CR.DDR.5.8–5.9 base-linear realization and lci comparison:
For n ≥ 1 and lci maps of flat Z/p^n-schemes, the source of
DerivedDeRham.lciCrystallineComparison and crystallineComparisonSheaf is
DerivedDeRhamCohomology §5.8.1's rawLciDeRhamSheaves, with rawLciDeRhamAffine,
rawLciDeRhamLocalization, rawLciDeRhamRealization and rawLciDeRhamCup. The common
baseLinearSheafDerived.crystallineComparison adapter transports these raw objects and the
separate completed objects of §5.8. For F_p[t] → F_p the raw source is the direct sum of
PD degrees; its Hodge completion is the product. CR.DDR.5.10 takes the p-adic derived limit
of these raw finite-level comparisons.

CR.5.5 The induced log structure on A_cris:
For K complete discretely valued of characteristic zero with perfect residue field of
characteristic p, let C=C_K be PadicPeriodRings §2's completed algebraic closure.
LogCrystalline.aCrisLog.finite_lift, LogCrystalline.aCrisLog.frobenius and
LogCrystalline.aCrisLog.fine_chart_comparison use the completed periodPDEnvelope of
PadicPeriodRings §3, its θ_cris and §4.1 Frobenius, identified with the general envelope by
DerivedDeRhamCohomology §PD.7 Crystalline.fontaineEnvelope_periodPDEnvelope. The characteristic
is Q≥0 with v(p)=1; the chart comparison uses semistable models over finite extensions of K.

CR.DDR.6.1–6.2, 6.4–6.5, 6.7, 6.9–6.10 consume DerivedDeRhamCohomology §6.20:
DerivedDeRham.freePrelogResolutions, freePrelogUniversal, prelogResolutionAugmentation,
prelogResolutionComparison, prelogHomotopyPushout, gabberLogCotangent, logCotangentH0,
logCotangentOrdinaryMap, logCotangentNaturality, logCotangentFunctoriality,
logDerivedDeRham, logDeRhamDLog, logDeRhamOrdinaryMap, logDeRhamHodgeGraded,
logDeRhamStrict, logDeRhamCompletions, logCartier and logificationBoundaries.
The prelog category is supplied there independently of the geometric log layer here;
LogCrystalline.PrelogRing presents its fixed-ring chart data. The local targets are the
derivation and extension classifiers, integral log smooth comparison, crystalline comparisons,
relative filtrations and descent on these same public objects and maps.
CR.DDR.6.12's DerivedDeRham.logCrystallineIntegralResolution takes n ≥ 1 and integral source
and target chart monoids over Z/p^n. Free terms have integral monoid M ⊕ ℕ^(S_i);
their logifications and the source logification are integral quasi-coherent. The zero base PD
ideal extends to source and ambient. The source-preserving envelopes are coordinate PD smooth
objects of CR.5.3's site, functorial by their universal property. On fine models exactification
precedes the strict PD envelope; the quasi-coherent construction descends these fine models.
DerivedDeRham.logCrystallineComparisonMap and logCrystallineComparisonNatural,
logCrystallineComparisonFiltered, logCrystallineComparisonStrict and
logCrystallineComparisonExactification all use this integral-chart range and n ≥ 1;
naturality squares have four integral chart monoids. The identity comparison has an integral
chart. LogCrystalline.idempotentChart_boundary is the excluded nonintegral log-ring example.
CR.DDR.6.13's DerivedDeRham.correctedLogLciCondition requires integral charts M, Q and N,
flat source and target over Z/p^n, an integral log smooth Cartier-type first factor modulo p,
and a strict finite regular quotient as second factor. correctedGLciFactorization,
correctedGLciStrictRegular, correctedGLciLocalFiltered and correctedGLciExample721 retain
these hypotheses. Filtered colimits of integral charts are integral.
CR.DDR.6.14's DerivedDeRham.logLciCrystallineComparison uses this same domain; its p-adic form
uses compatible flat finite reductions with integral charts and compatible factorizations.
DerivedDeRham.periodLogSpecialization and periodLogComparisonData specialize these constructors;
§6.21's periodDLogCanonical applies to this logDeRhamDLog. The ordinary-to-log maps,
transitivity boundary ψ, products, Hodge filtrations, conjugate filtrations on reductions,
p-completion and Galois/valued-embedding functoriality are those of the supplied §6.20 maps,
including p = 2 and arbitrary perfect residue fields.

CR.6.1 Logarithmic de Rham–Witt complexes and their crystalline model:
LogCrystalline.logDeRhamWitt.restriction; LogCrystalline.logWittQuotient;
LogCrystalline.logWittPDDifferentials.

CR.6.2 Normalized logarithms of units:
For a complete mixed-characteristic DVR with perfect residue field and fraction field K,
the norm with |p| = p⁻¹ makes K a complete normed ℚ_p-field. The normalized unit logarithm is
NormedSpace.logOneAdd K K (u / [ū] - 1), using the supplied multiplicative representatives.
PadicFunctionalAnalysis §4.5 supplies the principal-unit convergence and logarithm laws;
CR.6.2 supplies the Teichmüller normalization and Hyodo–Kato change-of-uniformizer application.
The domain includes p = 2 and infinite perfect residue fields.

-/

end TauCetiRoadmap.CrystallineCohomology
