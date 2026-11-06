module

public import Mathlib

/-!
# Drinfeld modules and t-modules, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The series below use native polynomials,
compositions and the completion at infinity, including the empty composition.

The following headlines are not statable with the pinned interfaces and a few
simple definitions: the analytic Carlitz exponential and period, Omega and the
arithmetic entire-series ring need their constructed valued analytic field and
Frobenius interfaces; Anderson–Thakur interpolation and entire Frobenius
specialisation need the Carlitz period, Omega and its analytic twist; Chang's
general descent theorem for MZ-property values needs the MZ-property carrier
(its grading consequence for actual MZVs is stated below); the ABP lifting and
independence criteria and Eulerian suffix theorem need their arithmetic entire
series and merged analytic prefix system; the complete description of relations
needs the constructed q-shuffle rewriting operator; period character splitting
and normalised ACMPL period relations need their period realisation; the v-adic
dimension bound needs the v-adic MZV realisation and specialisation homomorphism.
No arbitrary predicates or replacement period carriers stand for these objects.
-/

public section

namespace TauCetiRoadmap.DrinfeldModulesAndTModulesPartII

open scoped BigOperators


/-! ## Layer 0: indices, power sums and multiple-depth values -/

/-- The depth-one power sum over all monic polynomials of degree d, parametrised
by their d coefficients; theta is the native rational-function variable. -/
noncomputable def powerSum (F : Type*) [Field F] [Fintype F] (d k : ℕ) : RatFunc F :=
  ∑ a : Fin d → F,
    (RatFunc.X ^ d + ∑ i : Fin d, RatFunc.C (a i) * RatFunc.X ^ (i : ℕ))⁻¹ ^ k

/-- For every positive exponent, the depth-one power sums are nonzero and
their rational-function degrees strictly decrease with d, for every prime
power q (Thakur 2009, proof of Theorem 4). -/
theorem powerSum_degree_descent (F : Type*) [Field F] [Fintype F]
    (k : ℕ) (hk : 0 < k) :
    (∀ d, powerSum F d k ≠ 0) ∧ StrictAnti (fun d => (powerSum F d k).intDegree) := by
  sorry

/-- The alternating Thakur series: sum over monic tuples of strictly decreasing
degrees, with degree characters. Trivial characters give the ordinary MZV. -/
noncomputable def multipleZeta (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)]
    {w : ℕ} (s : Composition w) (ε : Fin s.length → Fˣ) :
    RatFunc.CompletionAtInfty F := by
  classical
  exact ∑' a : Fin s.length → Polynomial F,
    if (∀ i, (a i).Monic) ∧ StrictAnti (fun i => (a i).natDegree) then
      ∏ i, algebraMap (RatFunc F) (RatFunc.CompletionAtInfty F)
        (RatFunc.C ((ε i : F) ^ (a i).natDegree) /
          (algebraMap (Polynomial F) (RatFunc F) (a i)) ^ s.blocksFun i)
    else 0

/-- The signed Carlitz denominator, with ell zero equal to one. -/
noncomputable def carlitzDenominator (F : Type*) [Field F] [Fintype F]
    (d : ℕ) : RatFunc F :=
  ∏ i ∈ Finset.range d, (RatFunc.X - RatFunc.X ^ (Fintype.card F ^ (i + 1)))

/-- The alternating Carlitz multiple polylogarithm value, summed over decreasing
nonnegative degrees. Its characters are degree powers, not Frobenius powers. -/
noncomputable def multiplePolylog (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)]
    {w : ℕ} (s : Composition w) (ε : Fin s.length → Fˣ) :
    RatFunc.CompletionAtInfty F := by
  classical
  exact ∑' d : Fin s.length → ℕ,
    if StrictAnti d then
      ∏ i, algebraMap (RatFunc F) (RatFunc.CompletionAtInfty F)
        (RatFunc.C ((ε i : F) ^ d i) / carlitzDenominator F (d i) ^ s.blocksFun i)
    else 0

/-- The ordinary MZV weight space over the rational function field. -/
noncomputable def zetaSpace (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule (RatFunc F) (RatFunc.CompletionAtInfty F) :=
  Submodule.span (RatFunc F) (Set.range fun s : Composition w =>
    multipleZeta F s (fun _ => 1))

/-- The alternating MZV weight space; arrays are native dependent pairs. -/
noncomputable def alternatingZetaSpace (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule (RatFunc F) (RatFunc.CompletionAtInfty F) :=
  Submodule.span (RatFunc F) (Set.range fun a : (Σ s : Composition w, Fin s.length → Fˣ) =>
    multipleZeta F a.1 a.2)

/-- The ordinary Carlitz multiple polylogarithm weight space. -/
noncomputable def polylogSpace (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule (RatFunc F) (RatFunc.CompletionAtInfty F) :=
  Submodule.span (RatFunc F) (Set.range fun s : Composition w =>
    multiplePolylog F s (fun _ => 1))

/-- The alternating Carlitz multiple polylogarithm weight space. -/
noncomputable def alternatingPolylogSpace (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule (RatFunc F) (RatFunc.CompletionAtInfty F) :=
  Submodule.span (RatFunc F) (Set.range fun a : (Σ s : Composition w, Fin s.length → Fˣ) =>
    multiplePolylog F a.1 a.2)

/-- Thakur's family: all parts at most q and last part less than q.
The empty composition belongs in weight zero. -/
def thakurIndices (q w : ℕ) : Set (Composition w) :=
  {s | (∀ a ∈ s.blocks, a ≤ q) ∧ s.blocks.getLast?.getD 0 < q}

/-- The Hoffman family excludes multiples of q, including when q is not prime. -/
def indivisibleIndices (q w : ℕ) : Set (Composition w) :=
  {s | ∀ a ∈ s.blocks, ¬ q ∣ a}

/-- The small-entry family has every part strictly less than q. -/
def smallEntryIndices (q w : ℕ) : Set (Composition w) :=
  {s | ∀ a ∈ s.blocks, a < q}

/-- Todd's numbers as composition counts; the roadmap proves their q-step
recurrence, with the exceptional initial value at weight q. -/
noncomputable def toddNumber (q w : ℕ) : ℕ :=
  Nat.card {s : Composition w // s ∈ thakurIndices q w}

/-- The alternating dimension sequence as the count of degree-character arrays
over q-indivisible compositions; its recurrence is proved in the roadmap. -/
noncomputable def alternatingNumber (q w : ℕ) : ℕ := by
  classical
  exact ∑ s : Composition w,
    if s ∈ indivisibleIndices q w then (q - 1) ^ s.length else 0

/-- Every alternating MZV, including the ordinary series, is nonzero.
Thakur's power-sum degree theorem gives a unique leading degree tuple. -/
theorem multipleZeta_ne_zero (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)]
    {w : ℕ} (s : Composition w) (ε : Fin s.length → Fˣ) :
    multipleZeta F s ε ≠ 0 := by
  sorry

/-- Every degree-character Carlitz multiple polylogarithm value is nonzero:
the tuple of minimal decreasing degrees has uniquely largest norm
(Chang 2014, Remark 5.1.5). -/
theorem multiplePolylog_ne_zero (F : Type*) [Field F] [Fintype F]
    [DecidableEq (RatFunc F)] {w : ℕ} (s : Composition w)
    (ε : Fin s.length → Fˣ) : multiplePolylog F s ε ≠ 0 := by
  sorry

/-! ## Layer 1: products and value algebras -/

/-- Thakur's product theorem in weight-graded form: the product of the ordinary
MZV spaces of weights w and w' lies in the space of weight w + w', and likewise
for the alternating spaces (Thakur 2010, Theorem 3; Im–Kim–Le–Ngo Dac–Pham,
Proposition 4.2). -/
theorem zeta_space_mul_le (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)]
    (w w' : ℕ) :
    zetaSpace F w * zetaSpace F w' ≤ zetaSpace F (w + w') ∧
      alternatingZetaSpace F w * alternatingZetaSpace F w' ≤
        alternatingZetaSpace F (w + w') := by
  sorry

/-! ## Layer 2: binary relations and generation -/

/-- Brown generation: Thakur's family spans every ordinary MZV weight space. -/
theorem brown_spanning (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule.span (RatFunc F) (Set.range fun s :
      {s : Composition w // s ∈ thakurIndices (Fintype.card F) w} =>
      multipleZeta F s.1 (fun _ => 1)) = zetaSpace F w := by
  sorry

/-- Weak alternating Brown generation by arrays over Thakur's family. -/
theorem alternating_brown_spanning (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule.span (RatFunc F) (Set.range fun a :
      (Σ s : {s : Composition w // s ∈ thakurIndices (Fintype.card F) w},
        Fin s.1.length → Fˣ) => multipleZeta F a.1.1 a.2) =
      alternatingZetaSpace F w := by
  sorry

/-- Ordinary and alternating zeta spaces equal their respective polylogarithm
spaces, with the same coefficient field and weight. -/
theorem value_space_bridges (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    zetaSpace F w = polylogSpace F w ∧
      alternatingZetaSpace F w = alternatingPolylogSpace F w := by
  sorry

/-- Strong Brown generation by all alternating q-indivisible polylogarithms. -/
theorem strong_brown_spanning (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Submodule.span (RatFunc F) (Set.range fun a :
      (Σ s : {s : Composition w // s ∈ indivisibleIndices (Fintype.card F) w},
        Fin s.1.length → Fˣ) => multiplePolylog F a.1.1 a.2) =
      alternatingPolylogSpace F w := by
  sorry

/-! ## Layer 3: deformation periods and ABP independence -/

/-- Chang's grading theorem (Chang 2014, Theorem 2.2.1(1)): in any common
overfield of the infinity completion and an algebraic closure of K with
compatible K-embeddings, the spans over that algebraic closure of the MZVs of
the different weights are independent; weight zero contributes the scalars. -/
theorem zeta_algebra_graded (F : Type*) [Field F] [Fintype F]
    [DecidableEq (RatFunc F)] (E : Type*) [Field E]
    [Algebra (RatFunc F) E] [Algebra (RatFunc.CompletionAtInfty F) E]
    [Algebra (AlgebraicClosure (RatFunc F)) E]
    [IsScalarTower (RatFunc F) (RatFunc.CompletionAtInfty F) E]
    [IsScalarTower (RatFunc F) (AlgebraicClosure (RatFunc F)) E] :
    iSupIndep (fun w : ℕ => Submodule.span (AlgebraicClosure (RatFunc F))
      (Set.range fun s : Composition w =>
        algebraMap (RatFunc.CompletionAtInfty F) E (multipleZeta F s (fun _ => 1)))) := by
  sorry

/-! ## Layer 4: Frobenius difference solution spaces -/

/-- Prefixes of the reduced q-indivisible family: later parts are multiples of
q-1. The empty prefix is retained in weight zero. -/
def reducedPrefixes (q w : ℕ) : Set (List ℕ) :=
  {l | ∃ s : Composition w, s ∈ indivisibleIndices q w ∧
    (∀ a ∈ s.blocks.tail, q - 1 ∣ a) ∧ l.IsPrefix s.blocks}

/-- The residual of the complete reduced Frobenius system after coefficient
descent to F(t)[theta]. The polynomial variable is theta; RatFunc.X is t.
Functions vanish outside the prefix tree. -/
noncomputable def frobeniusResidual (F : Type*) [Field F] [Fintype F] (w : ℕ) :
    (List ℕ → Polynomial (RatFunc F)) →ₗ[RatFunc F]
      (List ℕ → Polynomial (RatFunc F)) := by
  classical
  exact {
    toFun := fun f l => if l ∈ reducedPrefixes (Fintype.card F) w then
      (f l).comp (Polynomial.X ^ Fintype.card F) -
        (f l + ∑ n ∈ Finset.range w, f (l ++ [n + 1])) *
          (Polynomial.C RatFunc.X - Polynomial.X) ^ (w - l.sum)
      else f l
    map_add' := by
      intro f g
      ext l
      simp only [Pi.add_apply]
      split_ifs
      · simp only [Polynomial.add_comp, Finset.sum_add_distrib]
        ring_nf
      · rfl
    map_smul' := by
      intro a f
      ext l
      simp only [Pi.smul_apply, RingHom.id_apply]
      split_ifs
      · simp only [Polynomial.smul_comp, ← Finset.smul_sum]
        simp only [Algebra.smul_def]
        ring_nf
      · rfl }

/-- The solution space X_w on its descended polynomial carrier; the degree
descent theorem identifies it with the original localized rational system. -/
noncomputable def frobeniusSolutionSpace (F : Type*) [Field F] [Fintype F] (w : ℕ) :
    Submodule (RatFunc F) (List ℕ → Polynomial (RatFunc F)) :=
  LinearMap.ker (frobeniusResidual F w)

/-- The complete Frobenius solution space is a line in weights divisible by
q-1 and zero in the other weights (Chang–Chen–Mishiba, Theorem 4.3.5). -/
theorem frobenius_solution_dimension (F : Type*) [Field F] [Fintype F] (w : ℕ) :
    Module.Finite (RatFunc F) (frobeniusSolutionSpace F w) ∧
      Module.finrank (RatFunc F) (frobeniusSolutionSpace F w) =
        if Fintype.card F - 1 ∣ w then 1 else 0 := by
  sorry

/-- On the full reduced prefix tree, a positive-weight character-twisted
Frobenius system has only the zero polynomial solution if the weight is not
divisible by q-1 or its total character is nontrivial
(Im–Kim–Le–Ngo Dac–Pham, proof of Theorem 3.4, Cases 1 and 2). -/
theorem twisted_system_rigidity (F : Type*) [Field F] [Fintype F]
    (w : ℕ) (hw : 0 < w) (ε : Fˣ)
    (γ : AlgebraicClosure (RatFunc F))
    (hγ : γ ^ (Fintype.card F - 1) =
      algebraMap (RatFunc F) (AlgebraicClosure (RatFunc F)) (RatFunc.C (ε : F)))
    (δ : List ℕ → Polynomial (AlgebraicClosure (RatFunc F)))
    (hsupport : ∀ l, l ∉ reducedPrefixes (Fintype.card F) w → δ l = 0)
    (heq : ∀ l ∈ reducedPrefixes (Fintype.card F) w,
      (δ l).map (FiniteField.frobeniusAlgHom F (AlgebraicClosure (RatFunc F))).toRingHom =
        (δ l + Polynomial.C (if l = [] then γ else 1) *
          ∑ n ∈ Finset.range w, δ (l ++ [n + 1])) *
        (Polynomial.X - Polynomial.C
          ((algebraMap (RatFunc F) (AlgebraicClosure (RatFunc F)) RatFunc.X) ^
            Fintype.card F)) ^ (w - l.sum))
    (hvanish : ¬ (Fintype.card F - 1) ∣ w ∨ ε ≠ 1) : δ = 0 := by
  sorry

/-- Ngo Dac's two-row system in weights q+k-1, 2 ≤ k ≤ q, has the
Eulerian line at k=q-1 and only the zero solution at every other k.
In every case its second leaf coefficient vanishes (Ngo Dac, §6). -/
theorem two_row_rigidity (F : Type*) [Field F] [Fintype F]
    (hq : 2 < Fintype.card F) (k : ℕ) (hk : 2 ≤ k) (hkq : k ≤ Fintype.card F)
    (δ₁ δ₂ : Polynomial (AlgebraicClosure (RatFunc F)))
    (a₁ a₂ : Polynomial F)
    (h₁ : δ₁.map (FiniteField.frobeniusAlgHom F (AlgebraicClosure (RatFunc F))).toRingHom =
      (δ₁ + δ₂ + a₁.map (algebraMap F (AlgebraicClosure (RatFunc F))) *
        ((Polynomial.X ^ Fintype.card F - Polynomial.X) +
          (k - 1 : ℕ) • (Polynomial.X ^ Fintype.card F - Polynomial.C
            ((algebraMap (RatFunc F) (AlgebraicClosure (RatFunc F)) RatFunc.X) ^
              Fintype.card F)))) *
      (Polynomial.X - Polynomial.C
        ((algebraMap (RatFunc F) (AlgebraicClosure (RatFunc F)) RatFunc.X) ^
          Fintype.card F)) ^ (Fintype.card F + k - 1))
    (h₂ : δ₂.map (FiniteField.frobeniusAlgHom F (AlgebraicClosure (RatFunc F))).toRingHom =
      (δ₂ + a₂.map (algebraMap F (AlgebraicClosure (RatFunc F)))) *
      (Polynomial.X - Polynomial.C
        ((algebraMap (RatFunc F) (AlgebraicClosure (RatFunc F)) RatFunc.X) ^
          Fintype.card F)) ^ (Fintype.card F - 1)) :
    a₂ = 0 ∧ δ₂ = 0 ∧
      if k = Fintype.card F - 1 then
        ∃ a : Polynomial F,
          a₁ = a * (Polynomial.X ^ Fintype.card F - Polynomial.X) ∧
          δ₁ = a.map (algebraMap F (AlgebraicClosure (RatFunc F))) *
            (Polynomial.X - Polynomial.C
              (algebraMap (RatFunc F) (AlgebraicClosure (RatFunc F)) RatFunc.X)) ^
                (2 * Fintype.card F)
      else δ₁ = 0 ∧ a₁ = 0 := by
  sorry

/-! ## Layer 5: independence, bases and dimensions -/

/-- Ngo Dac's independence theorem for every weight and parts less than q. -/
theorem small_entry_independent (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    LinearIndependent (RatFunc F) (fun s :
      {s : Composition w // s ∈ smallEntryIndices (Fintype.card F) w} =>
      multipleZeta F s.1 (fun _ => 1)) := by
  sorry

/-- Q-indivisible MZVs are independent through weight 2q-2 when q is greater
than two; the relation at weight 2q-1 is a sharp obstruction. -/
theorem q_indivisible_independent (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)]
    (hq : 2 < Fintype.card F) (w : ℕ) (hw : w ≤ 2 * Fintype.card F - 2) :
    LinearIndependent (RatFunc F) (fun s :
      {s : Composition w // s ∈ indivisibleIndices (Fintype.card F) w} =>
      multipleZeta F s.1 (fun _ => 1)) := by
  sorry

/-- Q-indivisible ordinary CMPL values form a basis of the MZV weight space. -/
theorem cmpl_ind_basis (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    LinearIndependent (RatFunc F) (fun s :
      {s : Composition w // s ∈ indivisibleIndices (Fintype.card F) w} =>
      multiplePolylog F s.1 (fun _ => 1)) ∧
    Submodule.span (RatFunc F) (Set.range fun s :
      {s : Composition w // s ∈ indivisibleIndices (Fintype.card F) w} =>
      multiplePolylog F s.1 (fun _ => 1)) = zetaSpace F w := by
  sorry

/-- Thakur's basis theorem: ordinary MZVs on the Thakur family are independent
and span the full weight space. -/
theorem thakur_basis (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    LinearIndependent (RatFunc F) (fun s :
      {s : Composition w // s ∈ thakurIndices (Fintype.card F) w} =>
      multipleZeta F s.1 (fun _ => 1)) ∧
    Submodule.span (RatFunc F) (Set.range fun s :
      {s : Composition w // s ∈ thakurIndices (Fintype.card F) w} =>
      multipleZeta F s.1 (fun _ => 1)) = zetaSpace F w := by
  sorry

/-- Todd's dimension formula for the entire MZV weight space. -/
theorem todd_dimension (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Module.finrank (RatFunc F) (zetaSpace F w) = toddNumber (Fintype.card F) w := by
  sorry

/-- Thakur's basis over an algebraic closure of K, in any common overfield of
that algebraic closure and the infinity completion with compatible K-embeddings. -/
theorem thakur_basis_algebraicClosure (F : Type*) [Field F] [Fintype F]
    [DecidableEq (RatFunc F)] (E : Type*) [Field E]
    [Algebra (RatFunc F) E] [Algebra (RatFunc.CompletionAtInfty F) E]
    [Algebra (AlgebraicClosure (RatFunc F)) E]
    [IsScalarTower (RatFunc F) (RatFunc.CompletionAtInfty F) E]
    [IsScalarTower (RatFunc F) (AlgebraicClosure (RatFunc F)) E] (w : ℕ) :
    LinearIndependent (AlgebraicClosure (RatFunc F)) (fun s :
      {s : Composition w // s ∈ thakurIndices (Fintype.card F) w} =>
      algebraMap (RatFunc.CompletionAtInfty F) E (multipleZeta F s.1 (fun _ => 1))) ∧
    Submodule.span (AlgebraicClosure (RatFunc F)) (Set.range fun s :
      {s : Composition w // s ∈ thakurIndices (Fintype.card F) w} =>
      algebraMap (RatFunc.CompletionAtInfty F) E (multipleZeta F s.1 (fun _ => 1))) =
    Submodule.span (AlgebraicClosure (RatFunc F)) (Set.range fun s : Composition w =>
      algebraMap (RatFunc.CompletionAtInfty F) E (multipleZeta F s (fun _ => 1))) := by
  sorry

/-- Distinct degree characters have linearly independent (q-1)-st roots
over the infinity completion in every common overfield
(Im–Kim–Le–Ngo Dac–Pham, Lemma 3.1). -/
theorem character_roots_independent (F : Type*) [Field F] [Fintype F]
    [DecidableEq (RatFunc F)] (E : Type*) [Field E]
    [Algebra (RatFunc.CompletionAtInfty F) E] (γ : Fˣ → E)
    (hγ : ∀ ε, γ ε ^ (Fintype.card F - 1) =
      algebraMap (RatFunc.CompletionAtInfty F) E
        (algebraMap (RatFunc F) (RatFunc.CompletionAtInfty F) (RatFunc.C (ε : F)))) :
    LinearIndependent (RatFunc.CompletionAtInfty F) γ := by
  sorry

/-- The Hoffman-like family of alternating CMPL values is a basis, both of
the alternating polylogarithm space and of the alternating MZV space. -/
theorem alternating_hoffman_basis (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    LinearIndependent (RatFunc F) (fun a :
      (Σ s : {s : Composition w // s ∈ indivisibleIndices (Fintype.card F) w},
        Fin s.1.length → Fˣ) => multiplePolylog F a.1.1 a.2) ∧
    Submodule.span (RatFunc F) (Set.range fun a :
      (Σ s : {s : Composition w // s ∈ indivisibleIndices (Fintype.card F) w},
        Fin s.1.length → Fˣ) => multiplePolylog F a.1.1 a.2) =
      alternatingZetaSpace F w := by
  sorry

/-- The alternating MZV dimension is the alternating composition count. -/
theorem alternating_dimension (F : Type*) [Field F] [Fintype F] [DecidableEq (RatFunc F)] (w : ℕ) :
    Module.finrank (RatFunc F) (alternatingZetaSpace F w) =
      alternatingNumber (Fintype.card F) w := by
  sorry

/-- The direct AMZV index family of the companion Note, through weight 3q-2:
no entry q up to weight 2q-2; up to weight 3q-3, no entry in {q, 2q-1, 2q} or
exactly one adjacent pair (q-1, q); at weight 3q-2 for q > 2, no entry in
{q, 2q-1, 2q, 3q-2}, or exactly one adjacent pair (q-1, q) or (2q-2, q) other
than (q-1, q-1, q), or (q-1, 2q-1); at q = 2 and weight 4, three listed tuples. -/
def directIndices (q w : ℕ) : Set (Composition w) :=
  {s | if w ≤ 2 * q - 2 then ∀ a ∈ s.blocks, a ≠ q
    else if w ≤ 3 * q - 3 then
      (∀ a ∈ s.blocks, a ≠ q ∧ a ≠ 2 * q - 1 ∧ a ≠ 2 * q) ∨
        ∃! i : Fin (s.length - 1),
          s.blocks[i.val]? = some (q - 1) ∧ s.blocks[i.val + 1]? = some q
    else if q = 2 then s.blocks ∈ [[2, 1, 1], [1, 2, 1], [1, 3]]
    else
      (∀ a ∈ s.blocks, a ≠ q ∧ a ≠ 2 * q - 1 ∧ a ≠ 2 * q ∧ a ≠ 3 * q - 2) ∨
        (s.blocks ≠ [q - 1, q - 1, q] ∧ ∃! i : Fin (s.length - 1),
          (s.blocks[i.val]? = some (q - 1) ∨ s.blocks[i.val]? = some (2 * q - 2)) ∧
            s.blocks[i.val + 1]? = some q) ∨
        s.blocks = [q - 1, 2 * q - 1]}

/-- Direct AMZV spanning through weight 2q-2 by Thakur arrays whose q entries
carry character one (Im–Kim–Le–Ngo Dac–Pham, Proposition 4.11). This statement
does not pass through CMPL values. -/
theorem direct_small_weight_spanning (F : Type*) [Field F] [Fintype F]
    [DecidableEq (RatFunc F)] (w : ℕ) (hw : w ≤ 2 * Fintype.card F - 2) :
    Submodule.span (RatFunc F) (Set.range fun a :
      {a : (Σ s : Composition w, Fin s.length → Fˣ) //
        a.1 ∈ thakurIndices (Fintype.card F) w ∧
          ∀ i, a.1.blocksFun i = Fintype.card F → a.2 i = 1} =>
      multipleZeta F a.1.1 a.1.2) = alternatingZetaSpace F w := by
  sorry

/-- Direct independence of the companion Note's AMZVs through weight 3q-2
for every finite field, with character one over the entries q and 2q-1
(the Note, Theorem 1.6). -/
theorem direct_small_weight_independent (F : Type*) [Field F] [Fintype F]
    [DecidableEq (RatFunc F)]
    (w : ℕ) (hw : w ≤ 3 * Fintype.card F - 2) :
    LinearIndependent (RatFunc F) (fun a :
      {a : (Σ s : Composition w, Fin s.length → Fˣ) //
        a.1 ∈ directIndices (Fintype.card F) w ∧ ∀ i,
          (a.1.blocksFun i = Fintype.card F ∨
            a.1.blocksFun i = 2 * Fintype.card F - 1) → a.2 i = 1} =>
      multipleZeta F a.1.1 a.1.2) := by
  sorry

end TauCetiRoadmap.DrinfeldModulesAndTModulesPartII
