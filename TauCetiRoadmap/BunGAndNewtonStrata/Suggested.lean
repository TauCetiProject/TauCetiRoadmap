import Mathlib
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Weight

/-!
# BunGAndNewtonStrata: representative target signatures

The roadmap is the accompanying `README.md`; this file records light definitions and
representative statements that can be made against the pinned Mathlib and Tau Ceti APIs,
and it is not exhaustive. Bun_G, its strata, its charts and the reductive classification
of B(G) are specified in the README, including the geometric supplier contracts.

Design choices made explicit here:
* arithmetic Frobenius acts on a representative `b` by twisted conjugation
  `b ↦ g * b * σ(g)⁻¹`, and the orbit set `SigmaClass` forgets stabilizers, which
  `SigmaCentralizer.points` keeps;
* the Kottwitz invariant is valued in integral coinvariants
  (`Representation.Coinvariants`), so torsion is never rationalized;
* numerical GL_n slope data record decreasing slopes, the integral total and the
  divisibility of each slope multiplicity by its denominator;
* the Witt-vector rank-one case has an algebraically closed residue field and uses
  the uniformizer `p`.
-/

noncomputable section
namespace TauCetiRoadmap.BunGAndNewtonStrata
universe u v w

/-! ## Layer 0: G-bundles, G-isocrystals and the set B(G) -/

section TwistedGroup
variable {G : Type u} [Group G]

/-- Arithmetic twisted conjugation of a representative. -/
def twistedConjugate (sigma : G ≃* G) (g b : G) : G := g * b * (sigma g)⁻¹

example (sigma : G ≃* G) (b : G) : twistedConjugate sigma 1 b = b := by
  simp [twistedConjugate]
example (g b : G) : twistedConjugate (MulEquiv.refl G) g b = g * b * g⁻¹ := by
  rfl

/-- Composing twisted actions multiplies the later conjugator on the left. -/
theorem twistedConjugate_comp (sigma : G ≃* G) (b g h : G) :
    twistedConjugate sigma h (twistedConjugate sigma g b) =
      twistedConjugate sigma (h * g) b := by sorry

/-- Reversing conjugator order fails already in the permutation group on three points. -/
theorem twistedConjugate_reverse_order_fails :
    ∃ b g h : Equiv.Perm (Fin 3),
      twistedConjugate (MulEquiv.refl _) h (twistedConjugate (MulEquiv.refl _) g b) ≠
        twistedConjugate (MulEquiv.refl _) (g * h) b := by sorry

/-- The equivalence relation for changing a Frobenius trivialization. -/
def sigmaSetoid (sigma : G ≃* G) : Setoid G where
  r b c := ∃ g : G, c = twistedConjugate sigma g b
  iseqv := by
    refine ⟨?_, ?_, ?_⟩
    · intro b
      exact ⟨1, by simp [twistedConjugate]⟩
    · rintro b c ⟨g, rfl⟩
      refine ⟨g⁻¹, ?_⟩
      simp [twistedConjugate, mul_assoc]
    · rintro b c d ⟨g, rfl⟩ ⟨h, rfl⟩
      refine ⟨h * g, ?_⟩
      simp [twistedConjugate, mul_assoc]

/-- Orbit classes of representatives; this set does not retain automorphisms. -/
def SigmaClass (sigma : G ≃* G) := Quotient (sigmaSetoid sigma)

namespace SigmaClass
/-- The class of a representative. -/
def mk (sigma : G ≃* G) (b : G) : SigmaClass sigma :=
  Quotient.mk (sigmaSetoid sigma) b

/-- Equality in the orbit set is existence of a twisted conjugator. -/
theorem mk_eq_iff (sigma : G ≃* G) (b c : G) :
    mk sigma b = mk sigma c ↔ ∃ g, c = g * b * (sigma g)⁻¹ := by sorry

end SigmaClass

end TwistedGroup

namespace WittRankOne
variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]

/-- The unramified Witt coefficient field. -/
abbrev Coefficients := FractionRing (WittVector p k)

/-- Arithmetic Frobenius on Witt coefficient units. -/
abbrev sigma := Units.mapEquiv (WittVector.FractionRing.frobenius p k).toMulEquiv

/-- The uniformizer, viewed as a unit of the fraction field. -/
def uniformizer : (Coefficients p k)ˣ :=
  Units.mk0 (p : Coefficients p k) (WittVector.FractionRing.p_nonzero p k)

example : sigma p k (uniformizer p k) = uniformizer p k := by
  ext
  simp [sigma, uniformizer]

/-- Rank-one classification normalized by the positive valuation of p. -/
theorem classification :
    ∃ e : SigmaClass (sigma p k) ≃ ℤ,
      ∀ m : ℤ, e (SigmaClass.mk (sigma p k) (uniformizer p k ^ m)) = m := by sorry

/-- The classes of the unit and the positive uniformizer are distinct. -/
theorem one_ne_uniformizer : SigmaClass.mk (sigma p k) 1 ≠
    SigmaClass.mk (sigma p k) (uniformizer p k) := by sorry

/-- The positive and negative uniformizer classes have opposite nonzero slopes. -/
theorem uniformizer_ne_inv : SigmaClass.mk (sigma p k) (uniformizer p k) ≠
    SigmaClass.mk (sigma p k) (uniformizer p k)⁻¹ := by sorry
end WittRankOne

/-! ## Layer 1: Newton and Kottwitz invariants, centralizers and acceptable classes -/

section TwistedGroupInvariants
variable {G : Type u} [Group G]

namespace SigmaCentralizer
/-- The point stabilizer, before algebraic representability and descent. -/
def points (sigma : G ≃* G) (b : G) : Subgroup G where
  carrier := {g | g * b = b * sigma g}
  one_mem' := by simp
  mul_mem' := by
    intro g h hg hh
    change (g * h) * b = b * sigma (g * h)
    rw [map_mul, mul_assoc, hh, ← mul_assoc, hg, mul_assoc]
  inv_mem' := by
    intro g hg
    change g⁻¹ * b = b * sigma g⁻¹
    rw [map_inv, eq_mul_inv_iff_mul_eq, mul_assoc, ← hg, inv_mul_cancel_left]

/-- A representative change conjugates the stabilizer by the same element. -/
theorem conjugate_points (sigma : G ≃* G) (b g h : G) :
    h ∈ points sigma b ↔
      g * h * g⁻¹ ∈ points sigma (twistedConjugate sigma g b) := by sorry

example (sigma : G ≃* G) (g : G) :
    g ∈ points sigma 1 ↔ sigma g = g := by
  change g * 1 = 1 * sigma g ↔ sigma g = g
  simp [eq_comm]
example : points (MulEquiv.refl G) (1 : G) = ⊤ := by
  ext g
  simp [points]
end SigmaCentralizer

/-- The ordered product of exactly r Frobenius translates. -/
def frobeniusNorm (sigma : G ≃* G) (b : G) : ℕ → G
  | 0 => 1
  | r + 1 => frobeniusNorm sigma b r * ((sigma : G → G)^[r]) b

/-- The positive-period equation underlying decency, without Newton integrality. -/
def decencyEquation (sigma : G ≃* G) (b a : G) (r : ℕ) : Prop :=
  0 < r ∧ frobeniusNorm sigma b r = a

/-- The norm of a twisted conjugate uses the r-th Frobenius iterate at its endpoint. -/
theorem frobeniusNorm_twisted (sigma : G ≃* G) (b g : G) (r : ℕ) :
    frobeniusNorm sigma (twistedConjugate sigma g b) r =
      g * frobeniusNorm sigma b r * (((sigma : G → G)^[r]) g)⁻¹ := by sorry

example (sigma : G ≃* G) (b : G) : frobeniusNorm sigma b 1 = b := by
  simp [frobeniusNorm]
example (sigma : G ≃* G) (b : G) :
    frobeniusNorm sigma b 2 = b * sigma b := by
  simp [frobeniusNorm]
example (sigma : G ≃* G) (b a : G) : ¬ decencyEquation sigma b a 0 := by
  simp [decencyEquation]
example (sigma : G ≃* G) (b a : G) :
    decencyEquation sigma b a 1 ↔ b = a := by
  simp [decencyEquation, frobeniusNorm]
end TwistedGroupInvariants

namespace WittRankOne
variable (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [IsAlgClosed k] [CharP k p]

/-- The r-factor Frobenius norm of the fixed uniformizer is its r-th power. -/
theorem norm_uniformizer (r : ℕ) :
    frobeniusNorm (sigma p k) (uniformizer p k) r = uniformizer p k ^ r := by sorry
end WittRankOne

/-- Numerical GL_n slope data; each denominator divides its multiplicity. -/
structure GLnSlopeData (n : ℕ) where
  slopes : Fin n → ℚ
  descending : Antitone slopes
  kottwitz : ℤ
  total_eq : (∑ i, slopes i) = (kottwitz : ℚ)
  denominatorMultiplicity : ∀ i, (slopes i).den ∣
    (Finset.univ.filter (fun j => slopes j = slopes i)).card

namespace GLnSlopeData
/-- Dominance includes equality of the integral determinant invariant. -/
def dominance {n : ℕ} (x y : GLnSlopeData n) : Prop :=
  x.kottwitz = y.kottwitz ∧ ∀ k : ℕ, k ≤ n →
    (∑ i : Fin n, if i.val < k then x.slopes i else 0) ≤
    (∑ i : Fin n, if i.val < k then y.slopes i else 0)

/-- Basic GL_n data has constant standard-representation slope. -/
def basic {n : ℕ} (x : GLnSlopeData n) : Prop := ∀ i j, x.slopes i = x.slopes j

/-- Numerical acceptability for a prescribed slope bound. -/
def acceptable {n : ℕ} (x mu : GLnSlopeData n) : Prop := dominance x mu

/-- The ordinary numerical class attains the prescribed Hodge slopes. -/
def ordinary {n : ℕ} (x mu : GLnSlopeData n) : Prop :=
  acceptable x mu ∧ x.slopes = mu.slopes

/-- The rank-two basic slope one-half datum. -/
def half : GLnSlopeData 2 where
  slopes := fun _ => 1/2
  descending := fun _ _ _ => le_rfl
  kottwitz := 1
  total_eq := by norm_num [Fin.sum_univ_two]
  denominatorMultiplicity := by intro i; norm_num

/-- The rank-two ordinary slopes one and zero. -/
def split : GLnSlopeData 2 where
  slopes := fun i => if i = 0 then 1 else 0
  descending := by decide
  kottwitz := 1
  total_eq := by norm_num [Fin.sum_univ_two]
  denominatorMultiplicity := by intro i; split_ifs <;> norm_num

/-- The slope-zero datum in any rank, including rank zero. -/
def zero (n : ℕ) : GLnSlopeData n where
  slopes := fun _ => 0
  descending := fun _ _ _ => le_rfl
  kottwitz := 0
  total_eq := by simp
  denominatorMultiplicity := by intro i; simp

/-- Dominance is antisymmetric on descending, integral slope data. -/
theorem dominance_antisymm {n : ℕ} (x y : GLnSlopeData n)
    (hxy : dominance x y) (hyx : dominance y x) : x = y := by sorry

example : dominance half split ∧ ¬ dominance split half := by
  constructor
  · refine ⟨rfl, ?_⟩
    intro k hk
    interval_cases k <;> norm_num [half, split, Fin.sum_univ_two]
  · intro h
    have hfirst := h.2 1 (by omega)
    norm_num [half, split, Fin.sum_univ_two] at hfirst
example : basic half ∧ ¬ basic split := by
  constructor
  · intro i j
    rfl
  · intro h
    have hfirst := h 0 1
    norm_num [split] at hfirst
/-- The split datum is ordinary for its own bound, whereas the half datum is not. -/
theorem ordinary_split_and_not_half : ordinary split split ∧ ¬ ordinary half split := by sorry
example : basic (zero 0) ∧ ordinary (zero 0) (zero 0) := by
  constructor
  · intro i
    exact Fin.elim0 i
  · exact ⟨⟨rfl, fun _ _ => le_rfl⟩, rfl⟩
/-- A slope of denominator two cannot occur with multiplicity one. -/
theorem rank_one_half_impossible :
    ¬ ∃ x : GLnSlopeData 1, x.slopes 0 = (1/2 : ℚ) := by sorry

/-- Three copies of slope one-third give valid integral slope data of total one. -/
theorem third_exists :
    ∃ x : GLnSlopeData 3, (∀ i, x.slopes i = (1/3 : ℚ)) ∧ x.kottwitz = 1 := by sorry

/-- Rank-one slopes zero and one are incomparable because their totals differ. -/
theorem rank_one_zero_one_incomparable :
    ∃ x y : GLnSlopeData 1, x.slopes 0 = 0 ∧ y.slopes 0 = 1 ∧
      ¬ dominance x y ∧ ¬ dominance y x := by sorry

/-- In positive rank the zero datum differs from every nonzero constant-slope datum. -/
theorem zero_ne_nonzero_constant {n : ℕ} (hn : 0 < n) (x : GLnSlopeData n)
    (q : ℚ) (hq : q ≠ 0) (h : ∀ i, x.slopes i = q) : zero n ≠ x := by sorry

/-- Integral total does not suffice when a slope denominator fails multiplicity divisibility. -/
theorem two_thirds_one_third_impossible :
    ¬ ∃ x : GLnSlopeData 2, x.slopes 0 = (2/3 : ℚ) ∧ x.slopes 1 = (1/3 : ℚ) := by sorry

/-- Descending slope data cannot have the ascending pair zero and one. -/
theorem ascending_pair_impossible :
    ¬ ∃ x : GLnSlopeData 2, x.slopes 0 = 0 ∧ x.slopes 1 = 1 := by sorry

/-- A first slope of two exceeds the split bound despite the matching total. -/
theorem two_neg_one_not_acceptable (x : GLnSlopeData 2)
    (hfirst : x.slopes 0 = 2) (hsecond : x.slopes 1 = -1) :
    ¬ acceptable x split := by sorry

/-- Numerical ordinarity allows the half datum as its own bound. -/
theorem half_ordinary_self : ordinary half half := by sorry
end GLnSlopeData

namespace SlopeProtorus
open CategoryTheory
variable (E : Type u) [Field E]

/-- Coordinate Hopf algebra of D(Q), with no finite-type claim. -/
abbrev coordinates : CommHopfAlgCat.{max u 0} E :=
  CommHopfAlgCat.of E (MonoidAlgebra E (Multiplicative ℚ))

/-- The slope-q map D(Q) to G_m on coordinate algebras. -/
def character (q : ℚ) :
    MonoidAlgebra E (Multiplicative ℤ) →ₐc[E] MonoidAlgebra E (Multiplicative ℚ) :=
  MonoidAlgebra.mapDomainBialgHom E (AddMonoidHom.toMultiplicative
    { toFun := fun n : ℤ => (n : ℚ) * q
      map_zero' := by simp
      map_add' := by intro m n; push_cast; ring })

/-- The rational weights of a finite representation have a common denominator. -/
theorem common_denominator
    {H : Type v} [CommRing H] [HopfAlgebra E H]
    (V : Type w) [AddCommGroup V] [Module E V] [TauCeti.Comodule E H V] [Module.Finite E V]
    (nu : H →ₐc[E] MonoidAlgebra E (Multiplicative ℚ)) :
    ∃ n : ℕ, 0 < n ∧ ∀ q : ℚ,
      TauCeti.DiagonalizableGroup.weightSpace V
        (nu : H →ₗc[E] MonoidAlgebra E (Multiplicative ℚ)) (Multiplicative.ofAdd q) ≠ ⊥ →
      ∃ m : ℤ, (n : ℚ) * q = (m : ℚ) := by sorry

example : character E (1/2)
    (MonoidAlgebra.single (Multiplicative.ofAdd (2 : ℤ)) (1 : E)) =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℚ)) (1 : E) := by
  simp [character, MonoidAlgebra.mapDomainBialgHom_single]
example (n : ℤ) : character E 0
    (MonoidAlgebra.single (Multiplicative.ofAdd n) (1 : E)) = 1 := by
  simp [character, MonoidAlgebra.mapDomainBialgHom_single, MonoidAlgebra.one_def]
/-- The rational half-slope does not come from an integral cocharacter. -/
theorem half_not_integral (n : ℤ) :
    character E (1/2) ≠ character E (n : ℚ) := by sorry
end SlopeProtorus

namespace KottwitzDescent
variable {G : Type u} [Group G] {A : Type v} [AddCommGroup A]

/-- The integral cyclic representation generated by Frobenius. -/
def cyclicRepresentation (tau : A ≃+ A) : Representation ℤ (Multiplicative ℤ) A where
  toFun n := (tau.toIntLinearEquiv ^ n.toAdd).toLinearMap
  map_one' := by ext a; simp
  map_mul' := by
    intro m n
    simp [zpow_add]

/-- Integral coinvariants of the cyclic action, retaining their torsion. -/
abbrev Target (tau : A ≃+ A) := Representation.Coinvariants (cyclicRepresentation tau)

/-- A Frobenius-equivariant homomorphism, without a reductive classification axiom. -/
structure Data (sigma : G ≃* G) (tau : A ≃+ A) where
  representative : G →* Multiplicative A
  frobenius : ∀ g, (representative (sigma g)).toAdd = tau (representative g).toAdd

/-- Equivariant representative invariants descend uniquely through twisted conjugacy. -/
theorem descent (sigma : G ≃* G) (tau : A ≃+ A) (d : Data sigma tau) :
    ∃! f : SigmaClass sigma → Target tau,
      ∀ b, f (SigmaClass.mk sigma b) =
        Representation.Coinvariants.mk (cyclicRepresentation tau)
          (d.representative b).toAdd := by sorry

/-- Abelian twisted conjugacy is exactly the integral cyclic coinvariant quotient. -/
theorem abelian_classification (tau : A ≃+ A) :
    ∃ e : SigmaClass (AddEquiv.toMultiplicative tau) ≃ Target tau,
      ∀ a : A, e (SigmaClass.mk (AddEquiv.toMultiplicative tau) (Multiplicative.ofAdd a)) =
        Representation.Coinvariants.mk (cyclicRepresentation tau) a := by sorry

example (tau : A ≃+ A) (a : A) :
    cyclicRepresentation tau (Multiplicative.ofAdd 1) a = tau a := by
  simp [cyclicRepresentation]
example (n : ℤ) (a : A) :
    cyclicRepresentation (AddEquiv.refl A) (Multiplicative.ofAdd n) a = a := by
  have h : (AddEquiv.refl A).toIntLinearEquiv = 1 := by
    ext x
    rfl
  simp [cyclicRepresentation, h]
/-- Sign Frobenius on the integers retains distinct odd and even twisted classes. -/
theorem sign_class_zero_ne_one :
    SigmaClass.mk (AddEquiv.toMultiplicative (AddEquiv.neg ℤ)) (Multiplicative.ofAdd 0) ≠
      SigmaClass.mk (AddEquiv.toMultiplicative (AddEquiv.neg ℤ)) (Multiplicative.ofAdd 1) :=
  by sorry

/-- Sign Frobenius identifies the twisted classes represented by two and zero. -/
theorem sign_class_two_eq_zero :
    SigmaClass.mk (AddEquiv.toMultiplicative (AddEquiv.neg ℤ)) (Multiplicative.ofAdd 2) =
      SigmaClass.mk (AddEquiv.toMultiplicative (AddEquiv.neg ℤ)) (Multiplicative.ofAdd 0) :=
  by sorry
end KottwitzDescent

/-- The affine solution fibre of Frobenius minus identity for an integral difference. -/
def ComponentCoset {A : Type u} [AddCommGroup A] (tau : A ≃+ A) (difference : A) : Set A :=
  {x | tau x - x = difference}

namespace ComponentCoset
/-- A nonempty difference fibre is a translate of the fixed subgroup. -/
theorem translate {A : Type u} [AddCommGroup A] (tau : A ≃+ A) (difference x : A)
    (hx : x ∈ ComponentCoset tau difference) :
    ComponentCoset tau difference = {y | ∃ z : A, tau z = z ∧ y = x + z} := by sorry

example : ComponentCoset (AddEquiv.neg ℤ) 2 = {(-1 : ℤ)} := by
  apply Set.ext
  intro x
  change -x - x = 2 ↔ x = -1
  omega
example : ComponentCoset (AddEquiv.neg ℤ) 1 = ∅ := by
  apply Set.ext
  intro x
  change (-x - x : ℤ) = 1 ↔ False
  constructor
  · intro h
    have hmod := congrArg (fun z : ℤ => z % 2) h
    omega
  · exact False.elim

/-- Sign coinvariants have two elements; rational averaging would lose their torsion. -/
theorem sign_coinvariants :
    ∃ e : KottwitzDescent.Target (AddEquiv.neg ℤ) ≃+ ZMod 2,
      ∀ a : ℤ, e (Representation.Coinvariants.mk
        (KottwitzDescent.cyclicRepresentation (AddEquiv.neg ℤ)) a) = (a : ZMod 2) := by sorry

/-- The sign-action integral quotient distinguishes odd from even classes. -/
theorem sign_zero_ne_one :
    Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation (AddEquiv.neg ℤ)) 0 ≠
    Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation (AddEquiv.neg ℤ)) 1 := by sorry
/-- The sign relation kills twice the generator. -/
theorem sign_two_eq_zero :
    Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation (AddEquiv.neg ℤ)) 2 =
    Representation.Coinvariants.mk (KottwitzDescent.cyclicRepresentation (AddEquiv.neg ℤ)) 0 := by sorry
end ComponentCoset

/-! ## Layer 2: the stack Bun_G, its points, uniformization and topology

G-bundles on the relative curve, Bun_G, the classification of its points, uniformization
and its topology are specified in the README. The two statements below are the
discriminating controls for the descent of families of G-isocrystals: an effective lattice
bound must involve the Frobenius denominator, and a lift in an ambient linear group need not
preserve the defining tensors.
-/

namespace FamilyDescentControls
variable {R K : Type u} [CommRing R] [Field K] [Algebra R K]

/-- A stable over-lattice cannot satisfy a bound excluding its shear coefficient. -/
theorem shear_violates_bound (sigma : K ≃+* K) (a scale : K)
    (hnonintegral : scale * a ∉ Set.range (algebraMap R K)) :
    ¬ ∃ M : Submodule R (Fin 2 → K),
      ![0, 1] ∈ M ∧
      (∀ x ∈ M, ![sigma (x 0) + a * sigma (x 1), sigma (x 1)] ∈ M) ∧
      (∀ x ∈ M, scale * x 0 ∈ Set.range (algebraMap R K)) := by sorry

/-- An ambient linear lift need not preserve the tensors of the norm-one torus.
This does not refute existence of a different lift in the smaller group. -/
theorem ambient_lift_not_tensor_lift :
    (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ![1, 1] = ![2, 1 / 2] ∧
    Function.Bijective (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ∧
    ∀ t : ℚˣ,
      (fun x : Fin 2 → ℚ => ![2 * x 0, -(x 0) / 2 + x 1]) ≠
      (fun x : Fin 2 → ℚ => ![(t : ℚ) * x 0, ((t⁻¹ : ℚˣ) : ℚ) * x 1]) := by sorry
end FamilyDescentControls

/-! ## Layer 3: automorphism groups, Newton strata and the smooth Artin stack

HN-graded bundles, the filtered and full automorphism groups, Newton strata as classifying
stacks, flag Newton strata, smoothness and connected components are specified in the README.
Basicness means a central Newton morphism; it does not force a single slope in every
representation.
-/

/-! ## Layer 4: filtered charts and specialization

The charts M_b, their negative Banach–Colmez towers, split sections, contracting actions and
the Jacobian positivity are specified in the README.
-/

/- Further README targets, not stated here: GBundle, GIsocrystal, the relative tensor torsors
and filtered tensor functors, PureInnerTwist, GIsocrystalFamily, PiOneTransport, continuous
Weil cohomology of crossed modules, NewtonSpace, HodgeInvariants, Invariants,
DecentRepresentative, SigmaCentralizer as a reductive group, Defect, Basic, NewtonOrder,
Acceptable, Ordinary, TorusSpecial, RationalNewtonWitness, AbelianizedClass,
BasicInnerFormEquivalence, DivisionAlgebraMorita, CentralNewtonOnJ, CurveEtaleBase, Bun,
BoundaryPeriodSpace and its bundle comparisons, HNGraded, FilteredAutomorphism,
FullAutomorphism, Semistable, TorusPicard, FlagNewton and FilteredChart. -/

/- The README specifies the following further API with its full hypotheses:
§0.6: SigmaClass.representative_hom_iff and
SigmaClass.wittGmSlopeEquiv_uniformizer.
§1.4: SlopeProtorus.toTorus_generator and SlopeProtorus.map_apply.
§1.8: KottwitzDescent.cyclicRepresentation_generator,
KottwitzDescent.ker_eq_range, KottwitzDescent.representative_twisted,
KottwitzDescent.representativeClass_twisted, KottwitzDescent.classKottwitz_mk,
KottwitzDescent.classKottwitz_unique, KottwitzDescent.classKottwitz_surjective,
KottwitzDescent.classKottwitz_natural, KottwitzDescent.abelianEquiv_mk,
KottwitzDescent.identityFrobeniusEquiv_mk and
KottwitzDescent.signCoinvariantsEquiv_mk.
§1.13: SigmaCentralizer.naturalConjugacy_apply.
§1.42: ComponentCoset.mem_iff. -/

end TauCetiRoadmap.BunGAndNewtonStrata
