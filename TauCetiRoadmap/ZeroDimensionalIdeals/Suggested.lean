import Mathlib
import TauCeti.RingTheory.MvPolynomial.Groebner.NormalForm
import TauCeti.RingTheory.MvPolynomial.Groebner.Reduced

/-!
# Zero-dimensional ideals: target signatures

The roadmap is `README.md`; this file is not the roadmap, and its statements are suggested forms,
not an exhaustive checklist. It states the roadmap's headline theorems against the pinned Mathlib
and Tau Ceti, each with `sorry`, with the two definitions they need: the multiplicity of a point
and the trace form of a polynomial. Gröbner bases, standard monomials and reduced bases are Tau
Ceti's (the realised Layer G1 of GroebnerGeometry) and are imported, not restated.

Zero-dimensionality is always the hypothesis `Module.Finite k (MvPolynomial σ k ⧸ I)`: Mathlib's
`Module.finrank` is `0` in infinite dimension. Every headline theorem of the README is stated here.
-/

namespace TauCetiRoadmap.ZeroDimensionalIdeals

open MvPolynomial

/-! ## Layer 1: finite dimension and the number of points -/

/-- 1.1 The finiteness theorem: for finitely many variables, finite dimension of the quotient,
finiteness of the standard monomials, pure powers among the leading monomials, a nonzero
univariate polynomial in each variable, and finiteness of the points over an algebraically closed
field are equivalent. -/
theorem finiteness_tfae {σ k : Type*} [Finite σ] [Field k] (m : MonomialOrder σ) (K : Type*)
    [Field K] [IsAlgClosed K] [Algebra k K] (I : Ideal (MvPolynomial σ k)) :
    List.TFAE
      [Module.Finite k (MvPolynomial σ k ⧸ I),
        (m.standardMonomials I).Finite,
        ∀ i, ∃ n : ℕ, ∃ p ∈ I, p ≠ 0 ∧ m.degree p = Finsupp.single i n,
        ∀ i, ∃ p : Polynomial k, p ≠ 0 ∧ Polynomial.aeval (X i : MvPolynomial σ k) p ∈ I,
        (zeroLocus K I).Finite] := by
  sorry

/-- 1.2 Over a perfect field, the number of points over an algebraically closed field equals the
dimension of the quotient exactly when the ideal is radical. -/
theorem card_zeroLocus_eq_finrank_iff_isRadical {σ k : Type*} [Field k] [PerfectField k]
    (K : Type*) [Field K] [IsAlgClosed K] [Algebra k K] (I : Ideal (MvPolynomial σ k))
    [Module.Finite k (MvPolynomial σ k ⧸ I)] :
    Nat.card (zeroLocus K I) = Module.finrank k (MvPolynomial σ k ⧸ I) ↔ I.IsRadical := by
  sorry

/-! ## Layer 2: multiplication maps and Stickelberger's theorem -/

/-- 2.1 The multiplicity of a point `a`: the dimension of the localization of the polynomial ring
at the maximal ideal of `a`, modulo the extension of `I`. It is `0` when `a` is not a point. -/
noncomputable def pointMultiplicity {σ K : Type*} [Field K] (I : Ideal (MvPolynomial σ K))
    (a : σ → K) : ℕ :=
  Module.finrank K (Localization.AtPrime (vanishingIdeal K {a} : Ideal (MvPolynomial σ K)) ⧸
    I.map (algebraMap (MvPolynomial σ K) (Localization.AtPrime (vanishingIdeal K {a}))))

/-- 2.2 The eigenvalue theorem: over an algebraically closed field, the eigenvalues of
multiplication by `f` on a finite-dimensional quotient are the values of `f` at the points. -/
theorem hasEigenvalue_lmul_iff {σ K : Type*} [Field K] [IsAlgClosed K]
    (I : Ideal (MvPolynomial σ K)) [Module.Finite K (MvPolynomial σ K ⧸ I)]
    (f : MvPolynomial σ K) (μ : K) :
    (Algebra.lmul K (MvPolynomial σ K ⧸ I) (Ideal.Quotient.mk I f)).HasEigenvalue μ ↔
      ∃ a ∈ zeroLocus K I, eval a f = μ := by
  sorry

/-- 2.3 Stickelberger's formula: the characteristic polynomial of multiplication by `f` is the
product of `(X - f(a)) ^ μ(a)` over the points `a`. -/
theorem charpoly_lmul_eq_finprod {σ K : Type*} [Field K] [IsAlgClosed K]
    (I : Ideal (MvPolynomial σ K)) [Module.Finite K (MvPolynomial σ K ⧸ I)]
    (f : MvPolynomial σ K) :
    (Algebra.lmul K (MvPolynomial σ K ⧸ I) (Ideal.Quotient.mk I f)).charpoly =
      ∏ᶠ a ∈ zeroLocus K I,
        (Polynomial.X - Polynomial.C (eval a f)) ^ pointMultiplicity I a := by
  sorry

/-- 2.4 Joint eigenvectors: over any field, the points of `I` are the joint eigenvalues of the
multiplications by the variables on a finite-dimensional quotient. -/
theorem zeroLocus_eq_setOf_exists_eigenvector {σ K : Type*} [Field K]
    (I : Ideal (MvPolynomial σ K)) [Module.Finite K (MvPolynomial σ K ⧸ I)] :
    zeroLocus K I = {a : σ → K | ∃ v : MvPolynomial σ K ⧸ I, v ≠ 0 ∧
      ∀ i, Ideal.Quotient.mk I (X i) * v = algebraMap K (MvPolynomial σ K ⧸ I) (a i) * v} := by
  sorry

/-! ## Layer 3: trace forms and real solutions -/

/-- 3.1 The type of the trace form of a finite-dimensional commutative real algebra: `r₁ + r₂`
positive and `r₂` negative squares, with `r₁` and `r₂` the numbers of maximal ideals with residue
field of dimension `1` and `2`. -/
theorem sigPos_sigNeg_traceForm (A : Type*) [CommRing A] [Algebra ℝ A] [Module.Finite ℝ A] :
    sigPos (Algebra.traceForm ℝ A).toQuadraticMap =
        Nat.card {m : MaximalSpectrum A // Module.finrank ℝ (A ⧸ m.asIdeal) = 1} +
          Nat.card {m : MaximalSpectrum A // Module.finrank ℝ (A ⧸ m.asIdeal) = 2} ∧
      sigNeg (Algebra.traceForm ℝ A).toQuadraticMap =
        Nat.card {m : MaximalSpectrum A // Module.finrank ℝ (A ⧸ m.asIdeal) = 2} := by
  sorry

/-- 3.2 The trace form of `h`: `(α, β) ↦ trace(α h β)` on the real quotient algebra. -/
noncomputable def traceFormOf {σ : Type*} (I : Ideal (MvPolynomial σ ℝ)) (h : MvPolynomial σ ℝ) :
    LinearMap.BilinForm ℝ (MvPolynomial σ ℝ ⧸ I) :=
  (Algebra.traceForm ℝ (MvPolynomial σ ℝ ⧸ I)).compl₂
    (Algebra.lmul ℝ (MvPolynomial σ ℝ ⧸ I) (Ideal.Quotient.mk I h))

/-- 3.2 Counting real solutions: the signature of the trace form of `h` is the number of real
points where `h > 0` minus the number where `h < 0`. -/
theorem signature_traceFormOf {σ : Type*} (I : Ideal (MvPolynomial σ ℝ))
    [Module.Finite ℝ (MvPolynomial σ ℝ ⧸ I)] (h : MvPolynomial σ ℝ) :
    (sigPos (traceFormOf I h).toQuadraticMap : ℤ) - sigNeg (traceFormOf I h).toQuadraticMap =
      ({a ∈ zeroLocus ℝ I | 0 < eval a h}.ncard : ℤ) -
        {a ∈ zeroLocus ℝ I | eval a h < 0}.ncard := by
  sorry

/-! ## Layer 4: the radical -/

/-- 4.1 The radical criterion: over a perfect field, a zero-dimensional ideal is radical exactly
when the minimal polynomial of every variable in the quotient is squarefree. -/
theorem isRadical_iff_squarefree_minpoly {σ k : Type*} [Field k] [PerfectField k]
    (I : Ideal (MvPolynomial σ k)) [Module.Finite k (MvPolynomial σ k ⧸ I)] :
    I.IsRadical ↔ ∀ i, Squarefree (minpoly k (Ideal.Quotient.mk I (X i))) := by
  sorry

/-- 4.2 The radical is `I` together with the squarefree parts of the minimal polynomials of the
variables, evaluated at the variables. -/
theorem radical_eq_sup_span {σ k : Type*} [Field k] [PerfectField k] [DecidableEq k]
    (I : Ideal (MvPolynomial σ k)) [Module.Finite k (MvPolynomial σ k ⧸ I)] :
    I.radical = I ⊔ Ideal.span (Set.range fun i => Polynomial.aeval (X i : MvPolynomial σ k)
      (UniqueFactorizationMonoid.radical (minpoly k (Ideal.Quotient.mk I (X i))))) := by
  sorry

/-! ## Layer 5: the shape lemma -/

/-- 5.1 When an ideal has a shape lemma: if the coordinate `j` separates the points, `I` is
generated by a polynomial in `X j` and the `X i - gᵢ(X j)` exactly when the multiplicity of every
point is the root multiplicity of its `j`-th coordinate in the minimal polynomial of `X j`. -/
theorem exists_shape_iff {σ K : Type*} [Field K] [IsAlgClosed K]
    (I : Ideal (MvPolynomial σ K)) [Module.Finite K (MvPolynomial σ K ⧸ I)] (j : σ)
    (hinj : Set.InjOn (fun a : σ → K => a j) (zeroLocus K I)) :
    (∃ (r : Polynomial K) (g : {i // i ≠ j} → Polynomial K),
        I = Ideal.span (insert (Polynomial.aeval (X j) r)
          (Set.range fun i : {i // i ≠ j} => X (i : σ) - Polynomial.aeval (X j) (g i)))) ↔
      ∀ a ∈ zeroLocus K I,
        pointMultiplicity I a = (minpoly K (Ideal.Quotient.mk I (X j))).rootMultiplicity (a j) := by
  sorry

/-- 5.2 The shape lemma: a proper ideal with as many points as the dimension of its quotient,
the points having distinct last coordinates, has the reduced lexicographic Gröbner basis
`X i - qᵢ(X n)`, `r(X n)` with `r` monic of degree the dimension and `deg qᵢ < deg r`. -/
theorem isReducedGroebnerBasis_lex_shape {k K : Type*} [Field k] [Field K] [Algebra k K] {n : ℕ}
    (I : Ideal (MvPolynomial (Fin (n + 1)) k))
    [Module.Finite k (MvPolynomial (Fin (n + 1)) k ⧸ I)] (hI : I ≠ ⊤)
    (hcard : Nat.card (zeroLocus K I) = Module.finrank k (MvPolynomial (Fin (n + 1)) k ⧸ I))
    (hinj : Set.InjOn (fun a : Fin (n + 1) → K => a (Fin.last n)) (zeroLocus K I)) :
    ∃ (r : Polynomial k) (q : Fin n → Polynomial k),
      r.Monic ∧ r.natDegree = Module.finrank k (MvPolynomial (Fin (n + 1)) k ⧸ I) ∧
      (∀ i, (q i).natDegree < r.natDegree) ∧
      MonomialOrder.lex.IsReducedGroebnerBasis
        (insert (Polynomial.aeval (X (Fin.last n)) r)
          (Set.range fun i : Fin n => X i.castSucc - Polynomial.aeval (X (Fin.last n)) (q i)))
        I := by
  sorry

/-- 5.3 A linear change of coordinates: over an infinite field, if the quotient has as many points
as its dimension, some linear form in the variables generates it as an algebra. -/
theorem exists_surjective_aeval_linearForm {σ k K : Type*} [Fintype σ] [Field k] [Infinite k]
    [Field K] [Algebra k K] (I : Ideal (MvPolynomial σ k))
    [Module.Finite k (MvPolynomial σ k ⧸ I)]
    (hcard : Nat.card (zeroLocus K I) = Module.finrank k (MvPolynomial σ k ⧸ I)) :
    ∃ c : σ → k, Function.Surjective
      (Polynomial.aeval (R := k) (Ideal.Quotient.mk I (∑ i, C (c i) * X i))) := by
  sorry

end TauCetiRoadmap.ZeroDimensionalIdeals
