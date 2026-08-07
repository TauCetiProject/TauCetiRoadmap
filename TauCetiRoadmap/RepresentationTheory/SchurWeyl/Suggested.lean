import Mathlib

/-!
# Representations of the symmetric group, Specht modules, and Schur-Weyl duality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`. The
statements here suggest Lean forms for particular milestones, so that contributors and reviewers converge
on names and signatures; discharging all of them finishes neither a layer nor the roadmap. `sorry` is
allowed in this human-owned roadmap library -- these are goals, not proofs.

Mathlib has the combinatorics of `YoungDiagram`, `SemistandardYoungTableau`, and `Nat.Partition`; the
cycle-type/conjugacy map `Equiv.Perm.partition` with `partition_eq_of_isConj`; the symmetric functions
`MvPolynomial.esymm`, `hsymm`, `psum`, `msymm` and their partition-indexed products; the permutation and
induced representations `Representation.ofMulAction` and `Representation.ind`; `FDRep`, `FDRep.character`,
`char_conj`, `char_orthonormal`, `Representation.IsIrreducible`, Maschke, and Schur's lemma; and the
tensor-power/`GL` machinery `PiTensorProduct` (with `reindex`, `map`, `mapMonoidHom`) and
`Matrix.GeneralLinearGroup`. It has **no** partition/diagram/class dictionary, **no** standard tableaux,
**no** dominance order, **no** Young subgroups or permutation modules `M^λ`, **no** Young symmetrizers,
**no** Specht modules or their classification, **no** hook-length formula, **no** Murnaghan-Nakayama rule,
**no** RSK, **no** Schur polynomials, **no** Schur-Weyl duality, and **no** Brauer algebra or any diagram
algebra (see `README.md` for the file-by-file map).

The design follows the layers of `README.md`: the partition/diagram/class dictionary and orders (Layer 0);
Young subgroups and `M^λ` (Layer 1); Young symmetrizers (Layer 2); the Specht modules `S^λ` (Layer 3);
irreducibility and completeness (Layer 4); the standard basis and hook lengths (Layer 5); the characters
and Murnaghan-Nakayama rule (Layer 6); Schur functions, the Frobenius characteristic, and RSK (Layer 7);
Schur-Weyl duality for `GLₔ × Sₙ` (Layer 8); and Schur-Weyl duality for the orthogonal and symplectic groups
via the Brauer algebra (Layer 9). `README.md` remains the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.SchurWeyl

open scoped TensorProduct
open CategoryTheory

/-! ## Layer 0: partitions, diagrams, tableaux, and orders -/

/-- **The partition/diagram dictionary**: a partition of `n` is the same data as a Young diagram of size
`n` (via `YoungDiagram.ofRowLens`/`equivListRowLens`). This connects Mathlib's two unrelated combinatorial
vocabularies. -/
def partitionEquivYoungDiagram (n : ℕ) :
    n.Partition ≃ {μ : YoungDiagram // μ.card = n} := sorry

/-- **Conjugacy classes of `Sₙ` are partitions of `n`** (via `Equiv.Perm.partition` and
`partition_eq_of_isConj`); the common index set of classes, characters, and Specht modules. -/
def partitionEquivConjClasses (n : ℕ) :
    n.Partition ≃ ConjClasses (Equiv.Perm (Fin n)) := sorry

theorem card_conjClasses_perm (n : ℕ) :
    Fintype.card (ConjClasses (Equiv.Perm (Fin n))) = Fintype.card n.Partition := sorry

/-- The Young diagram of a partition, as a convenience for the statements below. -/
noncomputable def diagramOf {n : ℕ} (μ : n.Partition) : YoungDiagram :=
  (partitionEquivYoungDiagram n μ).1

/-- **Dominance order** on partitions: `∀ k, ∑_{i<k} μᵢ ≥ ∑_{i<k} νᵢ` with the parts taken in
decreasing order (a partial order), the order in which Specht modules appear in the permutation
modules. Stated on sorted parts because `Nat.Partition.parts` is an unordered multiset. -/
def Dominates {n : ℕ} (μ ν : n.Partition) : Prop :=
  ∀ k : ℕ, ((ν.parts.sort (· ≥ ·)).take k).sum ≤ ((μ.parts.sort (· ≥ ·)).take k).sum

/-- The **conjugate (transpose) partition** `μᵀ`, read off the transposed Young diagram. -/
noncomputable def conjugate {n : ℕ} (μ : n.Partition) : n.Partition := sorry

/-- Conjugation of partitions **reverses** dominance: `μ ⊵ ν ↔ νᵀ ⊵ μᵀ`. -/
theorem dominates_transpose_iff {n : ℕ} (μ ν : n.Partition) :
    Dominates μ ν ↔ Dominates (conjugate ν) (conjugate μ) := sorry

/-- **Standard Young tableaux** of a diagram: bijective, row- and column-increasing fillings (Mathlib has
only the semistandard `SemistandardYoungTableau`). -/
def StandardYoungTableau (μ : YoungDiagram) : Type := sorry

/-- Standard Young tableaux of a fixed shape are finitely many. -/
noncomputable instance instFintypeStandardYoungTableau (μ : YoungDiagram) :
    Fintype (StandardYoungTableau μ) := sorry

/-- The number of standard Young tableaux of shape `μ`; this is `f^λ`, the dimension of `S^λ`.
Defined as the cardinality of the tableau type, so the counting statements below
(`finrank_spechtModule`, `sum_sq_standardCount`) constrain `StandardYoungTableau`, not an
unattached natural number. -/
noncomputable def standardCount (μ : YoungDiagram) : ℕ :=
  Fintype.card (StandardYoungTableau μ)

/-! ## Layer 1: Young subgroups and the permutation modules `M^λ` -/

/-- **The Young subgroup** `Sλ ≤ Sₙ`, the stabilizer of the ordered partition of `Fin n` into consecutive
blocks of sizes `μ₁, μ₂, …` taken in the decreasing order `μ.parts.sort (· ≥ ·)` (the parts multiset is
unordered, so the definition must pin a sort; the card/index statements below are order-independent);
isomorphic to `∏ᵢ Perm (Fin μᵢ)`. -/
def youngSubgroup {n : ℕ} (μ : n.Partition) : Subgroup (Equiv.Perm (Fin n)) := sorry

theorem card_youngSubgroup {n : ℕ} (μ : n.Partition) :
    Nat.card (youngSubgroup μ) = (μ.parts.map Nat.factorial).prod := sorry

theorem youngSubgroup_index_mul {n : ℕ} (μ : n.Partition) :
    (youngSubgroup μ).index * (μ.parts.map Nat.factorial).prod = n.factorial := sorry

/-- **The permutation module** `M^λ = ℚ[Sₙ/Sλ]` on the `λ`-tabloids, reusing `Rep.ofMulAction`. Its
dimension is the multinomial coefficient `n! / ∏ᵢ μᵢ!` (`youngSubgroup_index_mul`). -/
noncomputable def permutationModule {n : ℕ} (μ : n.Partition) : Rep ℚ (Equiv.Perm (Fin n)) :=
  Rep.ofMulAction ℚ (Equiv.Perm (Fin n)) (Equiv.Perm (Fin n) ⧸ youngSubgroup μ)

/-- **Kostka numbers**, defined combinatorially as the number of semistandard tableaux of shape
`μ`-diagram and content `ν`; `kostkaNumber μ μ = 1` and `kostkaNumber μ ν = 0` unless `Dominates μ ν`. Its
identification with the multiplicity of `S^λ` in `M^μ` (Young's rule proper) needs the Specht modules and
their irreducibility, so that statement is deferred to Layer 4. -/
def kostkaNumber {n : ℕ} (μ ν : n.Partition) : ℕ := sorry

/-! ## Layer 2: Young symmetrizers -/

/-- A **`λ`-tableau**: a bijective filling of the cells of `μ` by `Fin μ.card`, the datum a Young
symmetrizer is built from. -/
def YoungTableau (μ : YoungDiagram) : Type := ↥μ.cells ≃ Fin μ.card

/-- The **row group** of a `λ`-tableau: permutations preserving each row. -/
def rowSubgroup {μ : YoungDiagram} (t : YoungTableau μ) :
    Subgroup (Equiv.Perm (Fin μ.card)) := sorry

/-- The **column group** of a `λ`-tableau: permutations preserving each column. -/
def colSubgroup {μ : YoungDiagram} (t : YoungTableau μ) :
    Subgroup (Equiv.Perm (Fin μ.card)) := sorry

/-- **The Young symmetrizer** `c_t = a_t · b_t ∈ ℚ[Sₙ]`, where `a_t = ∑_{p ∈ rowSubgroup t} p` and
`b_t = ∑_{q ∈ colSubgroup t} sign(q) • q` (using `Equiv.Perm.sign`). -/
noncomputable def youngSymmetrizer {μ : YoungDiagram} (t : YoungTableau μ) :
    MonoidAlgebra ℚ (Equiv.Perm (Fin μ.card)) := sorry

/-- **Essential idempotence**: `c_t² = (n! / f^λ) • c_t`, so `(f^λ / n!) • c_t` is idempotent. -/
theorem youngSymmetrizer_sq {μ : YoungDiagram} (t : YoungTableau μ) :
    youngSymmetrizer t * youngSymmetrizer t
      = ((μ.card.factorial : ℚ) / (standardCount μ : ℚ)) • youngSymmetrizer t := sorry

/-! ## Layer 3: the Specht modules `S^λ` -/

/-- **The Specht module** `S^λ`, the subrepresentation of `M^λ` spanned by the polytabloids, equivalently
the left ideal `ℚ[Sₙ] c_t`; packaged as a finite-dimensional representation. -/
noncomputable def spechtModule {n : ℕ} (μ : n.Partition) : FDRep ℚ (Equiv.Perm (Fin n)) := sorry

-- **The submodule theorem (James)** is the engine of irreducibility: for any `Sₙ`-stable submodule
-- `U ≤ M^λ`, either `S^λ ≤ U` or `U ≤ (S^λ)ᗮ` for the tabloid bilinear form. Its precise Lean statement
-- needs the concrete-submodule presentation of `S^λ` inside `permutationModule μ` and the tabloid form
-- `⟨·,·⟩`, both named in `README.md` Layer 3; pinned once those are fixed.

/-! ## Layer 4: completeness and irreducibility (the classification) -/

/-- **Irreducibility** of the Specht modules over `ℚ` (characteristic `0`). -/
theorem spechtModule_simple {n : ℕ} (μ : n.Partition) : Simple (spechtModule μ) := sorry

/-- **Absolute irreducibility** over `ℚ`: the endomorphism ring is `ℚ` (Schur index `1`), stated as the
one-dimensionality of the endomorphism space. This is a genuine milestone: irreducibility over `ℚ` does not
give it, and rational character values do not force Schur index `1`; it is what makes `ℂ ⊗_ℚ S^λ` stay
irreducible. -/
theorem spechtModule_absolutelyIrreducible {n : ℕ} (μ : n.Partition) :
    Module.finrank ℚ (spechtModule μ ⟶ spechtModule μ) = 1 := sorry

/-- **Distinctness**: non-isomorphic across distinct partitions. -/
theorem spechtModule_iso_iff {n : ℕ} (μ ν : n.Partition) :
    Nonempty (spechtModule μ ≅ spechtModule ν) ↔ μ = ν := sorry

/-- **Completeness**: every simple representation of `Sₙ` over `ℚ` is a Specht module. With
`partitionEquivConjClasses` and #irreducibles = #classes (from `../CharacterTheory`), `μ ↦ S^λ` is a
bijection onto the irreducibles. -/
theorem exists_spechtModule_iso {n : ℕ} (V : FDRep ℚ (Equiv.Perm (Fin n))) [Simple V] :
    ∃ μ : n.Partition, Nonempty (V ≅ spechtModule μ) := sorry

/-! ## Layer 5: the standard basis and the hook-length formula -/

/-- **The standard basis**: the polytabloids indexed by standard Young tableaux form a basis of `S^λ`,
so `dim S^λ = f^λ`. -/
noncomputable def spechtStandardBasis {n : ℕ} (μ : n.Partition) :
    Module.Basis (StandardYoungTableau (diagramOf μ)) ℚ (spechtModule μ) := sorry

theorem finrank_spechtModule {n : ℕ} (μ : n.Partition) :
    Module.finrank ℚ (spechtModule μ) = standardCount (diagramOf μ) := sorry

/-- **Hook length** of a cell (arm + leg + 1). -/
def hookLength (μ : YoungDiagram) (c : ℕ × ℕ) : ℕ := sorry

/-- **The hook-length formula** `f^λ · ∏_c hook(c) = n!`. -/
theorem hookLengthFormula (μ : YoungDiagram) :
    standardCount μ * ∏ c ∈ μ.cells, hookLength μ c = μ.card.factorial := sorry

/-! ## Layer 6: characters and the Murnaghan-Nakayama rule -/

/-- **The integer-valued Specht character** `χ^λ` (values are integers because the classes of `Sₙ` are
rational). -/
noncomputable def spechtChar {n : ℕ} (μ : n.Partition) : Equiv.Perm (Fin n) → ℤ := sorry

theorem spechtChar_cast {n : ℕ} (μ : n.Partition) (g : Equiv.Perm (Fin n)) :
    ((spechtChar μ g : ℤ) : ℚ) = (spechtModule μ).character g := sorry

/-- The character value on a class, indexed by its cycle-type partition. -/
noncomputable def spechtCharValue {n : ℕ} (μ ν : n.Partition) : ℤ := sorry

theorem spechtChar_eq_value {n : ℕ} (μ : n.Partition) (g : Equiv.Perm (Fin n)) :
    spechtChar μ g = spechtCharValue μ ((partitionEquivConjClasses n).symm (ConjClasses.mk g)) := sorry

/-- **The character table of `Sₙ`** as an integer matrix indexed by partitions. It satisfies the
character-table specification of `../CharacterTheory` (row/column orthogonality with the class sizes). -/
noncomputable def symmetricCharacterTable (n : ℕ) : Matrix n.Partition n.Partition ℤ :=
  Matrix.of fun μ ν => spechtCharValue μ ν

-- **The Murnaghan-Nakayama rule**: `χ^λ` on a class with an `r`-cycle equals the signed sum over rim
-- hooks `ρ` of size `r`, `∑_ρ (-1)^{height ρ} χ^{λ∖ρ}(σ')`, where `σ'` deletes that `r`-cycle. This
-- recursion computes the whole character table from the empty diagram. Its Lean statement needs the
-- rim-hook (border-strip), height, and skew-shape API named in `README.md` Layer 6; pinned once those
-- combinatorial objects are defined.

/-! ## Layer 7: symmetric functions, the Frobenius characteristic, and RSK -/

/-- **Schur polynomials**, defined combinatorially by semistandard tableaux (and, via Jacobi-Trudi, as a
determinant of `MvPolynomial.hsymm`); a `ℤ`-basis of the symmetric functions. -/
noncomputable def schurPoly (σ : Type*) (R : Type*) [Fintype σ] [DecidableEq σ] [CommRing R]
    {n : ℕ} (μ : n.Partition) : MvPolynomial σ R := sorry

theorem schurPoly_isSymmetric (σ : Type*) (R : Type*) [Fintype σ] [DecidableEq σ] [CommRing R]
    {n : ℕ} (μ : n.Partition) : (schurPoly σ R μ).IsSymmetric := sorry

/-- **The Frobenius characteristic / power-sum expansion** `p_μ = ∑_λ χ^λ(μ) s_λ`: the character table
is the change of basis between power sums (`MvPolynomial.psumPart`) and Schur functions. The identity
holds for every variable set `σ` (setting variables to zero is a ring homomorphism), but it determines
the character table only when `Fintype.card σ ≥ n` — for fewer variables the rows with `ℓ(λ) > |σ|`
have `s_λ = 0` and drop out. The "this is the character table" reading of README Layer 7 is the
`|σ| ≥ n` instance of this statement. -/
theorem frobenius_powerSum (σ : Type*) [Fintype σ] [DecidableEq σ] {n : ℕ} (ν : n.Partition) :
    MvPolynomial.psumPart σ ℤ ν
      = ∑ μ : n.Partition, spechtCharValue μ ν • schurPoly σ ℤ μ := sorry

/-- **The RSK correspondence**: permutations biject with pairs of standard tableaux of the same shape,
by row insertion. -/
noncomputable def rsk (n : ℕ) :
    Equiv.Perm (Fin n) ≃
      Σ μ : n.Partition,
        StandardYoungTableau (diagramOf μ) × StandardYoungTableau (diagramOf μ) := sorry

/-- **The sum-of-squares corollary** `∑_λ (f^λ)² = n!` (both sides count `|Sₙ|`). -/
theorem sum_sq_standardCount (n : ℕ) :
    ∑ μ : n.Partition, (standardCount (diagramOf μ)) ^ 2 = n.factorial := sorry

/-! ## Layer 8: Schur-Weyl duality -/

/-- **The `Sₙ`-action** on `(ℂᵈ)^{⊗n}` by permuting tensor factors, via `PiTensorProduct.reindex`. -/
noncomputable def permAction (d n : ℕ) :
    Equiv.Perm (Fin n) →*
      ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ] (⨂[ℂ] (_ : Fin n), (Fin d → ℂ))) := sorry

/-- **The `GLₔ`-action** on `(ℂᵈ)^{⊗n}` diagonally, via `PiTensorProduct.map`/`mapMonoidHom`. -/
noncomputable def glAction (d n : ℕ) :
    GL (Fin d) ℂ →*
      ((⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ] (⨂[ℂ] (_ : Fin n), (Fin d → ℂ))) := sorry

/-- **The two actions commute** (`reindex` and a diagonal `map` commute). -/
theorem permAction_commute_glAction (d n : ℕ) (σ : Equiv.Perm (Fin n)) (g : GL (Fin d) ℂ) :
    (permAction d n σ).toLinearMap ∘ₗ (glAction d n g).toLinearMap
      = (glAction d n g).toLinearMap ∘ₗ (permAction d n σ).toLinearMap := sorry

/-- **The `GLₔ × Sₙ` double centralizer, image-level**: inside `End((ℂᵈ)^{⊗n})`, the image subalgebra of
`ℂ[GLₔ]` and the image subalgebra of `ℂ[Sₙ]` are each other's centralizers. The centralizer of `GLₔ` is the
*image* of `ℂ[Sₙ]` (a proper quotient of `ℂ[Sₙ]` when `d < n - 1`), not `ℂ[Sₙ]` itself. -/
theorem permAction_glAction_doubleCentralizer (d n : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : GL (Fin d) ℂ => (glAction d n g).toLinearMap)
      = Algebra.adjoin ℂ (Set.range fun σ : Equiv.Perm (Fin n) => (permAction d n σ).toLinearMap)
    ∧ Subalgebra.centralizer ℂ
        (Set.range fun σ : Equiv.Perm (Fin n) => (permAction d n σ).toLinearMap)
      = Algebra.adjoin ℂ (Set.range fun g : GL (Fin d) ℂ => (glAction d n g).toLinearMap) := sorry

/-- The induced **algebra map** `ℂ[Sₙ] → End((ℂᵈ)^{⊗n})`: the `MonoidAlgebra.lift` of `permAction`,
sending `σ` to `(permAction d n σ).toLinearMap` (pinned by `permActionAlgHom_single`). This, not the
group homomorphism, is the object whose injectivity is the Layer-8 faithfulness milestone. -/
noncomputable def permActionAlgHom (d n : ℕ) :
    MonoidAlgebra ℂ (Equiv.Perm (Fin n)) →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) := sorry

/-- The defining property of `permActionAlgHom`: on group elements it is `permAction`. -/
theorem permActionAlgHom_single (d n : ℕ) (σ : Equiv.Perm (Fin n)) :
    permActionAlgHom d n (MonoidAlgebra.single σ 1) = (permAction d n σ).toLinearMap := sorry

/-- **Faithfulness refinement**: once `d ≥ n`, the algebra map `ℂ[Sₙ] → End((ℂᵈ)^{⊗n})` is injective,
so the image of `ℂ[Sₙ]` is all of `ℂ[Sₙ]` rather than a proper quotient. (The group homomorphism
`permAction` itself is injective already for every `d ≥ 2`; the substantive `n ≤ d` threshold belongs
to the algebra map, which is why the milestone is stated here and not on `permAction`.) -/
theorem permActionAlgHom_injective_of_le (d n : ℕ) (h : n ≤ d) :
    Function.Injective (permActionAlgHom d n) := sorry

/-- **The complex Specht module** `ℂ ⊗ S^λ`, still irreducible (absolute irreducibility over `ℚ`). -/
noncomputable def spechtModuleℂ {n : ℕ} (μ : n.Partition) :
    FDRep ℂ (Equiv.Perm (Fin n)) := sorry

/-- **The Schur functor** `𝕊^λ(ℂᵈ)`, the irreducible polynomial `GLₔ`-representation of highest weight
`λ`, whose character is `schurPoly`. Defined primarily as the range of the Young symmetrizer `c_t` acting on
`(ℂᵈ)^{⊗n}` (avoiding the balanced-tensor right-module conventions of `(ℂᵈ)^{⊗n} ⊗_{ℂ[Sₙ]} S^λ`). -/
noncomputable def schurFunctor (d : ℕ) {n : ℕ} (μ : n.Partition) :
    FDRep ℂ (GL (Fin d) ℂ) := sorry

/-- **The dimension count** behind Schur-Weyl: `dⁿ = ∑_{ℓ(λ) ≤ d} f^λ · dim 𝕊^λ(ℂᵈ)`. -/
theorem schurWeyl_finrank (d n : ℕ) :
    d ^ n
      = ∑ μ : n.Partition, (if μ.parts.card ≤ d then
          Module.finrank ℚ (spechtModule μ) * Module.finrank ℂ (schurFunctor d μ) else 0) := sorry

/-- **Schur-Weyl duality**: `(ℂᵈ)^{⊗n} ≅ ⊕_{λ ⊢ n, ℓ(λ) ≤ d} S^λ ⊗ 𝕊^λ(ℂᵈ)` as an
`Sₙ × GLₔ`-representation. The equivariance **is** the theorem — a bare `ℂ`-linear equivalence would
be equivalent to the dimension count `schurWeyl_finrank` — so the isomorphism is required to
intertwine `permAction` with the summand-wise Specht actions and `glAction` with the summand-wise
Schur-functor actions (`DirectSum.lmap` transports the componentwise actions). -/
theorem schurWeylDecomposition (d n : ℕ) :
    ∃ e : (⨂[ℂ] (_ : Fin n), (Fin d → ℂ)) ≃ₗ[ℂ]
        DirectSum {μ : n.Partition // μ.parts.card ≤ d}
          (fun μ => TensorProduct ℂ (spechtModuleℂ μ.1) (schurFunctor d μ.1)),
      (∀ σ : Equiv.Perm (Fin n),
        e.toLinearMap ∘ₗ (permAction d n σ).toLinearMap
          = DirectSum.lmap
              (fun μ => TensorProduct.map ((spechtModuleℂ μ.1).ρ σ) LinearMap.id)
            ∘ₗ e.toLinearMap) ∧
      ∀ g : GL (Fin d) ℂ,
        e.toLinearMap ∘ₗ (glAction d n g).toLinearMap
          = DirectSum.lmap
              (fun μ => TensorProduct.map LinearMap.id ((schurFunctor d μ.1).ρ g))
            ∘ₗ e.toLinearMap := sorry

/-! ## Layer 9: Schur-Weyl duality for the orthogonal and symplectic groups (the Brauer algebra) -/

/-- **A Brauer diagram** on `k` strands: a perfect matching of the `2k` boundary points `Fin k ⊕ Fin k`
(`k` bottom, `k` top), i.e. a fixed-point-free involution. The `k!` matchings with no horizontal arc are the
permutation diagrams; the rest carry cups and caps. -/
abbrev brauerDiagram (k : ℕ) : Type :=
  {f : Fin k ⊕ Fin k → Fin k ⊕ Fin k // Function.Involutive f ∧ ∀ x, f x ≠ x}

noncomputable instance (k : ℕ) : Fintype (brauerDiagram k) := Fintype.ofFinite _

/-- There are `(2k-1)!!` Brauer diagrams on `k` strands. -/
theorem card_brauerDiagram (k : ℕ) :
    Fintype.card (brauerDiagram k) = Nat.doubleFactorial (2 * k - 1) := sorry

/-- A boundary point `x` lies on a **through-strand** of `D`: it is matched to a point on the opposite side
(bottom `Fin k ⊕ Fin k` is `inl`, top is `inr`). -/
def brauerDiagram.isThrough {k : ℕ} (D : brauerDiagram k) (x : Fin k ⊕ Fin k) : Prop :=
  x.isLeft ≠ (D.1 x).isLeft

/-- A boundary point `x` lies on a **cap** (bottom horizontal arc) of `D`. -/
def brauerDiagram.isCap {k : ℕ} (D : brauerDiagram k) (x : Fin k ⊕ Fin k) : Prop :=
  x.isLeft = true ∧ (D.1 x).isLeft = true

/-- A boundary point `x` lies on a **cup** (top horizontal arc) of `D`. -/
def brauerDiagram.isCup {k : ℕ} (D : brauerDiagram k) (x : Fin k ⊕ Fin k) : Prop :=
  x.isLeft = false ∧ (D.1 x).isLeft = false

/-- The underlying matching of the vertical composition of `D₁` (placed above) and `D₂`. -/
def composeDiagram {k : ℕ} (D₁ D₂ : brauerDiagram k) : brauerDiagram k := sorry

/-- The number of closed loops formed in the middle when stacking `D₁` above `D₂`; the exponent of `δ` in
the loop rule. -/
def middleLoopCount {k : ℕ} (D₁ D₂ : brauerDiagram k) : ℕ := sorry

/-- Associativity of the loop-weighted diagram composition (the underlying matching part), from which the
associativity of `brauerAlgebra` follows. -/
theorem composeDiagram_assoc {k : ℕ} (D₁ D₂ D₃ : brauerDiagram k) :
    composeDiagram (composeDiagram D₁ D₂) D₃ = composeDiagram D₁ (composeDiagram D₂ D₃) := sorry

/-- **The Brauer algebra** `B_k(δ)`: the free `ℂ`-module on `brauerDiagram k`, with multiplication by
vertical stacking of diagrams weighted by `δ^{#closed loops}` (the `δ`-power loop rule). A unital associative
`ℂ`-algebra of dimension `(2k-1)!!`. Pinned opaquely with its `Ring`/`Algebra` structure; the loop-rule
multiplication and its associativity are the load-bearing combinatorics (see `README.md`). -/
def brauerAlgebra (δ : ℂ) (k : ℕ) : Type := sorry

noncomputable instance (δ : ℂ) (k : ℕ) : Ring (brauerAlgebra δ k) := sorry
noncomputable instance (δ : ℂ) (k : ℕ) : Algebra ℂ (brauerAlgebra δ k) := sorry

/-- **The diagram basis** of `B_k(δ)`, indexed by Brauer diagrams; hence `finrank = (2k-1)!!`. -/
noncomputable def brauerBasis (δ : ℂ) (k : ℕ) :
    Module.Basis (brauerDiagram k) ℂ (brauerAlgebra δ k) := sorry

/-- **The action of `B_k(n)` on `V^{⊗k}`** for `V = ℂⁿ` orthogonal (nondegenerate symmetric form,
loop value `δ = n = dim V`): through-strands permute tensor factors, bottom arcs contract a pair of slots
against the form (cap) and top arcs expand against its inverse (cup). -/
noncomputable def brauerActionOrth (n k : ℕ) :
    brauerAlgebra (n : ℂ) k →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) := sorry

/-- **The complex orthogonal group** `O(n, ℂ) = {A | Aᵀ * A = 1}`, the isometry group of the standard
symmetric bilinear form. Mathlib's `Matrix.orthogonalGroup (Fin n) ℂ` unfolds to `Matrix.unitaryGroup`, i.e.
`U(n)` for the conjugate-linear form, so Schur-Weyl duality here uses this honest form-orthogonal group. -/
def complexOrthogonalGroup (n : ℕ) : Submonoid (Matrix (Fin n) (Fin n) ℂ) := sorry

/-- **The diagonal action of the orthogonal group** `O(V) = complexOrthogonalGroup n` on `V^{⊗k}`,
the restriction of Layer 8's `glAction` along `O(V) ↪ GLₙ`. -/
noncomputable def orthAction (n k : ℕ) :
    ↥(complexOrthogonalGroup n) →*
      ((⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) ≃ₗ[ℂ] (⨂[ℂ] (_ : Fin k), (Fin n → ℂ))) := sorry

/-- **The two actions commute** (through-strands permute, arcs contract/expand against an `O(V)`-invariant
form). -/
theorem brauerActionOrth_commute (n k : ℕ) (g : complexOrthogonalGroup n)
    (b : brauerAlgebra (n : ℂ) k) :
    Commute (orthAction n k g).toLinearMap (brauerActionOrth n k b) := sorry

/-- **Orthogonal Schur-Weyl, surjectivity onto the commutant** (first fundamental theorem for `O(V)`): the
centralizer of the image of `O(V)` in `End(V^{⊗k})` is exactly the image of `B_k(n)`. This is the
invariant-theoretic content and does not require semisimplicity of the Brauer algebra. -/
theorem brauerActionOrth_surjective_to_commutant (n k : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : complexOrthogonalGroup n => (orthAction n k g).toLinearMap)
      = (brauerActionOrth n k).range := sorry

/-- **Orthogonal Schur-Weyl, reverse centralizer**: the finite-dimensional bicommutant statement for the two
image subalgebras. -/
theorem brauerActionOrth_reverse_centralizer (n k : ℕ) :
    Subalgebra.centralizer ℂ ((brauerActionOrth n k).range : Set _)
      = Algebra.adjoin ℂ
          (Set.range fun g : complexOrthogonalGroup n => (orthAction n k g).toLinearMap) := sorry

/-- **The harmonic (traceless) tensors** in `V^{⊗k}`: the common kernel of the contraction (trace) maps
`V^{⊗k} → V^{⊗(k-2)}` that cap a pair of slots against the invariant form. These are not themselves one
irreducible; the irreducible `O(V)`-module `E_λ` is the trace-free part of the shape-`λ` Schur piece (the
range of `c_t` intersected with `harmonicTensors`), and the cups rebuild the rest from lower tensor powers. -/
noncomputable def harmonicTensors (n k : ℕ) :
    Submodule ℂ (⨂[ℂ] (_ : Fin k), (Fin n → ℂ)) := sorry

/-- **The symmetric group as the no-arcs subalgebra** `ℂ[Sₖ] ↪ B_k(δ)` (the permutation diagrams,
those with only through-strands). This exhibits Layer 8's `Sₖ` inside the Brauer algebra. -/
noncomputable def permToBrauer (δ : ℂ) (k : ℕ) :
    MonoidAlgebra ℂ (Equiv.Perm (Fin k)) →ₐ[ℂ] brauerAlgebra δ k := sorry

/-- On the no-arcs subalgebra the Brauer action agrees with Layer 8's `permAction`, so Layer 9 contains the
`GLₔ × Sₙ` duality of Layer 8. This equality is convention-sensitive (stacking and `PiTensorProduct.reindex`);
pinned here at the generator level, and if the chosen conventions compose oppositely the correct statement
carries `σ⁻¹` in place of `σ`. -/
theorem brauerActionOrth_permToBrauer (n k : ℕ) (σ : Equiv.Perm (Fin k)) :
    brauerActionOrth n k (permToBrauer (n : ℂ) k (MonoidAlgebra.single σ (1 : ℂ)))
      = (permAction n k σ).toLinearMap := sorry

/-- **The diagonal action of the symplectic group** `Sp(V) = Matrix.symplecticGroup (Fin l) ℂ` (Mathlib's
honest form-symplectic submonoid) on `V^{⊗k}`, `V = (Fin l ⊕ Fin l) → ℂ` of dimension `2l`. -/
noncomputable def sympAction (l k : ℕ) :
    ↥(Matrix.symplecticGroup (Fin l) ℂ) →*
      ((⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) ≃ₗ[ℂ]
        (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ))) := sorry

/-- **The action of `B_k(-2l)` on `V^{⊗k}`** for `V` symplectic. The alternating form is antisymmetric, so
the cap/cup of each pair must be given a definite ordering; with the standard alternating form and that
ordering fixed, the loop value is `δ = -2l = -dim V` (an ordered closed loop evaluates to the trace of the
alternating pairing). That this is an algebra map is the check of the Brauer generator relations
`s² = 1`, `e² = δ e`, `s e = e`, the braid, and the mixed relations at `δ = -2l`. -/
noncomputable def brauerActionSymp (l k : ℕ) :
    brauerAlgebra (-(2 * l : ℂ)) k →ₐ[ℂ]
      Module.End ℂ (⨂[ℂ] (_ : Fin k), ((Fin l ⊕ Fin l) → ℂ)) := sorry

/-- **Symplectic Schur-Weyl, surjectivity onto the commutant** (first fundamental theorem for `Sp(V)`): the
centralizer of the image of `Sp(V)` is exactly the image of `B_k(-2l)`; holds regardless of semisimplicity. -/
theorem brauerActionSymp_surjective_to_commutant (l k : ℕ) :
    Subalgebra.centralizer ℂ
        (Set.range fun g : Matrix.symplecticGroup (Fin l) ℂ => (sympAction l k g).toLinearMap)
      = (brauerActionSymp l k).range := sorry

/-- **Symplectic Schur-Weyl, reverse centralizer**: the bicommutant statement for the two image subalgebras. -/
theorem brauerActionSymp_reverse_centralizer (l k : ℕ) :
    Subalgebra.centralizer ℂ ((brauerActionSymp l k).range : Set _)
      = Algebra.adjoin ℂ
          (Set.range fun g : Matrix.symplecticGroup (Fin l) ℂ => (sympAction l k g).toLinearMap) := sorry

/-- **Semisimplicity of `B_k(δ)` for large/generic `δ`**: whenever `|δ| ≥ 2k - 2`, the Brauer algebra is
semisimple, with irreducibles indexed by partitions of `k, k-2, k-4, …`. Stated on `|δ|` with `δ : ℤ` so that
it covers both geometric values, orthogonal `δ = n` and symplectic `δ = -2l`. The bound is sufficient, not
sharp (the exact criterion is Wenzl's); before this target is relied on, the constant `2k - 2` must be
re-checked against Wenzl's / Rui's criterion, since the geometric specializations sit exactly where
semisimplicity can fail. -/
theorem brauerAlgebra_isSemisimple_of_large_abs (δ : ℤ) (k : ℕ) (h : (2 * k - 2 : ℤ) ≤ |δ|) :
    IsSemisimpleRing (brauerAlgebra (δ : ℂ) k) := sorry

end TauCetiRoadmap.RepresentationTheory.SchurWeyl
