import Mathlib
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Pieri
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.JacobiTrudi
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Symmetric
import TauCeti.RepresentationTheory.Symmetric.FrobeniusCharacteristic
import TauCeti.RepresentationTheory.Symmetric.Specht.StandardBasis
import TauCeti.RepresentationTheory.Symmetric.Specht.SumOfSquares
import TauCeti.Combinatorics.Young.HookLength.Formula
import TauCeti.Combinatorics.Enumerative.Partition.Conjugate
import TauCeti.Combinatorics.Young.Schensted
import TauCeti.RepresentationTheory.Symmetric.RowColumnSubgroup
import TauCeti.RepresentationTheory.Symmetric.Symmetrizer
import TauCeti.RepresentationTheory.Symmetric.PermutationModule.Basic
import TauCeti.RepresentationTheory.Symmetric.PermutationModule.PowerSum
import TauCeti.RepresentationTheory.Symmetric.PermutationModule.YoungRule
import TauCeti.RepresentationTheory.Symmetric.TensorAction.Basic
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.MurnaghanNakayama
import TauCeti.RepresentationTheory.Symmetric.ClassSize
import TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter
import TauCeti.RepresentationTheory.Induction.ClassFunction
import TauCeti.GroupTheory.Perm.SumCongr
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Basic
import TauCeti.RepresentationTheory.Symmetric.TensorAction.SchurWeyl
import TauCeti.RepresentationTheory.Symmetric.TensorAction.Faithful
import TauCeti.Combinatorics.Enumerative.PerfectMatching
import TauCeti.Combinatorics.Brauer.Associativity
import TauCeti.Combinatorics.Brauer.Relations
import TauCeti.Combinatorics.Brauer.PropagatingNumber
import TauCeti.RepresentationTheory.ClassicalGroups.BrauerGenerators.Symplectic
import TauCeti.RepresentationTheory.ClassicalGroups.BrauerGenerators.Orthogonal.TensorPower

/-!
# Representations of the symmetric group, Specht modules, and Schur-Weyl duality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`. The
statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge
on names and signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry` is
allowed in this human-owned roadmap library -- these are goals, not proofs.

The imported Tau Ceti modules supply the dictionary, tableaux, dominance, Young subgroups,
symmetrizers, Specht modules and basis, hook lengths, characters, finite Schur theory,
finite-variable Frobenius characteristic and row insertion. Aliases below consume those native
carriers. The new signatures pin shared skew tableaux, LR, stable symmetric functions, Hall pairing,
the native-compatible stable Frobenius map, RSK and the remaining duality constructions.

The design follows the layers of `README.md`: the partition/diagram/class dictionary and orders (Layer 0);
Young subgroups and `M^λ` (Layer 1); Young symmetrizers (Layer 2); the Specht modules `S^λ` (Layer 3);
irreducibility and completeness (Layer 4); the standard basis and hook lengths (Layer 5); the characters
(Layer 6); Schur functions, the Frobenius characteristic, and RSK (Layer 7);
Schur-Weyl duality for `GLₔ × Sₙ` (Layer 8); and Schur-Weyl duality for the orthogonal and symplectic groups
via the Brauer algebra (Layer 9). `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.SchurWeyl

open scoped TensorProduct DirectSum
open CategoryTheory

/-! ## Layer 0: partitions, diagrams, tableaux, and orders -/

/- **The partition/diagram dictionary**: a partition of `n` is the same data as a Young diagram of size
`n` (via `YoungDiagram.ofRowLens`/`equivListRowLens`). This connects Mathlib's two unrelated combinatorial
vocabularies. -/
abbrev partitionEquivYoungDiagram (n : ℕ) :
    n.Partition ≃ {μ : YoungDiagram // μ.card = n} :=
  TauCeti.partitionEquivYoungDiagram n

/-- **Conjugacy classes of `Sₙ` are partitions of `n`** (via `Equiv.Perm.partition` and
`partition_eq_of_isConj`); the common index set of classes, characters, and Specht modules. -/
noncomputable abbrev partitionEquivConjClasses (n : ℕ) :
    n.Partition ≃ ConjClasses (Equiv.Perm (Fin n)) := TauCeti.partitionEquivConjClasses n

/-- The Young diagram of a partition, as a convenience for the statements below. -/
abbrev diagramOf {n : ℕ} (μ : n.Partition) : YoungDiagram := TauCeti.diagramOf μ

/-- **Dominance order** on partitions: `∀ k, ∑_{i<k} μᵢ ≥ ∑_{i<k} νᵢ` with the parts taken in
decreasing order (a partial order), the order in which Specht modules appear in the permutation
modules. Stated on sorted parts because `Nat.Partition.parts` is an unordered multiset. -/
abbrev Dominates {n : ℕ} (μ ν : n.Partition) : Prop := TauCeti.Dominates μ ν

/-- The **conjugate (transpose) partition** `μᵀ`, read off the transposed Young diagram. -/
abbrev conjugate {n : ℕ} (μ : n.Partition) : n.Partition := TauCeti.conjugate μ

/- Conjugation of partitions **reverses** dominance: `μ ⊵ ν ↔ νᵀ ⊵ μᵀ`. -/

/- **Standard Young tableaux** of a diagram: bijective, row- and column-increasing fillings (Mathlib has
only the semistandard `SemistandardYoungTableau`). -/
abbrev StandardYoungTableau (μ : YoungDiagram) : Type := TauCeti.StandardYoungTableau μ

/-- Standard Young tableaux of a fixed shape are finitely many. -/
noncomputable instance instFintypeStandardYoungTableau (μ : YoungDiagram) :
    Fintype (StandardYoungTableau μ) := inferInstance

/-- The number of standard Young tableaux of shape `μ`; this is `f^λ`, the dimension of `S^λ`.
Defined as the cardinality of the tableau type, so the counting statements below
(`finrank_spechtModule`, `sum_sq_standardCount`) constrain `StandardYoungTableau`, not an
unattached natural number. -/
noncomputable abbrev standardCount (μ : YoungDiagram) : ℕ := TauCeti.standardCount μ

/-! ## Layer 1: Young subgroups and the permutation modules `M^λ` -/

/- **The Young subgroup** `Sλ ≤ Sₙ`, the stabilizer of the ordered partition of `Fin n` into consecutive
blocks of sizes `μ₁, μ₂, …` taken in the decreasing order `μ.parts.sort (· ≥ ·)` (the parts multiset is
unordered, so the definition must pin a sort; the card/index statements below are order-independent);
isomorphic to `∏ᵢ Perm (Fin μᵢ)`. -/
noncomputable abbrev youngSubgroup {n : ℕ} (μ : n.Partition) :
    Subgroup (Equiv.Perm (Fin n)) := TauCeti.youngSubgroup μ

/-- **The permutation module** `M^λ = ℚ[Sₙ/Sλ]` on the `λ`-tabloids, reusing `Rep.ofMulAction`. Its
dimension is the multinomial coefficient `n! / ∏ᵢ μᵢ!` (`youngSubgroup_index_mul`). -/
noncomputable abbrev permutationModule {n : ℕ} (μ : n.Partition) : Rep ℚ (Equiv.Perm (Fin n)) :=
  TauCeti.permutationModule μ

/-- **Kostka numbers**, defined combinatorially as the number of semistandard tableaux of shape
`μ`-diagram and content `ν`; `kostkaNumber μ μ = 1` and `kostkaNumber μ ν = 0` unless `Dominates μ ν`. Its
identification with the multiplicity of `S^λ` in `M^μ` (Young's rule proper) needs the Specht modules and
their irreducibility; its native implementation is consumed. -/
noncomputable abbrev kostkaNumber {n : ℕ} (μ ν : n.Partition) : ℕ := TauCeti.kostkaNumber μ ν

/-! ## Layer 2: Young symmetrizers -/

/- A **`λ`-tableau**: a bijective filling of the cells of `μ` by `Fin μ.card`, the datum a Young
symmetrizer is built from. -/
abbrev YoungTableau (μ : YoungDiagram) : Type := TauCeti.YoungTableau μ

/-- The **row group** of a `λ`-tableau: permutations preserving each row. -/
abbrev rowSubgroup {μ : YoungDiagram} (t : YoungTableau μ) :
    Subgroup (Equiv.Perm (Fin μ.card)) := TauCeti.YoungTableau.rowSubgroup t

/-- The **column group** of a `λ`-tableau: permutations preserving each column. -/
abbrev colSubgroup {μ : YoungDiagram} (t : YoungTableau μ) :
    Subgroup (Equiv.Perm (Fin μ.card)) := TauCeti.YoungTableau.colSubgroup t

/-- **The Young symmetrizer** `c_t = a_t · b_t ∈ ℚ[Sₙ]`, where `a_t = ∑_{p ∈ rowSubgroup t} p` and
`b_t = ∑_{q ∈ colSubgroup t} sign(q) • q` (using `Equiv.Perm.sign`). -/
noncomputable abbrev youngSymmetrizer {μ : YoungDiagram} (t : YoungTableau μ) :
    MonoidAlgebra ℚ (Equiv.Perm (Fin μ.card)) := TauCeti.YoungTableau.youngSymmetrizer t

/- **Essential idempotence**: `c_t² = (n! / f^λ) • c_t`, so `(f^λ / n!) • c_t` is idempotent. -/

/-! ## Layer 3: the Specht modules `S^λ` -/

/- **The Specht module** `S^λ`, the subrepresentation of `M^λ` spanned by the polytabloids, equivalently
the left ideal `ℚ[Sₙ] c_t`; packaged as a finite-dimensional representation. -/
noncomputable abbrev spechtModule {n : ℕ} (μ : n.Partition) : FDRep ℚ (Equiv.Perm (Fin n)) :=
  TauCeti.spechtModule μ

-- **The submodule theorem (James)** is the engine of irreducibility: for any `Sₙ`-stable submodule
-- `U ≤ M^λ`, either `S^λ ≤ U` or `U ≤ (S^λ)ᗮ` for the tabloid bilinear form. Its precise Lean statement
-- needs the concrete-submodule presentation of `S^λ` inside `permutationModule μ` and the tabloid form
-- `⟨·,·⟩`, both named as targets in `README.md` Layer 3.

/-! ## Layer 4: completeness and irreducibility (the classification) -/

/- **Irreducibility** of the Specht modules over `ℚ` (characteristic `0`). -/

/- **Absolute irreducibility** over `ℚ`: the endomorphism ring is `ℚ` (Schur index `1`), stated as the
one-dimensionality of the endomorphism space. This is a genuine milestone: irreducibility over `ℚ` does not
give it, and rational character values do not force Schur index `1`; it is what makes `ℂ ⊗_ℚ S^λ` stay
irreducible. -/

/- **Distinctness**: non-isomorphic across distinct partitions. -/

/- **Completeness**: every simple representation of `Sₙ` over `ℚ` is a Specht module. With
`partitionEquivConjClasses` and #irreducibles = #classes (from `../CharacterTheory`), `μ ↦ S^λ` is a
bijection onto the irreducibles. -/

/-! ## Layer 5: the standard basis and the hook-length formula -/

/- **The standard basis**: the polytabloids indexed by standard Young tableaux form a basis of `S^λ`,
so `dim S^λ = f^λ`. -/
noncomputable def spechtStandardBasis {n : ℕ} (μ : n.Partition) :
    Module.Basis (StandardYoungTableau (diagramOf μ)) ℚ (spechtModule μ) :=
  TauCeti.spechtModuleStandardBasis μ

/-- **Hook length** of a cell (arm + leg + 1). -/
abbrev hookLength (μ : YoungDiagram) (c : ℕ × ℕ) : ℕ := μ.hookLength c

/- **The hook-length formula** `f^λ · ∏_c hook(c) = n!`. -/

/-! ## Layer 6: characters and class sizes -/

/- **The integer-valued Specht character** `χ^λ` (values are integers because the classes of `Sₙ` are
rational). -/
noncomputable abbrev spechtChar {n : ℕ} (μ : n.Partition) : Equiv.Perm (Fin n) → ℤ :=
  TauCeti.spechtChar μ

/-- The character value on a class, indexed by its cycle-type partition. -/
noncomputable abbrev spechtCharValue {n : ℕ} (μ ν : n.Partition) : ℤ := TauCeti.spechtCharValue μ ν

/-- **The character table of `Sₙ`** as an integer matrix indexed by partitions. It satisfies the
character-table specification of `../CharacterTheory` (row/column orthogonality with the class sizes). -/
noncomputable def symmetricCharacterTable (n : ℕ) : Matrix n.Partition n.Partition ℤ :=
  TauCeti.symmetricCharacterTable n

/-! ## Layer 7: symmetric functions, the Frobenius characteristic, and RSK -/

/- **Schur polynomials**, defined combinatorially by semistandard tableaux (and, via Jacobi-Trudi, as a
determinant of `MvPolynomial.hsymm`); a `ℤ`-basis of the symmetric functions. -/
noncomputable abbrev schurPoly (σ : Type*) (R : Type*) [Fintype σ] [CommSemiring R]
    {n : ℕ} (μ : n.Partition) : MvPolynomial σ R := TauCeti.schurPoly σ R μ

theorem schurPoly_isSymmetric (σ : Type*) (R : Type*) [Fintype σ] [CommSemiring R]
    {n : ℕ} (μ : n.Partition) : (schurPoly σ R μ).IsSymmetric :=
  TauCeti.schurPoly_isSymmetric μ

/-- Finite skew cells, with native containment order on diagrams. -/
def skewCells (inner outer : YoungDiagram) : Finset (ℕ × ℕ) := outer.cells \ inner.cells

/-- LR reading order: top rows first, each read right to left. -/
noncomputable def skewReadingCells (inner outer : YoungDiagram) : List (ℕ × ℕ) :=
  (skewCells inner outer).toList.mergeSort fun p q =>
    decide (p.1 < q.1 ∨ (p.1 = q.1 ∧ q.2 ≤ p.2))

/-- Zero-indexed letters; the ballot condition applies to every prefix. -/
def IsBallotWord (w : List ℕ) : Prop :=
  ∀ t k : ℕ, ((w.take t).count (k + 1)) ≤ ((w.take t).count k)

/-- A shared skew semistandard carrier; entries outside the skew cells are normalized to zero. -/
structure SkewSemistandardYoungTableau (inner outer : YoungDiagram) where
  inner_le_outer : inner ≤ outer
  entry : ℕ × ℕ → ℕ
  zero_outside : ∀ p, p ∉ skewCells inner outer → entry p = 0
  row_weak : ∀ p ∈ skewCells inner outer, ∀ q ∈ skewCells inner outer,
    p.1 = q.1 → p.2 < q.2 → entry p ≤ entry q
  col_strict : ∀ p ∈ skewCells inner outer, ∀ q ∈ skewCells inner outer,
    p.2 = q.2 → p.1 < q.1 → entry p < entry q

noncomputable def skewContent {inner outer : YoungDiagram}
    (T : SkewSemistandardYoungTableau inner outer) : ℕ →₀ ℕ :=
  ((skewCells inner outer).val.map T.entry).toFinsupp

abbrev BoundedSkewSSYT (d : ℕ) (inner outer : YoungDiagram) :=
  {T : SkewSemistandardYoungTableau inner outer //
    ∀ p ∈ skewCells inner outer, T.entry p < d}

instance finite_boundedSkewSSYT (d : ℕ) (inner outer : YoungDiagram) :
    Finite (BoundedSkewSSYT d inner outer) := by sorry

/-- Bijection and entry/content compatibility with the existing straight carrier. -/
noncomputable def straightSkewEquiv (d : ℕ) (outer : YoungDiagram) :
    BoundedSkewSSYT d ⊥ outer ≃ TauCeti.BoundedSSYT d outer := by sorry

theorem straightSkewEquiv_content (d : ℕ) (outer : YoungDiagram)
    (T : BoundedSkewSSYT d ⊥ outer) :
    skewContent T.1 = SemistandardYoungTableau.content (straightSkewEquiv d outer T).1 := by sorry

/-- Native row insertion uses lists of rows, so the conversion is explicit. -/
noncomputable def boundedSSYTRowsEquiv (d : ℕ) :
    (Σ μ : YoungDiagram, TauCeti.BoundedSSYT d μ) ≃
      {rows : List (List ℕ) // rows.IsTableauRows ∧ ∀ row ∈ rows, ∀ x ∈ row, x < d} := by sorry

abbrev StandardSkewTableau (inner outer : YoungDiagram) :=
  {T : SkewSemistandardYoungTableau inner outer //
    ∀ k, skewContent T k = if k < (skewCells inner outer).card then 1 else 0}

noncomputable def straightStandardSkewEquiv (outer : YoungDiagram) :
    StandardSkewTableau ⊥ outer ≃ TauCeti.StandardYoungTableau outer := by sorry

/-- LR tableaux are the content-and-ballot subtype of the shared carrier. -/
abbrev LRTableau (inner outer content : YoungDiagram) :=
  {T : SkewSemistandardYoungTableau inner outer //
    (∀ k, skewContent T k = content.rowLen k) ∧
      IsBallotWord ((skewReadingCells inner outer).map T.entry)}

instance finite_lrTableau (inner outer content : YoungDiagram) :
    Finite (LRTableau inner outer content) := by sorry

noncomputable def lrCoefficient (μ ν κ : YoungDiagram) : ℕ :=
  Nat.card (LRTableau μ κ ν)

/-- Finite skew Schur polynomial with the shared bounded tableau carrier. -/
noncomputable def skewSchurPoly (d : ℕ) (R : Type*) [CommSemiring R]
    (inner outer : YoungDiagram) : MvPolynomial (Fin d) R := by
  classical
  letI := Fintype.ofFinite (BoundedSkewSSYT d inner outer)
  exact ∑ T : BoundedSkewSSYT d inner outer,
    MvPolynomial.monomial
      (Finsupp.onFinset Finset.univ (fun i : Fin d => skewContent T.1 i) (by simp)) 1

theorem skewSchurPoly_straight (d : ℕ) (R : Type*) [CommSemiring R] (κ : YoungDiagram) :
    skewSchurPoly d R ⊥ κ = TauCeti.diagramSchurPoly d R κ := by sorry

theorem littlewoodRichardson (σ R : Type*) [Fintype σ] [CommSemiring R]
    {n m : ℕ} (μ : n.Partition) (ν : m.Partition) :
    TauCeti.schurPoly σ R μ * TauCeti.schurPoly σ R ν =
      ∑ κ : (n + m).Partition,
        (lrCoefficient (TauCeti.diagramOf μ) (TauCeti.diagramOf ν) (TauCeti.diagramOf κ) : R) •
          TauCeti.schurPoly σ R κ := by sorry

theorem diagramLittlewoodRichardson (d : ℕ) (R : Type*) [CommSemiring R]
    (μ ν : YoungDiagram) :
    TauCeti.diagramSchurPoly d R μ * TauCeti.diagramSchurPoly d R ν =
      ∑ κ : (μ.card + ν.card).Partition,
        (lrCoefficient μ ν (TauCeti.diagramOf κ) : R) •
          TauCeti.diagramSchurPoly d R (TauCeti.diagramOf κ) := by sorry

/-- **The Frobenius characteristic / power-sum expansion** `p_μ = ∑_λ χ^λ(μ) s_λ`: the character table
is the change of basis between power sums (`MvPolynomial.psumPart`) and Schur functions. The identity
holds for every variable set `σ` (setting variables to zero is a ring homomorphism), but it determines
the character table only when `Fintype.card σ ≥ n` — for fewer variables the rows with `ℓ(λ) > |σ|`
have `s_λ = 0` and drop out. The "this is the character table" reading of README Layer 7 is the
`|σ| ≥ n` instance of this statement. -/
theorem frobenius_powerSum (σ : Type*) [Fintype σ] [DecidableEq σ] {n : ℕ} (ν : n.Partition) :
    MvPolynomial.psumPart σ ℤ ν
      = ∑ μ : n.Partition, TauCeti.spechtCharValue μ ν • TauCeti.schurPoly σ ℤ μ := sorry

open scoped Classical in
/-- The native rim-hook recursion changes the shape and cycle-type degree together. -/
theorem murnaghanNakayama {n r : ℕ} (hr : 0 < r)
    (κ ρ : (n + r).Partition) (ν : n.Partition)
    (hρ : ρ.parts = Multiset.cons r ν.parts) :
    TauCeti.spechtCharValue κ ρ =
      ∑ μ : n.Partition with (TauCeti.diagramOf κ).IsRimHook (TauCeti.diagramOf μ),
        (-1 : ℤ) ^ (TauCeti.diagramOf κ).rimHookHeight (TauCeti.diagramOf μ) *
          TauCeti.spechtCharValue μ ν := by sorry

/-- **The RSK correspondence**: permutations biject with pairs of standard tableaux of the same shape,
by row insertion. -/
noncomputable def rsk (n : ℕ) :
    Equiv.Perm (Fin n) ≃
      Σ μ : n.Partition,
        StandardYoungTableau (diagramOf μ) × StandardYoungTableau (diagramOf μ) := sorry

/-- **The sum-of-squares corollary** `∑_λ (f^λ)² = n!` (both sides count `|Sₙ|`). -/
theorem sum_sq_standardCount (n : ℕ) :
    ∑ μ : n.Partition, (standardCount (diagramOf μ)) ^ 2 = n.factorial :=
  TauCeti.sum_sq_standardCount n

/-! ### Stable symmetric functions, Hall pairing, and the native complex characteristic -/

noncomputable def zeroLast (R : Type*) [CommRing R] (d : ℕ) :
    MvPolynomial (Fin (d + 1)) R →ₐ[R] MvPolynomial (Fin d) R :=
  MvPolynomial.aeval (Fin.snoc MvPolynomial.X 0)

/-- The inverse-limit degree module has actual finite-variable compatibility equations. -/
noncomputable def stableHomogeneousSubmodule (R : Type*) [CommRing R] (n : ℕ) :
    Submodule R (∀ d : ℕ, TauCeti.symmetricHomogeneousSubmodule (Fin d) R n) where
  carrier := {f | ∀ d, zeroLast R d (f (d + 1)) = (f d : MvPolynomial (Fin d) R)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

abbrev StableDegree (R : Type*) [CommRing R] (n : ℕ) := ↥(stableHomogeneousSubmodule R n)
abbrev StableSymmetric (R : Type*) [CommRing R] := DirectSum ℕ (StableDegree R)

noncomputable instance stableDegreeGCommRing (R : Type*) [CommRing R] :
    DirectSum.GCommRing (StableDegree R) := by sorry

noncomputable instance stableDegreeGSemiring (R : Type*) [CommRing R] :
    DirectSum.GSemiring (StableDegree R) := (stableDegreeGCommRing R).toGSemiring

noncomputable instance stableDegreeGAlgebra (R : Type*) [CommRing R] :
    DirectSum.GAlgebra R (StableDegree R) := by sorry

noncomputable def stableDegreeMul (R : Type*) [CommRing R] (n m : ℕ) :
    StableDegree R n →ₗ[R] StableDegree R m →ₗ[R] StableDegree R (n + m) := by sorry

theorem stableDegreeMul_component (R : Type*) [CommRing R] (n m d : ℕ)
    (f : StableDegree R n) (g : StableDegree R m) :
    ((stableDegreeMul R n m f g).1 d : MvPolynomial (Fin d) R) =
      (f.1 d : MvPolynomial (Fin d) R) * (g.1 d : MvPolynomial (Fin d) R) := by sorry

theorem stableDegreeMul_of (R : Type*) [CommRing R] (n m : ℕ)
    (f : StableDegree R n) (g : StableDegree R m) :
    DirectSum.of (StableDegree R) (n + m) (stableDegreeMul R n m f g) =
      DirectSum.of (StableDegree R) n f * DirectSum.of (StableDegree R) m g := by sorry

noncomputable def stableSpecialize (R : Type*) [CommRing R] (d : ℕ) :
    StableSymmetric R →ₐ[R] MvPolynomial (Fin d) R := by sorry

theorem stableSpecialize_of (R : Type*) [CommRing R] (n d : ℕ) (f : StableDegree R n) :
    stableSpecialize R d (DirectSum.of (StableDegree R) n f) =
      (f.1 d : MvPolynomial (Fin d) R) := by sorry

noncomputable def stableProjectionEquiv (R : Type*) [CommRing R] (n d : ℕ) (h : n ≤ d) :
    StableDegree R n ≃ₗ[R] TauCeti.symmetricHomogeneousSubmodule (Fin d) R n := by sorry

theorem stableProjectionEquiv_apply (R : Type*) [CommRing R] (n d : ℕ) (h : n ≤ d)
    (f : StableDegree R n) : stableProjectionEquiv R n d h f = f.1 d := by sorry

noncomputable def stableSchur (R : Type*) [CommRing R] {n : ℕ} (μ : n.Partition) :
    StableDegree R n := by sorry

theorem stableSchur_component (R : Type*) [CommRing R] {n : ℕ} (μ : n.Partition) (d : ℕ) :
    ((stableSchur R μ).1 d : MvPolynomial (Fin d) R) = TauCeti.schurPoly (Fin d) R μ := by sorry

noncomputable def stableSchurBasis (R : Type*) [CommRing R] (n : ℕ) :
    Module.Basis n.Partition R (StableDegree R n) := by sorry

theorem stableSchurBasis_apply (R : Type*) [CommRing R] (n : ℕ) (μ : n.Partition) :
    stableSchurBasis R n μ = stableSchur R μ := by sorry

noncomputable def stableElementary (R : Type*) [CommRing R] (r : ℕ) : StableSymmetric R := by sorry
noncomputable def stableComplete (R : Type*) [CommRing R] (r : ℕ) : StableSymmetric R := by sorry
noncomputable def stablePowerPart (R : Type*) [CommRing R] {n : ℕ} (μ : n.Partition) :
    StableDegree R n := by sorry

theorem stableElementary_specialize (R : Type*) [CommRing R] (r d : ℕ) :
    stableSpecialize R d (stableElementary R r) = MvPolynomial.esymm (Fin d) R r := by sorry

theorem stableComplete_specialize (R : Type*) [CommRing R] (r d : ℕ) :
    stableSpecialize R d (stableComplete R r) = MvPolynomial.hsymm (Fin d) R r := by sorry

theorem stablePowerPart_component (R : Type*) [CommRing R] {n : ℕ} (μ : n.Partition) (d : ℕ) :
    ((stablePowerPart R μ).1 d : MvPolynomial (Fin d) R) =
      MvPolynomial.psumPart (Fin d) R μ := by sorry

/-- Generators are indexed by positive integers, with variable r representing e_(r+1). -/
noncomputable def stableElementaryAlgEquiv (R : Type*) [CommRing R] :
    MvPolynomial ℕ R ≃ₐ[R] StableSymmetric R := by sorry

theorem stableElementaryAlgEquiv_X (R : Type*) [CommRing R] (r : ℕ) :
    stableElementaryAlgEquiv R (MvPolynomial.X r) = stableElementary R (r + 1) := by sorry

noncomputable def stableOmega (R : Type*) [CommRing R] :
    StableSymmetric R ≃ₐ[R] StableSymmetric R := by sorry

theorem stableOmega_elementary (R : Type*) [CommRing R] (r : ℕ) :
    stableOmega R (stableElementary R r) = stableComplete R r := by sorry

theorem stableOmega_schur (R : Type*) [CommRing R] {n : ℕ} (μ : n.Partition) :
    stableOmega R (DirectSum.of (StableDegree R) n (stableSchur R μ)) =
      DirectSum.of (StableDegree R) n (stableSchur R (TauCeti.conjugate μ)) := by sorry

theorem stableOmega_involutive (R : Type*) [CommRing R] :
    Function.Involutive (stableOmega R) := by sorry

noncomputable def hallPairing (R : Type*) [CommRing R] (n : ℕ) :
    LinearMap.BilinForm R (StableDegree R n) := by sorry

theorem hallPairing_coordinates (R : Type*) [CommRing R] (n : ℕ) (f g : StableDegree R n) :
    hallPairing R n f g = ∑ μ : n.Partition,
      (stableSchurBasis R n).repr f μ * (stableSchurBasis R n).repr g μ := by sorry

theorem hallPairing_powerPart (R : Type*) [CommRing R] {n : ℕ} (μ ν : n.Partition) :
    hallPairing R n (stablePowerPart R μ) (stablePowerPart R ν) =
      if μ = ν then (TauCeti.zPart μ : R) else 0 := by sorry

noncomputable def stableFrobenius (n : ℕ) :
    TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n)) ≃ₗ[ℂ] StableDegree ℂ n := by sorry

theorem stableFrobenius_specialize (n d : ℕ) (h : n ≤ d)
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n))) :
    (stableFrobenius n f).1 d = TauCeti.frobeniusCharacteristic n d h f := by sorry

theorem stableFrobenius_powerSum (n : ℕ)
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n))) :
    stableFrobenius n f = ∑ μ : n.Partition,
      (TauCeti.ClassFunction.toConjClasses f (TauCeti.partitionEquivConjClasses n μ) / (TauCeti.zPart μ : ℂ)) •
        stablePowerPart ℂ μ := by sorry

theorem stableFrobenius_isometry (n : ℕ)
    (f g : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n))) :
    hallPairing ℂ n (stableFrobenius n f) (stableFrobenius n g) =
      TauCeti.ClassFunction.characterPairing f g := by sorry

theorem stableFrobenius_specht (n : ℕ) (μ : n.Partition) :
    stableFrobenius n (TauCeti.ClassFunction.ofCharacter (TauCeti.spechtModuleℂ μ).ρ) =
      stableSchur ℂ μ := by sorry

noncomputable def stableDegreeIntegerComplex (n : ℕ) :
    StableDegree ℤ n →ₗ[ℤ] StableDegree ℂ n := by sorry

theorem stableDegreeIntegerComplex_component (n d : ℕ) (f : StableDegree ℤ n) :
    ((stableDegreeIntegerComplex n f).1 d : MvPolynomial (Fin d) ℂ) =
      MvPolynomial.map (Int.castRingHom ℂ) (f.1 d : MvPolynomial (Fin d) ℤ) := by sorry

noncomputable def integralFrobenius (n : ℕ) :
    (TauCeti.virtualCharacters ℂ (Equiv.Perm (Fin n))) ≃ₗ[ℤ] StableDegree ℤ n := by sorry

/-- The integral lattice map agrees with the complex characteristic on underlying functions. -/
theorem integralFrobenius_complex (n : ℕ)
    (v : TauCeti.virtualCharacters ℂ (Equiv.Perm (Fin n)))
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n))) (hv : v.1 = f.1) :
    stableDegreeIntegerComplex n (integralFrobenius n v) = stableFrobenius n f := by sorry

/-- Concrete block convention: first n slots then the last m slots. -/
abbrev blockEmbedding (n m : ℕ) :
    (Equiv.Perm (Fin n) × Equiv.Perm (Fin m)) →* Equiv.Perm (Fin (n + m)) :=
  Equiv.Perm.finSumPermHom n m

theorem blockEmbedding_apply (n m : ℕ)
    (σ : Equiv.Perm (Fin n)) (τ : Equiv.Perm (Fin m)) :
    blockEmbedding n m (σ, τ) =
      Equiv.Perm.finSumPerm σ τ := Equiv.Perm.finSumPermHom_apply (σ, τ)

noncomputable def blockEquiv (n m : ℕ) :
    (Equiv.Perm (Fin n) × Equiv.Perm (Fin m)) ≃* (blockEmbedding n m).range := by sorry

theorem blockEquiv_apply (n m : ℕ) (x : Equiv.Perm (Fin n) × Equiv.Perm (Fin m)) :
    (blockEquiv n m x).1 = blockEmbedding n m x := by sorry

noncomputable def blockProduct (n m : ℕ)
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n)))
    (g : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin m))) :
    TauCeti.ClassFunction ℂ (blockEmbedding n m).range := by sorry

theorem blockProduct_apply (n m : ℕ)
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n)))
    (g : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin m)))
    (σ : Equiv.Perm (Fin n)) (τ : Equiv.Perm (Fin m)) :
    (blockProduct n m f g).1 (blockEquiv n m (σ, τ)) = f.1 σ * g.1 τ := by sorry

theorem stableFrobenius_induction (n m : ℕ)
    (f : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin n)))
    (g : TauCeti.ClassFunction ℂ (Equiv.Perm (Fin m))) :
    DirectSum.of (StableDegree ℂ) (n + m)
        (stableFrobenius (n + m)
          (TauCeti.ClassFunction.ind (blockEmbedding n m).range (blockProduct n m f g))) =
      DirectSum.of (StableDegree ℂ) n (stableFrobenius n f) *
        DirectSum.of (StableDegree ℂ) m (stableFrobenius m g) := by sorry

/-! ## Layer 8: Schur-Weyl duality -/

/- The native permutation representation, on the existing tensor-power carrier. -/
noncomputable abbrev permAction (d n : ℕ) :
    Representation ℂ (Equiv.Perm (Fin n)) (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) :=
  TauCeti.permTensorAction ℂ d n

/-- The native diagonal general-linear representation on the same tensor power. -/
noncomputable abbrev glAction (d n : ℕ) :
    Representation ℂ (GL (Fin d) ℂ) (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) :=
  TauCeti.tensorPowerRep ℂ d n

noncomputable abbrev permActionAlgHom (d n : ℕ) :
    MonoidAlgebra ℂ (Equiv.Perm (Fin n)) →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) := TauCeti.permTensorActionAlgHom ℂ d n

/-- **The complex Specht module** `ℂ ⊗ S^λ`, still irreducible (absolute irreducibility over `ℚ`). -/
noncomputable abbrev spechtModuleℂ {n : ℕ} (μ : n.Partition) :
    FDRep ℂ (Equiv.Perm (Fin n)) := TauCeti.spechtModuleℂ μ

/-- The same-shape native Schur functor owned by ClassicalGroups Layer 2. -/
noncomputable abbrev schurFunctor (d : ℕ) {n : ℕ} (μ : n.Partition) :
    FDRep ℂ (GL (Fin d) ℂ) := TauCeti.schurFunctor d (TauCeti.diagramOf μ)

set_option maxHeartbeats 4000000 in
/-- **Schur-Weyl duality**: `(ℂᵈ)^{⊗n} ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)` as an
`Sₙ × GLₔ`-representation. The equivariance **is** the theorem — a bare `ℂ`-linear equivalence would
be equivalent to the native dimension count — so the isomorphism is required to
intertwine `permAction` with the summand-wise Specht actions and `glAction` with the summand-wise
Schur-functor actions (`DirectSum.lmap` transports the componentwise actions). -/
theorem schurWeylDecomposition (d n : ℕ) :
    ∃ e : (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ]
        DirectSum {μ : n.Partition // μ.parts.card ≤ d}
          (fun μ => TensorProduct ℂ (spechtModuleℂ μ.1) (schurFunctor d μ.1)),
      (∀ σ : Equiv.Perm (Fin n),
        e.toLinearMap ∘ₗ (permAction d n σ)
          = DirectSum.lmap
              (fun μ : {μ : n.Partition // μ.parts.card ≤ d} =>
                TensorProduct.map ((spechtModuleℂ μ.1).ρ σ)
                  (LinearMap.id : (schurFunctor d μ.1) →ₗ[ℂ] (schurFunctor d μ.1)))
            ∘ₗ e.toLinearMap) ∧
      ∀ g : GL (Fin d) ℂ,
        e.toLinearMap ∘ₗ (glAction d n g)
          = DirectSum.lmap
              (fun μ : {μ : n.Partition // μ.parts.card ≤ d} =>
                TensorProduct.map
                  (LinearMap.id : (spechtModuleℂ μ.1) →ₗ[ℂ] (spechtModuleℂ μ.1))
                  ((schurFunctor d μ.1).ρ g))
            ∘ₗ e.toLinearMap := sorry

/-! ## Layer 9: Schur-Weyl duality for the orthogonal and symplectic groups (the Brauer algebra) -/

/-- The native matching carrier, composition and middle-loop combinatorics. -/
abbrev brauerDiagram (k : ℕ) := TauCeti.BrauerDiagram k
abbrev composeDiagram {k : ℕ} (D₁ D₂ : brauerDiagram k) := TauCeti.composeDiagram D₁ D₂
noncomputable abbrev middleLoopCount {k : ℕ} (D₁ D₂ : brauerDiagram k) := TauCeti.middleLoopCount D₁ D₂

/-- The additional three-layer loop-count identity needed for weighted associativity. -/
theorem middleLoopCount_assoc {k : ℕ} (D₁ D₂ D₃ : brauerDiagram k) :
    middleLoopCount D₁ D₂ + middleLoopCount (composeDiagram D₁ D₂) D₃ =
      middleLoopCount D₂ D₃ + middleLoopCount D₁ (composeDiagram D₂ D₃) := by sorry

/-- **The Brauer algebra** `B_k(δ)`: the free `ℂ`-module on `brauerDiagram k`, with multiplication by
vertical stacking of diagrams weighted by `δ^{#closed loops}` (the `δ`-power loop rule). A unital associative
`ℂ`-algebra of dimension `(2k-1)!!`. Pinned opaquely with its `Ring`/`Algebra` structure; the loop-rule
multiplication and its associativity are the load-bearing combinatorics (see `README.md`). -/
def brauerAlgebra : (δ : ℂ) → (k : ℕ) → Type := sorry

noncomputable def brauerAlgebraRing : (δ : ℂ) → (k : ℕ) → Ring (brauerAlgebra δ k) := sorry

noncomputable instance (δ : ℂ) (k : ℕ) : Ring (brauerAlgebra δ k) :=
  brauerAlgebraRing δ k
noncomputable def brauerAlgebraAlgebra : (δ : ℂ) → (k : ℕ) → Algebra ℂ (brauerAlgebra δ k) := sorry

noncomputable instance (δ : ℂ) (k : ℕ) : Algebra ℂ (brauerAlgebra δ k) :=
  brauerAlgebraAlgebra δ k

/-- **The diagram basis** of `B_k(δ)`, indexed by Brauer diagrams; hence `finrank = (2k-1)!!`. -/
noncomputable def brauerBasis : (δ : ℂ) → (k : ℕ) →
    Module.Basis (brauerDiagram k) ℂ (brauerAlgebra δ k) := sorry

/-- The explicit loop-weighted basis product constrains the algebra structure. -/
theorem brauerBasis_mul (δ : ℂ) (k : ℕ) (D₁ D₂ : brauerDiagram k) :
    brauerBasis δ k D₁ * brauerBasis δ k D₂ =
      δ ^ middleLoopCount D₁ D₂ • brauerBasis δ k (composeDiagram D₁ D₂) := by sorry

theorem brauerBasis_one (δ : ℂ) (k : ℕ) :
    brauerBasis δ k (TauCeti.permToBrauer 1) = 1 := by sorry

/-- **The action of `B_k(n)` on `V^{⊗k}`** for `V = ℂⁿ` orthogonal (nondegenerate symmetric form,
loop value `δ = n = dim V`): through-strands permute tensor factors, bottom arcs contract a pair of slots
against the form (cap) and top arcs expand against its inverse (cup). -/
noncomputable def brauerActionOrth : (n k : ℕ) →
    brauerAlgebra (n : ℂ) k →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) := sorry

/-- Mathlib's orthogonal-group definition fixes the trivial star, even over ℂ. -/
abbrev complexOrthogonalGroup (n : ℕ) := Matrix.orthogonalGroup (Fin n) ℂ

/-- The native diagonal orthogonal tensor action. -/
noncomputable abbrev orthAction (n k : ℕ) :
    Representation ℂ (complexOrthogonalGroup n) (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) :=
  (TauCeti.stdOrthogonalRep ℂ n).tensorPower k

theorem brauerActionOrth_capCup (n k : ℕ) (a b : Fin k) (hab : a ≠ b) :
    brauerActionOrth n k (brauerBasis (n : ℂ) k (TauCeti.capCup a b)) =
      TauCeti.orthogonalCupCapAt ℂ n k a b := by sorry

/-- **The two actions commute** (through-strands permute, arcs contract/expand against an `O(V)`-invariant
form). -/
theorem brauerActionOrth_commute (n k : ℕ) (g : complexOrthogonalGroup n)
    (b : brauerAlgebra (n : ℂ) k) :
    Commute (orthAction n k g) (brauerActionOrth n k b) := sorry

/-- **Orthogonal Schur-Weyl, surjectivity onto the commutant** (first fundamental theorem for `O(V)`): the
centralizer of the image of `O(V)` in `End(V^{⊗k})` is exactly the image of `B_k(n)`. This is the
invariant-theoretic content and does not require semisimplicity of the Brauer algebra. -/
theorem brauerActionOrth_surjective_to_commutant (n k : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : complexOrthogonalGroup n => (orthAction n k g))
      = (brauerActionOrth n k).range := sorry

/-- **Orthogonal Schur-Weyl, reverse centralizer**: the finite-dimensional bicommutant statement for the two
image subalgebras. -/
theorem brauerActionOrth_reverse_centralizer (n k : ℕ) :
    Subalgebra.centralizer ℂ ((brauerActionOrth n k).range : Set _)
      = Algebra.adjoin ℂ
          (Set.range fun g : complexOrthogonalGroup n => (orthAction n k g)) := sorry

/- **The harmonic (traceless) tensors** in `V^{⊗k}`: the common kernel of the contraction (trace) maps
`V^{⊗k} → V^{⊗(k-2)}` that cap a pair of slots against the invariant form. These are not themselves one
irreducible; the irreducible `O(V)`-module `E_λ` is the trace-free part of the shape-`λ` Schur piece (the
range of `c_t` intersected with `harmonicTensors`), and the cups rebuild the rest from lower tensor powers. -/
-- Defined from the actual contraction kernels in the selected interfaces below.

/-- **The symmetric group as the no-arcs subalgebra** `ℂ[Sₖ] ↪ B_k(δ)` (the permutation diagrams,
those with only through-strands). This exhibits Layer 8's `Sₖ` inside the Brauer algebra. -/
noncomputable def permutationDiagramAlgHom : (δ : ℂ) → (k : ℕ) →
    MonoidAlgebra ℂ (Equiv.Perm (Fin k)) →ₐ[ℂ] brauerAlgebra δ k := sorry

theorem permutationDiagramAlgHom_single (δ : ℂ) (k : ℕ) (σ : Equiv.Perm (Fin k)) :
    permutationDiagramAlgHom δ k (MonoidAlgebra.single σ 1) =
      brauerBasis δ k (TauCeti.permToBrauer σ) := by sorry

/-- Native stacking fixes the product order, so permutation diagrams act without inversion. -/
theorem brauerActionOrth_permToBrauer (n k : ℕ) (σ : Equiv.Perm (Fin k)) :
    brauerActionOrth n k (permutationDiagramAlgHom (n : ℂ) k (MonoidAlgebra.single σ (1 : ℂ)))
      = (permAction n k σ) := sorry

/-- The native diagonal symplectic tensor action. -/
noncomputable abbrev sympAction (l k : ℕ) :
    Representation ℂ (Matrix.symplecticGroup (Fin l) ℂ)
      (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) :=
  (TauCeti.stdSymplecticRep ℂ l).tensorPower k

/-- Permutations on the actual symplectic tensor carrier. -/
noncomputable abbrev sympPermAction (l k : ℕ) :
    Representation ℂ (Equiv.Perm (Fin k)) (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) :=
  PiTensorProduct.reindexRepresentation ℂ ((Fin l ⊕ Fin l) → ℂ) (Fin k)

/-- **The action of `B_k(-2l)` on `V^{⊗k}`** for `V` symplectic. The alternating form is antisymmetric, so
the cap/cup of each pair must be given a definite ordering; with the standard alternating form and that
ordering fixed, the loop value is `δ = -2l = -dim V` (an ordered closed loop evaluates to the trace of the
alternating pairing). That this is an algebra map is the check of the Brauer generator relations
`s² = 1`, `e² = δ e`, `s e = e`, the braid, and the mixed relations at `δ = -2l`. -/
noncomputable def brauerActionSymp : (l k : ℕ) →
    brauerAlgebra (-(2 * l : ℂ)) k →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) := sorry

/-- The ordered two-strand generator agrees with the native alternating cap/cup map. -/
theorem brauerActionSymp_capCup (l : ℕ) :
    brauerActionSymp l 2
        (brauerBasis (-(2 * l : ℂ)) 2 (TauCeti.capCup (0 : Fin 2) 1)) =
      TauCeti.symplecticCupCap ℂ l := by sorry

theorem brauerActionSymp_permToBrauer (l k : ℕ) (σ : Equiv.Perm (Fin k)) :
    brauerActionSymp l k
        (permutationDiagramAlgHom (-(2 * l : ℂ)) k (MonoidAlgebra.single σ 1)) =
      ((Equiv.Perm.sign σ : ℤ) : ℂ) • sympPermAction l k σ := by sorry

/-- **Symplectic Schur-Weyl, surjectivity onto the commutant** (first fundamental theorem for `Sp(V)`): the
centralizer of the image of `Sp(V)` is exactly the image of `B_k(-2l)`; holds regardless of semisimplicity. -/
theorem brauerActionSymp_surjective_to_commutant (l k : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : Matrix.symplecticGroup (Fin l) ℂ => (sympAction l k g))
      = (brauerActionSymp l k).range := sorry

/-- **Symplectic Schur-Weyl, reverse centralizer**: the bicommutant statement for the two image subalgebras. -/
theorem brauerActionSymp_reverse_centralizer (l k : ℕ) :
    Subalgebra.centralizer ℂ ((brauerActionSymp l k).range : Set _)
      = Algebra.adjoin ℂ
          (Set.range fun g : Matrix.symplecticGroup (Fin l) ℂ => (sympAction l k g)) := sorry

/-- **Semisimplicity of `B_k(δ)` for large/generic `δ`**: whenever `|δ| ≥ 2k - 2`, the Brauer algebra is
semisimple, with irreducibles indexed by partitions of `k, k-2, k-4, …`. Stated on `|δ|` with `δ : ℤ` so that
it covers both geometric values, orthogonal `δ = n` and symplectic `δ = -2l`. The bound is sufficient, not
sharp; use Rui, A criterion on the semisimple Brauer algebras, Theorem 1.2,
and prove the k = 0 and k = 1 cases directly. -/
theorem brauerAlgebra_isSemisimple_of_large_abs (δ : ℤ) (k : ℕ) (h : (2 * k - 2 : ℤ) ≤ |δ|) :
    IsSemisimpleRing (brauerAlgebra (δ : ℂ) k) := sorry

/-! ### Explicit contraction positions, trace filtration, and cup relations

The README gives the full classification/evaluation and cell-head comparison. These selected
interfaces pin actual tensor spaces, native diagrams, quotient maps, and the small-rank obstruction.
All newly admitted data families have their meaningful parameters inside the admitted Pi type.
-/

abbrev OrthTensor (n k : ℕ) := ⨂[ℂ] (_ : Fin k), (Fin n → ℂ)
abbrev SympTensor (l k : ℕ) := ⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)

/-- No repeated slots and a fixed order for alternating contractions. -/
abbrev ContractionPosition (k : ℕ) := {p : Fin k × Fin k // p.1 < p.2}

/-- The increasing complement of the two chosen slots; the equations below fix this choice. -/
noncomputable def unpairedSlot : (k : ℕ) → (p : ContractionPosition k) →
    Fin (k - 2) ↪ Fin k := by sorry

theorem unpairedSlot_strictMono (k : ℕ) (p : ContractionPosition k) :
    StrictMono (unpairedSlot k p) := by sorry

theorem unpairedSlot_range (k : ℕ) (p : ContractionPosition k) :
    Set.range (unpairedSlot k p) = {i | i ≠ p.1.1 ∧ i ≠ p.1.2} := by sorry

noncomputable def orthContraction : (n k : ℕ) → (p : ContractionPosition k) →
    OrthTensor n k →ₗ[ℂ] OrthTensor n (k - 2) := by sorry

noncomputable def sympContraction : (l k : ℕ) → (p : ContractionPosition k) →
    SympTensor l k →ₗ[ℂ] SympTensor l (k - 2) := by sorry

theorem orthContraction_tprod (n k : ℕ) (p : ContractionPosition k)
    (v : Fin k → (Fin n → ℂ)) :
    orthContraction n k p (PiTensorProduct.tprod ℂ v) =
      (∑ i : Fin n, v p.1.1 i * v p.1.2 i) •
        PiTensorProduct.tprod ℂ (fun i => v (unpairedSlot k p i)) := by sorry

theorem sympContraction_tprod (l k : ℕ) (p : ContractionPosition k)
    (v : Fin k → ((Fin l ⊕ Fin l) → ℂ)) :
    sympContraction l k p (PiTensorProduct.tprod ℂ v) =
      TauCeti.stdSymplecticBilinForm ℂ l (v p.1.1) (v p.1.2) •
        PiTensorProduct.tprod ℂ (fun i => v (unpairedSlot k p i)) := by sorry

/-- The original orthogonal name is now defined by the actual contraction kernels. -/
noncomputable def harmonicTensors (n k : ℕ) : Submodule ℂ (OrthTensor n k) :=
  ⨅ p : ContractionPosition k, LinearMap.ker (orthContraction n k p)

noncomputable def harmonicTensorsSymp (l k : ℕ) : Submodule ℂ (SympTensor l k) :=
  ⨅ p : ContractionPosition k, LinearMap.ker (sympContraction l k p)

/-- Native propagating number specifies the contraction ideal, including its zero tail. -/
noncomputable def brauerTraceIdeal (δ : ℂ) (k j : ℕ) : Submodule ℂ (brauerAlgebra δ k) :=
  Submodule.span ℂ {b | ∃ D : brauerDiagram k,
    D.propagatingNumber + 2 * j ≤ k ∧ b = brauerBasis δ k D}

theorem brauerTraceIdeal_mul_left (δ : ℂ) (k j : ℕ) (a b : brauerAlgebra δ k)
    (hb : b ∈ brauerTraceIdeal δ k j) : a * b ∈ brauerTraceIdeal δ k j := by sorry

theorem brauerTraceIdeal_mul_right (δ : ℂ) (k j : ℕ) (a b : brauerAlgebra δ k)
    (hb : b ∈ brauerTraceIdeal δ k j) : b * a ∈ brauerTraceIdeal δ k j := by sorry

theorem brauerTraceIdeal_zero_tail (δ : ℂ) (k j : ℕ) (h : k < 2 * j) :
    brauerTraceIdeal δ k j = ⊥ := by sorry

noncomputable def orthTraceFiltration (n k j : ℕ) : Submodule ℂ (OrthTensor n k) :=
  Submodule.span ℂ {w | ∃ b ∈ brauerTraceIdeal (n : ℂ) k j,
    ∃ v : OrthTensor n k, w = brauerActionOrth n k b v}

noncomputable def sympTraceFiltration (l k j : ℕ) : Submodule ℂ (SympTensor l k) :=
  Submodule.span ℂ {w | ∃ b ∈ brauerTraceIdeal (-(2 * l : ℂ)) k j,
    ∃ v : SympTensor l k, w = brauerActionSymp l k b v}

theorem orthTraceFiltration_succ_le (n k j : ℕ) :
    orthTraceFiltration n k (j + 1) ≤ orthTraceFiltration n k j := by sorry

theorem sympTraceFiltration_succ_le (l k j : ℕ) :
    sympTraceFiltration l k (j + 1) ≤ sympTraceFiltration l k j := by sorry

/-- Comap gives the literal submodule of F_j used in the quotient F_j/F_(j+1). -/
abbrev OrthTraceGrade (n k j : ℕ) :=
  letI : HasQuotient ↥(orthTraceFiltration n k j) (Submodule ℂ ↥(orthTraceFiltration n k j)) :=
    Submodule.hasQuotient (R := ℂ) (M := ↥(orthTraceFiltration n k j))
  ↥(orthTraceFiltration n k j) ⧸
    Submodule.comap (orthTraceFiltration n k j).subtype (orthTraceFiltration n k (j + 1))

abbrev SympTraceGrade (l k j : ℕ) :=
  letI : HasQuotient ↥(sympTraceFiltration l k j) (Submodule ℂ ↥(sympTraceFiltration l k j)) :=
    Submodule.hasQuotient (R := ℂ) (M := ↥(sympTraceFiltration l k j))
  ↥(sympTraceFiltration l k j) ⧸
    Submodule.comap (sympTraceFiltration l k j).subtype (sympTraceFiltration l k (j + 1))

/-- The true finite combinatorics of disjoint pairs, not a number of independent summands. -/
abbrev CupPlacement (k j : ℕ) :=
  {P : Finset (Fin k × Fin k) // P.card = j ∧
    (∀ p ∈ P, p.1 < p.2) ∧
    ∀ p ∈ P, ∀ q ∈ P, p ≠ q →
      p.1 ≠ q.1 ∧ p.1 ≠ q.2 ∧ p.2 ≠ q.1 ∧ p.2 ≠ q.2}

instance cupPlacement_finite (k j : ℕ) : Finite (CupPlacement k j) := inferInstance

/-- Insertion of inverse-form cups; pure-tensor coefficients and free-slot order are in the README. -/
noncomputable def orthCupExpansion : (n k j : ℕ) → CupPlacement k j →
    OrthTensor n (k - 2 * j) →ₗ[ℂ] OrthTensor n k := by sorry

noncomputable def sympCupExpansion : (l k j : ℕ) → CupPlacement k j →
    SympTensor l (k - 2 * j) →ₗ[ℂ] SympTensor l k := by sorry

/-- The j=1 two-strand insertion really consumes the native copairing. -/
theorem orthCupExpansion_two (n : ℕ) (P : CupPlacement 2 1) :
    orthCupExpansion n 2 1 P
        (PiTensorProduct.tprod ℂ (fun i : Fin 0 => Fin.elim0 i)) =
      TauCeti.orthogonalCup ℂ n 1 := by sorry

theorem sympCupExpansion_two (l : ℕ) (P : CupPlacement 2 1) :
    sympCupExpansion l 2 1 P
        (PiTensorProduct.tprod ℂ (fun i : Fin 0 => Fin.elim0 i)) =
      TauCeti.symplecticCup ℂ l 1 := by sorry

noncomputable def orthHarmonicCupSum (n k j : ℕ) :
    (⨁ _ : CupPlacement k j, harmonicTensors n (k - 2 * j)) →ₗ[ℂ] OrthTensor n k :=
  DirectSum.toModule ℂ _ _ fun P =>
    (orthCupExpansion n k j P).comp (harmonicTensors n (k - 2 * j)).subtype

noncomputable def sympHarmonicCupSum (l k j : ℕ) :
    (⨁ _ : CupPlacement k j, harmonicTensorsSymp l (k - 2 * j)) →ₗ[ℂ] SympTensor l k :=
  DirectSum.toModule ℂ _ _ fun P =>
    (sympCupExpansion l k j P).comp (harmonicTensorsSymp l (k - 2 * j)).subtype

noncomputable def orthHarmonicCupToGrade : (n k j : ℕ) →
    (⨁ _ : CupPlacement k j, harmonicTensors n (k - 2 * j)) →ₗ[ℂ]
      OrthTraceGrade n k j := by sorry

noncomputable def sympHarmonicCupToGrade : (l k j : ℕ) →
    (⨁ _ : CupPlacement k j, harmonicTensorsSymp l (k - 2 * j)) →ₗ[ℂ]
      SympTraceGrade l k j := by sorry

/-- The graded map is the quotient of the actual ambient cup map, not an unrelated surjection. -/
theorem orthHarmonicCupToGrade_spec (n k j : ℕ)
    (x : ⨁ _ : CupPlacement k j, harmonicTensors n (k - 2 * j)) :
    ∃ hx : orthHarmonicCupSum n k j x ∈ orthTraceFiltration n k j,
      orthHarmonicCupToGrade n k j x =
        Submodule.Quotient.mk (R := ℂ) (⟨orthHarmonicCupSum n k j x, hx⟩ : orthTraceFiltration n k j) := by sorry

theorem sympHarmonicCupToGrade_spec (l k j : ℕ)
    (x : ⨁ _ : CupPlacement k j, harmonicTensorsSymp l (k - 2 * j)) :
    ∃ hx : sympHarmonicCupSum l k j x ∈ sympTraceFiltration l k j,
      sympHarmonicCupToGrade l k j x =
        Submodule.Quotient.mk (R := ℂ) (⟨sympHarmonicCupSum l k j x, hx⟩ : sympTraceFiltration l k j) := by sorry

theorem orthHarmonicCupToGrade_surjective (n k j : ℕ) (h : 2 * j ≤ k) :
    Function.Surjective (orthHarmonicCupToGrade n k j) := by sorry

theorem sympHarmonicCupToGrade_surjective (l k j : ℕ) (h : 2 * j ≤ k) :
    Function.Surjective (sympHarmonicCupToGrade l k j) := by sorry

/-- Actual relations: ambient cup sums lying in the next filtration term. -/
noncomputable def orthCupRelations (n k j : ℕ) := LinearMap.ker (orthHarmonicCupToGrade n k j)
noncomputable def sympCupRelations (l k j : ℕ) := LinearMap.ker (sympHarmonicCupToGrade l k j)


/-! ### Matching signs and the raw symplectic cup action

The raw expansion maps above stay unchanged. The matching shuffle, diagonal change of basis,
and conjugation below distinguish their action from standard partial-matching stacking.
-/

/-- Oriented pair blocks sorted by first endpoint, then increasingly ordered free slots. -/
noncomputable def cupPlacementWord (k j : ℕ) (P : CupPlacement k j) : List (Fin k) :=
  ((P.1.toList.mergeSort (fun p q => decide (p.1 ≤ q.1))).flatMap
    (fun p => [p.1, p.2])) ++
  (List.finRange k).filter (fun i => decide (∀ p ∈ P.1, i ≠ p.1 ∧ i ≠ p.2))

theorem cupPlacementWord_perm (k j : ℕ) (P : CupPlacement k j) :
    (cupPlacementWord k j P).Perm (List.finRange k) := by sorry

/-- The one-line permutation is the actual word above, not an unspecified sign choice. -/
noncomputable def cupPlacementShuffle : (k j : ℕ) → CupPlacement k j →
    Equiv.Perm (Fin k) := by sorry

theorem cupPlacementShuffle_word (k j : ℕ) (P : CupPlacement k j) :
    (List.finRange k).map (cupPlacementShuffle k j P) = cupPlacementWord k j P := by sorry

noncomputable def cupMatchingSign (k j : ℕ) (P : CupPlacement k j) : ℂ :=
  ((Equiv.Perm.sign (cupPlacementShuffle k j P) : ℤ) : ℂ)

theorem cupMatchingSign_sq (k j : ℕ) (P : CupPlacement k j) :
    cupMatchingSign k j P * cupMatchingSign k j P = 1 := by sorry

abbrev SympCupDomain (l k j : ℕ) :=
  ⨁ _ : CupPlacement k j, harmonicTensorsSymp l (k - 2 * j)

/-- The diagonal matching-sign map on the actual harmonic direct sum. -/
noncomputable def sympCupSignChange (l k j : ℕ) : Module.End ℂ (SympCupDomain l k j) :=
  DirectSum.toModule ℂ _ _ fun P =>
    (DirectSum.lof ℂ (CupPlacement k j) _ P).comp
      (cupMatchingSign k j P • LinearMap.id)

theorem sympCupSignChange_lof (l k j : ℕ) (P : CupPlacement k j)
    (v : harmonicTensorsSymp l (k - 2 * j)) :
    sympCupSignChange l k j (DirectSum.lof ℂ _ _ P v) =
      cupMatchingSign k j P • DirectSum.lof ℂ _ _ P v := by sorry

theorem sympCupSignChange_involutive (l k j : ℕ) :
    Function.Involutive (sympCupSignChange l k j) := by sorry

noncomputable def sympNormalizedHarmonicCupSum (l k j : ℕ) :
    SympCupDomain l k j →ₗ[ℂ] SympTensor l k :=
  (sympHarmonicCupSum l k j).comp (sympCupSignChange l k j)

/-- Partial-matching stacking, loop weight −2l and sign-twisted free-slot permutation,
with terms of propagating number below k−2j set to zero; the README pins the full rule. -/
noncomputable def sympStandardCupAction : (l k j : ℕ) →
    brauerAlgebra (-(2 * l : ℂ)) k →ₐ[ℂ] Module.End ℂ (SympCupDomain l k j) := by sorry

noncomputable def sympRawCupAction : (l k j : ℕ) →
    brauerAlgebra (-(2 * l : ℂ)) k →ₐ[ℂ] Module.End ℂ (SympCupDomain l k j) := by sorry

theorem sympRawCupAction_conjugate (l k j : ℕ)
    (b : brauerAlgebra (-(2 * l : ℂ)) k) :
    sympRawCupAction l k j b =
      (sympCupSignChange l k j).comp
        ((sympStandardCupAction l k j b).comp (sympCupSignChange l k j)) := by sorry

theorem sympRawCupAction_cupSum (l k j : ℕ)
    (b : brauerAlgebra (-(2 * l : ℂ)) k) (x : SympCupDomain l k j) :
    sympHarmonicCupSum l k j (sympRawCupAction l k j b x) =
      brauerActionSymp l k b (sympHarmonicCupSum l k j x) := by sorry

theorem sympNormalizedCupAction_cupSum (l k j : ℕ)
    (b : brauerAlgebra (-(2 * l : ℂ)) k) (x : SympCupDomain l k j) :
    sympNormalizedHarmonicCupSum l k j (sympStandardCupAction l k j b x) =
      brauerActionSymp l k b (sympNormalizedHarmonicCupSum l k j x) := by sorry

theorem sympCupRelations_stable (l k j : ℕ)
    (b : brauerAlgebra (-(2 * l : ℂ)) k) (x : SympCupDomain l k j)
    (hx : x ∈ sympCupRelations l k j) :
    sympRawCupAction l k j b x ∈ sympCupRelations l k j := by sorry

theorem orthHarmonicCupToGrade_injective_stable (n k j : ℕ)
    (hj : 2 * j ≤ k) (hn : 2 * k ≤ n) :
    Function.Injective (orthHarmonicCupToGrade n k j) := by sorry

theorem sympHarmonicCupToGrade_injective_stable (l k j : ℕ)
    (hj : 2 * j ≤ k) (hl : k ≤ l) :
    Function.Injective (sympHarmonicCupToGrade l k j) := by sorry

/-- The lower tensor degree is part of the index itself. -/
abbrev HarmonicIndex (k : ℕ) := Σ j : {j : ℕ // 2 * j ≤ k}, (k - 2 * j.1).Partition

def OrthAdmissible {q : ℕ} (n : ℕ) (shape : q.Partition) : Prop :=
  (diagramOf shape).colLen 0 + (diagramOf shape).colLen 1 ≤ n

def SympAdmissible {q : ℕ} (l : ℕ) (shape : q.Partition) : Prop :=
  (diagramOf shape).colLen 0 ≤ l

/-- A chosen tableau is explicit; the README requires its choice-independence comparison. -/
noncomputable def orthShapeSpace (n : ℕ) {q : ℕ} (shape : q.Partition)
    (t : YoungTableau (diagramOf shape)) : Submodule ℂ (OrthTensor n (diagramOf shape).card) :=
  LinearMap.range ((permAction n (diagramOf shape).card).asAlgebraHom
    (TauCeti.YoungTableau.youngSymmetrizerOver ℂ t)) ⊓ harmonicTensors n (diagramOf shape).card

noncomputable def sympShapeSpace (l : ℕ) {q : ℕ} (shape : q.Partition)
    (t : YoungTableau (diagramOf shape)) : Submodule ℂ (SympTensor l (diagramOf shape).card) :=
  LinearMap.range ((sympPermAction l (diagramOf shape).card).asAlgebraHom
    (TauCeti.YoungTableau.youngSymmetrizerOver ℂ t)) ⊓ harmonicTensorsSymp l (diagramOf shape).card

/-- Defined intertwiner space; no private irreducible or multiplicity carrier. -/
abbrev OrthMultiplicity {q : ℕ} (n k : ℕ)
    (E : Subrepresentation (orthAction n q)) :=
  Representation.IntertwiningMap E.toRepresentation (orthAction n k)

abbrev SympMultiplicity {q : ℕ} (l k : ℕ)
    (E : Subrepresentation (sympAction l q)) :=
  Representation.IntertwiningMap E.toRepresentation (sympAction l k)

/-- Postcomposition is the actual commuting Brauer action on this native Hom space. -/
noncomputable def orthMultiplicityAction : (n k q : ℕ) →
    (E : Subrepresentation (orthAction n q)) → brauerAlgebra (n : ℂ) k →ₐ[ℂ]
      Module.End ℂ (OrthMultiplicity n k E) := by sorry

noncomputable def sympMultiplicityAction : (l k q : ℕ) →
    (E : Subrepresentation (sympAction l q)) → brauerAlgebra (-(2 * l : ℂ)) k →ₐ[ℂ]
      Module.End ℂ (SympMultiplicity l k E) := by sorry

theorem orthMultiplicityAction_apply (n k q : ℕ) (E : Subrepresentation (orthAction n q))
    (b : brauerAlgebra (n : ℂ) k) (f : OrthMultiplicity n k E) (v : E.toSubmodule) :
    orthMultiplicityAction n k q E b f v = brauerActionOrth n k b (f v) := by sorry

theorem sympMultiplicityAction_apply (l k q : ℕ) (E : Subrepresentation (sympAction l q))
    (b : brauerAlgebra (-(2 * l : ℂ)) k) (f : SympMultiplicity l k E) (v : E.toSubmodule) :
    sympMultiplicityAction l k q E b f v = brauerActionSymp l k b (f v) := by sorry

/-! ### Sp₂ at tensor degree three: a concrete relation, not independent cups -/
abbrev SpTwo := (Fin 1 ⊕ Fin 1) → ℂ

def spTwoE : SpTwo := Pi.single (Sum.inl 0) 1
def spTwoF : SpTwo := Pi.single (Sum.inr 0) 1

noncomputable def spTwoCup12 : SpTwo →ₗ[ℂ] SympTensor 1 3 :=
  (LinearMap.proj (Sum.inl (0 : Fin 1))).smulRight
      (PiTensorProduct.tprod ℂ ![spTwoE, spTwoF, spTwoE] - PiTensorProduct.tprod ℂ ![spTwoF, spTwoE, spTwoE]) +
    (LinearMap.proj (Sum.inr (0 : Fin 1))).smulRight
      (PiTensorProduct.tprod ℂ ![spTwoE, spTwoF, spTwoF] - PiTensorProduct.tprod ℂ ![spTwoF, spTwoE, spTwoF])
noncomputable def spTwoCup13 : SpTwo →ₗ[ℂ] SympTensor 1 3 :=
  (LinearMap.proj (Sum.inl (0 : Fin 1))).smulRight
      (PiTensorProduct.tprod ℂ ![spTwoE, spTwoE, spTwoF] - PiTensorProduct.tprod ℂ ![spTwoF, spTwoE, spTwoE]) +
    (LinearMap.proj (Sum.inr (0 : Fin 1))).smulRight
      (PiTensorProduct.tprod ℂ ![spTwoE, spTwoF, spTwoF] - PiTensorProduct.tprod ℂ ![spTwoF, spTwoF, spTwoE])
noncomputable def spTwoCup23 : SpTwo →ₗ[ℂ] SympTensor 1 3 :=
  (LinearMap.proj (Sum.inl (0 : Fin 1))).smulRight
      (PiTensorProduct.tprod ℂ ![spTwoE, spTwoE, spTwoF] - PiTensorProduct.tprod ℂ ![spTwoE, spTwoF, spTwoE]) +
    (LinearMap.proj (Sum.inr (0 : Fin 1))).smulRight
      (PiTensorProduct.tprod ℂ ![spTwoF, spTwoE, spTwoF] - PiTensorProduct.tprod ℂ ![spTwoF, spTwoF, spTwoE])

theorem spTwoCup12_apply (v : SpTwo) :
    spTwoCup12 v = PiTensorProduct.tprod ℂ ![spTwoE, spTwoF, v] -
      PiTensorProduct.tprod ℂ ![spTwoF, spTwoE, v] := by sorry

theorem spTwoCup13_apply (v : SpTwo) :
    spTwoCup13 v = PiTensorProduct.tprod ℂ ![spTwoE, v, spTwoF] -
      PiTensorProduct.tprod ℂ ![spTwoF, v, spTwoE] := by sorry

theorem spTwoCup23_apply (v : SpTwo) :
    spTwoCup23 v = PiTensorProduct.tprod ℂ ![v, spTwoE, spTwoF] -
      PiTensorProduct.tprod ℂ ![v, spTwoF, spTwoE] := by sorry

theorem spTwoCup_relation : spTwoCup12 - spTwoCup13 + spTwoCup23 = 0 := by sorry

noncomputable def spTwoCupSum : (SpTwo × SpTwo × SpTwo) →ₗ[ℂ] SympTensor 1 3 :=
  spTwoCup12.comp (LinearMap.fst ℂ SpTwo (SpTwo × SpTwo)) +
    spTwoCup13.comp ((LinearMap.fst ℂ SpTwo SpTwo).comp
      (LinearMap.snd ℂ SpTwo (SpTwo × SpTwo))) +
    spTwoCup23.comp ((LinearMap.snd ℂ SpTwo SpTwo).comp
      (LinearMap.snd ℂ SpTwo (SpTwo × SpTwo)))


/-! The raw degree-three domain action, in placement order (12,13,23). -/
abbrev SpTwoCupDomain := SpTwo × SpTwo × SpTwo

def spTwoSlot12 : SpTwoCupDomain →ₗ[ℂ] SpTwo := LinearMap.fst ℂ _ _
def spTwoSlot13 : SpTwoCupDomain →ₗ[ℂ] SpTwo :=
  (LinearMap.fst ℂ _ _).comp (LinearMap.snd ℂ _ _)
def spTwoSlot23 : SpTwoCupDomain →ₗ[ℂ] SpTwo :=
  (LinearMap.snd ℂ _ _).comp (LinearMap.snd ℂ _ _)

def spTwoRawS1 : Module.End ℂ SpTwoCupDomain :=
  spTwoSlot12.prod ((-spTwoSlot23).prod (-spTwoSlot13))
def spTwoRawS2 : Module.End ℂ SpTwoCupDomain :=
  (-spTwoSlot13).prod ((-spTwoSlot12).prod spTwoSlot23)
def spTwoRawE1 : Module.End ℂ SpTwoCupDomain :=
  ((-2 : ℂ) • spTwoSlot12 - spTwoSlot13 + spTwoSlot23).prod
    ((0 : SpTwoCupDomain →ₗ[ℂ] SpTwo).prod 0)
def spTwoRawE2 : Module.End ℂ SpTwoCupDomain :=
  (0 : SpTwoCupDomain →ₗ[ℂ] SpTwo).prod
    ((0 : SpTwoCupDomain →ₗ[ℂ] SpTwo).prod
      (spTwoSlot12 - spTwoSlot13 + (-2 : ℂ) • spTwoSlot23))

theorem spTwoRawS1_relation (v : SpTwo) : spTwoRawS1 (v, -v, v) = (v, -v, v) := by
  ext <;> simp [spTwoRawS1, spTwoSlot12, spTwoSlot13, spTwoSlot23]
theorem spTwoRawS2_relation (v : SpTwo) : spTwoRawS2 (v, -v, v) = (v, -v, v) := by
  ext <;> simp [spTwoRawS2, spTwoSlot12, spTwoSlot13, spTwoSlot23]
theorem spTwoRawE1_relation (v : SpTwo) : spTwoRawE1 (v, -v, v) = 0 := by sorry
theorem spTwoRawE2_relation (v : SpTwo) : spTwoRawE2 (v, -v, v) = 0 := by sorry

/-- These are four separate tensor-action regressions, beyond the existing rank checks. -/
theorem spTwoRawS1_cupSum :
    spTwoCupSum.comp spTwoRawS1 =
      (brauerActionSymp 1 3 (brauerBasis (-(2 * (1 : ℕ) : ℂ)) 3
        (TauCeti.permToBrauer (Equiv.swap (0 : Fin 3) 1)))).comp spTwoCupSum := by sorry
theorem spTwoRawS2_cupSum :
    spTwoCupSum.comp spTwoRawS2 =
      (brauerActionSymp 1 3 (brauerBasis (-(2 * (1 : ℕ) : ℂ)) 3
        (TauCeti.permToBrauer (Equiv.swap (1 : Fin 3) 2)))).comp spTwoCupSum := by sorry
theorem spTwoRawE1_cupSum :
    spTwoCupSum.comp spTwoRawE1 =
      (brauerActionSymp 1 3 (brauerBasis (-(2 * (1 : ℕ) : ℂ)) 3
        (TauCeti.capCup (0 : Fin 3) 1))).comp spTwoCupSum := by sorry
theorem spTwoRawE2_cupSum :
    spTwoCupSum.comp spTwoRawE2 =
      (brauerActionSymp 1 3 (brauerBasis (-(2 * (1 : ℕ) : ℂ)) 3
        (TauCeti.capCup (1 : Fin 3) 2))).comp spTwoCupSum := by sorry

theorem spTwoCupSum_finrank_range : Module.finrank ℂ (LinearMap.range spTwoCupSum) = 4 := by sorry

theorem harmonicTensorsSymp_one_three_finrank :
    Module.finrank ℂ (harmonicTensorsSymp 1 3) = 4 := by sorry

theorem brauer_three_neg_two_not_semisimple :
    ¬ IsSemisimpleRing (brauerAlgebra (-2 : ℂ) 3) := by sorry

end TauCetiRoadmap.RepresentationTheory.SchurWeyl
