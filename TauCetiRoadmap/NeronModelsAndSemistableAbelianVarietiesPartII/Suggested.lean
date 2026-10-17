import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
import TauCeti.LinearAlgebra.RootSystem.AffineDynkinType.Basic

/-!
# NeronModelsAndSemistableAbelianVarietiesPartII: representative target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive
specification is `README.md`. This file records light definitions and representative
milestones statable against the pinned APIs. Ring and
Weierstrass carriers are the native ones. Conductors retain nilpotents, quadratic
pinching allows inseparability, reversal uses a specified weight, and coefficient
bounds carry no minimality or rationality assertion. The geometric constructions and
the resolved-surface classification are specified in the README. The fourteen-equation
list and its invariant examples supply Checks for the single classification-list target;
the classification theorem uses admissible changes and normal-form case analysis.
-/

namespace TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII

open CategoryTheory CategoryTheory.Limits Polynomial
open scoped Polynomial

universe u v w
noncomputable section

/-! ## Layer 1: finite pinching and conductors -/

namespace AffinePinching

/-- The largest ambient ideal contained in an arbitrary subring. -/
def conductor {B : Type u} [CommRing B] (A : Subring B) : Ideal B where
  carrier := {b | ∀ x : B, b * x ∈ A}
  zero_mem' := fun x => by simp
  add_mem' := fun ha hb x => by
    rw [add_mul]
    exact A.add_mem (ha x) (hb x)
  smul_mem' := fun r b hb x => by
    change (r * b) * x ∈ A
    rw [show r * b * x = b * (r * x) by ring]
    exact hb (r * x)

/-- Membership requires multiplication by every ambient element. -/
theorem conductor_mem {B : Type u} [CommRing B] (A : Subring B) (b : B) :
    b ∈ conductor A ↔ ∀ x : B, b * x ∈ A := by sorry

/-- Containment in the subring characterizes the maximal ideal. -/
theorem conductor_greatest {B : Type u} [CommRing B] (A : Subring B) (I : Ideal B) :
    I ≤ conductor A ↔ (I : Set B) ⊆ A := by sorry

/-- The identity inclusion has the whole conductor, also for the zero ring. -/
example {B : Type u} [CommRing B] : conductor (⊤ : Subring B) = ⊤ := by sorry

/-- The cusp conductor remembers the double point in its normalization. -/
example (k : Type u) [Field k] :
    conductor (Algebra.adjoin k ({X ^ 2, X ^ 3} : Set k[X])).toSubring =
      Ideal.span ({X ^ 2} : Set k[X]) := by sorry

/-- A nonreduced diagonal has conductor zero, rather than its radical. -/
example :
    conductor ((RingHom.id (ZMod 4)).prod (RingHom.id (ZMod 4))).range = ⊥ ∧
    (2 : ZMod 4 × ZMod 4) ≠ 0 ∧ (2 : ZMod 4 × ZMod 4) ^ 2 = 0 := by sorry

/-- The actual comparison into Mathlib's constructed ring pullback. -/
def commonIdealComparison {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    CommRingCat.of A ⟶ (CommRingCat.pullbackCone
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map))).pt :=
  (CommRingCat.pullbackConeIsLimit _ _).lift
    (PullbackCone.mk (CommRingCat.ofHom f)
      (CommRingCat.ofHom (Ideal.Quotient.mk I)) (by ext a; rfl))

/-- The two-coordinate comparison kills exactly ker(f) intersected with I. -/
theorem commonIdealComparison_kernel {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    RingHom.ker (commonIdealComparison f I).hom = RingHom.ker f ⊓ I := by sorry

/-- Surjectivity asks that the image of the ideal already be an ideal. -/
theorem commonIdealComparison_surjective_iff {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    Function.Surjective (commonIdealComparison f I).hom ↔
      (I.map f : Set B) = f '' (I : Set A) := by sorry

/-- Ferrand's common-ideal reconstruction criterion, without domain assumptions. -/
theorem commonIdeal_isPullback_iff {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A)
    (himage : (I.map f : Set B) = f '' (I : Set A)) :
    IsPullback (CommRingCat.ofHom f) (CommRingCat.ofHom (Ideal.Quotient.mk I))
      (CommRingCat.ofHom (Ideal.Quotient.mk (I.map f)))
      (CommRingCat.ofHom (Ideal.quotientMap (I.map f) f Ideal.le_comap_map)) ↔
      RingHom.ker f ⊓ I = ⊥ := by sorry

/-- With I zero, even a noninjective original map is reconstructed. -/
example {A B : Type u} [CommRing A] [CommRing B] (f : A →+* B) :
    Function.Bijective (commonIdealComparison f ⊥).hom := by sorry

/-- An injective diagonal need not satisfy the image-ideal hypothesis. -/
example :
    let f := (RingHom.id (ZMod 2)).prod (RingHom.id (ZMod 2))
    ¬ Function.Surjective (commonIdealComparison f ⊤).hom := by sorry

/-- The additive difference has the sign b minus the image of the residue. -/
def commonIdealDifference {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) : B × (A ⧸ I) →+ B ⧸ I.map f :=
  (Ideal.Quotient.mk (I.map f)).toAddMonoidHom.comp (AddMonoidHom.fst B (A ⧸ I)) -
    (Ideal.quotientMap (I.map f) f Ideal.le_comap_map).toAddMonoidHom.comp
      (AddMonoidHom.snd B (A ⧸ I))

/-- The common-ideal sequence is exact precisely under the literal image condition. -/
theorem commonIdeal_exact_iff {A B : Type u} [CommRing A] [CommRing B]
    (f : A →+* B) (I : Ideal A) :
    Function.Exact (fun a : A => (f a, Ideal.Quotient.mk I a))
      (commonIdealDifference f I) ↔ (I.map f : Set B) = f '' (I : Set A) := by sorry

/-- A two-term witness fixes the difference sign over the integers. -/
example : commonIdealDifference (RingHom.id ℤ) ⊥ (0, Ideal.Quotient.mk ⊥ 1) =
    -Ideal.Quotient.mk ((⊥ : Ideal ℤ).map (RingHom.id ℤ)) (1 : ℤ) := by sorry

/-- Surjectivity of the difference alone does not imply middle exactness. -/
example :
    let f := (RingHom.id (ZMod 2)).prod (RingHom.id (ZMod 2))
    Function.Surjective (commonIdealDifference f ⊤) ∧
    ¬ Function.Exact (fun a : ZMod 2 => (f a, Ideal.Quotient.mk ⊤ a))
      (commonIdealDifference f ⊤) := by sorry

end AffinePinching

namespace FerrandPushout

/-- An algebra morphism induces a linear map on the quotients by the unit spans. -/
def conductorCokernelMap {A : Type u} {B : Type v} {D : Type w}
    [CommRing A] [CommRing B] [CommRing D]
    [Algebra A B] [Algebra A D] (h : B →ₐ[A] D) :
    (B ⧸ Submodule.span A ({1} : Set B)) →ₗ[A]
      D ⧸ Submodule.span A ({1} : Set D) :=
  Submodule.mapQ _ _ h.toLinearMap (by
    apply Submodule.span_le.mpr
    rintro b (rfl : b = 1)
    change h 1 ∈ Submodule.span A ({1} : Set D)
    rw [map_one]
    exact Submodule.subset_span (Set.mem_singleton (1 : D)))

/-- Swapping the factors negates the nonzero diagonal-quotient class outside characteristic two. -/
example (k : Type*) [Field k] (h : (2 : k) ≠ 0) :
    let Q := Submodule.span k ({1} : Set (k × k))
    let c := Q.mkQ (1, 0)
    c ≠ 0 ∧ conductorCokernelMap ((AlgHom.snd k k k).prod (AlgHom.fst k k k)) c = -c ∧
      -c ≠ c := by sorry

/-- Evaluation at zero kills the nonconstant polynomial's nonzero quotient class. -/
example (k : Type*) [Field k] :
    let Q := Submodule.span k ({1} : Set k[X])
    Q.mkQ X ≠ 0 ∧ conductorCokernelMap (Polynomial.aeval (0 : k)) (Q.mkQ X) = 0 := by sorry

/-- The polynomial inclusion preserves the X class and misses the independent Y class. -/
example (k : Type*) [Field k] :
    let Q := Submodule.span k ({1} : Set k[X])
    let P := Submodule.span k ({1} : Set (MvPolynomial (Fin 2) k))
    let h := Polynomial.aeval (MvPolynomial.X (0 : Fin 2) : MvPolynomial (Fin 2) k)
    conductorCokernelMap h (Q.mkQ X) = P.mkQ (MvPolynomial.X 0) ∧
      P.mkQ (MvPolynomial.X 0) ≠ 0 ∧
      ¬ ∃ c, conductorCokernelMap h c = P.mkQ (MvPolynomial.X 1) := by sorry

end FerrandPushout

/-! ## Layer 2: genus-one fibers and binary elliptic curves -/

/-- A connected integral fiber matrix with a positive primitive null vector is negative affine ADE,
and its primitive coefficients are the diagram marks under the same reindexing. -/
theorem canonicalFiber_affineMatrixClassification {ι : Type*}
    [Fintype ι] [DecidableEq ι] [Nonempty ι] (M : Matrix ι ι ℤ) (m : ι → ℤ)
    (hsymm : ∀ i j, M i j = M j i) (hdiag : ∀ i, M i i = -2)
    (hoff : ∀ i j, i ≠ j → 0 ≤ M i j)
    (hconn : ∀ i j, Relation.ReflTransGen (fun a b => a ≠ b ∧ 0 < M a b) i j)
    (hpos : ∀ i, 0 < m i) (hprim : Finset.univ.gcd (fun i => (m i).natAbs) = 1)
    (hnull : Matrix.mulVec M m = 0) :
    ∃ t : TauCeti.AffineDynkinType, t.Valid ∧ ∃ e : ι ≃ Fin t.nodes,
      (∀ i j, M i j = -t.cartanMatrix (e i) (e j)) ∧
      (∀ i, m i = t.marks (e i)) := by sorry

/-- The two-vertex case retains the double edge in the matrix. -/
example : (TauCeti.AffineDynkinType.A 1).cartanMatrix = !![2, -2; -2, 2] ∧
    (TauCeti.AffineDynkinType.A 1).marks = ![1, 1] := by sorry

/-- The triangle has three primitive coefficients equal to one. -/
example : (TauCeti.AffineDynkinType.A 2).cartanMatrix = !![2, -1, -1; -1, 2, -1; -1, -1, 2] ∧
    (TauCeti.AffineDynkinType.A 2).marks = ![1, 1, 1] := by sorry

/-- The four-leaf star has one mark two and four marks one. -/
example : ∃ i : Fin (TauCeti.AffineDynkinType.D 4).nodes,
    (TauCeti.AffineDynkinType.D 4).marks i = 2 ∧
      ∀ j, j ≠ i → (TauCeti.AffineDynkinType.D 4).marks j = 1 := by sorry

namespace QuadraticPinch

variable {k : Type u} [Field k]

/-- Polynomials whose residue modulo q is constant. -/
def algebra (q : k[X]) : Subalgebra k k[X] :=
  (⊥ : Subalgebra k (AdjoinRoot q)).comap (AdjoinRoot.mkₐ q)

/-- The preimage description equals k plus q k[t], without separability. -/
theorem mem_algebra (q f : k[X]) :
    f ∈ algebra q ↔ ∃ c : k, ∃ h : k[X], f = C c + q * h := by sorry

/-- A quadratic pinch has the full ambient conductor (q). -/
theorem conductor (q : k[X]) (hq : q.natDegree = 2) :
    AffinePinching.conductor (algebra q).toSubring = Ideal.span {q} := by sorry

/-- Cusp and node equations are the same native five-coefficient carrier. -/
def curve (a b : k) : WeierstrassCurve k := ⟨a, -b, 0, 0, 0⟩

/-- The normalization parameter sends x to q(t), y to t q(t). -/
theorem curve_param (a b t : k) :
    (curve a b).toAffine.Equation (t ^ 2 + a * t + b)
      (t * (t ^ 2 + a * t + b)) := by sorry

/-- At q=t² the pinch contains t³ and excludes t. -/
example : X ^ 3 ∈ algebra (X ^ 2 : k[X]) ∧ X ∉ algebra (X ^ 2 : k[X]) := by sorry

/-- The split node condition requires distinct roots. -/
example (h : (2 : k) ≠ 0) (f : k[X]) :
    f ∈ algebra (X ^ 2 - 1) ↔ f.eval 1 = f.eval (-1) := by sorry

/-- The binary nonsplit pinch excludes its normalization parameter. -/
example : X ∉ algebra (X ^ 2 + X + 1 : (ZMod 2)[X]) := by sorry

/-- The binary split node has one affine rational point and its point at infinity. -/
example : (curve (1 : ZMod 2) 0).pointCount = 2 := by sorry

/-- The binary nonsplit node has three affine rational points. -/
example : (curve (1 : ZMod 2) 1).pointCount = 4 := by sorry

/-- A cusp is singular even though its equation has rational solutions. -/
example : (curve (0 : ZMod 2) 0).Δ = 0 ∧
    (curve (0 : ZMod 2) 0).pointCount = 3 := by sorry

/-- The binary split node, nonsplit node and cusp have the three signed count defects. -/
example : (curve (1 : ZMod 2) 0).frobeniusTrace = 1 ∧
    (curve (1 : ZMod 2) 1).frobeniusTrace = -1 ∧
    (curve (0 : ZMod 2) 0).frobeniusTrace = 0 := by sorry

/-- Two distinct rational conductor roots give the split count in odd characteristic. -/
example : (curve (0 : ZMod 3) (-1)).pointCount = 3 := by sorry

/-- A quadratic conductor with no rational root gives the nonsplit count defect. -/
example : (curve (0 : ZMod 3) 1).frobeniusTrace = -1 := by sorry

/-- A repeated conductor root gives count defect zero in characteristic three. -/
example : (curve (1 : ZMod 3) 1).frobeniusTrace = 0 := by sorry

/-- The rank-two polynomial normal form uses q as the new parameter. -/
theorem exists_normal_form (a b : k) (h : k[X]) :
    let q := X ^ 2 + C a * X + C b
    ∃ P Q : k[X], h = P.comp q + X * Q.comp q := by sorry

/-- The field-extension count alternates according to the quadratic branch action. -/
theorem nonsplit_pointCount {K : Type v} [Field K] [Fintype K] [Algebra (ZMod 2) K]
    (r : ℕ) (hr : 0 < r) (hcard : Fintype.card K = 2 ^ r) :
    ((curve (1 : ZMod 2) 1).map (algebraMap (ZMod 2) K)).pointCount =
      if Even r then 2 ^ r else 2 ^ r + 2 := by sorry

namespace InfinityChart

/-- The reciprocal monic-quadratic denominator retains both parameters over any commutative ring. -/
def denominator {R : Type*} [CommRing R] (a b : R) : R[X] := 1 + C a * X + C b * X ^ 2

/-- A nonzero linear parameter changes the binary denominator. -/
example : denominator (1 : ZMod 2) 0 = 1 + X := by sorry

/-- The binary quadratic parameter gives a nonconstant square. -/
example : denominator (0 : ZMod 2) 1 = (1 + X) ^ 2 ∧
    denominator (0 : ZMod 2) 1 ≠ 1 := by sorry

/-- A nonzero nilpotent parameter survives as the linear coefficient. -/
example : denominator (2 : ZMod 4) 1 = 1 + C 2 * X + X ^ 2 ∧
    (denominator (2 : ZMod 4) 1).coeff 1 = 2 ∧
    (2 : ZMod 4) ≠ 0 ∧ (2 : ZMod 4) ^ 2 = 0 := by sorry

end InfinityChart

end QuadraticPinch

/-- The five smooth binary equation representatives, indexed by count minus one. -/
def F2Model : Fin 5 → WeierstrassCurve (ZMod 2) :=
  ![⟨0, 1, 1, 0, 1⟩, ⟨1, 1, 0, 1, 0⟩, ⟨0, 0, 1, 0, 0⟩,
    ⟨1, 0, 0, 1, 0⟩, ⟨0, 1, 1, 0, 0⟩]

/-- Smoothness is checked by the native discriminant. -/
theorem F2Model.discriminant (i : Fin 5) : (F2Model i).Δ = 1 := by sorry

/-- Point counts separate the five smooth classes. -/
theorem F2Model.pointCount (i : Fin 5) : (F2Model i).pointCount = i.val + 1 := by sorry

/-- All sixteen smooth tuples have an infinity-preserving native change to one model. -/
theorem F2Model.orbit_witnesses (W : WeierstrassCurve (ZMod 2)) (hW : W.Δ = 1) :
    ∃ i : Fin 5, ∃ V : WeierstrassCurve.VariableChange (ZMod 2), V • W = F2Model i := by sorry

/-- The five native equation orbits are disjoint. -/
theorem F2Model.orbits_disjoint (i j : Fin 5) :
    (∃ V : WeierstrassCurve.VariableChange (ZMod 2), V • F2Model i = F2Model j) ↔
      i = j := by sorry

/-- Every smooth binary equation is classified by its rational point count. -/
theorem F2Model.count_classifier (W : WeierstrassCurve (ZMod 2)) (hW : W.Δ = 1) :
    ∃! i : Fin 5, W.pointCount = i.val + 1 ∧
      ∃ V : WeierstrassCurve.VariableChange (ZMod 2), V • W = F2Model i := by sorry

/-- The one-point curve has no affine rational solution. -/
example : (¬ ∃ x y : ZMod 2, (F2Model 0).toAffine.Equation x y) ∧
    (F2Model 0).pointCount = 1 := by sorry

/-- The middle binary representative has equation y² + y = x³. -/
example : F2Model 2 = ⟨0, 0, 1, 0, 0⟩ := by sorry

/-- Equal j does not identify the three supersingular binary classes. -/
example : (F2Model 0).c₄ = 0 ∧ (F2Model 4).c₄ = 0 ∧ F2Model 0 ≠ F2Model 4 := by sorry

/-- Smoothness cannot be omitted from the point-count classifier. -/
example :
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).Δ = 0 ∧
    (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)).pointCount = (F2Model 2).pointCount :=
  by sorry

/-! ## Layer 4: canonical bundles, Picard lattices and global equations -/

/-- The native equation plus its five polynomial degree bounds. -/
structure BoundedWeierstrass (k : Type u) [CommRing k] where
  toCurve : WeierstrassCurve k[X]
  bound1 : toCurve.a₁.natDegree ≤ 1
  bound2 : toCurve.a₂.natDegree ≤ 2
  bound3 : toCurve.a₃.natDegree ≤ 3
  bound4 : toCurve.a₄.natDegree ≤ 4
  bound6 : toCurve.a₆.natDegree ≤ 6

/-- Reverse at the given weight, including zero coefficients above the actual degree. -/
def reverseWeight {k : Type u} [CommRing k] (i : ℕ) (p : k[X]) : k[X] :=
  ∑ n ∈ Finset.range (i + 1), C (p.coeff n) * X ^ (i - n)

/-- The inverse-chart raw equation; its degree bounds are a theorem. -/
def inverseChart {k : Type u} [CommRing k] (W : WeierstrassCurve k[X]) :
    WeierstrassCurve k[X] :=
  ⟨reverseWeight 1 W.a₁, reverseWeight 2 W.a₂, reverseWeight 3 W.a₃,
    reverseWeight 4 W.a₄, reverseWeight 6 W.a₆⟩

/-- Reversal remains bounded in its specified weight. -/
theorem reverseWeight_bound {k : Type u} [CommRing k] (i : ℕ) (p : k[X]) :
    (reverseWeight i p).natDegree ≤ i := by sorry

/-- Reversal is involutive only with the degree bound. -/
theorem reverseWeight_involutive {k : Type u} [CommRing k]
    (i : ℕ) (p : k[X]) (hp : p.natDegree ≤ i) :
    reverseWeight i (reverseWeight i p) = p := by sorry

/-- On polynomials of degree at most `i`, weight reversal is Mathlib's `Polynomial.reflect`;
above that weight `reflect` keeps a coefficient that `reverseWeight` drops. -/
theorem reverseWeight_eq_reflect {k : Type u} [CommRing k]
    (i : ℕ) (p : k[X]) (hp : p.natDegree ≤ i) :
    reverseWeight i p = Polynomial.reflect i p := by sorry

/-- The two reversals differ above the weight: `reflect` keeps `X ^ 7` at weight six. -/
example : reverseWeight 6 (X ^ 7 : ℤ[X]) ≠ Polynomial.reflect 6 (X ^ 7 : ℤ[X]) := by sorry

/-- Weight-six reversal drops the entire monomial of degree seven. -/
example : reverseWeight 6 (X ^ 7 : ℤ[X]) = 0 := by sorry

/-- The global discriminant transforms with weight twelve. -/
theorem inverseChart_discriminant {k : Type u} [CommRing k] (W : BoundedWeierstrass k) :
    (inverseChart W.toCurve).Δ = reverseWeight 12 W.toCurve.Δ := by sorry

/-- A bounded tuple may be singular. -/
example {k : Type u} [CommRing k] : ∃ W : BoundedWeierstrass k,
    W.toCurve = ⟨0, 0, 0, 0, 0⟩ ∧ W.toCurve.Δ = 0 := by sorry

/-- Zero has natDegree zero and obeys every nonnegative weight bound. -/
example {k : Type u} [CommRing k] : (0 : k[X]).natDegree ≤ 1 := by sorry

/-- Weight six retains the missing top coefficients of a constant. -/
example {k : Type u} [CommRing k] : reverseWeight 6 (1 : k[X]) = X ^ 6 := by sorry

/-- The highest-weight monomial becomes constant. -/
example {k : Type u} [CommRing k] : reverseWeight 6 (X ^ 6 : k[X]) = 1 := by sorry

/-- The highest-weight coefficient is the constant on the inverse chart. -/
example {k : Type u} [CommRing k] :
    (inverseChart (⟨X, 0, 0, 0, X ^ 6⟩ : WeierstrassCurve k[X])).a₆ = 1 := by sorry

/-- A constant coefficient of weight one becomes the reciprocal chart coordinate. -/
example : (inverseChart (⟨1, 0, 0, 0, 0⟩ : WeierstrassCurve ℤ[X])).a₁ = X := by sorry

/-- Weight reversal loses terms above its bound. -/
example : inverseChart (inverseChart (⟨0, 0, 0, 0, X ^ 7⟩ :
    WeierstrassCurve ℤ[X])) ≠ ⟨0, 0, 0, 0, X ^ 7⟩ := by sorry

/-- The zero tuple stays zero on the reciprocal chart, including in characteristic two. -/
example : inverseChart (⟨0, 0, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)[X]) =
    ⟨0, 0, 0, 0, 0⟩ := by sorry

/-- Fiber and zero-section intersections determine an integral unimodular plane. -/
def fiberSectionGram : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, -1]

/-- Its determinant has the sign fixed by the section square minus one. -/
theorem fiberSectionGram_det : fiberSectionGram.det = -1 := by sorry

/-- A two-term vector witnesses the odd plane. -/
example : fiberSectionGram 1 1 = -1 := by sorry

/-- The fiber pairs positively with its section. -/
example : fiberSectionGram 0 1 = 1 ∧ fiberSectionGram 0 0 = 0 := by sorry

/-- The sum of the fiber and section has square one in the odd plane. -/
example :
    let v : Fin 2 → ℤ := ![1, 1]
    (∑ i : Fin 2, ∑ j : Fin 2, v i * fiberSectionGram i j * v j) = 1 := by sorry

/-! ## Layer 5: Frobenius, graphs and Picard constancy -/

/-- The resolved rank-ten surface's maximal point-count expression. -/
def rationalSurfaceCount (q : ℕ) : ℕ := 1 + 10 * q + q ^ 2

/-- The binary point-count threshold is twenty-five. -/
example : rationalSurfaceCount 2 = 25 := by sorry

/-- The formula is only a numerical expression at zero, not a field-size assertion. -/
example : rationalSurfaceCount 0 = 1 := by sorry

/-- The numerical threshold is forty at three and twelve at one. -/
example : rationalSurfaceCount 3 = 40 ∧ rationalSurfaceCount 1 = 12 := by sorry

/-- Three small fibers cannot achieve the binary threshold. -/
theorem small_fiber_bound : 10 + 7 + 7 < rationalSurfaceCount 2 := by sorry

/-! ## Layer 6: the fourteen-model classification list -/

/-- The fourteen equations in the classification-list Checks, indexed from zero. -/
def modelEquations : Fin 14 → WeierstrassCurve (ZMod 2)[X] :=
  ![⟨X, X, X ^ 2, X ^ 4, X ^ 5 + X ^ 6⟩,
    ⟨X, 0, 0, X ^ 3, X ^ 5 + X ^ 6⟩,
    ⟨X, 0, 0, X ^ 3, 0⟩,
    ⟨X, X ^ 2, 0, X ^ 3, 0⟩,
    ⟨X, 0, 0, 0, X ^ 5⟩,
    ⟨X, X ^ 2, 0, 0, X ^ 5⟩,
    ⟨X, X, 0, X ^ 4, 0⟩,
    ⟨X, X, X, X, 0⟩,
    ⟨0, X, X ^ 2, 0, 0⟩,
    ⟨0, 0, X ^ 2, X ^ 3, 0⟩,
    ⟨0, 0, X ^ 2, 0, 0⟩,
    ⟨X, 1, X ^ 3, 0, 0⟩,
    ⟨X, X, X ^ 3, 0, 0⟩,
    ⟨X, X ^ 2, X ^ 2, 0, 0⟩]

/-- Each equation in the list satisfies the five global weight bounds. -/
theorem modelEquations_bounded (i : Fin 14) :
    (modelEquations i).a₁.natDegree ≤ 1 ∧ (modelEquations i).a₂.natDegree ≤ 2 ∧
    (modelEquations i).a₃.natDegree ≤ 3 ∧ (modelEquations i).a₄.natDegree ≤ 4 ∧
    (modelEquations i).a₆.natDegree ≤ 6 := by sorry

/-- The fourteen equations have pairwise distinct coefficient tuples. -/
theorem modelEquations_injective : Function.Injective modelEquations := by sorry

/-- Model twelve has the displayed coefficients and discriminant t10. -/
example : modelEquations 11 = ⟨X, 1, X ^ 3, 0, 0⟩ ∧
    (modelEquations 11).Δ = X ^ 10 := by sorry

/-- The I₃* example has discriminant exponent eleven. -/
example : (modelEquations 12).Δ = X ^ 11 := by sorry

/-- The remaining IV* example also has a nonrational discriminant factor. -/
example : (modelEquations 13).Δ = X ^ 8 * (X ^ 2 + X + 1) := by sorry

/-- The first model's binary invariant has c4=t4 and discriminant t8. -/
example : (modelEquations 0).c₄ = X ^ 4 ∧
    (modelEquations 0).Δ = X ^ 8 := by sorry

/-- The three zero-j tuples have c4 zero and nonzero discriminant t8. -/
example (i : Fin 3) :
    let W := modelEquations ⟨i.val + 8, by omega⟩
    W.c₄ = 0 ∧ W.Δ = X ^ 8 := by sorry

/-! ## Layer 7: admissible equivalence and classification -/

/-- A coefficient polynomial of prescribed weight, built from its complete vector. -/
def coefficientPolynomial {k : Type u} [CommRing k] (n : ℕ) (c : Fin (n + 1) → k) :
    k[X] := ∑ j : Fin (n + 1), C (c j) * X ^ j.val

/-- Coefficient-vector evaluation is injective. -/
theorem coefficientPolynomial_injective {k : Type u} [CommRing k] (n : ℕ) :
    Function.Injective (coefficientPolynomial (k := k) n) := by sorry

/-- These vectors parametrize exactly the polynomials obeying the bound. -/
theorem coefficientPolynomial_range {k : Type u} [CommRing k] (n : ℕ) (p : k[X]) :
    (∃ c, coefficientPolynomial n c = p) ↔ p.natDegree ≤ n := by sorry

/-- The zero vector gives the zero polynomial at every weight. -/
example (n : ℕ) : coefficientPolynomial (k := ZMod 2) n (fun _ => 0) = 0 := by sorry

/-- The vector (1,0) is constant; its weight-one reversal is t. -/
example : coefficientPolynomial 1 (![1, 0] : Fin 2 → ZMod 2) = 1 ∧
    reverseWeight 1 (coefficientPolynomial 1 (![1, 0] : Fin 2 → ZMod 2)) = X := by sorry

/-- A middle weight-two coordinate produces the linear monomial. -/
example : coefficientPolynomial 2 (![0, 1, 0] : Fin 3 → ZMod 2) = X := by sorry

/-- A weight-zero vector retains its nonzero nilpotent coefficient. -/
example : coefficientPolynomial 0 (![2] : Fin 1 → ZMod 4) = C 2 := by sorry

/-- The normalized binary coefficient space has a2 zero by construction. -/
abbrev NormalizedCoefficients :=
  (Fin 2 → ZMod 2) × (Fin 4 → ZMod 2) × (Fin 5 → ZMod 2) × (Fin 7 → ZMod 2)

/-- Real native equation attached to a complete normalized coefficient vector. -/
def normalizedEquation (c : NormalizedCoefficients) : WeierstrassCurve (ZMod 2)[X] :=
  ⟨coefficientPolynomial 1 c.1, 0, coefficientPolynomial 3 c.2.1,
    coefficientPolynomial 4 c.2.2.1, coefficientPolynomial 6 c.2.2.2⟩

/-- The normalized coefficient space has cardinality 2^18. -/
theorem normalizedCoefficients_card : Fintype.card NormalizedCoefficients = 2 ^ 18 := by sorry

/-- The zero coefficient vector has discriminant zero. -/
example : (normalizedEquation (0, 0, 0, 0)).Δ = 0 := by sorry

/-- Every normalized equation has the prescribed absent coefficient. -/
example (c : NormalizedCoefficients) : (normalizedEquation c).a₂ = 0 := by sorry

/-- The vector count factors as 4 times 16 times 32 times 128. -/
example : Fintype.card NormalizedCoefficients = 4 * 16 * 32 * 128 := by sorry

/-- The top sixth-coefficient coordinate produces the highest allowed monomial. -/
example : (normalizedEquation (0, 0, 0, ![0, 0, 0, 0, 0, 0, 1])).a₆ = X ^ 6 := by sorry

/-- Changing the first coordinate alone changes the slope coefficient. -/
example : (normalizedEquation (![0, 1], 0, 0, 0)).a₁ = X := by sorry

/-- Translate x by a2 in characteristic two; no inverse or division is needed. -/
def normalizeA2 (W : WeierstrassCurve (ZMod 2)[X]) : WeierstrassCurve (ZMod 2)[X] :=
  ⟨W.a₁, 0, W.a₃ + W.a₁ * W.a₂, W.a₄ + W.a₂ ^ 2,
    W.a₆ + W.a₂ * W.a₄ + W.a₂ ^ 2 * W.a₂ + W.a₂ ^ 3⟩

/-- The normalization is an actual native admissible coordinate change. -/
theorem normalizeA2_variableChange (W : WeierstrassCurve (ZMod 2)[X]) :
    (⟨1, W.a₂, 0, 0⟩ : WeierstrassCurve.VariableChange (ZMod 2)[X]) • W =
      normalizeA2 W := by sorry

/-- Normalization preserves the global coefficient bounds. -/
theorem normalizeA2_bounded (W : BoundedWeierstrass (ZMod 2)) :
    (normalizeA2 W.toCurve).a₁.natDegree ≤ 1 ∧
    (normalizeA2 W.toCurve).a₂.natDegree ≤ 2 ∧
    (normalizeA2 W.toCurve).a₃.natDegree ≤ 3 ∧
    (normalizeA2 W.toCurve).a₄.natDegree ≤ 4 ∧
    (normalizeA2 W.toCurve).a₆.natDegree ≤ 6 := by sorry

/-- A2 vanishes after normalization and normalizing twice changes nothing. -/
example (W : WeierstrassCurve (ZMod 2)[X]) :
    (normalizeA2 W).a₂ = 0 ∧ normalizeA2 (normalizeA2 W) = normalizeA2 W := by sorry

/-- Normalization fixes every tuple whose second coefficient already vanishes. -/
example (W : WeierstrassCurve (ZMod 2)[X]) (h : W.a₂ = 0) :
    normalizeA2 W = W := by sorry

/-- Nonzero a2 changes the other coefficients; dropping it alone is incorrect. -/
example : normalizeA2 (⟨X, X, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)[X]) =
    ⟨X, 0, X ^ 2, X ^ 2, 0⟩ := by sorry

/-- Normalizing a constant a2 changes a4 even when the other coefficients vanish. -/
example : normalizeA2 (⟨0, 1, 0, 0, 0⟩ : WeierstrassCurve (ZMod 2)[X]) =
    ⟨0, 0, 0, 1, 0⟩ := by sorry

/-- Global translation parameters have weights 1,2,3. -/
abbrev AdmissibleParameters :=
  (Fin 2 → ZMod 2) × (Fin 3 → ZMod 2) × (Fin 4 → ZMod 2)

/-- Construct the native variable change from s,r,q in their stated order. -/
def admissibleChange (c : AdmissibleParameters) :
    WeierstrassCurve.VariableChange (ZMod 2)[X] :=
  ⟨1, coefficientPolynomial 2 c.2.1,
    coefficientPolynomial 1 c.1, coefficientPolynomial 3 c.2.2⟩

/-- There are 512 translation triples, before six base automorphisms. -/
theorem admissibleParameters_card : Fintype.card AdmissibleParameters = 512 := by sorry

/-- Zero parameters give the identity native change. -/
example : admissibleChange (0, 0, 0) = 1 := by sorry

/-- The middle parameter is r, rather than the y-slope s. -/
example : (admissibleChange (0, (![0, 1, 0] : Fin 3 → ZMod 2), 0)).r = X ∧
    (admissibleChange (0, (![0, 1, 0] : Fin 3 → ZMod 2), 0)).s = 0 := by sorry

/-- The first parameter supplies the y-slope, independently of the x-translation. -/
example :
    (admissibleChange ((![0, 1] : Fin 2 → ZMod 2), 0, 0)).s = X ∧
    (admissibleChange ((![0, 1] : Fin 2 → ZMod 2), 0, 0)).r = 0 := by sorry

/-
The Layer 3 targets (multiple-fiber isogenies and the local LLR comparison) have no
carriers at the pins and live in the README. The README also defines the following
objects whose geometric or comparison constructions are not represented here:
GeometricPushout, FerrandPushout, GenusOneFibration, FiberTypeDivisor, HasGeometricKodairaFiber,
DegenerateFiber, conductorIdealSheaf, conductorMap,
QuadraticPinch.coordinates, QuadraticPinch.presentationEquiv,
QuadraticPinch.affineParamEquiv, AffinePinching.commonIdealAwayEquiv,
QuadraticPinch.residueCokernelEquiv_over_k, QuadraticPinch.InfinityChart.curve,
QuadraticPinch.Overlap.equiv, QuadraticPinch.Overlap.chartEquiv,
QuadraticPinch.Global.curve, QuadraticPinch.Global.normalizationChart,
QuadraticPinch.Global.normalizationSource, QuadraticPinch.Global.normalization,
QuadraticPinch.Global.structureMap, QuadraticPinch.Global.infinityTransition,
QuadraticPinch.Global.normalizationPartialIso, QuadraticPinch.polynomialBasis,
QuadraticPinch.polynomialHomEquivRoots, QuadraticPinch.Global.relativeNormalization,
QuadraticPinch.Global.relativeNormalizationSectionsIso,
QuadraticPinch.Global.relativeNormalizationDesc,
QuadraticPinch.Global.normalizationFunctionFieldMap,
QuadraticPinch.Global.absoluteNormalizationComparison,
QuadraticPinch.Global.normalizationSectionsClosureEquiv,
QuadraticPinch.Global.absoluteSectionsClosureEquiv,
QuadraticPinch.Global.absoluteNormalizationSourceSectionsEquiv,
QuadraticPinch.Global.absoluteNormalizationComparisonSectionsAlgEquiv,
AffinePinching.commonIdealEquiv, FerrandPushout.conductorSectionsIso,
FerrandPushout.conductorSectionDifference, FerrandPushout.conductorSheafComparison,
FerrandPushout.conductorOpenSectionsIso, FerrandPushout.conductorAdditiveShortComplex,
FerrandPushout.conductorSpecDesc, FerrandPushout.conductorGlobalDesc,
FerrandPushout.conductorSchemeDesc, FerrandPushout.conductorCokernelBaseChange,
FerrandPushout.conductorCokernelRightBaseChange,
FerrandPushout.conductorTargetBaseChangeIso, FerrandPushout.conductorSourceBaseChangeIso,
FerrandPushout.conductorTargetTowerIso, FerrandPushout.conductorSourceTowerIso,
FibrationEquivalence.
Their definitions, API, hypotheses and Checks are specified in the README.
Layer 6 has one classification list with the fourteen equations and resolved invariants as Checks,
with supporting results surface_rationalityCriterion and jacobian_hodgeDegreeOne_rational (§6.1),
followed by the nonrational-fibre theorems (§§6.16–6.17). Layer 7 gives admissible
geometric equivalence (§7.2) and completeness by normal-form case analysis (§7.4).
The invariant separation and class counts are §§7.5–7.6.
The additional geometric prerequisites are finiteMap_etaleCover_cofinal (§1.9),
rationalSurface_commonBlowup, blowup_Picard_intersection and rationalSurface_coherent_vanishing (§4.0),
the supplied projective-bundle and blowup specializations projectivePlane_ellAdicCohomology
and pointBlowup_ellAdicCohomology (§5.0), followed by
rationalSurface_cycleClass (§5.2). Their genuine geometric and cohomological carriers are specified there.
The general cohomology, Frobenius, perfect-complex trace, duality and Gysin constructions come from
EtaleCohomologyFoundations §§F.2.1–F.2.7, F.3–F.7 and F.10.1–F.10.5 (including F.10.2b),
with the algebraic class and trace normalizations of EtaleCohomologyFoundations §§0.9–0.11.
The curve, finite-coefficient and rational trace formulas and the constant-sheaf point-count trace
come from
InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4.
-/

/-
Pinned suppliers cited in the README:
discriminant_typeE₆RootLattice, pointCount_eq_card_point.
Further API targets specified in the README, with their hypotheses and checks:
§1.2:
AffinePinching.conductor_adjoin, AffinePinching.conductor_away_bijective, AffinePinching.conductor_le,
AffinePinching.conductor_mono.
§1.12:
AffinePinching.commonIdealComparison_bijective_iff, commonIdealComparison_fst, commonIdealComparison_snd,
commonIdealComparison_surjective, commonIdealComparison_unique.
§1.13:
conductor_eq_annihilator.
§1.14:
conductor_flat_baseChange.
§1.15:
conductor_localization.
§1.17:
conductor_affine_quotients.
§1.18:
conductor_global_geometric.
§1.19:
conductor_global_isPushout.
§1.20:
conductor_global_flat_comparison.
§1.21:
AffinePinching.commonIdealAwayEquiv_algebraMap, AffinePinching.commonIdealAwayEquiv_apply,
AffinePinching.commonIdealAwayEquiv_symm_algebraMap, AffinePinching.commonIdealAwayEquiv_symm_of_mul,
AffinePinching.commonIdeal_away_bijective, AffinePinching.commonIdeal_kill_kernel.
§1.22:
AffinePinching.commonIdealEquiv_apply, AffinePinching.commonIdealEquiv_inverse_fst,
AffinePinching.commonIdealEquiv_inverse_snd, AffinePinching.commonIdealEquiv_inverse_unique,
AffinePinching.conductorRing_image_comap, AffinePinching.conductorRing_map_comap.
§1.23:
AffinePinching.commonIdealDiagonal_injective_iff, AffinePinching.commonIdealDifference_apply,
AffinePinching.commonIdealDifference_surjective, AffinePinching.commonIdeal_exact.
§2.25:
F2Model.point_group.
§2.26:
QuadraticPinch.finite_normalization, QuadraticPinch.moduleCoefficients_fst,
QuadraticPinch.moduleCoefficients_reconstruct, QuadraticPinch.moduleCoefficients_snd,
QuadraticPinch.module_generator_map_not_injective, QuadraticPinch.normalization_module_finite,
QuadraticPinch.normalization_remainder, QuadraticPinch.normalization_span,
QuadraticPinch.normalization_spec_finite, QuadraticPinch.pinch_spanning, QuadraticPinch.relation_eval,
QuadraticPinch.relation_origin, QuadraticPinch.relation_quadratic, QuadraticPinch.remainder_scalar,
QuadraticPinch.residue_kernel, QuadraticPinch.residue_normal_form, QuadraticPinch.residue_surjective,
QuadraticPinch.scalar_unique, QuadraticPinch.tangent_branches.
§2.27:
QuadraticPinch.proper_point_pushout.
§2.28:
QuadraticPinch.i1_genus.
§2.29:
QuadraticPinch.i2_genus.
§2.31:
QuadraticPinch.affine_card_balance, QuadraticPinch.extension_counts, QuadraticPinch.frobeniusTrace_branch,
QuadraticPinch.frobeniusTrace_extension_parity, QuadraticPinch.frobeniusTrace_roots,
QuadraticPinch.pointCount_balance, QuadraticPinch.pointCount_branch,
QuadraticPinch.pointCount_extension_parity, QuadraticPinch.pointCount_extension_power,
QuadraticPinch.pointCount_field_map, QuadraticPinch.quadraticRootCount_branch,
QuadraticPinch.quadraticRootCount_extension_parity, QuadraticPinch.quadratic_root_iff_even.
§2.32:
QuadraticPinch.constant_remainder, QuadraticPinch.linear_remainder, QuadraticPinch.normal_form_degrees,
QuadraticPinch.normal_form_injective.
§2.33:
QuadraticPinch.basis_degrees, QuadraticPinch.basis_inl, QuadraticPinch.basis_inr,
QuadraticPinch.basis_reconstruction, QuadraticPinch.basis_repr, QuadraticPinch.coordinateMap_bijective,
QuadraticPinch.coordinateMap_coe, QuadraticPinch.coordinates_coe,
QuadraticPinch.coordinates_symm_normal_form, QuadraticPinch.coordinates_unique,
QuadraticPinch.pinch_normal_form_injective, QuadraticPinch.quadratic_natDegree.
§2.34:
QuadraticPinch.inV_U, QuadraticPinch.inV_V, QuadraticPinch.inV_relation, QuadraticPinch.inV_relation_monic,
QuadraticPinch.inV_relation_natDegree, QuadraticPinch.inV_remainder_normal_form,
QuadraticPinch.presentationEquiv_generators, QuadraticPinch.presentationEquiv_mk,
QuadraticPinch.presentationEquiv_symm_substitution, QuadraticPinch.substitutionToAlgebra_coe,
QuadraticPinch.substitutionToAlgebra_ker, QuadraticPinch.substitutionToAlgebra_surjective,
QuadraticPinch.substitution_eq_zero_iff_dvd, QuadraticPinch.substitution_inV,
QuadraticPinch.substitution_ker, QuadraticPinch.substitution_range, QuadraticPinch.substitution_relation.
§2.35:
QuadraticPinch.affineParamEquiv_nonzero, QuadraticPinch.affineParamEquiv_origin,
QuadraticPinch.affineParamEquiv_symm_none, QuadraticPinch.affineParamEquiv_symm_some,
QuadraticPinch.affine_zero_x, QuadraticPinch.parameter_equation, QuadraticPinch.parameter_recovery.
§2.36:
QuadraticPinch.away_bijective.
§2.37:
QuadraticPinch.away_inverse_generator.
§2.38:
QuadraticPinch.fractionEquiv_algebraMap, QuadraticPinch.fractionEquiv_symm_X,
QuadraticPinch.fractionEquiv_symm_algebraMap, QuadraticPinch.fraction_ring, QuadraticPinch.integral_closure,
QuadraticPinch.integral_iff_polynomial.
§2.39:
QuadraticPinch.conductor_image_span, QuadraticPinch.conductor_span_restrictScalars,
QuadraticPinch.normalization_image_span, QuadraticPinch.normalization_quotient_annihilator,
QuadraticPinch.normalization_quotient_annihilator_mem, QuadraticPinch.normalization_quotient_finrank,
QuadraticPinch.normalization_quotient_generator_ne_zero,
QuadraticPinch.normalization_quotient_reconstruction, QuadraticPinch.normalization_quotient_scalar_action,
QuadraticPinch.normalization_span_restrictScalars, QuadraticPinch.residueCokernelEquiv_annihilator,
QuadraticPinch.residueCokernelEquiv_apply, QuadraticPinch.residueCokernelEquiv_over_k_apply,
QuadraticPinch.residueCokernelEquiv_over_k_symm_apply, QuadraticPinch.residueCokernelEquiv_scalar_action,
QuadraticPinch.residueCokernelEquiv_symm_apply, QuadraticPinch.residueCokernelMap_apply,
QuadraticPinch.residueCokernelMap_ker, QuadraticPinch.residueCokernelMap_surjective.
§2.52:
QuadraticPinch.parameterHom_coe, QuadraticPinch.parameterHom_coordinates,
QuadraticPinch.parameterHom_injective, QuadraticPinch.parameter_smul, QuadraticPinch.polynomialBasis_one,
QuadraticPinch.polynomialBasis_repr, QuadraticPinch.polynomialBasis_square,
QuadraticPinch.polynomialBasis_zero, QuadraticPinch.polynomialBasis_zero_eq_one,
QuadraticPinch.polynomialCoordinates_coe, QuadraticPinch.polynomialCoordinates_inverse,
QuadraticPinch.polynomialCoordinates_inverse_mul, QuadraticPinch.polynomialCoordinates_mul,
QuadraticPinch.polynomialCoordinates_reconstruction, QuadraticPinch.polynomialCoordinates_smul,
QuadraticPinch.polynomialModule_finite, QuadraticPinch.polynomialModule_finrank,
QuadraticPinch.polynomialModule_flat, QuadraticPinch.polynomialModule_free,
QuadraticPinch.polynomialProduct_unit.
§2.53:
QuadraticPinch.polynomialEvaluation_apply, QuadraticPinch.polynomialEvaluation_mul,
QuadraticPinch.polynomialEvaluation_parameter, QuadraticPinch.polynomialHomEquivRoots_apply,
QuadraticPinch.polynomialHomEquivRoots_parameter, QuadraticPinch.polynomialHomEquivRoots_symm_apply,
QuadraticPinch.polynomialHom_relation, QuadraticPinch.polynomialLift_apply,
QuadraticPinch.polynomialLift_basis, QuadraticPinch.polynomialLift_unique.
§2.54:
QuadraticPinch.quadratic_normalization_inclusion_not_surjective.
§3.11:
curve_picardRanks_euler.
§4.10:
inverseChart_inverseChart.
§7.1:
normalizedEquation_injective.
-/

/-
Additional FerrandPushout API specified in the README, with the geometric carriers and
hypotheses of the corresponding Layer 1 targets:
FerrandPushout.affine_space_hom_injective, FerrandPushout.affine_space_hom_surjective,
FerrandPushout.conductorAdditiveShortComplex_affine_surjective,
FerrandPushout.conductorAdditiveShortComplex_epi,
FerrandPushout.conductorAdditiveShortComplex_exact,
FerrandPushout.conductorAdditiveShortComplex_f_fst,
FerrandPushout.conductorAdditiveShortComplex_f_snd,
FerrandPushout.conductorAdditiveShortComplex_inl_g,
FerrandPushout.conductorAdditiveShortComplex_inl_g_app,
FerrandPushout.conductorAdditiveShortComplex_inr_g,
FerrandPushout.conductorAdditiveShortComplex_inr_g_app,
FerrandPushout.conductorAdditiveShortComplex_locally_surjective,
FerrandPushout.conductorAdditiveShortComplex_mono,
FerrandPushout.conductorAdditiveShortComplex_pair_app,
FerrandPushout.conductorAdditiveShortComplex_shortExact,
FerrandPushout.conductorChartMap_ambient_quotient, FerrandPushout.conductorChartMap_comm,
FerrandPushout.conductorChartMap_coordinates, FerrandPushout.conductorChartMap_quotient,
FerrandPushout.conductorChartMap_restrict, FerrandPushout.conductorChart_ambient_le,
FerrandPushout.conductorChart_ideal_image, FerrandPushout.conductorChart_ideal_le,
FerrandPushout.conductorChart_ideal_map, FerrandPushout.conductorCokernelBaseChange_annihilator,
FerrandPushout.conductorCokernelBaseChange_natural,
FerrandPushout.conductorCokernelBaseChange_natural_map,
FerrandPushout.conductorCokernelBaseChange_scalar_zero,
FerrandPushout.conductorCokernelBaseChange_symm_tmul,
FerrandPushout.conductorCokernelBaseChange_tmul, FerrandPushout.conductorCokernelMap_comp,
FerrandPushout.conductorCokernelMap_id, FerrandPushout.conductorCokernelMap_mk,
FerrandPushout.conductorCokernelMap_surjective,
FerrandPushout.conductorCokernelRightBaseChange_annihilator,
FerrandPushout.conductorCokernelRightBaseChange_scalar_zero,
FerrandPushout.conductorCokernelRightBaseChange_symm_tmul,
FerrandPushout.conductorCokernelRightBaseChange_tmul, FerrandPushout.conductorDescApp_closed,
FerrandPushout.conductorDescApp_compatible, FerrandPushout.conductorDescApp_naturality,
FerrandPushout.conductorDescApp_source, FerrandPushout.conductorDescApp_unique,
FerrandPushout.conductorDescBase_closed, FerrandPushout.conductorDescBase_preimage_closed,
FerrandPushout.conductorDescBase_preimage_source, FerrandPushout.conductorDescBase_source,
FerrandPushout.conductorDescRingedSpace_closed, FerrandPushout.conductorDescRingedSpace_isLocalHom,
FerrandPushout.conductorDescRingedSpace_source, FerrandPushout.conductorGlobalDesc_closed,
FerrandPushout.conductorGlobalDesc_natural, FerrandPushout.conductorGlobalDesc_source,
FerrandPushout.conductorGlobalDesc_unique, FerrandPushout.conductorIdealSheaf_comap_chart,
FerrandPushout.conductorIdealSheaf_flat_tower, FerrandPushout.conductorIdealSheaf_ideal,
FerrandPushout.conductorIdealSheaf_restrict, FerrandPushout.conductorMap_baseChange_inverse_square,
FerrandPushout.conductorMap_baseChange_square, FerrandPushout.conductorMap_eq_subschemeMap,
FerrandPushout.conductorMap_isIso_iff_of_zero, FerrandPushout.conductorMap_isIso_of_isIso,
FerrandPushout.conductorMap_preimage, FerrandPushout.conductorMap_square,
FerrandPushout.conductorMap_tower_inverse_square, FerrandPushout.conductorMap_tower_square,
FerrandPushout.conductorMap_unique, FerrandPushout.conductorOpenSectionsIso_affine,
FerrandPushout.conductorOpenSectionsIso_fst, FerrandPushout.conductorOpenSectionsIso_inv_fst,
FerrandPushout.conductorOpenSectionsIso_inv_snd, FerrandPushout.conductorOpenSectionsIso_snd,
FerrandPushout.conductorQuotientMap_comp_mk, FerrandPushout.conductorQuotientMap_mk,
FerrandPushout.conductorRightAnnihilator_flat, FerrandPushout.conductorRightMap_injective,
FerrandPushout.conductorSchemeDesc_closed, FerrandPushout.conductorSchemeDesc_natural,
FerrandPushout.conductorSchemeDesc_source, FerrandPushout.conductorSchemeDesc_unique,
FerrandPushout.conductorSectionDifference_apply, FerrandPushout.conductorSectionDifference_exact,
FerrandPushout.conductorSectionDifference_open_exact,
FerrandPushout.conductorSectionDifference_restrict,
FerrandPushout.conductorSectionDifference_surjective,
FerrandPushout.conductorSectionDifference_zero, FerrandPushout.conductorSectionPair_injective,
FerrandPushout.conductorSectionsIso_fst, FerrandPushout.conductorSectionsIso_inv_fst,
FerrandPushout.conductorSectionsIso_inv_snd, FerrandPushout.conductorSectionsIso_inv_unique,
FerrandPushout.conductorSectionsIso_snd, FerrandPushout.conductorSheafChart_app,
FerrandPushout.conductorSheafComparison_fst, FerrandPushout.conductorSheafComparison_isIso,
FerrandPushout.conductorSheafComparison_snd, FerrandPushout.conductorSheafInclusion_app,
FerrandPushout.conductorSourceBaseChangeIso_hom_fst,
FerrandPushout.conductorSourceBaseChangeIso_hom_snd_inclusion,
FerrandPushout.conductorSourceBaseChangeIso_inv_inclusion,
FerrandPushout.conductorSourceBaseChangeIso_isPullback,
FerrandPushout.conductorSourceBaseChangeIso_tower,
FerrandPushout.conductorSourceBaseChangeIso_tower_inverse,
FerrandPushout.conductorSourceBaseChangeIso_tower_snd, FerrandPushout.conductorSourceIdeal_affine,
FerrandPushout.conductorSourceIdeal_chart, FerrandPushout.conductorSourceIdeal_chart_transport,
FerrandPushout.conductorSourceIdeal_flat, FerrandPushout.conductorSourceIdeal_mem,
FerrandPushout.conductorSourceIdeal_restrict, FerrandPushout.conductorSourceIdeal_tower,
FerrandPushout.conductorSourceObjIso_inclusion, FerrandPushout.conductorSourceObjIso_inv_mk,
FerrandPushout.conductorSourceObjIso_mk, FerrandPushout.conductorSourcePullbackTowerIso_hom_fst,
FerrandPushout.conductorSourcePullbackTowerIso_hom_snd,
FerrandPushout.conductorSourcePullbackTowerIso_inv_fst,
FerrandPushout.conductorSourcePullbackTowerIso_inv_snd,
FerrandPushout.conductorSourceTowerIso_hom_inclusion,
FerrandPushout.conductorSourceTowerIso_inv_inclusion, FerrandPushout.conductorSourceTowerIso_unique,
FerrandPushout.conductorSpecDesc_closed, FerrandPushout.conductorSpecDesc_comap,
FerrandPushout.conductorSpecDesc_natural, FerrandPushout.conductorSpecDesc_unique,
FerrandPushout.conductorSpec_isPushout, FerrandPushout.conductorTargetBaseChangeIso_hom_fst,
FerrandPushout.conductorTargetBaseChangeIso_hom_snd_inclusion,
FerrandPushout.conductorTargetBaseChangeIso_inv_inclusion,
FerrandPushout.conductorTargetBaseChangeIso_isPullback,
FerrandPushout.conductorTargetBaseChangeIso_nilpotent_section,
FerrandPushout.conductorTargetBaseChangeIso_nonzero,
FerrandPushout.conductorTargetBaseChangeIso_tower,
FerrandPushout.conductorTargetBaseChangeIso_tower_inverse,
FerrandPushout.conductorTargetBaseChangeIso_tower_snd,
FerrandPushout.conductorTargetPullbackTowerIso_hom_fst,
FerrandPushout.conductorTargetPullbackTowerIso_hom_snd,
FerrandPushout.conductorTargetPullbackTowerIso_inv_fst,
FerrandPushout.conductorTargetPullbackTowerIso_inv_snd,
FerrandPushout.conductorTargetTowerIso_hom_inclusion,
FerrandPushout.conductorTargetTowerIso_inv_inclusion, FerrandPushout.conductorTargetTowerIso_unique,
FerrandPushout.conductorUnitQuotientSwap_annihilator, FerrandPushout.conductorUnitQuotientSwap_mk,
FerrandPushout.conductorUnitQuotientSwap_symm_mk, FerrandPushout.conductorUnitSpan_baseChange,
FerrandPushout.conductorUnitSpan_swap, FerrandPushout.conductor_additive_isPullback,
FerrandPushout.conductor_affine_fiber_eq, FerrandPushout.conductor_affine_isPullback,
FerrandPushout.conductor_basicOpen, FerrandPushout.conductor_comap_algEquiv,
FerrandPushout.conductor_comap_le_iff, FerrandPushout.conductor_comap_postcomp,
FerrandPushout.conductor_comap_precomp, FerrandPushout.conductor_comap_pushout,
FerrandPushout.conductor_common_denominator, FerrandPushout.conductor_diagonal_comap_eq_bot,
FerrandPushout.conductor_diagonal_idealSheaf_eq_bot, FerrandPushout.conductor_diagonal_ideal_top,
FerrandPushout.conductor_diagonal_isFinite, FerrandPushout.conductor_diagonal_nilpotent_section,
FerrandPushout.conductor_diagonal_schemeTheoreticallyDominant, FerrandPushout.conductor_fiber_eq,
FerrandPushout.conductor_flat_chart, FerrandPushout.conductor_fraction_mem_iff_generators,
FerrandPushout.conductor_global, FerrandPushout.conductor_global_factorsThrough,
FerrandPushout.conductor_global_topological, FerrandPushout.conductor_localization_away,
FerrandPushout.conductor_localization_finite_generators,
FerrandPushout.conductor_localization_recomputed, FerrandPushout.conductor_localized_fraction_image,
FerrandPushout.conductor_localized_image_criterion,
FerrandPushout.conductor_localized_mem_iff_images,
FerrandPushout.conductor_localized_product_criterion, FerrandPushout.conductor_mem_iff_generators,
FerrandPushout.conductor_nilpotent_section, FerrandPushout.conductor_open_isPullback,
FerrandPushout.conductor_prime_eq_of_comap_eq, FerrandPushout.conductor_range_conjugate,
FerrandPushout.conductor_sheaf_isPullback, FerrandPushout.conductor_spec_factorsThrough,
FerrandPushout.etale_relation, FerrandPushout.exists_algebraicSpace, FerrandPushout.isScheme_iff,
FerrandPushout.overlap_isScheme, FerrandPushout.pinching_etale_cover,
FerrandPushout.space_closed_complement, FerrandPushout.space_flat_baseChange,
FerrandPushout.space_geometric, FerrandPushout.space_isFinite, FerrandPushout.space_isPullback.
-/

end

end TauCetiRoadmap.NeronModelsAndSemistableAbelianVarietiesPartII
