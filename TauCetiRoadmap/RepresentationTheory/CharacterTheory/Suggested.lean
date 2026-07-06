import Mathlib

/-!
# Character theory and computable character tables: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has characters as traces and the **first (row) orthogonality relation** `char_orthonormal`,
Maschke's theorem, Schur's lemma, the algebraically-closed Artin-Wedderburn theorem, computable conjugacy
classes, the algebraic-integer and cyclotomic API, and `ZMod p` as a computable field (see `README.md`
for the file-by-file map). It has **no class-function space, no center-of-the-group-algebra theory, no
count, no completeness or second orthogonality, no character table, and no computation of one**.

The design follows the three deliverables of `README.md`: **A** ordinary character theory (`ClassFunction`,
`classSum`, `structureConstant`, Wedderburn/count, the table, `primitiveCentralIdempotent`, the arithmetic
of values); **B** the Dixon-Schneider specification (the coordinate identity, `centralCharacterTable`,
`IsCharacterTableSpec`, labeled uniqueness); **C** the executable algorithm over an **exact** cyclotomic
type (`Cyclotomic e`, `ExactCharTable`, `DixonPrimeData`, `IsGoodDixonPrime`, `kernelBasis`,
`eigenvalueSearch`, `liftCyclotomic`, `characterTableDixon`). `ℂ` is only the specification: the summit
`characterTable_eq` says the **embedded** exact output satisfies the `ℂ`-valued checker. `README.md`
remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.CharacterTheory

open scoped Classical Matrix
open Representation MonoidAlgebra

universe u v

/-! ## A. Ordinary character theory and the character table -/

/-! ### Layer 0: class functions and their pairing -/

/-- **Class functions**: the submodule of `G → k` of functions constant on conjugacy classes. Every
character is a member, by `char_conj`. -/
def ClassFunction (k : Type u) (G : Type v) [CommRing k] [Group G] : Submodule k (G → k) := sorry

/-- A class function is the same data as a function on conjugacy classes; this makes the character table
a **square** matrix indexed by classes. -/
noncomputable def classFunctionEquiv (k : Type u) (G : Type v) [CommRing k] [Group G] :
    ClassFunction k G ≃ₗ[k] (ConjClasses G → k) := sorry

/-- The dimension of the space of class functions is the number of conjugacy classes. -/
theorem finrank_classFunction (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G] :
    Module.finrank k (ClassFunction k G) = Nat.card (ConjClasses G) := sorry

/-- **The character pairing**: bilinear and symmetric over a general field (*not* Hermitian there); the
`g⁻¹` form matching `char_orthonormal`. Over `ℂ`, a separate lemma identifies it with the Hermitian inner
product on virtual characters. -/
noncomputable def characterPairing {k : Type u} {G : Type v} [Field k] [Group G] [Fintype G]
    (f₁ f₂ : G → k) : k := (Nat.card G : k)⁻¹ * ∑ g : G, f₁ g * f₂ g⁻¹

theorem characterPairing_nondegenerate (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G] :
    ∀ f ∈ ClassFunction k G, (∀ f' ∈ ClassFunction k G, characterPairing f f' = 0) → f = 0 := sorry

/-! ### Layer 1: the group algebra, its center, and structure constants -/

/-- **The class sum** `∑_{g ∈ C} g ∈ k[G]`. Computable on `[Fintype G] [DecidableEq G]` data. -/
def classSum (k : Type u) {G : Type v} [Semiring k] [Group G] [Fintype G] [DecidableEq G]
    (C : ConjClasses G) : MonoidAlgebra k G := sorry

theorem classSum_mem_center (k : Type u) {G : Type v} [CommRing k] [Group G] [Fintype G]
    [DecidableEq G] (C : ConjClasses G) :
    classSum k C ∈ Subalgebra.center k (MonoidAlgebra k G) := sorry

/-- The class sums are a basis of the center; its dimension is the number of classes. -/
theorem finrank_center_monoidAlgebra (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G] :
    Module.finrank k (Subalgebra.center k (MonoidAlgebra k G)) = Nat.card (ConjClasses G) := sorry

/-- **Structure constants** `aᵢⱼₖ = #{(x,y) : x ∈ Cᵢ, y ∈ Cⱼ, x*y = g_k}`. A computable `ℕ`-valued
function; the entire input to Dixon-Schneider. Coercions to `ℤ`, `k`, `ZMod p` are exposed downstream. -/
def structureConstant {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (Ci Cj Ck : ConjClasses G) : ℕ := sorry

theorem classSum_mul (k : Type u) {G : Type v} [CommRing k] [Group G] [Fintype G] [DecidableEq G]
    (Ci Cj : ConjClasses G) :
    classSum k Ci * classSum k Cj
      = ∑ Ck : ConjClasses G, (structureConstant Ci Cj Ck : k) • classSum k Ck := sorry

/-- **The integral class center**: each class sum is integral over `ℤ` inside the finite `ℤ`-algebra
`Z(ℤ[G])` spanned by the class sums (integer structure constants). The base for central-character
integrality. -/
theorem isIntegral_classSum {G : Type v} [Group G] [Fintype G] [DecidableEq G] (C : ConjClasses G) :
    IsIntegral ℤ (classSum ℤ C) := sorry

/-! ### Layer 2: Wedderburn, irreducible indexing, and the count -/

/-- **`k[G] ≅ ∏ Matₙᵢ(k)`** (`k` algebraically closed, `char ∤ |G|`); a **noncomputable** algebra
equivalence over the finite index set of simple modules. -/
theorem exists_algEquiv_pi_matrix (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Fintype.card G : k)] :
    ∃ (ι : Type) (_ : Fintype ι) (n : ι → ℕ),
      Nonempty (MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) := sorry

theorem sum_sq_dim_eq_card (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Fintype.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    ∑ i, (n i) ^ 2 = Nat.card G := sorry

/-- **The center splits** by central-character evaluation, `Z(k[G]) ≃ (ι → k)`: central characters
**separate points** of the center. The sharp form Layer 5 needs. -/
theorem center_algEquiv_pi (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Fintype.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    Nonempty (Subalgebra.center k (MonoidAlgebra k G) ≃ₐ[k] (ι → k)) := sorry

/-- **#irreducibles = #conjugacy classes.** -/
theorem card_irreps_eq_card_conjClasses (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Fintype.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    Fintype.card ι = Nat.card (ConjClasses G) := sorry

/-! ### Layer 3: the character table, idempotents, completeness, second orthogonality

The tables index rows by `Fin (Fintype.card (ConjClasses G))` (as many irreducibles as classes) and
columns by `ConjClasses G` (labeled). -/

/-- **Completeness**: irreducible characters span the class functions. -/
theorem irreducibleCharacters_span (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Fintype.card G : k)] :
    ⊤ ≤ Submodule.span k {f : G → k | ∃ (V : FDRep k G) (_ : CategoryTheory.Simple V),
      (V.character : G → k) = f} := sorry

/-- **Primitive central idempotents** `eχ = (χ(1)/|G|) ∑_g χ(g⁻¹) g ∈ Z(k[G])`; orthogonal idempotents
summing to `1`, the Wedderburn projectors. The connective tissue Layer 5 uses. -/
noncomputable def primitiveCentralIdempotent {k : Type u} {G : Type v} [Field k] [IsAlgClosed k]
    [Group G] [Fintype G] {V : Type*} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k G V) [ρ.IsIrreducible] : MonoidAlgebra k G := sorry

/-- **The character table**: `χᵢ(g_C)` for a representative of each class. -/
noncomputable def characterTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    Matrix (Fin (Fintype.card (ConjClasses G))) (ConjClasses G) ℂ := sorry

/-- **Second (column) orthogonality**, with the class-size weights, from completeness. -/
theorem char_column_orthogonality (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (C C' : ConjClasses G) :
    ∑ i, characterTable G i C * (starRingEnd ℂ) (characterTable G i C')
      = if C = C' then (Nat.card G : ℂ) / (Nat.card (ConjClasses.carrier C) : ℂ) else 0 := sorry

-- **Labeled uniqueness** (`characterTable_unique_rows`) is stated in Layer 5, after `IsCharacterTableSpec`.

/-! ### Layer 4: the arithmetic of character values -/

/-- **Character values are algebraic integers** (sums of `e`-th roots of unity in `ℤ[ζ_e]`). Stated over
`ℂ`, not over an arbitrary `k`. -/
theorem isIntegral_character {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G) (g : G) :
    IsIntegral ℤ (V.character g) := sorry

/-- **The central character** `ωᵪ : Z(k[G]) → k` (Schur), with `ωᵪ(Kⱼ) = |Cⱼ| χ(gⱼ)/χ(1)`. -/
noncomputable def centralCharacter {k : Type u} {G : Type v} [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] {V : Type*} [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k G V) [ρ.IsIrreducible] :
    Subalgebra.center k (MonoidAlgebra k G) →ₐ[k] k := sorry

/-- The value of a central character on a class sum is an algebraic integer (base-changed from the
integral class center). -/
theorem isIntegral_centralCharacter_classSum {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] (C : ConjClasses G) :
    IsIntegral ℤ (centralCharacter ρ ⟨classSum ℂ C, classSum_mem_center ℂ C⟩) := sorry

/-- **Degree divides the order.** -/
theorem finrank_dvd_card {G : Type v} [Group G] [Fintype G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) [ρ.IsIrreducible] :
    (Module.finrank ℂ V) ∣ Nat.card G := sorry

/-- **The Galois action**: `Gal(ℚ(ζ_e)/ℚ) ≃ (ZMod e)ˣ` acts on character values by `σ_k · χ (g) = χ(g^k)`.
Mandatory for the Layer-6 lift. -/
theorem character_galois_pow {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G) (g : G)
    (k : ℕ) (hk : Nat.Coprime k (Monoid.exponent G)) :
    ∃ σ : ℂ →+* ℂ, σ (V.character g) = V.character (g ^ k) := sorry

/-- **The Frobenius-Schur indicator** `ν₂(χ) = |G|⁻¹ ∑ g, χ(g²)`; `+1` for `D₄`, `-1` for `Q₈`. -/
noncomputable def frobeniusSchurIndicator {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G) : ℂ :=
  (Nat.card G : ℂ)⁻¹ * ∑ g : G, V.character (g * g)

/-- **Burnside's `pᵃqᵇ` theorem** (off the critical path; a Layer-4 application). -/
theorem isSolvable_of_card_eq_prime_pow_mul_prime_pow {G : Type v} [Group G] [Fintype G]
    {p q : ℕ} (hp : p.Prime) (hq : q.Prime) {a b : ℕ} (h : Nat.card G = p ^ a * q ^ b) :
    IsSolvable G := sorry

/-! ## B. The class algebra and the Dixon-Schneider specification -/

/-! ### Layer 5: the Dixon-Schneider characterization (the specification) -/

/-- **Class-multiplication matrix**, convention pinned: `(Mᵢ)ⱼₖ = aᵢₖⱼ`, acting on column vectors. -/
def classMultMatrix {G : Type v} [Group G] [Fintype G] [DecidableEq G] (Ci : ConjClasses G) :
    Matrix (ConjClasses G) (ConjClasses G) ℤ :=
  Matrix.of fun Cj Ck => (structureConstant Ci Ck Cj : ℤ)

theorem classMultMatrix_commute {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    (Ci Cj : ConjClasses G) : Commute (classMultMatrix Ci) (classMultMatrix Cj) := sorry

/-- **The coordinate identity** `ωᵪ(Kᵢ) ωᵪ(Kⱼ) = ∑ₖ aᵢⱼᵏ ωᵪ(Kₖ)`, from multiplicativity of `ωᵪ`. The
algebraic fact the eigenvector theorem rests on. -/
theorem centralCharacter_coordinate {G : Type v} [Group G] [Fintype G] [DecidableEq G]
    {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] (Ci Cj : ConjClasses G) :
    centralCharacter ρ ⟨classSum ℂ Ci, classSum_mem_center ℂ Ci⟩
        * centralCharacter ρ ⟨classSum ℂ Cj, classSum_mem_center ℂ Cj⟩
      = ∑ Ck : ConjClasses G, (structureConstant Ci Cj Ck : ℂ)
          * centralCharacter ρ ⟨classSum ℂ Ck, classSum_mem_center ℂ Ck⟩ := sorry

/-- **The central-character table** `Ω`, `Ωᵢⱼ = ωᵢ(Kⱼ)`, normalized by `ωᵢ(K₁) = 1`. The algorithm's
primary computed object; the ordinary table `X` is a conversion via `χ(gⱼ) = dᵢ ωᵢ(Kⱼ)/|Cⱼ|`. -/
noncomputable def centralCharacterTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    Matrix (Fin (Fintype.card (ConjClasses G))) (ConjClasses G) ℂ := sorry

/-- **The columns of `Ω` are the common eigenvectors** of the `{Mᵢ}` (after the coordinate identity). -/
theorem centralCharacterTable_eigenvector (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (i : Fin (Fintype.card (ConjClasses G))) (Ci : ConjClasses G) :
    (classMultMatrix Ci).map (Int.cast : ℤ → ℂ) *ᵥ (fun Cj => centralCharacterTable G i Cj)
      = (centralCharacterTable G i Ci) • (fun Cj => centralCharacterTable G i Cj) := sorry

/-- **The specification** over `ℂ`: rows orthonormal class functions of the right count; columns the
common eigenvectors of the `{Mᵢ}`; degrees positive integers dividing `|G|` with `∑ dᵢ² = |G|`.
`characterTable G` satisfies it (`isCharacterTableSpec_characterTable`), and it pins the table up to a
row permutation (`characterTable_unique_rows`). -/
def IsCharacterTableSpec (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (M : Matrix (Fin (Fintype.card (ConjClasses G))) (ConjClasses G) ℂ) : Prop := sorry

theorem isCharacterTableSpec_characterTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    IsCharacterTableSpec G (characterTable G) := sorry

/-- **Labeled uniqueness**: with columns the actual classes, any matrix satisfying the specification is
the character table up to a permutation of **rows only**. -/
theorem characterTable_unique_rows (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (M : Matrix (Fin (Fintype.card (ConjClasses G))) (ConjClasses G) ℂ)
    (hM : IsCharacterTableSpec G M) :
    ∃ σ : Equiv.Perm (Fin (Fintype.card (ConjClasses G))),
      M = (characterTable G).submatrix σ id := sorry

/-! ## C. The executable certified algorithm with exact cyclotomic output -/

/-! ### Layer 6: the executable Burnside-Dixon-Schneider algorithm (the summit) -/

/-- **Exact cyclotomic arithmetic** `ℤ[ζ_e] = ℤ[X]/Φ_e` as computable coefficient vectors, with `+`, `*`,
`DecidableEq` as `def`s and a pinned embedding into `ℂ`. The computational artifact; `ℂ` is only used
under `cyclotomicEmbedding` in the correctness statement. -/
def Cyclotomic (e : ℕ) : Type := sorry

noncomputable def cyclotomicEmbedding (e : ℕ) : Cyclotomic e → ℂ := sorry

/-- The exact character table: entries in `Cyclotomic e`, never `ℂ`. -/
abbrev ExactCharTable (G : Type v) [Group G] [Fintype G] [DecidableEq G] :=
  Matrix (Fin (Fintype.card (ConjClasses G))) (ConjClasses G) (Cyclotomic (Monoid.exponent G))

/-- **Verified computable kernel basis** over a field (Gaussian elimination). -/
def kernelBasis {F : Type u} [Field F] [DecidableEq F] {m n : ℕ} (A : Matrix (Fin m) (Fin n) F) :
    List (Fin n → F) := sorry

/-- **Eigenvalue search** over a *finite* field (needs `Fintype F`, unlike `kernelBasis`). -/
def eigenvalueSearch {F : Type u} [Field F] [Fintype F] [DecidableEq F] {n : ℕ}
    (A : Matrix (Fin n) (Fin n) F) : List F := sorry

/-- **Certified Dixon-prime data**: a prime `p` with `e ∣ p - 1`, above Dixon's size bound, carrying a
good-reduction certificate. Supplied explicitly for the worked examples; existence is a separate later
theorem, off the `#eval` path. -/
structure DixonPrimeData (G : Type v) [Group G] [Fintype G] where
  p : ℕ
  prime_p : p.Prime
  split : Monoid.exponent G ∣ p - 1
  large : 2 * Nat.sqrt (Nat.card G) < p

/-- **The good-prime predicate**: `p ∤ |G|`, `X^e - 1` splits, and reduced central-character tuples stay
distinct (no bad-prime merging). Correctness of the search is conditional on this. -/
def IsGoodDixonPrime (G : Type v) [Group G] [Fintype G] (p : ℕ) : Prop := sorry

/-- **The good-prime structure theorem**: `Z(𝔽_p[G]) ≅ 𝔽_p^r`, guaranteeing the `{Mᵢ}` are simultaneously
diagonalizable with exactly `r` distinct algebra homomorphisms and the search terminates in
one-dimensional common eigenspaces. -/
theorem center_zmod_algEquiv_pi {G : Type v} [Group G] [Fintype G] [DecidableEq G] {p : ℕ}
    [Fact p.Prime] (hp : IsGoodDixonPrime G p) :
    Nonempty (Subalgebra.center (ZMod p) (MonoidAlgebra (ZMod p) G)
      ≃ₐ[ZMod p] (Fin (Fintype.card (ConjClasses G)) → ZMod p)) := sorry

/-- **The structured cyclotomic lift**: not a bare `ZMod p → ℤ[ζ_e]`. Takes a chosen primitive `e`-th root
`α : ZMod p`, the residues over the embeddings `(ZMod e)ˣ → ZMod p`, and Dixon's bound, returning the
unique `Cyclotomic e` element with those data. (With `p ≡ 1 mod e` the Frobenius on `ζ_e` is trivial mod
`p`, so all embeddings are needed, not a Frobenius orbit.) -/
def liftCyclotomic {e p : ℕ} (α : ZMod p) (residues : (ZMod e)ˣ → ZMod p) (bound : ℕ) :
    Cyclotomic e := sorry
-- Its correctness/uniqueness: `liftCyclotomic` reduces to `residues` mod `p` and its coefficients are
-- within `bound` (Dixon), and it is the unique such element. Pinned once `Cyclotomic e → ZMod p` is fixed.

/-- **The assembled solver**: modular reduction, the eigenvector search, degree recovery, and the lift,
returning the exact table. A genuine `def` on `[DecidableEq G] [Fintype G]` data, `#eval`-able. -/
def characterTableDixon (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (d : DixonPrimeData G) : ExactCharTable G := sorry

/-- **The summit.** The `ℂ`-embedding of the computed exact table satisfies the specification, hence (with
`characterTable_unique_rows`) **is** the character table of `G`. -/
theorem characterTable_eq (G : Type v) [Group G] [Fintype G] [DecidableEq G] (d : DixonPrimeData G)
    (hd : IsGoodDixonPrime G d.p) :
    IsCharacterTableSpec G
      ((characterTableDixon G d).map (cyclotomicEmbedding (Monoid.exponent G))) := sorry

-- Acceptance: once the `def`s above are discharged computably, with a certified `DixonPrimeData`, this
-- `#eval` prints the exact character table of the dihedral group of order 8:
--   #eval characterTableDixon (DihedralGroup 4) dihedralPrimeData

/-! ## D. Structural theorems and worked families

Three classical applications of Deliverable A, off the Dixon-Schneider critical path: the Frobenius-Schur
trichotomy, Frobenius's theorem, and the character table of `GL₂(𝔽_q)`. See `README.md`. -/

/-! ### Layer 7: the Frobenius-Schur indicator and real/quaternionic type -/

/-- **The indicator on the module spine**, generalizing the `FDRep`-level `frobeniusSchurIndicator`:
`ν₂(χ) = |G|⁻¹ ∑_g χ(g²)` for `ρ : Representation ℂ G V`. -/
noncomputable def frobeniusSchurIndicatorRep {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V) : ℂ :=
  (Nat.card G : ℂ)⁻¹ * ∑ g : G, ρ.character (g * g)

/-- **An invariant bilinear form**: `B (ρ g x) (ρ g y) = B x y` for all `g`. The symmetric invariant forms
(orthogonal type) and alternating invariant forms (symplectic type) are the `G`-invariants of `V* ⊗ V*`. -/
def IsInvariantForm {k : Type u} {G : Type v} [CommRing k] [Group G] {V : Type*} [AddCommGroup V]
    [Module k V] (ρ : Representation k G V) (B : LinearMap.BilinForm k V) : Prop :=
  ∀ (g : G) (x y : V), B (ρ g x) (ρ g y) = B x y

/-- **The trichotomy**: for an irreducible `ρ` over `ℂ`, the indicator is `+1`, `0`, or `-1`. -/
theorem frobeniusSchurIndicatorRep_trichotomy {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = 1 ∨ frobeniusSchurIndicatorRep ρ = 0
      ∨ frobeniusSchurIndicatorRep ρ = -1 := sorry

/-- **`ν₂ = +1` iff orthogonal**: a nonzero invariant symmetric nondegenerate form exists. Realizability
over `ℝ` is a *strictly stronger* consequence, pinned separately as `frobeniusSchurIndicatorRep_eq_one_realizable`
below (the symmetric complex form alone is not a real representation). -/
theorem frobeniusSchurIndicatorRep_eq_one_iff {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = 1
      ↔ ∃ B : LinearMap.BilinForm ℂ V, IsInvariantForm ρ B ∧ B.IsSymm ∧ B.Nondegenerate := sorry

/-- **`ν₂ = -1` iff symplectic (quaternionic)**: a nonzero invariant alternating nondegenerate form exists. -/
theorem frobeniusSchurIndicatorRep_eq_neg_one_iff {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = -1
      ↔ ∃ B : LinearMap.BilinForm ℂ V, IsInvariantForm ρ B ∧ B.IsAlt ∧ B.Nondegenerate := sorry

/-- **A real form** of a complex representation: a real representation `σ` whose scalar extension along
`ℝ → ℂ` is isomorphic to `ρ`. Mathlib has no complexification of representations, so this predicate (and
its scalar-extension equivalence) is itself a build target. Used with a concrete `σ` in hand. -/
def IsRealForm {G : Type v} [Group G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ G V) {W : Type*} [AddCommGroup W] [Module ℝ W]
    (σ : Representation ℝ G W) : Prop := sorry

/-- **Realizability over `ℝ`**: `ρ` is `IsRealForm`-isomorphic to the complexification of some real
representation. Stated as a bare `Prop` (the witness `W`, `σ`, and the scalar-extension iso are produced in
the proof) to avoid bundling `AddCommGroup`/`Module` instances into an existential. -/
def IsRealizableOverReal {G : Type v} [Group G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ G V) : Prop := sorry

/-- **`ν₂ = +1` iff realizable over `ℝ`**: the orthogonal case admits an honest real form whose
complexification recovers `ρ`. This must *construct* a real representation, not merely a symmetric complex
form; hence a separate target from `frobeniusSchurIndicatorRep_eq_one_iff`. -/
theorem frobeniusSchurIndicatorRep_eq_one_realizable {G : Type v} [Group G] [Fintype G] {V : Type*}
    [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V] (ρ : Representation ℂ G V)
    [ρ.IsIrreducible] :
    frobeniusSchurIndicatorRep ρ = 1 ↔ IsRealizableOverReal ρ := sorry

/-- **A real conjugacy class**: `g` is conjugate to `g⁻¹`. -/
def IsRealClass {G : Type v} [Group G] (C : ConjClasses G) : Prop :=
  ∃ g : G, ConjClasses.mk g = C ∧ IsConj g g⁻¹

/-- **Real-valued irreducibles match real classes**: the rows of `characterTable` fixed by complex
conjugation are as many as the real conjugacy classes. -/
theorem card_realValued_eq_card_realClasses (G : Type v) [Group G] [Fintype G] [DecidableEq G] :
    Nat.card {i // ∀ C, (starRingEnd ℂ) (characterTable G i C) = characterTable G i C}
      = Nat.card {C : ConjClasses G // IsRealClass C} := sorry

/-- **The Frobenius-Schur indicator of the `i`-th irreducible** (the row `i` of `characterTable`). The
per-row form the involution count sums against. -/
noncomputable def frobeniusSchurIndicatorRow (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (i : Fin (Fintype.card (ConjClasses G))) : ℂ := sorry

/-- **The involution-counting formula** `#{g : g² = x} = ∑_χ ν₂(χ) χ(x)`, the degree-weighted signed sum
over the irreducibles. At `x = 1` this is `#{g : g² = 1} = ∑_χ ν₂(χ) χ(1)` (weighted by the degrees `χ(1)`),
which is *not* the raw count of orthogonal minus quaternionic irreducibles `∑_χ ν₂(χ)`. -/
theorem card_sq_eq_sum_frobeniusSchur (G : Type v) [Group G] [Fintype G] [DecidableEq G] (x : G) :
    (Nat.card {g : G // g * g = x} : ℂ)
      = ∑ i, frobeniusSchurIndicatorRow G i * characterTable G i (ConjClasses.mk x) := sorry

/-! ### Layer 8: Frobenius groups and Frobenius's theorem -/

/-- **A Frobenius complement**: `H` is proper and nontrivial, and a trivial-intersection subgroup, meeting
each distinct conjugate trivially. Then `G` is a Frobenius group with complement `H`. -/
def IsFrobeniusComplement {G : Type v} [Group G] (H : Subgroup G) : Prop := sorry

/-- **A trivial-intersection (T.I.) set** relative to `H`: a subset `S` (in practice the nonidentity part
`H# = (H : Set G) \ {1}`, a union of nonidentity classes of `H`) whose distinct `G`-conjugates are disjoint
and normalized by `H`. The load-bearing property, pinned as `isometry_ind_of_isTISet`, is that a class
function on `H` *supported on `S`* (vanishing outside `H#`), extended by zero, induces to `G` with its norm
preserved; this is what makes the differences `χᵢ - χⱼ` land as norm-`2` virtual characters. -/
def IsTISet {G : Type v} [Group G] (S : Set G) (H : Subgroup G) : Prop := sorry

/-- **The Frobenius kernel** `{1} ∪ (G ∖ ⋃_g g H g⁻¹)`: the identity and the elements in no conjugate of the
complement. -/
def frobeniusKernel {G : Type v} [Group G] (H : Subgroup G) : Set G := sorry

/-- **Frobenius's theorem** (proved via the T.I.-set and exceptional-character route; no character-free
proof is known): the kernel is a `Subgroup`. Promoted to a bundled `Subgroup G` so downstream results need
not carry a chosen `N` and a carrier-equality proof. -/
noncomputable def frobeniusKernelSubgroup {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) : Subgroup G := sorry

theorem coe_frobeniusKernelSubgroup {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) :
    (frobeniusKernelSubgroup H hH : Set G) = frobeniusKernel H := sorry

theorem frobeniusKernelSubgroup_normal {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) : (frobeniusKernelSubgroup H hH).Normal := sorry

/-- **The semidirect decomposition** `G = N ⋊ H`: the kernel is a complement to `H`. -/
theorem frobeniusKernel_isComplement' {G : Type v} [Group G] [Finite G] (H : Subgroup G)
    (hH : IsFrobeniusComplement H) : (frobeniusKernelSubgroup H hH).IsComplement' H := sorry

/-! ### Layer 9: the representation theory of GL₂(𝔽_q) -/

/-- **The Borel subgroup** of `GL₂(𝔽_q)`: the upper-triangular matrices `B = T U`. -/
def GL2Borel (F : Type u) [Field F] [Fintype F] [DecidableEq F] : Subgroup (GL (Fin 2) F) := sorry

/-- **The class count**: `GL₂(𝔽_q)` has `q² - 1` conjugacy classes (central, split semisimple, unipotent,
elliptic), hence `q² - 1` irreducibles. -/
theorem card_conjClasses_GL2 (F : Type u) [Field F] [Fintype F] [DecidableEq F] :
    Nat.card (ConjClasses (GL (Fin 2) F)) = (Fintype.card F) ^ 2 - 1 := sorry

/-- **The principal series** `Ind_B^{GL₂}(α ⊗ β)`, dimension `q + 1`; irreducible iff `α ≠ β`. -/
noncomputable def GL2PrincipalSeries (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) : FDRep ℂ (GL (Fin 2) F) := sorry

/-- The principal series has dimension `q + 1` (read off `char_one`). -/
theorem character_one_GL2PrincipalSeries (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) :
    (GL2PrincipalSeries F α β).character 1 = (Fintype.card F : ℂ) + 1 := sorry

/-- The principal series is irreducible exactly when `α ≠ β`. -/
theorem simple_GL2PrincipalSeries_iff (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (α β : Fˣ →* ℂˣ) :
    CategoryTheory.Simple (GL2PrincipalSeries F α β) ↔ α ≠ β := sorry

/-- **The Steinberg representation**, the dimension-`q` constituent of `Ind_B(α α)` beside the linear
character `α ∘ det`. -/
noncomputable def GL2Steinberg (F : Type u) [Field F] [Fintype F] [DecidableEq F] :
    FDRep ℂ (GL (Fin 2) F) := sorry

/-- **The non-split (elliptic) torus** `𝔽_{q²}^× ↪ GL₂(𝔽_q)`, embedded through a chosen `F`-basis of a
degree-`2` extension `E` of `F` (so `Fintype.card E = q²`). The source of the cuspidal series; the
degree-`2` extension is itself a build target, not an ambient `[Field F] [Fintype F]` datum. -/
noncomputable def GL2NonSplitTorus (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] : Subgroup (GL (Fin 2) F) := sorry

/-- **A cuspidal (discrete-series) representation** of dimension `q - 1`, attached to a character
`θ : Eˣ →* ℂˣ` of the non-split torus that does *not* factor through the norm (`θ ≠ θ ∘ Frob`); `θ` and its
`q`-power twist give the same representation, so the cuspidals are parametrized by the `½q(q-1)` such orbits.
These are exactly the irreducibles absent from every principal series. -/
noncomputable def GL2Cuspidal (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (θ : Eˣ →* ℂˣ) :
    FDRep ℂ (GL (Fin 2) F) := sorry

/-- The cuspidal representation has dimension `q - 1` (read off `char_one`). -/
theorem character_one_GL2Cuspidal (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (θ : Eˣ →* ℂˣ) :
    (GL2Cuspidal F E θ).character 1 = (Fintype.card F : ℂ) - 1 := sorry

end TauCetiRoadmap.RepresentationTheory.CharacterTheory
