# Roadmap: algebraic codes and code-lattice constructions

Algebraic codes are the finite algebra which turns coordinate data into lattice overlattices.
This roadmap develops finite linear and additive codes far enough to support that use: matrix
presentations, Hamming data, duality, the MacWilliams identity, the small exceptional codes, and
Construction A.  Its final layer identifies code coordinates with the discriminant modules from
the [integral-lattices roadmap](../IntegralLattices/README.md), so the lattice attached to an
isotropic code is literally the preimage construction from that roadmap and has discriminant
module `C^⊥/C`.

The primary linear code on a finite coordinate type `ι` over a finite field `F` is the existing
Mathlib object

```lean
Submodule F (ι → F)
```

and an additive code over a finite abelian alphabet `A` is

```lean
AddSubgroup (ι → A).
```

Dimension, length, distance, and divisibility conditions are derived data or predicates; they are
not fields of another bundled code structure.  This keeps the full `Submodule` and `AddSubgroup`
APIs available and agrees with the direction of Mathlib's coding-theory development.

This roadmap does **not** develop decoding algorithms, general bounds, cyclic/BCH/Reed--Solomon
codes, designs, rank-24 glue tables, a classification of codes or lattices, theta series, or any
categorical construction.  It does not identify Golay automorphism groups with Mathieu groups.
The named codes and discriminant-coordinate checks below are reusable input for explicit lattice
constructions, not a classification of the resulting lattices.

Suggested home: `TauCeti/InformationTheory/Coding/`, with the discriminant and Construction A
bridge in `TauCeti/LinearAlgebra/IntegralLattice/ConstructionA.lean`.

## Standing conventions

- A coordinate set `ι` is an arbitrary finite type.  Use `Fin n` only for a displayed matrix or a
  named code with a conventional ordering.  The length is `Fintype.card ι`; changing coordinates
  along an equivalence must not require transport through an equality with `Fin n`.
- A linear code is a `Submodule F (ι → F)`, for a field `F` with `[Finite F]`.  Install a local
  `Fintype` or decidable-equality instance only for finite sums or enumeration.  The dimension is
  `Module.finrank F C`, and `#C = (#F)^(finrank F C)` is a theorem.
- An additive code is an `AddSubgroup (ι → A)` for a finite commutative additive group `A`.
  Linearity over a field or ring is extra structure, never inferred from additive closure.  An
  arbitrary subgroup of a discriminant module is called a subgroup, not automatically a binary or
  field-linear code.
- Words are functions.  Hamming support is the set of nonzero coordinates; Hamming weight and
  distance are Mathlib's `hammingNorm` and `hammingDist`.  The minimum distance of the zero code is
  `0`; for a nonzero linear or additive code it is the least weight of a nonzero codeword and also
  the least distance between distinct codewords.
- The Euclidean dual of a linear code uses the standard bilinear form
  `⟪x,y⟫ = ∑ i, x i * y i`, with no conjugation.  Hermitian duality is a separate construction over
  a finite field with a specified involutive field automorphism `σ`.  Its pinned orientation is
  `hσ(x,y)=∑ i, x_i σ(y_i)`: it is linear in the first entry and `σ`-semilinear in the
  second.  For `F₄`, `σ` is Frobenius `x ↦ x²`.  With this orientation, a generator matrix
  `G` for `C` becomes the entrywise-conjugate parity-check matrix `σ(G)` for `C^⊥_H`; using
  `G` itself would silently compute the Euclidean dual.
- A generator matrix `G : Matrix ρ ι F` generates the row space, namely the range of
  `G.vecMulLinear`.  A parity-check matrix `H : Matrix σ ι F` cuts out
  `ker H.mulVecLin`.  Thus a systematic generator `[I | A]` has parity check
  `[-Aᵀ | I]`.  Row indices carry no coordinate meaning.
- A permutation equivalence is induced only by a coordinate equivalence.  A monomial equivalence
  additionally multiplies coordinates by nonzero field elements.  Both preserve Hamming data.
  Semilinear equivalence, which also applies a field automorphism, remains a distinct notion.
  `Aut(C)` means the monomial stabilizer unless a declaration explicitly says
  `PermutationAut(C)`.
- The homogeneous Hamming weight enumerator has coefficients in `ℤ` and variable order
  `(X,Y)`:
  `W_C(X,Y)=∑_{c∈C} X^(n-wt(c)) Y^wt(c)`.  Also expose the weight distribution and the
  one-variable specialization.  The MacWilliams identity is stated without division as
  `#C · W_{C⊥}(X,Y) = W_C(X+(q-1)Y, X-Y)`.
- A binary code is **doubly even** when every weight is divisible by four.  A **Type II** code is a
  doubly-even Euclidean self-dual binary code.  “Even” alone means weights divisible by two and is
  not a synonym for Type II.
- Fix `F₄` as a field of four elements and choose `ω` with `ω²+ω+1=0`; write
  `F₄={0,1,ω,ω²}`.  The hexacode statements must be invariant under exchanging `ω` and `ω²`.
- For Construction A, every declaration has `m ≥ 2` (or at least a `NeZero m` parameter where
  only nonvanishing is used); no helper is defined at `m=0`.  Reduce coordinatewise
  `ρ_m : ℤ^ι → (ZMod m)^ι`, and put `P_m(C)=ρ_m⁻¹(C)`.  The Lean lattice stays in the rational
  ambient space `ℚ^ι`, has carrier the image of `P_m(C)`, and has form
  `B_m(x,y)=(∑ i, x_i y_i)/m`.  After scalar extension to `ℝ` it is isometric to the usual
  `m^(-1/2) P_m(C)`.  This convention avoids adjoining square roots and makes all dual carriers
  literal submodules of one rational space.
- The integral-lattices dependency uses the half-norm discriminant convention
  `q(x)=B(x,x)/2 mod ℤ`.  All code-to-discriminant comparisons below use that convention.

## Existing library material to consume

### Mathlib

- `Mathlib/InformationTheory/Hamming.lean` defines `hammingDist`, `hammingNorm`, and their
  invariance and triangle lemmas on finite Pi types.  Do not introduce a second Hamming weight.
- `Submodule`, `AddSubgroup`, `Module.finrank`, finite-dimensional duality, and
  `LinearMap.BilinForm.orthogonal` and the root declaration `dotProductBilin` supply the primary
  carriers, dimension, and dual-code
  machinery.  `Matrix.vecMulLinear`, `Matrix.mulVecLin`, kernels, ranges, rank, transpose, and block
  matrices supply generator and check presentations.
- `MvPolynomial` supplies the homogeneous enumerator and substitution in the MacWilliams identity.
  `AddChar.FiniteField.primitiveChar` and `AddChar.sum_eq_zero_of_ne_one` supply the character and
  vanishing sum for the character-sum proof.  Do not prove MacWilliams through theta series.
- `GaloisField`, `ZMod`, finite-field cardinality and Frobenius APIs supply the named alphabets.
  Use an existing four-element field rather than defining a private four-element ring.
- Mathlib's open linear-code work in
  [PR #38014](https://github.com/leanprover-community/mathlib4/pull/38014) uses
  `Subspace F (Hamming (fun _ : Fin n ↦ F))`, hence a `Fin n` coordinate type and the Hamming
  type synonym,
  and defines minimum distance through `Set.infsep`.  This roadmap agrees with that unbundled-
  subspace design, but its arbitrary finite coordinate type is a genuine generalization, not the
  PR's present interface.  Supply explicit reindexing/Hamming-type bridges, and either reuse
  `Set.infsep` or prove the equality between it and the least-nonzero-weight formula.  If the PR
  lands first, consume its declarations for `Fin n`; do not claim that the current signatures are
  already import-compatible.

### Tau Ceti and neighboring roadmaps

Tau Ceti has no general coding-theory layer.  Its finite-field, matrix, polynomial, and root-data
material is input, not an alternative representation of codes.  The integral-lattices roadmap
supplies `IntegralLattice`, finite bilinear and quadratic modules, discriminant forms, isotropic
subgroups, `IntegralLattice.ofIsotropicSubgroup`, and the isometry
`A_{L_H} ≅ H^⊥/H`.  Construction A and every root-discriminant coordinate check must consume those
objects directly.

There are independent Lean drafts involving Golay codes and Mathieu groups, discussed in the Lean
Zulip [Mathieu groups topic](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Mathieu.20groups/with/608500915).
Coordinate with their authors before copying or adapting code.  The intrinsic targets and
conventions in this roadmap, rather than any one draft's file layout, remain the specification.

---

## Layer 1: finite codes, matrices, and elementary constructions

Build the carrier API once for arbitrary finite coordinate types.

- Give namespace aliases for linear and additive codes, membership and extensionality lemmas, the
  zero, top, inclusion, sum, intersection, map, and comap operations inherited from their carriers,
  and finite-cardinality results.  Do not wrap these operations in a structure which hides the
  lattice of subobjects.
- Define the code generated by a matrix as `range G.vecMulLinear` and the code checked by a matrix
  as `ker H.mulVecLin`.  Define generator- and parity-check-matrix predicates by equality to those
  submodules.  Prove existence from finite bases, the row-span and syndrome membership criteria,
  the rank/dimension formulae, deletion of dependent rows, and invariance under invertible row
  operations.
- Prove that full-rank generator and check matrices for `C` have respectively `k` and `n-k` rows.
  Relate a generator for `C` to a check matrix for `C^⊥`.  Develop systematic form relative to a
  chosen information set and verify directly that `[I | A]` and `[-Aᵀ | I]` generate/check
  orthogonal codes.  Do not assert that a canonical information set exists.
- For `s : Set ι`, take `s` to mean the coordinates **retained**.  Define puncturing by restriction
  to `s`, and shortening by first imposing zero outside `s` and then restricting.  Supply single-
  coordinate forms, membership and dimension lemmas, repeated-operation identities, and naturality
  under reindexing.  State bounds using the finite number of deleted coordinates.
- Define the direct sum on the disjoint-union coordinate type and prove its universal membership,
  dimension, cardinality, Hamming, and associativity/commutativity statements.  Supply canonical
  reindexing equivalences rather than identifying different function types by proof irrelevance.
- Construct permutation, monomial, and semilinear word equivalences, the induced code maps, and the
  equivalence relations.  Define their stabilizer groups and actions on codewords.  Prove
  preservation of dimension, support cardinality, weight, distance, and weight enumerator by the
  appropriate equivalences.

Acceptance at this layer includes converting a full-rank generator matrix to a parity-check matrix,
then recovering the same code as the kernel, and checking that this calculation is natural under a
nontrivial coordinate reindexing.

## Layer 2: Hamming data and dual codes

- Relate `Function.support`, its finite version, `hammingNorm`, and `hammingDist`.  Prove the support
  formulae for addition and scalar multiplication, the weight bound by length, and
  `dist(x,y)=wt(y-x)` with the pinned subtraction orientation.
- Define minimum distance for linear and additive codes with the zero-code convention above.  For a
  nonzero code, prove attainment by a nonzero word and equality with the least pairwise distance.
  Prove invariance under Hamming isometries, that shortening cannot decrease minimum distance, the
  sharp deleted-coordinate bound for puncturing, and the minimum formula for direct sums.
- Define the standard bilinear form on `ι → F` using Mathlib's finite dot product, prove symmetry
  and nondegeneracy, and define `C^⊥` with `BilinForm.orthogonal`.  Prove membership, order reversal,
  `C ≤ C^⊥` and `C=C^⊥` characterizations, `(C^⊥)^⊥=C`,
  `dim C + dim C^⊥ = #ι`, and `#C · #C^⊥ = (#F)^(#ι)`.
- Prove the duality formulae
  `(puncture C s)^⊥ = shorten (C^⊥) s`,
  `(shorten C s)^⊥ = puncture (C^⊥) s`, and
  `(C ⊕ D)^⊥ = C^⊥ ⊕ D^⊥`, with the retained-coordinate convention visible in each statement.
  Describe the contragredient action of a monomial equivalence on the dual.
- Develop Hermitian duality separately for a finite field with a specified involutive
  automorphism using Mathlib's sesquilinear-map and `Submodule.orthogonalBilin` APIs.  Prove the
  membership, nondegeneracy, double-dual, and dimension formulae, and the generator/check theorem
  `rowspan(G)=C ⇔ ker(σ(G))=C^⊥_H`.  Specialize to Frobenius on `F₄`.  No theorem may
  silently replace a Hermitian dual by the Euclidean dual.
- For a finite bilinear alphabet `A` from the integral-lattices roadmap, construct the coordinate
  power on `ι → A` by summing pairings.  Define the orthogonal additive code and prove the
  finite-cardinality and double-perpendicular results under nondegeneracy.  Construct the analogous
  coordinate finite quadratic module by summing quadratic values.

## Layer 3: weight enumerators and MacWilliams

- Define the weight distribution `A_w(C)`, prove it vanishes above the length, sums to `#C`, has
  `A_0=1`, and is invariant under monomial equivalence.  Define the one-variable and homogeneous
  weight enumerators and prove their coefficient formulae, finite support, homogeneity, evaluation
  at `(1,1)`, direct-sum product, and recovery of minimum distance for a nonzero code.
- Establish the finite-character orthogonality lemma for a linear subspace and its Euclidean dual.
  Reuse Mathlib's primitive additive character on a finite field and its nontrivial-character sum;
  expose the resulting finite Fourier transform lemma as reusable API rather than burying it in the
  final polynomial calculation.
- Prove the `q`-ary MacWilliams identity for every finite field `F`, `q=#F`, in the integral,
  division-free form

  `#C · W_{C^⊥}(X,Y) = W_C(X+(q-1)Y, X-Y)`.

  Derive the rational normalized form, the coefficient/Krawtchouk formula, and invariance of the
  enumerator of a self-dual code under the normalized transform.  Check the identity on the zero,
  whole-space, repetition, and single-parity-check codes.

This layer does not introduce theta series or use a theta transformation as a proof of MacWilliams.

## Layer 4: binary doubly-even and Type II codes

- Define even, doubly-even, self-orthogonal, self-dual, and Type II predicates without bundling
  proofs into a new code type.  Prove that a doubly-even binary linear code is self-orthogonal by
  the support-intersection weight identity.
- For a binary self-dual code, prove that every word has even weight, the all-ones word lies in the
  code, the dimension is half the length, and the code has `2^(n/2)` words.  For Type II codes prove
  the stronger length congruence `#ι ≡ 0 (mod 8)` with all finiteness and nondegeneracy hypotheses
  explicit.
- Prove closure of doubly-even and Type II codes under direct sum and preservation under coordinate
  permutation.  Record the exact behavior under general monomial and semilinear maps, even though
  these collapse to permutations over `F₂`.
- Specialize MacWilliams to Type II codes and prove the two elementary weight-enumerator
  invariances forced by self-duality and divisibility by four, with their coefficient rings pinned:

  `W_C(X+Y,X-Y)=2^(#ι/2) W_C(X,Y)` in `ℤ[X,Y]`, and

  `W_C(X,iY)=W_C(X,Y)` after base change to `ℤ[i][X,Y]` (or `ℂ[X,Y]`).

  Full Gleason invariant theory and classification of Type II codes are outside this roadmap.

## Layer 5: tetracode, hexacode, and the extended Golay codes

Each named code is defined by a displayed finite matrix (or an equivalent finite spanning list),
then its properties are proved by exact finite algebra.  A declaration which merely assumes the
desired parameters does not construct the named code.

- Define the ternary tetracode from

  ```text
  [ 1 0 1  1 ]
  [ 0 1 1 -1 ]
  ```

  over `ZMod 3`.  Prove it has parameters `[4,2,3]`, is Euclidean self-dual, every nonzero word has
  weight `3`, and
  `W_T(X,Y)=X^4+8XY^3`.
- With `ω²+ω+1=0`, define the hexacode over `F₄` from

  ```text
  [ 1 0 0 1 ω ω ]
  [ 0 1 0 ω 1 ω ]
  [ 0 0 1 ω ω 1 ].
  ```

  Prove it has parameters `[6,3,4]`, is **Hermitian** self-dual, has only weights `0`, `4`, and
  `6`, and
  `W_H(X,Y)=X^6+45X^2Y^4+18Y^6`.  The conjugate code is genuinely different -- it meets `H` in only
  four words -- so verify explicitly that exchanging `ω` and `ω²` gives an equivalent code.  In the
  displayed one-based coordinate order the reordering
  `(c₁,c₂,c₃,c₄,c₅,c₆) ↦ (c₁,c₂,c₄,c₆,c₃,c₅)`
  carries the coordinatewise Frobenius conjugate back to `H`.  This is one-line notation for a
  coordinate ordering, **not** cycle notation: the cycle `(1 2 4 6 3 5)` does not work.  This must
  be an actual permutation-equivalence theorem, not just invariance of the parameters.  As a
  convention check, compute that the displayed generator has zero Hermitian Gram matrix but a
  nonzero Euclidean Gram matrix.
- Define the extended binary Golay code `G₂₄` from the systematic generator `[I₁₂ | B]` with the
  bordered reverse-circulant block of Huffman--Pless §1.9.1.  Writing `Q={0,1,3,4,5,9}` for the
  quadratic residues modulo eleven together with zero, `B` has first row and first column the
  all-ones border except `B₀₀=0`, and `B_{ij}=1` exactly when `(i-1)+(j-1) mod 11 ∈ Q` for
  `i,j ≥ 1`:

  ```text
  B = [ 0 1 1 1 1 1 1 1 1 1 1 1
        1 1 1 0 1 1 1 0 0 0 1 0
        1 1 0 1 1 1 0 0 0 1 0 1
        1 0 1 1 1 0 0 0 1 0 1 1
        1 1 1 1 0 0 0 1 0 1 1 0
        1 1 1 0 0 0 1 0 1 1 0 1
        1 1 0 0 0 1 0 1 1 0 1 1
        1 0 0 0 1 0 1 1 0 1 1 1
        1 0 0 1 0 1 1 0 1 1 1 0
        1 0 1 0 1 1 0 1 1 1 0 0
        1 1 0 1 1 0 1 1 1 0 0 0
        1 0 1 1 0 1 1 1 0 0 0 1 ].
  ```

  Prove rank `12`, minimum distance `8`, self-duality, doubly-evenness, and

  `W_G₂₄(X,Y)=X^24+759X^16Y^8+2576X^12Y^12+759X^8Y^16+Y^24`.

  Prove that puncturing any coordinate gives a binary `[23,12,7]` Golay code and that extending it
  by the parity coordinate recovers a code permutation-equivalent to `G₂₄`.
- Define the extended ternary Golay code `G₁₂` from the systematic matrix `[I₆ | A]`

  ```text
  A = [ 0 1 1 1 1 1
        1 0 1 2 2 1
        1 1 0 1 2 2
        1 2 1 0 1 2
        1 2 2 1 0 1
        1 1 2 2 1 0 ]
  ```

  over `ZMod 3`.  Prove parameters `[12,6,6]`, Euclidean self-duality, divisibility of every weight
  by `3`, and
  `W_G₁₂(X,Y)=X^12+264X^6Y^6+440X^3Y^9+24Y^12`.

For all four codes, evaluate the finite sum defining the enumerator and independently verify the
dual through the generator/check interface.  Full uniqueness up to equivalence and identification
of permutation automorphism groups with Mathieu groups are not targets: neither is needed to use
these explicit codes in a lattice construction.  The general automorphism API from Layer 1 remains
in scope.

## Layer 6: Construction A with exact hypotheses

Let `m ≥ 2` and let `C ≤ (ZMod m)^ι` be an additive code.  Define its standard dual by the
`ZMod m` dot product and construct `P_m(C)` and `B_m` using the standing convention.
Ebeling Proposition 1.3 is the exact binary specialization.  For general `ZMod m`,
Harada--Munemasa--Venkov §2 fixes the `A_m(C)` normalization for arbitrary positive `m` and
records the self-dual-to-unimodular implication and its frame converse.  Munemasa--Tamura §4
states the exact integrality/self-orthogonality and unimodularity/self-duality criteria.  Translate
their real `m^(-1/2)` normalization to `B_m` on the rational carrier.  The stronger literal
carrier identity `A_m(C)^∨=A_m(C^⊥)` is an elementary inverse-image/residue-pairing lemma to be
proved here; it is not attributed to a theorem which those sources do not state.  The Type II theorem of
Dougherty--Gulliver--Harada is used only for codes over `Z/(2^r)`: do not extrapolate its named
Type II/even-lattice result to arbitrary composite moduli.  Elementary residue calculations below
may be stated for every `m ≥ 2`, with their proof and exact hypotheses visible.

- Prove that `P_m(C)` is a full `ℤ`-lattice in `ℚ^ι` for every `C`.  It bundles as an
  `IntegralLattice` exactly when `C ≤ C^⊥`.  Prove the literal carrier equality
  `P_m(C)^∨ = P_m(C^⊥)` under the form `B_m`; do not replace it by a cardinality calculation.
- Prove
  `disc(P_m(C)) = m^(#ι) / (#C)^2` for self-orthogonal `C`, including the divisibility which makes
  the right side a natural number.  For a linear `[n,k]` code over `ZMod p`, with `p` prime, derive
  `disc(P_p(C))=p^(n-2k)`.
- Prove that integral `P_m(C)` is unimodular exactly when `C=C^⊥`.  Keep self-orthogonality visible
  in the construction so “unimodular” is never asserted of an unbundled nonintegral carrier.
- When `m` is even, define
  `q_m(c)=∑ i lift(c_i)^2/(2m) mod ℤ`; prove independence of integer lifts and identify its polar
  form with the coordinate discriminant pairing.  Prove that `P_m(C)` is even exactly when
  `q_m|_C=0`.  If `m` is odd and `ι` is nonempty, prove `P_m(C)` is not even because it contains a
  coordinate vector of norm `m`.
- At `m=2`, prove `q_2(c)=wt(c)/4 mod ℤ`, so evenness is exactly doubly-evenness.  Deduce that the
  Construction A lattice of a Type II code is positive-definite, even, and unimodular.  Apply this
  to the explicit `G₂₄`; this end-to-end theorem is an acceptance test, without identifying or
  classifying the resulting rank-24 lattice.
- For the published higher-modulus terminology, separately define a Type II `Z/(2^r)` code as a
  self-dual code whose Euclidean weights are divisible by `2^(r+1)`, and prove the corresponding
  Construction-A lattice is even unimodular.  Do not install “Type II” as a predicate on every
  `ZMod m` code.
- Prove naturality under coordinate permutations and the precise lattice isometry induced by a
  signed coordinate change.  State separately which general monomial code equivalences lift to
  rational or integral lattice isometries; a unit of `ZMod m` is not automatically a Euclidean
  coordinate isometry.

## Layer 7: codes as isotropic discriminant subgroups

This layer is the bridge to the integral-lattices roadmap, not a second gluing theory.
The `A₂` and `D₄` coordinate calculations use the discriminant-glue convention of
Conway--Sloane Chapter 4 §3 and the nonbinary constructions in Chapter 7 §§8--9; the Lean targets
must exhibit the isometries rather than relying on those identifications as folklore.

- Let `L₀(m,ι)` have carrier `mℤ^ι` in `ℚ^ι` and form `B_m`.  Prove
  `L₀(m,ι)^∨=ℤ^ι` and construct an isometry
  `A_{L₀} ≅ (ZMod m)^ι` carrying the class of an integer vector to its coordinatewise
  reduction modulo `m`, and carrying the discriminant pairing to
  `∑ lift(x_i)lift(y_i)/m mod ℤ`.  For even `m`, identify the half-norm quadratic form with `q_m`.
- Under this isometry, transport an additive code `C` to an actual
  `AddSubgroup L₀.DiscriminantGroup`; define it as the inverse image under the displayed
  isometry, not as opaque existential data.  Prove its orthogonal complement is exactly the inverse
  image of `C^⊥`, bilinear isotropy is equivalent to
  `C ≤ C^⊥`, quadratic isotropy for even `m` is equivalent to `q_m|_C=0`, and the preimage lattice
  `L₀.ofIsotropicSubgroup` is isometric to `P_m(C)`.
- Consume the general gluing theorem to obtain, for isotropic `C`, the natural isometry
  `A_{P_m(C)} ≅ C^⊥/C`, first as an isometry of finite bilinear modules and, when `m` is even
  and `q_m|_C=0`, as an isometry of finite quadratic modules.  Its underlying quotient must be the
  actual subtype quotient built from `C ≤ C^⊥`; a cardinality equality is not a substitute.
  Deduce unimodularity from the Lagrangian condition `C=C^⊥`, not from an unexplained determinant
  computation.
- Build finite coordinate powers and coordinatewise isometries for other discriminant alphabets.
  Verify that the tetracode and `G₁₂` become quadratic-isotropic, Lagrangian subgroups for the
  standard `A₂` discriminant alphabet.  Pin its generator so that, for `a,b∈F₃`,
  `q_A₂(a)=a²/3 mod ℤ` and `b_A₂(a,b)=2ab/3 mod ℤ`.
  Identify the standard `D₄` alphabet additively with `F₄` by sending
  `1` to the vector class and `ω,ω²` to the two spinor classes.  On a coordinate power use
  `q_D₄(x)=wt(x)/2 mod ℤ` and
  `b_D₄(x,y)=(1/2) Tr_{F₄/F₂}(∑_i x_i y_i²) mod ℤ`.
  Construct the corresponding quadratic-module isometries to the actual discriminant modules,
  then verify that the tetracode and `G₁₂` are quadratic-isotropic Lagrangians for `A₂`, and the
  hexacode is one for `D₄`.  These are coordinate checks, not rank-24 glue tables or lattice
  identifications.
- State the reusable interface for an isometry from a coordinate finite quadratic module to the
  discriminant module of an orthogonal lattice sum.  Its input subgroup remains an
  `AddSubgroup`; field-linearity is used only when separately proved for a named code.

Acceptance at this layer sends the explicit binary Golay code through the coordinate discriminant
isometry, constructs the same lattice both as Construction A and as
`IntegralLattice.ofIsotropicSubgroup`, and obtains evenness, unimodularity, and trivial
`C^⊥/C` from the general APIs.

## Ordering and completion criterion

Layer 1 fixes carriers and matrix conventions before any invariant depends on them.  Hamming and
dual APIs in Layer 2 feed the enumerator theorem in Layer 3 and Type II theory in Layer 4.  The four
finite examples in Layer 5 exercise those general layers.  Construction A then consumes the code
API, and Layer 7 identifies it with the discriminant-subgroup construction in the integral-lattices
roadmap.

The roadmap is complete only when all general operations, duality and MacWilliams, all four named
code computations, Construction A criteria, and the discriminant bridge have been formalized.
Having a matrix called “Golay” without verified rank, distance, dual, and enumerator, or proving
even unimodularity without the `ofIsotropicSubgroup`/`C^⊥/C` comparison, is not completion.

## References

- W. C. Huffman and V. Pless, *Fundamentals of Error-Correcting Codes*, Cambridge University Press
  (2003), [book DOI](https://doi.org/10.1017/CBO9780511807077).  §§1.2--1.7 give matrices, duals,
  Hamming data, puncturing, shortening, direct sums, and equivalence; §1.9 gives the initial Golay
  matrices; Chapter 7 gives weight distributions and the MacWilliams equations; Chapters 9--10
  give self-dual codes, additive `F₄` codes, the binary and ternary Golay codes, and the hexacode.
  Examples 1.3.3--1.3.4 fix the tetracode and Hermitian hexacode conventions used here.
- F. J. MacWilliams and N. J. A. Sloane, *The Theory of Error-Correcting Codes*, North-Holland
  Mathematical Library 16 (1977),
  [publisher page](https://www.sciencedirect.com/bookseries/north-holland-mathematical-library/vol/16).
  Chapters 1 and 5 supply linear-code foundations, dual weight distributions, and MacWilliams;
  Chapters 18--20 supply code constructions, self-dual codes, and the Golay codes.
- J. H. Conway and N. J. A. Sloane, *Sphere Packings, Lattices and Groups*, 3rd ed., Springer
  (1999), [DOI](https://doi.org/10.1007/978-1-4757-6568-7).  Chapter 4 §3 supplies discriminant
  glue coordinates; Chapter 5 §2 and Chapter 7 §§2, 6, 8--9 supply Construction A and its binary,
  Type II, and nonbinary forms.  The code descriptions used by the later rank-24 constructions are
  treated as examples, not as a classification target here.
- W. Ebeling, *Lattices and Codes*, 3rd ed., Springer (2013),
  [DOI](https://doi.org/10.1007/978-3-658-00360-9).  §§1.2--1.3 give binary codes and the exact
  Construction A equivalences (Proposition 1.3); §§2.8--2.9 give the Golay enumerator and
  MacWilliams normalization; §3.3 gives the discriminant-coordinate viewpoint; §§5.2 and 5.4 give
  the ternary code and dual-lattice calculations.  Its theta-function proofs are background only:
  theta series are outside this roadmap.
- M. Harada, A. Munemasa, and B. Venkov, “Classification of ternary extremal self-dual codes of
  length 28,” *Math. Comp.* **78** (2009), 1787--1796,
  [DOI](https://doi.org/10.1090/S0025-5718-08-02194-7).  Section 2 fixes the general `Z_k`
  Construction-A normalization, the self-dual-to-unimodular implication, and the converse through
  `k`-frames.  It does not state the full dual-carrier identity targeted above.
- A. Munemasa and H. Tamura, “The codes and the lattices of Hadamard matrices,” *European J.
  Combin.* **33** (2012), 519--533,
  [DOI](https://doi.org/10.1016/j.ejc.2011.11.007).  Section 4 uses the general `Z_m`
  integrality/self-orthogonality and unimodularity/self-duality criteria in the normalization which
  this roadmap translates to its rational ambient space.
- S. T. Dougherty, T. A. Gulliver, and M. Harada, “Type II self-dual codes over finite rings and
  even unimodular lattices,” *J. Algebraic Combin.* **9** (1999), 233--250,
  [DOI](https://doi.org/10.1023/A:1018696102510).  This is the source for Type II codes over
  `Z/(2^r)` and their even-unimodular Construction-A lattices; its modulus restriction is retained.

Mathematical review is wanted from a coding theorist, especially for the equivalence conventions,
the `F₄` Hermitian/D₄ discriminant identification, and the exact hypotheses of the generalized
`ZMod m` Construction A statements, and from a Lean contributor familiar with finite sums,
matrices, `MvPolynomial`, and finite character sums.
