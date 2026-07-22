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

open scoped Classical Matrix Pointwise TensorProduct
open Representation MonoidAlgebra

universe u v

/-! ## A. Ordinary character theory and the character table -/

/-! ### Layer 0: class functions and their pairing -/

/-- **Class functions**: the submodule of `G → k` of functions constant on conjugacy classes. Every
character is a member, by `char_conj`. -/
def ClassFunction (k : Type u) (G : Type v) [CommRing k] [Group G] : Submodule k (G → k) where
  carrier := {f | ∀ g h : G, f (h * g * h⁻¹) = f g}
  add_mem' := by
    intro f₁ f₂ h₁ h₂ g h
    simp [h₁ g h, h₂ g h]
  zero_mem' := by intro g h; rfl
  smul_mem' := by
    intro c f hf g h
    simp [hf g h]

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

/-- Nondegeneracy of the pairing on class functions. The `[Invertible (Nat.card G : k)]` hypothesis is
essential, not decorative: when `char k ∣ |G|` the normalization `(Nat.card G : k)⁻¹` is `0`, the
pairing vanishes identically, and the statement would assert that every class function is zero. -/
theorem characterPairing_nondegenerate (k : Type u) (G : Type v) [Field k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] :
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

/-- **The integral class center**: each class sum is integral over `ℤ` **as an element of the center**
`Z(ℤ[G])` (the finite `ℤ`-algebra spanned by the class sums, with integer structure constants). Stated
inside `Subalgebra.center` so it carries structural content — in `ℤ[G]` itself the claim is trivial,
since `ℤ[G]` is module-finite over `ℤ`. The base for central-character integrality. -/
theorem isIntegral_classSum {G : Type v} [Group G] [Fintype G] [DecidableEq G] (C : ConjClasses G) :
    IsIntegral ℤ
      (⟨classSum ℤ C, classSum_mem_center ℤ C⟩ :
        Subalgebra.center ℤ (MonoidAlgebra ℤ G)) := sorry

/-! ### Layer 2: Wedderburn, irreducible indexing, and the count -/

/-- **`k[G] ≅ ∏ Matₙᵢ(k)`** (`k` algebraically closed, `char ∤ |G|`); a **noncomputable** algebra
equivalence over the finite index set of simple modules. -/
theorem exists_algEquiv_pi_matrix (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Nat.card G : k)] :
    ∃ (ι : Type) (_ : Fintype ι) (n : ι → ℕ),
      Nonempty (MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) := sorry

theorem sum_sq_dim_eq_card (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    ∑ i, (n i) ^ 2 = Nat.card G := sorry

/-- **The center splits** by central-character evaluation, `Z(k[G]) ≃ (ι → k)`: central characters
**separate points** of the center. The sharp form Layer 5 needs. -/
theorem center_algEquiv_pi (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G] [Fintype G]
    [Invertible (Nat.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    Nonempty (Subalgebra.center k (MonoidAlgebra k G) ≃ₐ[k] (ι → k)) := sorry

/-- **#irreducibles = #conjugacy classes.** -/
theorem card_irreps_eq_card_conjClasses (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Nat.card G : k)] {ι : Type} [Fintype ι] (n : ι → ℕ)
    (e : MonoidAlgebra k G ≃ₐ[k] Π i, Matrix (Fin (n i)) (Fin (n i)) k) :
    Fintype.card ι = Nat.card (ConjClasses G) := sorry

/-! ### Layer 3: the character table, idempotents, completeness, second orthogonality

The tables index rows by `Fin (Fintype.card (ConjClasses G))` (as many irreducibles as classes) and
columns by `ConjClasses G` (labeled). -/

/-- **Completeness**: irreducible characters span the class functions — and only those: every
character is a class function, so the span is contained in `ClassFunction k G` and the correct
completeness statement is the reverse inclusion stated here (spanning all of `G → k` is false for
any nonabelian `G`). -/
theorem irreducibleCharacters_span (k : Type u) (G : Type v) [Field k] [IsAlgClosed k] [Group G]
    [Fintype G] [Invertible (Nat.card G : k)] :
    ClassFunction k G ≤ Submodule.span k {f : G → k | ∃ (V : FDRep k G) (_ : CategoryTheory.Simple V),
      (V.character : G → k) = f} := sorry

/-- **Primitive central idempotents** `eχ = (χ(1)/|G|) ∑_g χ(g⁻¹) g ∈ Z(k[G])`; orthogonal idempotents
summing to `1`, the Wedderburn projectors. The connective tissue Layer 5 uses. `char ∤ |G|` is
required for the formula to be idempotent, hence the invertibility hypothesis. -/
noncomputable def primitiveCentralIdempotent {k : Type u} {G : Type v} [Field k] [IsAlgClosed k]
    [Group G] [Fintype G] [Invertible (Nat.card G : k)] {V : Type*} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V]
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
Mandatory for the Layer-6 lift. One `σ` valid **for all** `g` simultaneously (a per-`g` existential
would be nearly vacuous), pinned to the power map: on `ℚ(ζ_e)` the witness is `autEquivPow`'s `σ_k`,
extended to `ℂ`. -/
theorem character_galois_pow {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G)
    (k : ℕ) (hk : Nat.Coprime k (Monoid.exponent G)) :
    ∃ σ : ℂ →+* ℂ, ∀ g : G, σ (V.character g) = V.character (g ^ k) := sorry

/-- **The Frobenius-Schur indicator** `ν₂(χ) = |G|⁻¹ ∑ g, χ(g²)`; `+1` for `D₄`, `-1` for `Q₈`. -/
noncomputable def frobeniusSchurIndicator {G : Type v} [Group G] [Fintype G] (V : FDRep ℂ G) : ℂ :=
  (Nat.card G : ℂ)⁻¹ * ∑ g : G, V.character (g * g)

/-! ### Layer 4b: the representation ring (characteristic zero)

The multiplicative structure the family index promises. `virtualCharacters` (an `AddSubgroup`, in
`../InductionRestriction`) is deliberately only the additive shadow, kept for positive
characteristic; in characteristic zero the ring itself is pinned here, so that tensor-product
decomposition (Littlewood-Richardson, Racah-Speiser via `../LieHighestWeight`'s `formalCharacter`)
has a machine-checked home rather than a prose promise. -/

/-- **The representation ring** `R(G)` over a characteristic-zero field: the Grothendieck ring of
`FDRep k G`, addition from `⊕`, multiplication from `⊗`. -/
def repRing (k : Type u) (G : Type v) [Field k] [CharZero k] [Group G] [Fintype G] :
    Type (max u v) := sorry

noncomputable instance (k : Type u) (G : Type v) [Field k] [CharZero k] [Group G] [Fintype G] :
    CommRing (repRing k G) := sorry

/-- **The character map is a ring homomorphism** into functions on `G` (additive on `⊕`,
multiplicative on `⊗` via `char_tensor`), with image inside `ClassFunction k G`. -/
noncomputable def repRingCharacter (k : Type u) (G : Type v) [Field k] [CharZero k] [Group G]
    [Fintype G] : repRing k G →+* (G → k) := sorry

theorem repRingCharacter_mem_classFunction (k : Type u) (G : Type v) [Field k] [CharZero k]
    [Group G] [Fintype G] (x : repRing k G) :
    repRingCharacter k G x ∈ ClassFunction k G := sorry

/-- **The character map is injective** over a characteristic-zero splitting field (stated for
algebraically closed `k`): virtual representations are determined by their characters, which is what
makes character-level computation of tensor decompositions sound. -/
theorem repRingCharacter_injective (k : Type u) (G : Type v) [Field k] [CharZero k] [IsAlgClosed k]
    [Group G] [Fintype G] :
    Function.Injective (repRingCharacter k G) := sorry

/-- **Burnside's `pᵃqᵇ` theorem** (off the critical path; a Layer-4 application). -/
theorem isSolvable_of_card_eq_prime_pow_mul_prime_pow {G : Type v} [Group G] [Fintype G]
    {p q : ℕ} (hp : p.Prime) (hq : q.Prime) {a b : ℕ} (h : Nat.card G = p ^ a * q ^ b) :
    IsSolvable G := sorry

/-! ## B. The class algebra and the Dixon-Schneider specification -/

/-! ### Layer 5: the Dixon-Schneider characterization (the specification) -/

/-- **Class-multiplication matrix**, convention pinned: `(Mᵢ)ⱼₖ = aᵢₖⱼ` (the coefficient of `K_j` in
`K_i K_k`), acting on **row vectors from the left** via `ᵥ*`. Under this convention the normalized
central-character **rows** of `Ω` are common **left** eigenvectors of the `{Mᵢ}`
(`centralCharacterTable_eigenvector` below): with `v_j = ω(K_j)`,
`(v ᵥ* Mᵢ)_k = ∑_j ω(K_j) a_{i,k,j} = ω(K_i) ω(K_k)` by the coordinate identity and commutativity of
the class algebra. Do not mix this with the column/`*ᵥ` convention, which would need the transposed
matrix `(Mᵢ)ⱼₖ = aᵢⱼₖ` instead. -/
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

/-- **The rows of `Ω` are the common left eigenvectors** of the `{Mᵢ}` (after the coordinate
identity), in the pinned row/`ᵥ*` convention of `classMultMatrix`. -/
theorem centralCharacterTable_eigenvector (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (i : Fin (Fintype.card (ConjClasses G))) (Ci : ConjClasses G) :
    (fun Cj => centralCharacterTable G i Cj) ᵥ* (classMultMatrix Ci).map (Int.cast : ℤ → ℂ)
      = (centralCharacterTable G i Ci) • (fun Cj => centralCharacterTable G i Cj) := sorry

/-- **Normalized left eigenrows are exactly the class-algebra homomorphisms**: a vector `v` on the
classes with `v(1) = 1` is a common left eigenvector of every `classMultMatrix Ci` (with eigenvalue
`v Ci`) iff it is the evaluation of an algebra homomorphism `Z(ℂ[G]) → ℂ` on the class sums. This is
the lemma that makes `characterTable_unique_rows` an argument rather than a leap: the homomorphisms
of the split semisimple class algebra are finite in number, orthonormality forbids repetitions, and
the row count exhausts them. -/
theorem normalized_eigenrow_iff_algHom (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (v : ConjClasses G → ℂ) (hv : v (ConjClasses.mk 1) = 1) :
    (∀ Ci : ConjClasses G,
        v ᵥ* (classMultMatrix Ci).map (Int.cast : ℤ → ℂ) = v Ci • v) ↔
      ∃ φ : Subalgebra.center ℂ (MonoidAlgebra ℂ G) →ₐ[ℂ] ℂ,
        ∀ C : ConjClasses G, φ ⟨classSum ℂ C, classSum_mem_center ℂ C⟩ = v C := sorry

/-- **The specification** over `ℂ`, now with a real body (a `Prop`-valued structure): degrees are
positive integers dividing `|G|` with `∑ dᵢ² = |G|`; the rows are orthonormal in the class-size
weighted Hermitian pairing; and each **normalized row** (the central-character row `ω_i(K_j) =
|C_j| M i C_j / M i 1`) is a common **left** eigenvector of the `{Mᵢ}` in the pinned `ᵥ*` convention.
`characterTable G` satisfies it (`isCharacterTableSpec_characterTable`), and it pins the table up to a
row permutation (`characterTable_unique_rows`, via `normalized_eigenrow_iff_algHom`). -/
structure IsCharacterTableSpec (G : Type v) [Group G] [Fintype G] [DecidableEq G]
    (M : Matrix (Fin (Fintype.card (ConjClasses G))) (ConjClasses G) ℂ) : Prop where
  exists_degree : ∀ i, ∃ d : ℕ, 0 < d ∧ M i (ConjClasses.mk 1) = d ∧ d ∣ Nat.card G
  sum_degree_sq : ∑ i, M i (ConjClasses.mk 1) ^ 2 = (Nat.card G : ℂ)
  row_orthonormal : ∀ i j, (Nat.card G : ℂ)⁻¹ *
      ∑ C : ConjClasses G, (Nat.card (ConjClasses.carrier C) : ℂ)
        * M i C * (starRingEnd ℂ) (M j C)
      = if i = j then 1 else 0
  row_eigen : ∀ (i : Fin (Fintype.card (ConjClasses G))) (Ci : ConjClasses G),
    (fun Cj => (Nat.card (ConjClasses.carrier Cj) : ℂ) * M i Cj / M i (ConjClasses.mk 1))
        ᵥ* (classMultMatrix Ci).map (Int.cast : ℤ → ℂ)
      = ((Nat.card (ConjClasses.carrier Ci) : ℂ) * M i Ci / M i (ConjClasses.mk 1)) •
        (fun Cj => (Nat.card (ConjClasses.carrier Cj) : ℂ) * M i Cj / M i (ConjClasses.mk 1))

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

/-- The (computable) ring structure on the coefficient vectors. -/
instance (e : ℕ) : CommRing (Cyclotomic e) := sorry

/-- The canonical generator `ζ_e` (the class of `X`). -/
def cyclotomicGen (e : ℕ) : Cyclotomic e := sorry

/-- The coefficient of `X^j` on the power basis `1, ζ, …, ζ^{φ(e)-1}`; the handle for Dixon's
size bound in `liftCyclotomic_spec`. -/
def cyclotomicCoeff {e : ℕ} (x : Cyclotomic e) (j : ℕ) : ℤ := sorry

/-- **The pinned embedding into `ℂ`, as a ring homomorphism** (a bare function would leave the
bridge from exact arithmetic to the `ℂ`-valued specification unconstrained). -/
noncomputable def cyclotomicEmbedding (e : ℕ) : Cyclotomic e →+* ℂ := sorry

/-- **`Cyclotomic e` is the cyclotomic ring**: a ring equivalence with Mathlib's
`CyclotomicRing e ℤ ℚ`. Together with the two companions below this is the correctness bridge for
the exact type: without it, `Cyclotomic e` is an unconstrained carrier and the summit would prove
nothing about cyclotomic integers. `NeZero e` holds in application (`e = Monoid.exponent G ≠ 0` for
finite `G`). -/
noncomputable def cyclotomicRingEquiv (e : ℕ) [NeZero e] :
    Cyclotomic e ≃+* CyclotomicRing e ℤ ℚ := sorry

/-- The embedding is injective. -/
theorem cyclotomicEmbedding_injective (e : ℕ) [NeZero e] :
    Function.Injective (cyclotomicEmbedding e) := sorry

/-- The embedding sends the canonical generator to a primitive `e`-th root of unity, pinning which
root `ζ_e` means in `ℂ` (Galois-coherently with `character_galois_pow` / `autEquivPow`). -/
theorem isPrimitiveRoot_cyclotomicEmbedding_gen (e : ℕ) [NeZero e] :
    IsPrimitiveRoot (cyclotomicEmbedding e (cyclotomicGen e)) e := sorry

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
  /-- Dixon's size bound. Caveat recorded per review: before `liftCyclotomic_spec` is relied on,
  the exact coefficient bound that makes the cyclotomic-basis lift *unique* must be re-checked
  against Dixon 1967 (the `2√|G|` coefficient here is the standard citation, low-confidence as to
  the precise constant). -/
  large : 2 * Nat.sqrt (Nat.card G) < p

/-- **The good-prime predicate**: `p` prime, `p ∤ |G|`, `X^e - 1` splits mod `p` (via
`e ∣ p - 1`), and `p` above Dixon's size bound. That reduced central-character tuples stay distinct
(no bad-prime merging) is **not** part of the definition — it is the content of the good-prime
structure theorem `center_zmod_algEquiv_pi` below, which these arithmetic conditions imply.
Correctness of the search is conditional on this predicate. -/
def IsGoodDixonPrime (G : Type v) [Group G] [Fintype G] (p : ℕ) : Prop :=
  p.Prime ∧ ¬ p ∣ Nat.card G ∧ Monoid.exponent G ∣ p - 1 ∧ 2 * Nat.sqrt (Nat.card G) < p

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

/-- The reduction `Cyclotomic e →+* ZMod p` determined by sending the generator to `α` (defined when
`α` is an `e`-th root of unity mod `p`; junk otherwise). The `u`-th embedding is the reduction at
`α ^ u`. -/
def cyclotomicReduce {e : ℕ} (p : ℕ) (α : ZMod p) : Cyclotomic e →+* ZMod p := sorry

/-- The reduction sends the generator to `α` — the pin that makes `cyclotomicReduce` the map it
claims to be. -/
theorem cyclotomicReduce_gen {e p : ℕ} [NeZero e] (α : ZMod p) :
    cyclotomicReduce (e := e) p α (cyclotomicGen e) = α := sorry

/-- **Lift correctness and uniqueness** — the load-bearing companion of `liftCyclotomic`, previously
only a comment. Stated **conditionally on an admissible witness** `y` (residue-matching with
coefficients within `bound`): for arbitrary `residues`/`bound` no such element need exist (e.g.
`bound = 0` with nonzero residues), so an unconditional existence claim would be false; given a
witness, the window `2 * bound < p` (equivalently `2 * bound + 1 ≤ p`, the count of representable
values) makes it unique and the lift returns exactly it. `orderOf α = e` — not mere divisibility —
is required so the evaluation points `α ^ u` are the primitive embeddings. Dixon's `2√|G| < p`
supplies the window for character data; without this theorem the summit `characterTable_eq` would
silently depend on an unspecified `def`. -/
theorem liftCyclotomic_spec {e p : ℕ} [NeZero e] (hp : p.Prime) (he : e ∣ p - 1)
    (α : ZMod p) (hα : orderOf α = e) (residues : (ZMod e)ˣ → ZMod p) (bound : ℕ)
    (hbound : 2 * bound < p) (y : Cyclotomic e)
    (hy_res : ∀ u : (ZMod e)ˣ, cyclotomicReduce p (α ^ (u : ZMod e).val) y = residues u)
    (hy_bound : ∀ j, (cyclotomicCoeff y j).natAbs ≤ bound) :
    liftCyclotomic α residues bound = y := sorry

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
`ℝ → ℂ` is isomorphic to `ρ`, stated on pure tensors (`ℂ ⊗[ℝ] W` carries its `ℂ`-module structure via
`TensorProduct.leftModule`, so no bespoke complexification of representations is needed to *state*
the predicate; the complexification API remains a build target for working with it). -/
def IsRealForm {G : Type v} [Group G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ G V) {W : Type*} [AddCommGroup W] [Module ℝ W]
    (σ : Representation ℝ G W) : Prop :=
  ∃ e : (ℂ ⊗[ℝ] W) ≃ₗ[ℂ] V, ∀ (g : G) (w : W), e (1 ⊗ₜ[ℝ] σ g w) = ρ g (e (1 ⊗ₜ[ℝ] w))

/-- **Realizability over `ℝ`**: `ρ` has a real form. The carrier is fixed to
`Fin (Module.finrank ℂ V) → ℝ` so that no type- or instance-existential is needed (safe in the
finite-dimensional setting where the notion is used; every real form of the right dimension
transports to this carrier along a basis). -/
def IsRealizableOverReal {G : Type v} [Group G] {V : Type*} [AddCommGroup V] [Module ℂ V]
    (ρ : Representation ℂ G V) : Prop :=
  ∃ σ : Representation ℝ G (Fin (Module.finrank ℂ V) → ℝ), IsRealForm ρ σ

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
each distinct conjugate trivially (`MulAut.conj g • H` is the conjugate subgroup). Then `G` is a
Frobenius group with complement `H`. -/
def IsFrobeniusComplement {G : Type v} [Group G] (H : Subgroup G) : Prop :=
  H ≠ ⊥ ∧ H ≠ ⊤ ∧ ∀ g : G, g ∉ H → H ⊓ (MulAut.conj g • H) = ⊥

/-- **A trivial-intersection (T.I.) set** relative to `H`: a subset `S` (in practice the nonidentity part
`H# = (H : Set G) \ {1}`, a union of nonidentity classes of `H`) whose distinct `G`-conjugates are disjoint
and normalized by `H`. The load-bearing property, pinned as `isometry_ind_of_isTISet`, is that a class
function on `H` *supported on `S`* (vanishing outside `H#`), extended by zero, induces to `G` with its norm
preserved; this is what makes the differences `χᵢ - χⱼ` land as norm-`2` virtual characters. -/
def IsTISet {G : Type v} [Group G] (S : Set G) (H : Subgroup G) : Prop :=
  S ⊆ (H : Set G) ∧ (∀ h ∈ H, (fun x => h * x * h⁻¹) '' S = S) ∧
    ∀ g : G, g ∉ H → Disjoint ((fun x => g * x * g⁻¹) '' S) S

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
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (hE : Module.finrank F E = 2) :
    Subgroup (GL (Fin 2) F) := sorry

/-- **A cuspidal (discrete-series) representation** of dimension `q - 1`, attached to a character
`θ : Eˣ →* ℂˣ` of the non-split torus that does *not* factor through the norm (`θ ≠ θ ∘ Frob`); `θ` and its
`q`-power twist give the same representation, so the cuspidals are parametrized by the `½q(q-1)` such orbits.
These are exactly the irreducibles absent from every principal series. The degree-2 hypothesis and
the regularity of `θ` (it does not factor through the norm: `θ^q ≠ θ`) are carried explicitly — the
dimension claim below is false without them. -/
noncomputable def GL2Cuspidal (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (hE : Module.finrank F E = 2)
    (θ : Eˣ →* ℂˣ) (hθ : ∃ x : Eˣ, θ (x ^ Fintype.card F) ≠ θ x) :
    FDRep ℂ (GL (Fin 2) F) := sorry

/-- The cuspidal representation has dimension `q - 1` (read off `char_one`). -/
theorem character_one_GL2Cuspidal (F : Type u) [Field F] [Fintype F] [DecidableEq F]
    (E : Type u) [Field E] [Fintype E] [Algebra F E] (hE : Module.finrank F E = 2)
    (θ : Eˣ →* ℂˣ) (hθ : ∃ x : Eˣ, θ (x ^ Fintype.card F) ≠ θ x) :
    (GL2Cuspidal F E hE θ hθ).character 1 = (Fintype.card F : ℂ) - 1 := sorry

end TauCetiRoadmap.RepresentationTheory.CharacterTheory
