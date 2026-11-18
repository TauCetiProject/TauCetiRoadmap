# Roadmap: rank-two lifting inputs for Serre's conjecture over ℚ

**Summary.** The proof of Serre's modularity conjecture over `ℚ` rests on a body of rank-two theorems about Galois representations of `ℚ` and of the totally real fields used as auxiliary base changes. This roadmap proves them; the conjecture itself, with its consequences, is proved in SerreModularityByCompatibleSystems. Throughout, a residual representation `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` of S-type is continuous, odd and absolutely irreducible, and Serre's invariants are its conductor `N(ρ̄)` away from `p`, its weight `k(ρ̄)` and its character `ε(ρ̄)`. None of the results assumes Serre's conjecture.

The first group of results produces modular forms over a larger field. Moret-Bailly's theorem finds points on a geometrically irreducible variety over a finite extension of a number field with prescribed local behaviour. Applied to moduli of abelian varieties with real multiplication, it gives controlled residual potential modularity: an S-type `ρ̄` with `2 ≤ k(ρ̄) ≤ p + 1` whose restriction to `ℚ(μ_p)` is absolutely irreducible (non-solvable image when `p = 2`) becomes modular over a totally real field of even degree, with the same residual image and with control at `p`.

The second group consists of modularity lifting theorems over `ℚ`. Skinner and Wiles's theorems treat ordinary representations, both residually reducible and residually irreducible; Khare and Wintenberger's theorem lifts modularity from `ρ̄` to a crystalline or weight-two semistable lift with the stated local conditions; Kisin's theorem on potentially Barsotti–Tate representations gives Khare and Wintenberger's Hypothesis (H). Together with global finiteness of deformation rings, these give the existence of lifts of `ρ̄` with prescribed local behaviour and of almost strictly compatible systems through them, along which modularity transfers.

The roadmap also proves Khare and Wintenberger's results on good-dihedral primes. For `p ≡ 1 (mod 4)` and a continuous odd `ρ̄ : G_ℚ → GL₂(𝔽_p)` of non-solvable image, the auxiliary primes whose Frobenius is projectively conjugate to complex conjugation and which satisfy the stated congruences have positive Dirichlet density. A last layer proves irreducibility of the Galois representations of rank-two conjugate-self-dual cuspidal forms over CM fields, the globalisation of a local residual representation with the Hecke-valued Galois representation of the resulting definite unitary tower, and the vanishing of the rational second Galois cohomology of a totally real field twisted by the square of the cyclotomic character.

The roadmap builds on GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra, HilbertModularVarietiesAndShimuraCurves and AlgebraicModularFormsAndSerreWeights for deformation rings, patching, Hilbert modular forms and Serre weights. SerreModularityByCompatibleSystems uses it to prove Serre's conjecture; GL2ModularityLifting and PotentialModularityAndCompatibleSystems build on it for the totally real generalisations.

Layer I holds the potential modularity, lifting and compatible-system results. Layer R26.1 holds Böckle's presentation of minimal deformation rings, Layer R27.1 the good-dihedral primes and the Chebotarev choice of auxiliary primes, and Layer R33.1 the three further results.

Headline statements in [`Suggested.lean`](Suggested.lean) express the positive density of auxiliary primes and the arithmetic interfaces for residual representations and newforms (the absolute Galois group, Frobenius elements, unramifiedness, oddness, absolute irreducibility and attachment) on which the statements of Serre's conjecture are written. The other targets require the arithmetic and geometric objects specified here, with their hypotheses and source locators.

## How to read the build

Layer I proves the inputs that no earlier roadmap supplies. Within it, build first the field constructions of I.0 (Moret-Bailly's theorem and soluble base change), then the lifting theorems that need only a modular seed (`I.2/potentially-barsotti-tate-lifting`, the nearly ordinary Hecke algebras and pseudo-deformation rings of I.1 and the two Skinner–Wiles theorems), then controlled residual potential modularity in I.0, then the global finiteness, patching comparisons and Khare–Wintenberger lifting of I.2, and finally the prescribed lifts and systems of I.3. The almost-strict-family definition is available before the theorems constructing its members.

R26.1 holds Böckle's presentation of minimal deformation rings, which uses only I.2. The targets of R27.1 use only ArithmeticGaloisRepresentations Layers 2–4, `AlgebraicModularFormsAndSerreWeights:R15.4`, Input I.3 and Chebotarev Layer 10. R33.1 uses I.0 for its globalisation and is otherwise independent of the other layers.

Targets carry labels such as `R27.1/good-dihedral-prime-definition`, its layer and a short name. Prerequisites written with such a label are targets of this roadmap; those written `Roadmap:Layer/target` or `Roadmap:Layer` are targets of a neighbouring roadmap; those written in code font without a colon are existing declarations.

## Conventions

### 2.1 Representations

`G_ℚ = Gal(ℚ̄/ℚ)` carries its Krull topology. As in EllipticCurveModularity, `GQ` in the representative signatures is the unfolded automorphism group `AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, the body of Mathlib's `Field.absoluteGaloisGroup ℚ`, so Tau Ceti's actions on algebraic integers and elliptic torsion apply directly. Fix embeddings `ℚ̄ → ℂ` and, for every prime `p, ι_p : ℚ̄ → ℚ̄_p`. A *residual representation* is a continuous homomorphism `ρ̄ : G_ℚ → GL₂(𝔽), 𝔽` a finite field of characteristic `p`, or its extension to `𝔽̄_p`. Continuity means that the kernel is open. *Odd* means `det ρ̄(c) = −1` for a complex conjugation `c`; in characteristic two it is automatic. Irreducibility over an algebraically closed field is absolute irreducibility. A residual representation is *of S-type* if it is continuous, odd and absolutely irreducible.

Lemma 8.2 of Khare–Wintenberger (R27.1) is the only statement in the roadmap whose coefficients must be the prime field `𝔽_p`. Every use of it first arranges an `𝔽_p`-valued representation, by choosing the coefficient prime to split completely in the coefficient field.

Always distinguish the inertia group `I_q`, the decomposition group `D_q` and their images in `PGL₂`. The *projective image* of `ρ̄` is the image of `G_ℚ` in `PGL₂(𝔽̄_p)`.

### 2.2 Serre's invariants

- `N(ρ̄)` is the Artin conductor of `ρ̄` away from `p`, a positive integer prime to `p`; *level* means `N(ρ̄)`.
- `k(ρ̄)` is Serre's weight, defined by his local recipe at `p`, with `k(ρ̄) ≥ 2`. For `p = 2, k(ρ̄) ∈ {2, 4}`, and `k(ρ̄) = 4` exactly when `ρ̄|_{D₂}` is *très ramifiée*.
- `ε(ρ̄)` is the character with `det ρ̄ = ε(ρ̄) χ̄_p^{k(ρ̄)−1}, χ̄_p` the mod-`p` cyclotomic character.
- `ρ̄` *arises from* a newform `f` of positive weight `k` in the sense of the coefficient-defined `ArisesFrom` of AlgebraicModularFormsAndSerreWeights §7.5. For continuous absolutely irreducible `ρ̄`, its integral-model comparison gives a prime `λ` above `p` of the coefficient field of `f` (relative to `ι_p`) and an integral model of `ρ_{f,λ}` whose reduction is isomorphic to `ρ̄`, with compatible residue embeddings. Conductor `N(ρ̄) = 1` does not say that the `p`-adic lift is unramified at `p`.
- `ρ̄` is *modular* if it arises from a newform of some weight `k ≥ 2` and some level.

AlgebraicModularFormsAndSerreWeights §7.5 (S-type and modularity predicates) owns that `ArisesFrom` and its comparisons. The trace/determinant interface follows the Imperial College London FLT project. In `Suggested.lean`, `ArisesFrom` is its consumer spelling on `HeckeRing.GL2.Newform N k`, with the same coefficient ring map and arithmetic Frobenius identities. Here `coeff f n` reads the Fourier expansion and `coefficientRing f` is the subring of `ℂ` generated by all coefficients and zero-extended nebentypus values. One ring homomorphism to `FpBar p`, which kills `p` automatically since `FpBar p` has characteristic `p`, gives unramifiedness and the trace and determinant identities at every prime `ℓ ∤ pN`. The determinant formula uses `χ_f(ℓ) ℓ^(k−1)` for `k ≥ 1`; all residual modularity statements require `k ≥ 2`. For S-type representations the supplier's integral-model comparison identifies this with the integral-model reading; without semisimplicity only the semisimplification is determined. The consumer comparison must preserve basis invariance and the supplier's integral-closure congruence comparison on these carriers. The coefficient-map extension needs no additional weight bound: the same exponent `k.toNat - 1` occurs on both sides.

**Checks.**

- Every newform has `coeff f 1 = 1` and `coeff f 0 = 0`, by normalization and cuspidality. For `Δ = q∏(1−q^n)^24`, all coefficients are integral and the character is trivial, so `coefficientRing Δ = ℤ` inside `ℂ`; its map to `𝔽̄_p` is uniquely the reduction of integers.
- Ramanujan's congruence `τ(ℓ) ≡ 1 + ℓ^11 (mod 691)` gives `ArisesFrom (1 ⊕ χ̄₆₉₁^11) Δ`. Thus attachment alone does not imply irreducibility or recover extension data; the S-type hypothesis makes the attached semisimplification an actual isomorphism class of irreducible representations.
- For the level-`11`, weight-`2` form with trivial character, `a₂ = −2`. At `p = 3` the required trace and determinant at arithmetic Frobenius `2` are `1` and `2`. The action on `11a1[3]` has these values, whereas the trivial rank-two action has `2` and `1` and fails `ArisesFrom`.
- Fix a coefficient map `φ` and put `d = φ(χ_f(ℓ))ℓ^(k−1)` at a good prime. If `d² ≠ 1`, the contragredient has determinant `d⁻¹ ≠ d` and cannot satisfy attachment through this same map. Failure of the existential `ArisesFrom` requires excluding every coefficient map. For the preceding rational-coefficient form at `p = 7, ℓ = 2`, the map is unique and the dual determinant `4` differs from the required `2`.
- The [level-`23`, weight-`2` newform](https://www.lmfdb.org/ModularForm/GL2/Q/holomorphic/23/2/a/a/) has coefficient field `ℚ(√5)` and `a₂² + a₂ − 1 = 0`. At the split prime `p = 11`, its two coefficient maps give traces `3` and `7` at Frobenius `2`. The two reductions are non-isomorphic but both satisfy `ArisesFrom ρ f`, using different maps.

The exact Serre invariants, reduction-isomorphism definition and determinant identity belong to `AlgebraicModularFormsAndSerreWeights:R15.6`, the Artin conductor underlying `N(ρ̄)` to `ArithmeticGaloisRepresentations Layer 3`, and the local weight recipe to `AlgebraicModularFormsAndSerreWeights:R15.4`.

### 2.3 Lifts and compatible systems

A *minimal* lift is minimal in the sense of Khare–Wintenberger §5, pp. 8–9 (Diamond §3 for odd `p`; Khare–Wintenberger (II) §3.3.1 for `p = 2`). At `ℓ ≠ p` the map `ρ(I_ℓ) → ρ̄(I_ℓ)` is bijective, with two exceptions: if `ρ̄(I_ℓ)` is projectively cyclic of order `p, ρ|_{I_ℓ}` is the Teichmüller twist of a unipotent lift; if `p = 2` and `ρ̄|_{D_ℓ}` is induced from a wildly ramified character `γ` of a ramified quadratic extension `L` of `ℚ_ℓ, ρ` agrees on inertia with the induction of the Teichmüller lift of `γ` times a ramified quadratic character of `G_L`. In every case the determinant on inertia is the Teichmüller lift. Minimal lifts preserve the prime-to-`p` conductor, and away from the two exceptions they keep the inertial type of `ρ̄` at `ℓ`. It is stronger than "unramified wherever `ρ̄` is unramified".

An *almost strictly compatible system* is a system `(ρ_λ)` over a number field `E` in the sense of Dieulefait–Pacetti Definition 1.10 and the paragraph after Remark 3, pp. 6–7: a fixed finite ramification set, Weil–Deligne parameters at each `ℓ` that do not depend on the coefficient place away from `ℓ`, and the matching `p`-adic Hodge-theoretic condition at coefficient places above `ℓ` itself, with exceptions only at pairs `(ℓ,λ)` where `λ|ℓ`, the global residual member is reducible, and either `ℓ = 2` or the common Weil–Deligne parameter at `ℓ` is ramified. De Rhamness and the fixed Hodge pair remain required at these pairs. Khare–Wintenberger §5, p. 8, require de Rhamness only outside the exceptional pairs; their Theorem 5.1 supplies the stronger condition through the automorphic restrictions in [KW-II], §10.3.2, pp. 93–94. A finite exceptional set of coefficient places alone does not establish this pairwise condition. Each member may also ramify at its own coefficient prime. An odd unramified prime `ℓ` of the system gives a crystalline member at `ℓ` even when its residual reduction is reducible, while at a ramified coefficient prime with reducible reduction only the de Rham condition is available. Irreducibility of every characteristic-zero member does not imply irreducibility of its residual reductions: residual reducibility after a change of prime is always a branch of the proof.

### 2.4 Numerical conventions

`Q(n)` is Mathlib's `Nat.maxPrimeFac`: `Q(1) = 1`, and `Q(n)` is the greatest prime divisor of `n` for `n > 1`.

### 2.5 Local types

`ℚ_{N²}` is the unramified quadratic extension of `ℚ_N`, with residue field `𝔽_{N²}`. A character of `I_N` has *niveau 2* if it factors through `𝔽_{N²}^×` and not through `𝔽_N^×`. A residual `ρ̄` is *bad dihedral* if it is irreducible but becomes reducible over `ℚ(√p*), p* = (−1)^{(p−1)/2}p`; equivalently over `ℚ(ζ_p)` (`ArithmeticGaloisRepresentations Layer 4`).

### Arithmetic interfaces for the theorem statements

These definitions specialize ArithmeticGaloisRepresentations Layers 1–4 to the actual absolute Galois group and two-dimensional matrices; their comparison with the supplier's bundled representation API retains the coefficient, inertia and conjugation conventions. Sources: [KW-I], §1, p. 2, and §5, p. 8; [Kh], §1.1, p. 2. The aliases introduce no new Galois groups or fields.

**`GQ`.** Use the automorphisms of `AlgebraicClosure ℚ` over `ℚ`, with the Krull topology.

- Its action fixes rational scalars and respects multiplication and addition.
- Multiplication acts by composition, with the right factor acting first.
- Finite Galois restriction quotients carry the usual restriction homomorphism.

**Checks.**

- The identity sends `√2` to `√2`, rather than to zero.
- An automorphism sending `√2` to `−√2` fixes `(√2)² = 2`.
- Complex conjugation sends `i` to `−i` and its square sends `i` to `i`; an automorphism need not fix every algebraic number.

**`IntBar`.** Use the ring of algebraic integers in `AlgebraicClosure ℚ`.

- The inclusion in the algebraic closure is an injective ring map.
- The Galois action preserves this subring.
- Rational elements in this subring are exactly the integers.

**Checks.**

- `2` belongs and `2+1 = 3`, with characteristic zero.
- `√2` belongs, since it satisfies the monic polynomial `X²−2`.
- `1/2` does not belong: its reduced rational denominator is `2`, not `1`.

**`FpBar p`.** For prime `p`, use the algebraic closure of `ZMod p`.

- The prime field embeds and the characteristic is `p`.
- Every polynomial splits in the algebraic closure.
- A finite collection of elements lies in a finite extension of the prime field.

**Checks.**

- At `p = 2`, `1+1 = 0`; at `p = 3`, `1+1 = −1 ≠ 0`.
- At `p = 2`, a root of `X²+X+1` is outside the prime field, where the values at `0,1` are both `1`.
- `p = 1` and `p = 4` fail the prime hypothesis; no field structure is asserted for `ZMod 4`, where `2·2 = 0`.

**`IsFrobAt σ r`.** Some prime ideal `Q` of `IntBar` contains `r` and satisfies Mathlib's `IsArithFrobAt ℤ σ Q`.

- At a rational prime there are Frobenius lifts with the arithmetic residue action.
- Conjugating a lift transports its prime ideal.
- For an unramified representation the resulting traces and determinants are independent of the lift and prime above `r`.

**Checks.**

- At `r = 1`, a proper prime cannot contain `1`, so the predicate is false.
- At `r = 2`, take `u ∈ 𝔽₈` with `u³+u+1 = 0`. Arithmetic Frobenius sends `u` to `u²`; its inverse sends it to `u⁴ = u²+u ≠ u²`. This distinguishes arithmetic from geometric Frobenius.
- In the subfield `𝔽₄`, a root `v` of `v²+v+1 = 0` is sent to `v² = v+1 ≠ v`; both Frobenius and its inverse have this value. This tests the residue characteristic, not inversion.

**`IsUnramifiedAt ρ r`.** Every prime of `IntBar` containing `r` has inertia contained in the kernel of `ρ`.

- This is equivalent to trivial action of each such inertia group.
- It is invariant under a change of basis and conjugation of the prime.
- Restriction and injective coefficient extension preserve the inertia test.

**Checks.**

- The trivial action has inertia matrix `I₂`, hence is unramified.
- An inertia element acting by `(1,1;0,1)` fixes a space of dimension `1`, so it is ramified even though its semisimplification has invariant dimension `2`.
- An unramified character with Frobenius value `−1` still has inertia value `1`; requiring the whole decomposition group to act trivially would reject it.

**`IsOdd ρ`.** Every complex conjugation has determinant `−1`.

- It is invariant under a change of basis.
- Checking one complex conjugation suffices, since they are conjugate.
- Coefficient extension preserves the determinant identity.

**Checks.**

- The trivial rank-two action over `ℚ` has determinant `1 ≠ −1` and fails.
- The trivial rank-two action over `𝔽₂` has determinant `1 = −1` and passes oddness alone.
- For `diag(1,χ̄₃)`, the determinant at conjugation is `2 = −1` in `𝔽₃`, so it passes.

**`IsAbsIrreducible ρ`.** Over a field `k`, the linear span of the matrices `ρ(g)` is `M₂(k)`.

- Compare this criterion with irreducibility over every coefficient-field extension.
- It is invariant under conjugation.
- It is preserved and reflected by field extension.

**Checks.**

- The trivial representation has span dimension `1 < 4` and fails.
- All diagonal matrices span a space of dimension `2 < 4`, so a sum of characters fails.
- The matrices of `GL₂(𝔽₂)`, in its natural action, span all four matrix units and pass; this tests a nonabelian image, rather than a cyclic scalar action.

**`IsSType ρ`.** The residual action has open kernel, is odd and is absolutely irreducible.

- Extract each of the three conjuncts separately.
- Transport the predicate under isomorphism.
- Descend to a finite coefficient field containing the finite image, and recover it on scalar extension.

**Checks.**

- The trivial action over `𝔽₂` has open kernel and determinant `1 = −1`, but span dimension `1`, so it fails.
- The splitting field of `X³−4X+1` is totally real with group `S₃` (discriminant `229 > 0`, nonsquare). Its standard action over `𝔽₅` has open kernel and matrix span dimension `4`, but conjugation acts as `I₂` with determinant `1 ≠ −1`, so it fails precisely oddness.
- The same finite quotient followed by `S₃ ≅ GL₂(𝔽₂)` has span dimension `4` and determinant `1 = −1`; all three conditions hold.

**`coeff f n`.** Read the coefficient of `q^n` in the expansion at infinity of the native newform.

- Normalization gives the coefficient at one equal to one.
- Cuspidality gives the coefficient at zero equal to zero.
- Comparison with the Hecke eigenvalue at good indices uses this same expansion, without rescaling.

**Checks.**

- For `Δ`, the coefficient at `0` is `0` and at `1` is `1`.
- For `Δ`, the coefficient at `2` is `−24`, excluding an index shift.
- The level-11 weight-two newform has coefficient at `2` equal to `−2`; doubling its expansion would give coefficient `2` at `1` and would not be a normalized newform.

**`coefficientRing f`.** Take the subring of `ℂ` generated by every Fourier coefficient and every zero-extended nebentypus value.

- All these generators belong to the subring.
- A subring containing the generators contains this one.
- A ring map out is determined by its values on these generators; coefficient and character reductions use one map.

**Checks.**

- For `Δ` the ring is `ℤ` inside `ℂ`: all coefficients and character values are integers and a subring contains every integer.
- For the rational-coefficient level-11 weight-two form the ring is also `ℤ`; `1/2` does not enter by taking a subring, in contrast with taking the generated field.
- For that level-11 form the character values at `1` and `11` are `1` and `0`; the zero extension creates no inverse of `11` and reduction to `𝔽₁₁` remains possible.

**`ArisesFrom ρ f`.** One ring map from the coefficient ring to `FpBar p` gives unramifiedness and the arithmetic Frobenius trace and determinant at every prime away from `pN`, as in §2.2.

- It is invariant under a change of basis.
- It is compatible with coefficient-field extension using the same reduction map.
- For S-type representations it agrees with the supplier's integral-model attachment; without semisimplicity it identifies only the semisimplification.

**Checks.**

- For the level-11 weight-two form at `p = 3, ℓ = 2`, the trace and determinant are `−2 ≡ 1` and `2`; the trivial action has `2,1` and fails.
- For that rational-coefficient form at `p = 7, ℓ = 2`, the determinant is `2`; the dual has determinant `2⁻¹ = 4`, and the unique coefficient map cannot repair this discrepancy.
- For `Δ` at `691`, Ramanujan's congruence gives the reducible attachment `1 ⊕ χ̄₆₉₁^11`: at `ℓ = 2`, its trace is `1+2^11 ≡ 667 ≡ −24` and its determinant is `2^11 ≡ 666`. Attachment alone does not imply irreducibility.

**`toRepresentation ρ`.** Use the matrix action on `Fin 2 → R` for Mathlib's representation and semisimplicity predicates.

- Evaluation is the actual matrix-vector product.
- Multiplication of group elements acts by composition in the same order.
- Intertwining by an invertible matrix gives the corresponding linear representation isomorphism.

**Checks.**

- `I₂` sends both basis vectors to themselves.
- The swap sends `e₁` to `e₂` and `e₂` to `e₁`, rather than fixing both.
- `(1,1;0,1)` sends `e₂` to `e₁+e₂` and `e₁` to `e₁`; transposing or semisimplifying the action gives different values.

For integral matrix representations, use `Matrix.GeneralLinearGroup.map` for residue and fraction-field maps. Evaluation is entrywise and respects trace, determinant and integral change of basis. There is no lattice independence of full reduction. Fixed vectors use `Representation.invariants`, and ordinary irreducibility uses `Representation.IsIrreducible`.

**Checks.**

- A trivial integral action reduces to determinant `1`.
- The nonzero uniformizer entry of `(1,π;0,1)` reduces to `0`; the reduction is `I₂`.
- The entry `1` above the diagonal stays `1` on fraction-field extension, so extension does not semisimplify this action.
- At `(q,N) = (3,2)`, the two full lattice reductions of the order-three type of `I.3/prescribed-lifts` differ while their semisimplifications agree.

**`IsProjConj ρ a b`.** Some source element `τ` and scalar `z` satisfy `ρ(a) = z ρ(τbτ⁻¹)`.

- It is reflexive, symmetric and transitive.
- It is invariant under conjugation.
- Over a field the scalar is nonzero, and the condition is precisely conjugacy in the projective image.

**Checks.**

- In the natural `GL₂(ℚ)` action, `I₂` and `2I₂` are projectively conjugate, with scalar `1/2` in that order and traces `2,4`.
- A nontrivial unipotent matrix is not projectively conjugate to `I₂`: its off-diagonal entry is `1` rather than `0`.
- The swap conjugates `diag(1,−1)` to `diag(−1,1)`; both have projective order `2` in odd characteristic.

**`primesOfRat S`.** Pull `S ⊆ ℕ` back under the absolute norm on the height-one spectrum of `𝓞 ℚ`.

- Membership means that the norm belongs to `S`.
- Inverse image preserves unions and intersections.
- Rational-prime density transports to `NumberField.Set.HasDirichletDensity` through this identification.

**Checks.**

- The inverse images of `∅` and the whole set are respectively `∅` and the whole spectrum.
- The ideal `(3)` has norm `3` and lies over `{3}`, not `{9}`.
- The inverse image of `{4}` is empty: rational height-one primes have prime norm.

**`auxiliaryPrimes ρ c`.** Take unramified primes whose projective Frobenius is conjugate to `ρ(c)`, congruent to `1` modulo `8` and every prime at most `p−1`, and to `−1` modulo `p`.

- Membership extracts all these conditions, including the existence of an arithmetic Frobenius witness.
- Conjugating `ρ` or the chosen complex conjugation preserves the set.
- The density theorem in R27.1 proves positive density under its prime-field, image and `p ≡ 1 (mod 4)` hypotheses.

**Checks.**

- At `p = 5, q = 409`, the numerical residues modulo `8,3,5` are `1,1,4`; membership still requires the specified representation-theoretic conditions.
- At `p = 5, q = 41`, the residues modulo `8,3,5` are `1,2,1`; it fails two congruences even if its Frobenius has the desired class.
- At `p = 5, q = 5`, the last residue is `0`, not `4`; the coefficient prime is excluded without a convention for its unramified Frobenius.

## Layer I: Lifting and compatible-system inputs

This layer proves the rank-two input statements on which the proof of Serre's conjecture rests. Representations, lattices, local period conditions, conductors and residual-image comparisons come from the arithmetic suppliers. The shared carrier is `AutomorphicSystemData` of SmallRamificationAndAbelianVarietyBaseCases §5.0d; its base-`ℚ`, rank-two specialization `ArithmeticCompatibleFamily` supplies the chosen completion models and arithmetic compatibility predicates. The local comparisons below enrich that specialization, using its fields and convention adapters. The raw operations and the marked isogeny and base-change transports retain their supplier's hypotheses and identifications. The global and local deformation rings come from GlobalGaloisDeformations R04.3–R04.6 and LocalGaloisDeformationRings Layer 8; the Taylor–Wiles data, the patching formalism and the quaternionic Hecke modules at auxiliary level come from GlobalGaloisDeformations R04.5–R04.6, ArithmeticGaloisDuality R02.6, DeformationAndDerivedPatchingAlgebra Layer 5 and HilbertModularVarietiesAndShimuraCurves R18.3. Every target names its proof route and the supplier sections that route uses. The assertions here do not assume the universal Serre theorem.

### I.0 Potential modularity with local control

**Soluble totally real extensions with prescribed completions** (`I.0/soluble-totally-real-base-change`). Let `K` be a totally real number field, `D/K` a finite Galois extension, `S` a finite set of finite places of `K`, for each `v ∈ S` a finite Galois extension `E_v/K_v`, and `S′` a further finite set of places of `K`, with `E_v = K_v` for every `v ∈ S ∩ S′`. Prove that there is a finite soluble Galois extension `E/K`, totally real, linearly disjoint from `D`, such that `E_w ≅ E_v` over `K_v` for every place `w` of `E` above `v ∈ S`, and such that every place of `S′` splits completely in `E`. Route: each `E_v/K_v` has soluble Galois group, so it is a tower of cyclic extensions of prime degree; realise each step by a cyclic global extension of the same prime degree with the prescribed completions and complete splitting at the real places, at the places of `S′` and at the places already treated (Grunwald–Wang; its exceptional class needs a degree divisible by `8`, so prime-degree steps never meet it); pass to the Galois closure of the tower, which is soluble and keeps the completions at the places of `S` and the complete splitting elsewhere; and impose complete splitting at finitely many extra places unramified in `D` whose Frobenius classes generate `Gal(D/K)`, which forces `E ∩ D = K`. Base change of a cuspidal Hilbert eigenform along `E/K`, and descent of modularity along it for a representation whose restriction to `G_E` is irreducible, are GL2AutomorphicRepresentationsAndTransfer R17.4.
Source: [KW-II], proof of Theorem 6.1, p. 57 (successive applications of Grunwald–Wang), and proof of Theorem 9.7, p. 89 (allowable base change); [SW99], proof of Theorem A, pp. 75–76.
*Needs:* ArithmeticGaloisDuality §§R02.4.5b–R02.4.6; [Chebotarev, Layer 10][cheb]; [ClassFieldTheory, Layer 13][cft]; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Checks.**

- For `K = D = ℚ` and `S = S′ = {2}`, an unramified quadratic `E₂/ℚ₂` has local degree `2`, whereas complete splitting requires degree `1`; this incompatible datum is excluded. With `E₂ = ℚ₂` both requirements have degree `1` and `E = ℚ` satisfies them.
- For `K = ℚ`, `S = {2}` with `E_2` the unramified quadratic extension of `ℚ₂`, and `S′ = {11}`: `E = ℚ(√5)` is totally real, `2` is inert in it since `5 ≡ 5 (mod 8)`, and `11` splits since `5` is a square modulo `11`; `ℚ(√3)` is ramified at `2` and is not a witness.
- The exceptional class: `16` is an eighth power in `ℚ_v` for every odd `v` and in `ℝ` but not in `ℚ₂`, so no cyclic extension of `ℚ` of degree `8` has the unramified degree-eight completion at `2`; the prime-degree tower avoids this, at the cost of not controlling the degree of `E`.
- Avoidance: with `D = ℚ(√2, √3)`, complete splitting at places whose Frobenius classes lie in the subgroup fixing `√6` does not force `E ∩ D = ℚ`, since `E` may contain `√6`; generators of the whole group are needed.
- A real place prescribed to become complex contradicts total reality; `S` consists of finite places and the real places are always split.

**Moret-Bailly's theorem** (`I.0/moret-bailly-split-points`). Let `K` be a number field, `X` a separated `K`-scheme of finite type that is geometrically irreducible, `S` a finite set of places of `K`, and for each `v ∈ S` a finite Galois extension `L_v/K_v` and a nonempty open `Gal(L_v/K_v)`-stable set `Ω_v ⊂ X(L_v)` of smooth points. Prove that there are a finite extension `K′/K` and a point `x ∈ X(K′)` such that `K′ ⊗_K L_v ≅ L_v^{[K′:K]}` as `L_v`-algebras for every `v ∈ S`, and the image of `x` under every `K`-embedding `K′ → L_v` lies in `Ω_v`. Route: spread `X` out to a flat surjective separated scheme of finite type with irreducible total space over the ring of `T`-integers of `K`, for a finite set `T` of finite places containing those of `S`, by generic flatness and openness of flat morphisms (Stacks, Tags [052A](https://stacks.math.columbia.edu/tag/052A) and [01UA](https://stacks.math.columbia.edu/tag/01UA)); enlarge `T` by one place outside `S`, so that the Skolem datum is incomplete; prove the integral-point theorem for incomplete Skolem data, whose proof reduces by hyperplane sections to relative dimension one and uses the compactness of generalised Jacobians and of idèle class groups there; and read the integral point in the field form through the generic fibre of the finite surjective closed subscheme it produces. Derive the refinement used below. If `L_v = K_v` for every `v ∈ S`, then `K′` may be taken Galois over `K` with every `v ∈ S` split completely: replace `K′` by its Galois closure, in which the places of `S` still split completely, and the condition at every embedding is preserved because every completion of the closure above `v` is `K_v`. If `K` is totally real and every real place lies in `S` with `Ω_v ⊂ X(ℝ)`, then `K′` is totally real. Given a finite extension `M/K`, `K′` can be made linearly disjoint from `M`: add to `S` finitely many finite places `v`, unramified in the Galois closure of `M`, whose Frobenius classes generate its Galois group, with `L_v = K_v` and `Ω_v` the set of smooth points of `X(K_v)`, which is nonempty for all but finitely many `v` by Lang–Weil and Hensel's lemma; complete splitting at these places forces `K′ ∩ M = K`.
Source: [MB], Définition 1.2 and Théorème 1.3, pp. 181–182, and Remarque 1.5, p. 182 (the field form); [KW-II], proof of Theorem 6.1, pp. 56–57, where the theorem is applied with these refinements.
*Needs:* [Chebotarev, Layer 10][cheb]; InverseGaloisAndArithmeticFundamentalGroups IG.2.5 (the Lang–Weil estimate); Mathlib `AlgebraicGeometry.Scheme` and its flatness API; the relative Picard and idèle-class compactness used inside the integral-point theorem are part of this target.

**Checks.**

- For `X = 𝔸¹` over `ℚ`, `S = {∞, 2}`, `L_v = K_v`, `Ω_∞ = (0, 1)` and `Ω_2 = 2ℤ₂`, the rational point `2/3` is a witness with `K′ = ℚ`, while `1/2` meets `Ω_∞` and fails `Ω_2`; the conclusion is a condition at every embedding, not at one.
- Incompleteness is essential: for `X = 𝔾_m` over `ℚ`, prescribing `|x|_v ≤ 1` at every finite place and `0 < |x|_∞ < 1` at the real place admits no point in any `K′`, because a nonzero algebraic integer has `|N(x)| ≥ 1`; this datum is complete.
- A prescribed nontrivial `L_v` is not transported to the Galois closure of `K′`, which is why the Galois refinement is stated only when `L_v = K_v`; complete splitting and unramifiedness are transported.
- With `M = ℚ(√2, √3)`, choosing places whose Frobenius classes generate only the subgroup fixing `√6` allows `K′ ⊇ ℚ(√6)`; generating the whole group excludes it.

**Controlled residual potential modularity** (`I.0/controlled-residual-potential-modularity`). Let `ρ̄` be S-type, with `2 ≤ k(ρ̄) ≤ p+1` and `ρ̄|G_{ℚ(μ_p)}` absolutely irreducible for odd `p`, or nonsolvable image for `p = 2`. Prove that there is a totally real field `F`, Galois over `ℚ` of even degree, unramified at `p` and split at `p` when `ρ̄|D_p` is irreducible, with `im(ρ̄|G_F) = im(ρ̄)` and `ρ̄|G_{F(μ_p)}` absolutely irreducible, such that (i) when `k(ρ̄) = 2` if `p = 2`, `ρ̄|G_F` arises from a cuspidal automorphic representation of `GL₂(A_F)` of parallel weight `k(ρ̄)` unramified at every place above `p`; (ii) `ρ̄|G_F` arises from one of parallel weight two whose conductor at every `v | p` divides `v`, unramified at `v` when `ρ̄` is finite flat at `v`; and (iii) the four controls hold: when `k(ρ̄) = p` and `ρ̄|I_p` is trivial, `ρ̄|D_℘` is trivial at every `℘ | p` of `F`; the closures of `F` at finitely many prescribed primes `ℓ_i ≠ p` contain prescribed finite extensions of `ℚ_{ℓ_i}`; for odd `p` and `k(ρ̄) = p+1`, `F` is split at `p`; and `F` is linearly disjoint from a prescribed finite extension `L/ℚ`. In the Annals form (odd `p`, `k(ρ̄) ≠ p`) retain the weight-`k(ρ̄)` seed with its determinant. Route: solvable image is Langlands–Tunnell with the weight and level refinements. Otherwise take the twisted Hilbert–Blumenthal moduli problem with level structure at a place above `p` given by `ρ̄` and at one or two auxiliary primes by residual representations induced from characters (one auxiliary prime when `ρ̄|D_p` is reducible, two in the supersingular case), its selected geometrically irreducible component and its real and finite local loci; prove here the local realizations the supplier leaves open, namely the dyadic real involutions and, for ordinary `ρ̄`, the point with good ordinary reduction obtained by lifting the Kummer class of `ρ̄|D_p` with the obstruction computed by local duality as a cup product with an unramified class. Apply `I.0/moret-bailly-split-points` with `Ω_p` the points reducing to that integral point, with the local opens at the `ℓ_i`, at the real places and at the auxiliary primes, and with disjointness from the kernel field of `ρ̄` and from `L`; in the dihedral case also impose splitting at a prime that splits in the field of the projective image but is inert in the quadratic subfield of `ℚ(μ_p)`. The resulting abelian variety `A/F` has `A[λ] ≅ ρ̄|G_F` and an auxiliary-prime torsion induced from a character, so its auxiliary-prime Tate module is residually modular by automorphic induction and `A` is modular over `F` by `I.2/potentially-barsotti-tate-lifting` applied over `F` at that odd auxiliary prime; this gives (ii). For (i) pass from the parallel-weight-two ordinary form with inertial Weil–Deligne parameter `(ω^{k(ρ̄)−2} ⊕ 1, 0)` (or `(1 ⊕ 1, N)` at `k(ρ̄) = p+1`) to a form of parallel weight `k(ρ̄)` unramified above `p` through `I.1/ordinary-control-and-weight-change`, with the auxiliary neatness prime of [KW-Ann] Lemma 2.2 when needed; at `p = 3` with `ρ̄|D_3` irreducible use the same lemma to lift the weight restriction. The even degree, the splitting at `p` for even `k(ρ̄)` (through an even character split at `p` and a square root of the twisted determinant) and the disjointness are imposed by enlarging the set of places given to Moret-Bailly's theorem. For a given characteristic-zero lift with Hodge–Tate weights `{0, 1}` satisfying the residual hypotheses, potential modularity over a controlled totally real extension with the single-representation solvable descent is SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0c.
Source: [KW-II], Theorem 6.1 and proof, pp. 53–57, Theorem 9.7, pp. 89–90, and §10.3.2, pp. 93–94; [KW-Ann], Theorem 2.1, pp. 233–237, for odd `p`, `k≠p`; [Kh], Proposition 3.1, pp. 16–17, for the specified weight-two lifts.
*Needs:* `I.0/moret-bailly-split-points`; `I.0/soluble-totally-real-base-change`; `I.2/potentially-barsotti-tate-lifting`; `I.1/nearly-ordinary-hecke-algebras`; HilbertModularVarietiesAndShimuraCurves H1, §§H6.2–H6.5 and H6.9; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0c; AutomorphicGaloisRepresentations §§3.10–3.14; SerreWeightAndLevelOptimisation §3.7, §4.2, §4.7 and §§6.6–6.8; AlgebraicModularFormsAndSerreWeights R15.4; ArithmeticGaloisRepresentations Layer 4; ArithmeticGaloisDuality R02.4; [ClassFieldTheory, Layer 13][cft].

**Checks.**

- At residual weight `p`, the Annals seed theorem is unavailable; [KW-II], Theorem 6.1 includes it, with the additional local trivialization when inertia is trivial.
- At `p=2`, complex conjugation can act trivially or unipotently. The real HBAV realization must handle both; H6.4's odd split-eigendirection hypothesis alone does not cover them.
- At residual weight four in characteristic two, the prescribed lift is semistable noncrystalline of weight two; the crystalline weight-two branch requires residual weight two.
- Moret-Bailly's theorem is applied to the fine moduli scheme with its level structures, not to the moduli stack without level structure: the fine-moduli hypothesis of H1 is what makes `X` a scheme whose local opens are opens in `X(ℚ_v)`.

### I.1 Ordinary lifting over ℚ

The two Skinner–Wiles theorems below are proved over totally real fields and specialised to `ℚ`. The nearly ordinary Hecke algebras, pseudo-deformation rings and pro-modularity argument they rest on are targets of this subsection, since no earlier roadmap supplies them.

**Nearly ordinary Hecke algebras over totally real fields** (`I.1/nearly-ordinary-hecke-algebras`). Let `p` be odd, `F` totally real of even degree, `D` the quaternion algebra over `F` ramified exactly at the infinite places, `U` an open compact subgroup of `(D ⊗ A_{F,f})^×` maximal at the places above `p`, and `𝒪` the integers of a finite extension of `ℚ_p`. Construct Hida's nearly ordinary Hecke algebra `T^{n.o.}(U)`: the ordinary part, cut out by the idempotent `e = lim U_p^{n!}` of the operators `T_y` at the places above `p`, of the inverse limit over `a` of the Hecke algebras acting on the spaces of algebraic forms of level `U ∩ U(p^a)` of all weights, as an algebra over the completed group algebra `Λ_𝒪` of the `p`-adic torus of diagonal units and the ray-class quotient. Prove that `T^{n.o.}(U)` is finite over `Λ_𝒪`; the integral module control and characteristic-zero arithmetic specialization stated below; the existence, for each maximal ideal `𝔪`, of a continuous pseudo-representation of `G_{F,Σ}` with values in `T^{n.o.}(U)_𝔪` whose trace at arithmetic Frobenius is the Hecke operator `T(v)` and whose determinant is `Nv·S(v)`, interpolating the nearly ordinary Hilbert attachments at arithmetic points, and, at a maximal ideal whose residual representation is absolutely irreducible, an actual representation with the nearly ordinary local shape at every `v | p` whose quotient character reads `T_y` and `T₀(v)`; and the existence of permissible (Eisenstein) maximal ideals for the reducible residual data of the next target, with the trace of inertia at auxiliary tame places acting through the sum of a character and its inverse. The Hecke action and the integral lattices come from the definite quaternionic forms of the supplier; Jacquet–Langlands identifies the eigensystems with Hilbert cuspidal ones.
The **ordinary control and weight-change target** (`I.1/ordinary-control-and-weight-change`) uses the groups `U_a`, diamond group `G(U)` and weight algebra of [SW99] §3.2, with `U_a` the level imposing the diagonal congruences modulo `p^a` specified there. Put `X(U_a) = D^× ∖ (D ⊗ A_{F,f})^× / U_a` and let `M_∞(U)` be the inverse limit, under trace, of the ordinary integral function modules on these finite sets; the adjoint-action version has the same assertions. When `U/(U ∩ F^×)` acts freely on `D^× ∖ (D ⊗ A_{F,f})^×`, prove finite freeness over the torsion-free weight algebra `Λ_𝒪` and the finite-level coinvariant isomorphism: for the kernel `Γ_a` of the diamond action at level `a`, the natural map from `M_∞(U)_{Γ_a}` to the corresponding finite-level ordinary module is an isomorphism. Its kernel and cokernel are zero; finite torsion diamond factors are retained in that finite-level module. This is the integral module assertion of Proposition 3.3 and its proof, not an integral specialization assertion for every Hecke algebra.

For arbitrary `U`, prove that the nearly ordinary Hecke algebra is finite and torsion-free over `Λ_𝒪` (Corollary 3.4). For each `𝒪`-algebra homomorphism `λ : T^{n.o.}(U) → ℚ̄_p` whose ray-class character is `ψχ_p^μ`, `μ ≥ 0`, and whose diagonal-unit character `φ` is finite order, prove that its good-prime Hecke eigensystem is classical, nearly ordinary, of parallel weight `μ+2`, at some `U_a` on which `ψ` and `φ` factor; conversely the corresponding classical eigensystems give these arithmetic homomorphisms (Proposition 3.7 and the preceding paragraph). Equivalently the map of reduced characteristic-zero Hecke algebras defined by these eigensystems is an isomorphism, with kernel and cokernel zero. This assertion may be localized at any maximal ideal `𝔪` and retains precisely the eigensystems reducing to `𝔪`; it asserts no integral Hecke-algebra isomorphism at arbitrary level. Prove also that weight-two arithmetic points are Zariski dense on each irreducible component of `T^{n.o.}(U)` (Lemma 3.8). The consequence used in I.0 is specialization within a residual ordinary family at the prescribed arithmetic weight and tame character, after its stated neat auxiliary level change: it preserves the residual eigensystem and reads the ordinary local character from the chosen weight, rather than identifying the characteristic-zero eigenvalues at two different weights.
Source: [SW99], Proposition 3.3 and proof, pp. 35–36, Corollary 3.4, p. 36, Proposition 3.7, p. 37, and Lemma 3.8, p. 38; §§3.1–3.4, pp. 27–48, and §§3.6–3.8, pp. 52–60.
*Needs:* HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.9 and R18.3.22; AutomorphicGaloisRepresentations §§4.10–4.12; IntegralHeckeAndGaloisDeterminants §0.5; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; [ClassFieldTheory, Layer 13][cft].

**Checks.**

- For a classical ordinary newform of weight `k ≥ 2` and level prime to `p` with `a_p` a `p`-adic unit, the weight-`k` specialization recovers the unit-root quotient with Frobenius eigenvalue the unit root `α`; the non-unit root is killed by `e`, and a form with `a_p ≡ 0` is killed altogether.
- On a finite `𝒪`-module `M`, for each `a ≥ 1` the powers `U_p^{n!}` eventually stabilize on the finite set `M/π^aM`. Their compatible idempotents define `e` on `M = lim_a M/π^aM` by completeness. For `M = ℤ₃` and `U_p = 4`, the first powers are `4, 16, 4096`; modulo `9` they are `4, 7, 1` and then `1`, and `v₃(4^(n!)−1) = 1+v₃(n!) → ∞`. Thus `e = 1` although the powers on `M` never stabilize.
- For `M = ℤ₃` and `U_p = 3`, the valuations of `3^(n!)` are `1, 2, 6, …`, tending to infinity, so `e = 0`; for `U_p = diag(4,3)` on `ℤ₃²`, the limit is `diag(1,0)`, separating the invertible and topologically nilpotent summands.
- The identity map on `𝒪` has kernel and cokernel zero, and generic fibre of dimension `1`. The quotient `𝒪 → 𝒪/(π)` has kernel `(π)` and generic fibre of dimension `0`, so it fails both the small-level module isomorphism and the characteristic-zero comparison. Freeness of the module at a free-action level is not inferred at a level with stabilizers.
- The `11`-adic family through the discriminant form, ordinary at `11` because `τ(11)` is an `11`-adic unit, specialises in weight two to the level-`11` eigenform congruent to `Δ` modulo `11`; at a prime where a form is not ordinary no such family passes through it.
- A pseudo-representation into `T_𝔪` determines only the semisimplification at reducible points: at a permissible ideal the residual data is `χ ⊕ 1`, and the nonsplit lattices are the content of the next target.

**Pseudo-deformation rings and pro-modularity** (`I.1/pseudo-deformation-rings-and-pro-modularity`). Fix `p` odd, `F` totally real, a finite set `Σ` of places of `F` containing those above `p` and infinity, a character `χ : G_{F,Σ} → 𝔽^×` with `χ|D_v ≠ 1` for `v | p`, the nearly ordinary deformation datum `𝒟` of [SW99] §2 (the type at each `v ∈ Σ` away from `p`, the ordinary condition with distinguished unramified quotient at `v | p`, and the determinant), and the residual pseudo-representation `(1 + χ, χ)`. Construct the universal pseudo-deformation ring `R^{ps}_𝒟` as a complete local `Λ_𝒪`-algebra, with its generation by traces of Frobenius elements and the presentation bound of [SW99] §2.1 (numbers of generators and relations from the adjoint Selmer and dual Selmer groups), the reducible locus and the special (dihedral and induced) deformations of §§2.2–2.3, and the comparison of pseudo-deformations with deformations of nonsplit lattices at one-dimensional primes of §2.4. Define pro-modular primes of `R^{ps}_𝒟` as those containing the kernel of the map to the nearly ordinary Hecke algebra localized at the permissible ideal; nice primes (one-dimensional, with an irreducible representation whose reduction is a nonsplit extension of distinct characters and with the prescribed local constant lifts); good deformation data and the properties `(P1)` and `(P2)`. Prove the key proposition: if the datum is good and `(P1)`, `(P2)` hold, every prime of `R^{ps}_𝒟` is pro-modular, by the patching argument of §5 at nice primes, the cohomology estimates of §6, the existence of nice primes at minimal level of §7 and level raising for nice primes of §8; conclude the Main Theorem, that `R^{ps}_𝒟` modulo its nilradical is the localized Hecke algebra. Prove the criterion for `(P2)` of §4.4, whose arithmetic input is Washington's theorem that the `p`-part of the class numbers in the cyclotomic `ℤ_ℓ`-extension of an abelian number field is bounded for `ℓ ≠ p`; that theorem, for the abelian fields used, is part of this target.
Source: [SW99], §§2.1–2.5, pp. 9–26; §§4.1–4.5, pp. 61–74 (Proposition 4.1, p. 64, Proposition 4.2, p. 66, and the Main Theorem, p. 73); §5, pp. 79–87; §6, pp. 88–98; §§7–8, pp. 99–122; and the remark on Washington's theorem, p. 74.
*Needs:* `I.1/nearly-ordinary-hecke-algebras`; LocalGaloisDeformationRings §§F.2.11 and 6.2; GlobalGaloisDeformations R04.3–R04.4; ArithmeticGaloisDuality §§R02.4.4 and R02.5; DeformationAndDerivedPatchingAlgebra §§3.1–3.2, 4.3 and 5.2–5.6; IntegralHeckeAndGaloisDeterminants §0.5; [Chebotarev, Layer 10][cheb]; [ClassFieldTheory, Layer 13][cft].

**Checks.**

- The split representation `1 ⊕ χ` and a nonsplit extension of `1` by `χ` have the same pseudo-representation; the pseudo-deformation ring sees both, and the dimension of the reducible locus is a separate statement.
- Recovering the matrix entries of a Wiles pseudo-representation from its trace divides by `2`; the construction is for odd `p` only.
- A one-dimensional prime whose representation reduces to the split `1 ⊕ χ` is not nice, whatever its characteristic-zero irreducibility; niceness requires a nonsplit reduction with distinct residual characters.
- For `χ` even the pseudo-representation `(1 + χ, χ)` is not odd and has no odd nearly ordinary modular lift; oddness of `χ` is a standing hypothesis of the datum.

**Residually reducible ordinary lifting over ℚ** (`I.1/residually-reducible-ordinary-lifting`). Let `p` be odd, and let `ρ` be continuous, odd, irreducible and finitely ramified over a finite extension of `ℚ_p`. After a finite-order twist suppose `ρ̄^ss = 1 ⊕ χ`, `χ|D_p ≠ 1`, `ρ|I_p = (*,*;0,1)`, and `det ρ = ψχ_p^(k−1)` with `k ≥ 2` and `ψ` finite order. Then `ρ` is attached to a classical newform of weight `k`. The residual character `χ` is odd, and its splitting field is abelian over `ℚ`. The unramified quotient and its residual character must agree; the distinguished condition is a hypothesis. Route: choose a totally real abelian extension `F′/ℚ` in which the primes of `Σ` behave as the proof of [SW99] Theorem A prescribes, so that the datum of `ρ|G_{F′}` is good and `(P1)`, `(P2)` hold (this is where Washington's theorem enters); the Main Theorem over `F′` makes `ρ|G_{F′}` nearly ordinary modular; descend along the abelian tower, and identify the descended form over `ℚ` as a classical newform of weight `k`, with the `p`-part of its level read from the ordinary quotient.
Source: [SW99], Introduction, p. 6, Theorem A, pp. 74–75, and its proof, pp. 75–76.
*Needs:* `I.1/pseudo-deformation-rings-and-pro-modularity`; `I.1/nearly-ordinary-hecke-algebras`; `I.0/soluble-totally-real-base-change`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; AutomorphicGaloisRepresentations §§1.5 and 4.10–4.12; [ClassFieldTheory, Layer 13][cft].

**Residually irreducible ordinary lifting over ℚ** (`I.1/residually-irreducible-ordinary-lifting`). Prove the residually irreducible ordinary theorem with the same characteristic-zero hypotheses, absolutely irreducible modular residual representation, and a `p`-distinguished ordinary residual local shape whose quotient matches the ordinary automorphic seed. The target includes the case induced from `ℚ(√−p)` for `p ≡ 3 mod 4`. In that case supply a correct nearly ordinary dihedral deformation argument and its pro-modularity consequence: the printed dimension estimate does not establish the full scope. The imaginary-quadratic branch is a proof target, not an application of the theorem restricted to non-imaginary inducing fields. Route: the nearly ordinary deformation ring `R_𝒟` of the irreducible `ρ̄`, its presentation and the generation by traces of [SW01] §2, the dimension of the dihedral locus (whose printed proof, Lemma 2.2, assumes the inducing field real), the map to the nearly ordinary Hecke algebra and the pro-modularity of every prime of `R_𝒟` by the method of the preceding target with the modular seed in the χ₂-good form of Diamond's theorem, then descent as above.
Source: [SW01], Introduction, pp. 186–187, Lemma 2.2, p. 191, and Theorems 5.1–5.2, pp. 203–204; [KW-I], references to Skinner's correction in the lifting argument.
*Needs:* `I.1/pseudo-deformation-rings-and-pro-modularity`; `I.1/nearly-ordinary-hecke-algebras`; `I.0/soluble-totally-real-base-change`; LocalGaloisDeformationRings §§6.2–6.3; GlobalGaloisDeformations R04.3; ArithmeticGaloisDuality R02.5; SerreWeightAndLevelOptimisation §§3.1–3.6 and 4.7–4.8; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; AutomorphicGaloisRepresentations §§1.5 and 4.10–4.12.

**Ordinary exact level** (`I.1/ordinary-exact-level`). The ordinary exact-level specialization identifies the weight and local conductor of the resulting newform from the given representation, including its coefficient-prime ordinary crystalline or semistable comparison. Its small terminal instances are supplied by SmallRamificationAndAbelianVarietyBaseCases §5.0e. For the other instances, prove the same local–global conductor comparison from the actual attachment of AlgebraicModularFormsAndSerreWeights R15.5A.2 and GL2AutomorphicRepresentationsAndTransfer R17.6.4.
Source: [Kh], Lemma 5.4 and proof, p. 22.
*Needs:* `I.1/residually-reducible-ordinary-lifting`; `I.1/residually-irreducible-ordinary-lifting`; SmallRamificationAndAbelianVarietyBaseCases §5.0e; AlgebraicModularFormsAndSerreWeights §R15.5A.2; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; LocalGaloisDeformationRings §0.3; PadicHodgeTheory §6.4.

**Checks.**

- Coincident residual characters at `p` do not satisfy `p`-distinguishedness, even when the characteristic-zero representation is ordinary.
- A reducible characteristic-zero representation is excluded from both lifting conclusions.
- Induction from an imaginary quadratic field fails the restricted printed proof's dimension argument; it remains included in the full-scope mathematical target.

### I.2 Global finiteness, presentations and classical lifting

**Hilbert integral comparison over the potential-modularity field** (`I.2/hilbert-fixed-determinant-comparison`). Let `p > 2`, `ρ̄` be S-type, `ρ̄|G_{ℚ(μ_p)}` absolutely irreducible, `2 ≤ k(ρ̄) ≤ p+1`, and `k(ρ̄) ≠ p`. Use I.0 in the form of [KW-Ann], Theorem 2.1: `F/ℚ` is totally real Galois of even degree, unramified above `p`, preserves the residual image, makes `ρ̄|G_{F(μ_p)}` absolutely irreducible, and splits `p` completely in the supersingular case. Retain a cuspidal Hilbert automorphic seed over `F` realizing `ρ̄|G_F`, with the weight, determinant and local conditions of the chosen deformation problem. Let `W = W(𝔽)` and `O/W` be a finite coefficient DVR extension containing the seed's coefficients. The minimal fixed-determinant ring `R_F` is unramified at finite places away from `p`. At every `v | p` impose the restrictions of the corresponding [KW-Ann] §3.1 condition: crystalline weight `k` for `k < p`, or at `k = p+1` either the ordinary crystalline weight-`p+1` branch or the ordinary semistable weight-two branch. Fix determinant `ε̂χ_p^(k−1)` in the crystalline branch and `ε̂χ_p` in the semistable branch. In the ordinary case choose the distinguished filtration and its quotient matching the seed; in the supersingular case use the split-at-`p` crystalline problem. For `p = 3`, include the auxiliary neatness prime and its removal as in [Kh] §2.1.

Take the integral Hecke module and algebra `T_F`, localized at the residual eigensystem in this exact weight and level, from HilbertModularVarietiesAndShimuraCurves R18.3. Apply AutomorphicGaloisRepresentations §§6.8–6.12 for the arithmetic Hecke-valued representation, verifying every chosen local condition and the fixed determinant over the entire Hecke family. Prove here that `T_F` is finite flat over `O`, with the chosen residue identification and closed trace subalgebra equal to `T_F`. These data give GlobalGaloisDeformations R04.6 §6.7's `HeckeGaloisDatum`; its `classifying_surjective` supplies the unframed fixed-determinant map `R_F → T_F`. For reconstruction from characteristic-zero points use §6.8's `ofPoints` and `mem_of_points`, with reduced `T_F`, jointly injective point maps, both Frobenius coefficients and every prescribed local and determinant condition at the points. Prove here that the resulting surjection is an isomorphism. The ordinary and supersingular comparisons are separate targets within this contract; formally smooth local conditions alone are not a modularity hypothesis. The individual Hilbert attachments and their normalization come from AutomorphicGaloisRepresentations §§3.10–3.14, 4.4 and 4.7; this roadmap owns the Hilbert integral comparison and its finiteness application. The classifying-map interface follows the Imperial College London FLT project.
Source: [KW-Ann], Proposition 3.8 and proof, pp. 241–242, using Fujiwara Theorem 0.2 in the ordinary branch and Taylor Theorem 3.2 in the supersingular branch; [Kh], §2.1, pp. 8–11.
*Needs:* `I.0/controlled-residual-potential-modularity`; GlobalGaloisDeformations R04.3 and R04.6 §§6.7–6.8 (Hecke–Galois data and their construction from points); GlobalGaloisDeformations R04.5; ArithmeticGaloisDuality R02.6; DeformationAndDerivedPatchingAlgebra §§5.2–5.8; LocalGaloisDeformationRings Layers 4–5 and §§8.2–8.17; HilbertModularVarietiesAndShimuraCurves §§R18.3.12–R18.3.15 and R18.3.22; AutomorphicGaloisRepresentations §§3.10–3.14, 4.4, 4.7 and 6.8–6.12.

**Checks.**

- A residual representation not yet known modular over `ℚ` still has the Hilbert seed after restriction to this `F`; it does not supply a Hecke maximal ideal over `ℚ`.
- The supersingular comparison requires complete splitting of `p` in `F`; unramifiedness alone is insufficient for this branch.
- Weight `p` is excluded here. At weight `p+1` both local problems are ordinary, but their weights, determinants and monodromy differ.
- Extending a lift from `O` to `O[ε]/(ε²)` leaves its traces in `O`; without trace generation the classifying map need not surject onto the larger algebra.

For the associated minimal global ring over `ℚ`, prove finiteness over the coefficient DVR by restriction to `R_F`. The finite-characteristic universal inertia images away from `p` have the residual orders, giving the restriction map `R_F/(π) → R_ℚ/(π)`. Use finite universal image over `F`, finite index and the ring/image criterion to deduce finite cardinality of `R_ℚ/(π)`, then integral finiteness. For the integral `R_ℚ ≅ T_ℚ` and complete-intersection conclusion, require residual modularity over `ℚ` and a matching automorphic seed satisfying the determinant and every prescribed local condition, together with the classical lifting hypotheses below. Retain the maps of deformation problems and local types.
Source: [KW-Ann], Proposition 3.8 and Theorem 3.7, pp. 241–242; Lemma 3.6, p. 241, only for the finite-characteristic ring/image criterion; [KW-I], Theorem 4.1, p. 7, proved in [KW-II].

**Global finiteness for the full Khare–Wintenberger range** (`I.2/full-kw-global-finiteness`). Let `ρ̄` be S-type, with `2 ≤ k(ρ̄) ≤ p+1` and cyclotomically absolutely irreducible restriction for odd `p`, or nonsolvable image for `p=2`. Fix a finite set `S` containing `p`, infinity and the residual ramification, the integers `O` of a finite extension of `ℚ_p` with the chosen residual coefficient embedding, and an arithmetic character `ψ` with `ψχ_p` lifting the residual determinant. Choose the framed local quotient rings of LocalGaloisDeformationRings §§8.2–8.19 with this determinant and their nonempty local lifting data. At `p` use exactly [KW-II], §8.3.3: crystalline weight `k` in `2≤k≤p+1` (including `k=p`), the prescribed potentially crystalline weight-two type, or semistable noncrystalline weight two at residual weight `p+1`. In characteristic two use crystalline weight two at residual weight two, or the specified semistable noncrystalline weight-two ordinary shape at residual weight four. At infinity impose oddness.

Base change the framed global ring along the completed tensor product of these local quotient rings. Prove that the image of the unframed fixed-determinant universal global ring in this base-changed framed ring is finite over `O`. Use I.0's seeds and the matching full-range Hilbert finiteness comparisons of [KW-II], Propositions 9.2–9.3, followed by the restriction and finite-image argument of §10.1; the odd `k≠p` integral isomorphism above has its narrower scope. Combine the dimension lower bound with this finiteness to obtain an `O′`-valued characteristic-zero point for some finite coefficient DVR extension `O′/O`, and hence the prescribed lifts of I.3.
Source: [KW-II], Theorem 10.1 and §10.1, pp. 90–92; Theorem 6.1, pp. 53–54; Corollary 4.7, pp. 45–46, and §10.3.1, p. 92.
*Needs:* `I.0/controlled-residual-potential-modularity`; `I.0/soluble-totally-real-base-change`; GlobalGaloisDeformations R04.3–R04.6; ArithmeticGaloisDuality R02.6; DeformationAndDerivedPatchingAlgebra §§5.2–5.8; LocalGaloisDeformationRings §§8.2–8.19; HilbertModularVarietiesAndShimuraCurves §§R18.3.12–R18.3.15 and R18.3.22; AutomorphicGaloisRepresentations §§6.8–6.12.

**Checks.**

- The standard `S₃` action from the splitting field of `x³−2` over `𝔽₅` is odd, cyclotomically absolutely irreducible and unramified at `5`, with Serre weight `5`. Its crystalline lift uses this target's weight-`p` branch.
- A nonsolvable dyadic residual representation of weight two admits the crystalline weight-two problem; weight four instead uses the semistable noncrystalline prescription.
- Finiteness of an arbitrary quotient such as `O/(π)` does not give a characteristic-zero point. Corollary 4.7 also uses the dimension lower bound for these chosen local quotient rings.

Böckle's numerical criterion here is: if `O` is a complete DVR with uniformizer `π`, `A=O[[x₁,…,x_n]]`, and `f₁,…,f_m` lie in the maximal ideal with `m ≤ n`, and the nonzero local quotient `R` has the same residue field and is finite over `O`, then `m = n` and `R` is a finite flat complete intersection. The regularity is that of `(π,f₁,…,f_n)` in `A`; in particular the characteristic-zero fibre is nonempty. Use the finite-equation continuous formal presentations of DeformationAndDerivedPatchingAlgebra §1.9, its regular-sequence ideal and absolute local CI interfaces of §3.4, and its dimension and flatness criterion of §3.5. Retain the chosen equations, their count and the quotient equivalence. This roadmap owns their arithmetic application to the deformation rings, including the deduction from auxiliary `R_Q ≅ T_Q` to minimal `R_∅ ≅ T_∅` with the exact hypotheses of R26.1.

A relative formal CI presentation means a continuous local presentation `R ≅ O[[x₁,…,x_n]]/(f₁,…,f_m)` with the equations a regular sequence. It asserts neither finiteness nor flatness over `O`. Specialize the comparison of DeformationAndDerivedPatchingAlgebra §§3.4 and 3.14 to a regular complete Noetherian local coefficient ring `O` and a complete Noetherian local `O`-algebra `R` with the same residue field and such a finite-equation presentation. Since `O[[x₁,…,x_n]]` is regular local, `R` is an absolute local CI if and only if the kernel of this presentation is a regular-sequence ideal; equivalently `R` admits a relative formal CI presentation. A complete coefficient DVR satisfies these hypotheses. For arbitrary coefficient rings the relative formal condition and the absolute local CI condition remain distinct. Source: [Bö], Theorem 1, p. 1, Proposition 1, p. 2, Lemma 1, pp. 3–4, Corollary 1, p. 4, and Lemma 2/Corollary 2, p. 5; Stacks, Tags [09Q0](https://stacks.math.columbia.edu/tag/09Q0) and [09Q1](https://stacks.math.columbia.edu/tag/09Q1).
*Needs:* DeformationAndDerivedPatchingAlgebra §§1.9, 3.4–3.5 and 3.14; GlobalGaloisDeformations R04.3.

**Checks.**

- `O` has the empty presentation and also `O[[x]]/(x)`; a count refers to the chosen presentation.
- The dual numbers `ℚ[ε]/(ε²)` have a one-variable, one-relation power-series presentation with relation `X²`, and give both a relative formal CI over `ℚ` and an absolute local CI.
- The algebra `A=ℚ[X,Y]/(X²,XY,Y²)`, equivalently the same quotient of `ℚ[[X,Y]]`, is neither a relative formal CI over `ℚ` nor an absolute local CI. Its embedding dimension is two, while its minimal defining ideal needs three generators. This excludes every regular presentation, not just this displayed one (Stacks, Tags [00SC](https://stacks.math.columbia.edu/tag/00SC) and [09Q1](https://stacks.math.columbia.edu/tag/09Q1)).
- Taking the non-CI ring `B=ℚ[[X,Y]]/(X,Y)²` as coefficient ring, the identity `B → B` has an empty relative regular presentation, although `B` is not an absolute local CI. The regularity hypothesis on the coefficient ring is essential.
- `O[[x]]` has fewer equations than variables and is flat but is not finite over `O`, so finiteness cannot be omitted from the numerical criterion.
- The quotient by `(1)` is zero and is excluded; `O/(π)` is finite but fails flatness and cannot meet the regular presentation hypotheses with no excess relations.

**Crystalline lifting with a matching-weight seed** (`I.2/same-weight-crystalline-lifting`). Let `p > 2`, let `O` be the integers of a finite extension of `ℚ_p` with residue field `𝔽`, and let `ρ : G_ℚ → GL₂(O)` be continuous, odd, finitely ramified and crystalline at `p` with Hodge–Tate weights `{0,h−1}`, `2 ≤ h ≤ 2p−1`. Suppose `ρ̄|G_{ℚ(μ_p)}` is absolutely irreducible, `End_{𝔽[G_{ℚ_p}]}(ρ̄) = 𝔽`, and a cuspidal modular eigenform of weight `h` has residual representation `ρ̄`. Then `ρ` is modular. Prove the rational crystalline comparison of Kisin, including the fixed-determinant crystalline domain in this weight range and the matching-weight modular point, using the local crystalline deformation interfaces and weight and level changes over `ℚ`.
Source: [Ki], Proposition (3.13) and Theorem (3.14), author pp. 19–21; [KW-II], §10.2, p. 92.
*Needs:* LocalGaloisDeformationRings §3.10 and Layer 5; GlobalGaloisDeformations R04.3–R04.6; ArithmeticGaloisDuality R02.6; DeformationAndDerivedPatchingAlgebra §§5.2–5.8; HilbertModularVarietiesAndShimuraCurves §§R18.3.12–R18.3.15; `I.0/soluble-totally-real-base-change`; SerreWeightAndLevelOptimisation Layer 4; AutomorphicGaloisRepresentations §§4.4, 4.7 and 6.8–6.12.

**Checks.**

- At `h=p+1`, a nonordinary crystalline lift has locally absolutely irreducible reduction by the Berger–Li–Zhu comparison of PadicHodgeTheory §6.4, so its local endomorphisms are scalars.
- A weight-two modular seed alone is not a weight-`p+1` seed; multiplication by the weight-`p−1` Hasse invariant and eigenvalue lifting supply the latter.
- Weight `h=2p` lies outside this comparison, and a scalar local residual action fails its endomorphism hypothesis.

**Classical modularity lifting** (`I.2/classical-modularity-lifting`). Let `ρ` be an odd continuous irreducible finitely ramified `p`-adic representation with a chosen stable lattice and modular reduction `ρ̄`. For odd `p`, assume `2 ≤ k(ρ̄) ≤ p+1` and absolute irreducibility on `G_{ℚ(μ_p)}`. The crystalline branch allows any lift weight `2 ≤ h ≤ p+1`, with Hodge–Tate weights `{0,h−1}`, independently of `k(ρ̄)`, and includes ordinary and nonordinary endpoints. The other branch uses the weight-two type prescribed in I.3. For `p=2`, assume nonsolvable residual image and either crystallinity of weight two with residual weight two, or semistability of weight two with residual weight four. Then `ρ` is modular, with the local–global comparisons required to identify its weight and conductor. In applications retain the determinant and the minimal or prescribed away-`p` conditions of the chosen global deformation problem.

Route, following the case division of [KW-II] §10.2. For odd `p`, after an allowable base change to a totally real field `F` of even degree with the local behaviour of [KW-II] Theorem 9.7 (unipotent ramification away from `p`, uniform type above `p`), prove the fixed-determinant `R = T` over `F` by Taylor–Wiles–Kisin patching on the component selected by the modular seed: the Taylor–Wiles data and finite-level deformation data, the quaternionic Hecke modules at Taylor–Wiles levels with their integral diamond freeness, the Hecke-valued representation with its local conditions, the local rings above `p` of the selected type (the Fontaine–Laffaille rings for `k ≤ p−1`, the endpoint-weight rings for `k = p` and `k = p+1`, the Barsotti–Tate rings of the chosen tame type, the semistable weight-two rings), their completed tensor product, and the patching of the ring and the based module; the patched module is faithful on every component through a modular point, which gives modularity of every point on that component and so of `ρ|G_F`; descend to `ℚ`. The crystalline cases with `k ≤ p+1` and the semistable weight-two case run through this patching, with the nonordinary endpoint treated below; the potentially crystalline weight-two case is `I.2/potentially-barsotti-tate-lifting`. For `p = 2`, crystalline weight two is the dyadic branch of `I.2/potentially-barsotti-tate-lifting` with trivial type, and semistable weight two with `k(ρ̄) = 4` is the dyadic patching of [KW-II] §9 with the semistable weight-two dyadic rings and the free determinant-torus action on the dyadic patched rings. The residual hypotheses `(α)` and `(β)` of [KW-II] §8.2 follow from residual modularity by the weight part of Serre's conjecture.

For the nonordinary endpoint `h=p+1`, PadicHodgeTheory §6.4 gives locally absolutely irreducible reduction of Serre weight two, up to an unramified twist. From residual modularity obtain a weight-two form at level prime to `p`, multiply its mod-`p` reduction by the Hasse invariant, and lift the resulting cuspidal eigensystem to weight `p+1`. Hasse multiplication preserves the mod-`p` q-expansion and away-`p` eigenvalues; eigenvalue lifting preserves their reductions. Apply `I.2/same-weight-crystalline-lifting` with this seed and its scalar local endomorphisms. The ordinary endpoint uses I.1 with distinguishedness, the matching quotient and ordinary modular seed. This treats the two endpoint branches without identifying the residual and lift weights.
Source: [KW-I], Theorem 4.1, p. 7; [KW-II], Theorem 9.7, p. 89, §8.2, p. 70, and §10.2, p. 92; [Ki], Proposition (3.13) and Theorem (3.14), author pp. 19–21.
*Needs:* `I.1/residually-irreducible-ordinary-lifting`; `I.2/same-weight-crystalline-lifting`; `I.2/potentially-barsotti-tate-lifting`; `I.0/soluble-totally-real-base-change`; PadicHodgeTheory §6.4; SerreWeightAndLevelOptimisation §3.7, Layer 4 and §§6.6–6.11; AlgebraicModularFormsAndSerreWeights §3.1 (the elliptic Hasse invariant) and §5.10 (Deligne–Serre eigenvalue lifting); GlobalGaloisDeformations R04.5–R04.6; ArithmeticGaloisDuality R02.6; DeformationAndDerivedPatchingAlgebra §§5.2–5.8; HilbertModularVarietiesAndShimuraCurves §§R18.3.12–R18.3.15, R18.3.22 and R18.3.25–R18.3.27; AutomorphicGaloisRepresentations §§6.8–6.12; LocalGaloisDeformationRings §§1.6, 1.13, 5.6, 5.14, 8.2–8.3, 8.13 and 8.15–8.17; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Checks.**

- At `p=3`, a nonordinary crystalline member with weights `{0,3}` has residual Serre weight two. The Hasse invariant raises its weight-two modular seed to weight four; the crystalline lift retains weights `{0,3}`.
- In a crystalline return after a change of coefficient prime, `h≤p+1` controls lifting even if the residual weight after changing coefficient prime differs from `h`.
- A crystalline lift of weight `p+2` is outside this contract. At `p=2`, residual weight four uses the semistable weight-two prescription.

**Potentially Barsotti–Tate lifting and Hypothesis `(H)`** (`I.2/potentially-barsotti-tate-lifting`). Let `p` be odd, `F` totally real, and `ρ : G_{F,S} → GL₂(E)` continuous, potentially Barsotti–Tate at every place above `p` with determinant the cyclotomic character times a finite-order character, strongly residually modular (its residual representation arises from a parallel-weight-two Hilbert eigenform `f`, not special at any place above `p`, which is potentially ordinary at a place above `p` exactly when `ρ` is), with residue field `𝔽_p` at every place above `p` where `ρ` is not potentially ordinary, and with `ρ̄|G_{F(μ_p)}` absolutely irreducible (when `p = 5` and the projective image is `PGL₂(𝔽₅)`, its kernel does not fix `F(μ₅)`). Then `ρ` is modular. Over `ℚ`: an odd continuous `ρ : G_{ℚ,S} → GL₂(E)`, potentially Barsotti–Tate at `p` with such a determinant, residually modular, with `ρ̄|G_{ℚ(√p*)}` absolutely irreducible, is modular; in the potentially ordinary case Diamond's potentially ordinary modular lift is the strongly residually modular seed. At `p = 2` prove Hypothesis `(H)`: a continuous, odd, irreducible `2`-adic representation of `G_ℚ`, unramified outside a finite set, of weight two and potentially crystalline at `2`, whose residual representation is modular with non-solvable image, is modular; potentially crystalline of weight two is potentially Barsotti–Tate by FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20. Route: allowable base change to a totally real field of even degree where `ρ` and `f` have matching types at the places above `p` and unipotent ramification elsewhere; Taylor–Wiles–Kisin patching with the flat deformation rings of the chosen type, resolved by the moduli of finite flat models, whose components are determined by the residual cyclotomic-line character in the ordinary case and are connected in the nonordinary case; the patched module is faithful over the component through the modular point, which gives modularity on that component and so of `ρ`. At `p = 2` use the dyadic finite-level data with the free determinant-torus action, the components of the `2`-adic Barsotti–Tate rings and the quaternionic dyadic twists.
Source: [KiFF], Theorem (3.5.5), p. 1170, Theorem (3.5.7) and Corollary (3.5.8), pp. 1172–1173; [Ki2], Theorem (0.1), cited by locator; [KW-I], §9, Hypothesis `(H)` and the remark after it, p. 18; [KW-II], Theorem 9.7, p. 89, and §10.2, p. 92; [DP], Theorems 1.4–1.5, pp. 3–4, in the weight-two case.
*Needs:* `I.0/soluble-totally-real-base-change`; GlobalGaloisDeformations R04.5–R04.6 (including §6.6); ArithmeticGaloisDuality R02.6; DeformationAndDerivedPatchingAlgebra §§4.6 and 5.2–5.8 and Layer 6; HilbertModularVarietiesAndShimuraCurves §§R18.3.12–R18.3.15, R18.3.22 and R18.3.25–R18.3.27; AutomorphicGaloisRepresentations §§6.8–6.12; LocalGaloisDeformationRings §§4.9–4.15, 5.2, 5.12–5.13 and 8.17; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20; SerreWeightAndLevelOptimisation §§6.6–6.11; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Checks.**

- The `3`-adic Tate module of an elliptic curve over `ℚ` with good reduction over a wildly ramified extension of `ℚ₃` is potentially Barsotti–Tate at `3`; a Steinberg weight-two lift is not, and belongs to the semistable case of `I.2/classical-modularity-lifting`.
- Matching potential ordinarity between `ρ` and the seed is required: with split distinct unramified residual characters two ordinary components exist, and the seed must lie on the component of `ρ`.
- At `p = 2` the hypothesis is non-solvable residual image, not cyclotomic absolute irreducibility; a dyadic representation with dihedral residual image is outside `(H)`, and its residual modularity (Rohrlich–Tunnell) is used only at the residual level.

### I.3 Prescribed lifts and compatible systems

**The four prescribed lifts** (`I.3/prescribed-lifts`). Use the common hypotheses: `ρ̄` is S-type; for odd `p` its cyclotomic restriction is absolutely irreducible and `2 ≤ k(ρ̄) ≤ p+1`; for `p = 2` its image is nonsolvable. Every odd-characteristic application first twists the residual representation by a power of the cyclotomic character into this weight range; a change of coefficient prime requires a fresh twist unless the weight range is already established. Construct the following prescribed lifts over the integers of a finite extension of `ℚ_p`, with a stable lattice reducing to the given full residual representation, the matching fixed determinant and minimality away from the listed primes.

- The minimal crystalline lift has weight `k`, requires `k = 2` at `p = 2`, and is minimal away from `p`. The Annals variant assumes odd `p` and `k ≠ p`; the full Khare–Wintenberger variant includes `k = p`.
- The weight-two lift is minimal away from `p` and has parameter `(ω_p^(k−2) ⊕ 1,0)` at `p`, with the semistable noncrystalline parameter `(id,N)` with `N ≠ 0` at `k = p+1`. At `p = 2` the exceptional residual weight is `4`.
- For odd `q` with `q ∥ N(ρ̄)` and `p | q−1`, with residual inertia shape `(χ,*;0,1)`, prescribe at `q` the lift `(χ′,*;0,1)` with `χ′=ω_q^i`, `0<i≤q−2`, reducing to `χ`. Require `i` even if `p = 2`. At `p` use the preceding weight-two prescription; be minimal away from `p` and `q`.
- For `q ≠ p` with `p | q+1` and residual decomposition shape an unramified twist of `(χ̄_p,*;0,1)`, prescribe `χ′ ⊕ χ′^q` at `q`, where `χ′` has `p`-power order, genuine niveau two and the compatible reduction. For `p = 2` impose the even exponent-sum condition, and exclude `v₂(q+1)=1`, where this character does not exist. At `p` use the weight-two prescription and be minimal away from `p` and `q`.

These are mathematical existence targets, using the local rings of LocalGaloisDeformationRings §§8.2–8.19 and the global presentation of I.2 together with `I.2/full-kw-global-finiteness` for every prescribed branch. The local point characterization, prescribed determinant, preservation of minimality, coefficient extension and residue comparison are the required API. Source: [KW-I], Theorem 5.1(1)–`(4)`, pp. 9–10; [KW-Ann], Theorem 3.3, p. 239.

**Checks.**

- At `p = 2` and `q = 5` the exponent `i = 1` in the third prescription is excluded; `i = 2` has the required parity.
- In the fourth prescription `p = 2, q = 7` permits niveau-two `2`-power characters, whereas `q = 5` does not.
- At `k = p+1`, a weight-two lift has nonzero monodromy; the crystalline weight-`k` lift is a different prescription.
- The order-three type at `(p,q)=(3,2)` has both standard and adapted integral models; the full residual representation determines which lattice supplies compatibility.

**Families through prescribed lifts** (`I.3/families-through-prescribed-lifts`). Enrich the supplied `ArithmeticCompatibleFamily` by oddness and irreducibility of every characteristic-zero member and require AutomorphicGaloisRepresentations §7.1's rank-two almost-strict predicate on its underlying shared data, with the pairwise exceptions of Conventions §2.3. Use its underlying `AutomorphicSystemData` fields for the coefficient number field `E`, finite places, ramification set `S`, polynomials, members and Hodge multisets, together with the specialization's chosen `E_λ`-models and equivariant scalar-extension identifications. Stable lattices and residual embeddings refer to these same members. Common arithmetic-Frobenius polynomials and positive Hodge weights are obtained through the owner's adapters: a geometric polynomial `P` of degree `n` becomes `X^n P(1/X)/P(0)`, and the numerical Hodge labels change sign. For Weil–Deligne parameters invert the Frobenius matrix, retain inertia and monodromy, and invert the Frobenius–monodromy conjugation relation. These changes leave the representation unchanged; taking its dual is a separate operation.

The supplied almost-strict predicate requires de Rhamness, the fixed Hodge pair, crystallinity at good coefficient primes, and Frobenius-semisimplified Weil–Deligne comparison preserving monodromy at every pair outside exactly the exceptions of Conventions §2.3. In particular, supply every required pairwise comparison even at coefficient places in the owner's finite exceptional set. At a ramified coefficient prime with reducible global reduction the Weil–Deligne comparison may be omitted, while de Rhamness remains; at an odd unramified coefficient prime comparison and crystallinity are still required when reduction is reducible. The finite-exception predicate alone does not imply the supplied almost-strict predicate.

Its API reuses the owner's coefficient-extension and residual-member operations, including independence of semisimplified reduction from the lattice. Use AutomorphicGaloisRepresentations §7.1's transport of the almost-strict predicate for coefficient extension, retaining chosen models and every required output comparison; use its strict-to-almost-strict and almost-strict-to-weak implications. Prove here the stated local inertial-type, weight and ramification comparisons for each selected member. Marked isogeny and base-change transports of geometric realizations retain the specified coefficient action and equivariant identifications. The weight-`k` predicate on a system means that the supplied multiset, after the Hodge-sign adapter, is `{0,k−1}`; the split-at-`p` predicate means that every selected coefficient place above `p` has residue field `𝔽_p`. Construct an almost-strict system containing each prescribed lift, with the local conditions that their applications prescribe. The general-weight system uses I.0 and Brauer induction over solvable subextensions. For each descended cuspidal Hilbert form `π_i` over the totally real field `F_i`, retain its parallel weight `k ≥ 2`, central character, coefficient field `E_i` and embedding `E_i → ℚ̄_ℓ` at each selected coefficient place. Apply AutomorphicGaloisRepresentations §§3.10–3.14 and 7.3, using its arithmetic dual `ρ_{π_i,λ}^∨`: at arithmetic Frobenius `v` the polynomial is `X²−t_vX+Nv·s_v`. Convert the supplier's `D_HT` degrees `{0,1−k}` for this dual to the positive cyclotomic-weight convention `{0,k−1}` used here and local Weil–Deligne parameters by §§4.4 and 4.7, retaining monodromy. Identify the induced virtual representations with actual semisimple representations at every coefficient place. SmallRamificationAndAbelianVarietyBaseCases §5.0b supplies only the parallel-weight-two special case. Source: [Kh], Proposition 3.1, pp. 16–17; [KW-I], §5, pp. 8–10; [DP], Definition 1.10, Theorem 1.11 and Remark 3, pp. 6–7.

**Checks.**

- A member can ramify at its own coefficient prime even when `S` is empty; replacing the ramification condition by unramifiedness at every prime would reject a crystalline Tate member.
- The Tate family of an elliptic curve has geometric polynomial `X²−(a_r/r)X+1/r` at a good prime; the shared reciprocal-polynomial adapter gives `X²−a_rX+r` at arithmetic Frobenius for the same representation.
- At an odd unramified coefficient prime with reducible global reduction, membership of the coefficient place in a finite exceptional set does not waive the almost-strict Weil–Deligne comparison or crystallinity.
- At a ramified coefficient prime with reducible global reduction, the allowed omission of Weil–Deligne comparison retains de Rhamness and the fixed Hodge pair.
- Reducible residual reduction does not make a characteristic-zero member reducible. A Hodge-sign conversion changes the labels, whereas the dual changes the representation; the cyclotomic character has labels `−1` and `+1` in the two conventions.
- Inert degree-two coefficient places need not give prime-field-valued reductions. Complete splitting, or a proved descent, is needed before Lemma 8.2.
- The Steinberg and order-three parameters at `2` have different monodromy. Matching trace alone cannot supply the local comparison or a type-preserving congruence.

**Residual links and modularity transfer** (`I.3/residual-links-and-modularity-transfer`). Define two such systems to be linked at `p` when specified places above `p` have isomorphic semisimplified residual representations over a common residue field. The API is symmetry and invariance under coefficient extension; linkage alone does not imply modularity equivalence. Prove modularity transfer relative to a lifting hypothesis. A lifting hypothesis is a class of continuous `p`-adic representations of `G_ℚ`, cut out by the local and residual conditions it names, together with the statement that every member of the class whose residual representation is modular is itself modular. Suppose the chosen `p`-adic members of two linked systems both lie in the class of a given lifting hypothesis and lift the same modular residual representation; then both members are modular. The lifting theorems of I.1 and I.2 instantiate the hypothesis here; later rational lifting theorems instantiate it where they are proved, and this target does not refer to them. Once one member is modular, common Frobenius polynomials and ArithmeticGaloisRepresentations Layer 5 give modularity of the entire system. GL2AutomorphicRepresentationsAndTransfer §§R17.6.17–R17.6.19 supply compatible-family transfer and descent with their common-index and character hypotheses. Source: [KW-I], applications of Theorem 4.1 in §§8–9, pp. 12–19; [DP], Remark 4, p. 7.

**Checks.**

- A family is linked to itself at any selected coefficient place; reversing the residual isomorphism reverses the link.
- Equal residual traces give only semisimplified linkage. A prescribed lift still requires a lattice realizing the given full residual representation.
- A link between crystalline and weight-two members gives modularity transfer only when each member lies in the class of a lifting hypothesis, with its own weight and determinant.

### Examples

A family is linked to itself at a chosen coefficient place, and an isomorphism of residual representations gives linkage in either direction. Equal residual traces alone supply only semisimplified linkage; the chosen lattice must still realize the full residual representation required by a prescribed lift. Linkage between a crystalline member and a member of another Hodge type gives no modularity equivalence until the appropriate lifting hypotheses hold on both sides.

For the split-at-`p` condition, complete splitting of `p` in the coefficient field gives prime-field residue fields at all its places; an inert quadratic place has residue degree two and fails it; a chosen degree-one place alone does not establish the condition at every place. For the weight condition, `{0,1}` is weight two, `{0,p}` is weight `p+1`, and `{0,0}` is irregular and fails every regular weight-`k` condition with `k ≥ 2`.

### Dependencies

*Needs:* ArithmeticGaloisRepresentations Layers 1–5; ArithmeticGaloisDuality §§R02.4.4–R02.4.6, R02.5 and R02.6; GlobalGaloisDeformations R04.3–R04.6; LocalGaloisDeformationRings Layers F, 0, 1 and 3–6 and Layer 8; DeformationAndDerivedPatchingAlgebra §§3.1–3.2, 4.3, 4.6, Layer 5 and Layer 6; IntegralHeckeAndGaloisDeterminants §0.5; InverseGaloisAndArithmeticFundamentalGroups IG.2.5; [Chebotarev, Layer 10][cheb]; [ClassFieldTheory, Layer 13][cft]; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3–R07.5; AlgebraicModularFormsAndSerreWeights R15.3–R15.6; GL2AutomorphicRepresentationsAndTransfer R17.4–R17.6; SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0e (shared system data, operations, convention adapters and rank-two specialization) and §§5.1–5.4 (marked realization transports); HilbertModularVarietiesAndShimuraCurves H1, §§H6.2–H6.5, H6.9 and R18.3; AutomorphicGaloisRepresentations §§1.5, 3.10–3.14, 4.4, 4.7, 4.10–4.12, 6.8–6.12, 7.1 and 7.3; PadicHodgeTheory §6.4; SerreWeightAndLevelOptimisation §§3.1–3.8, 4.2, 4.7–4.8, Layer 4 and §§6.6–6.11. The minimal ring, the auxiliary automorphic seed, the prescribed lift and the family containing a given lift are separate outputs; none assumes the final residual modularity theorem.

## Layer R26.1: Böckle's presentation of minimal deformation rings

*Milestone:* the deformation contract for minimal rings.

This layer states the exact form in which Böckle's presentation and his auxiliary-to-minimal deduction apply to minimal deformation rings over `ℚ`.

**Böckle's presentation for minimal deformation rings** (`R26.1/bockle-appendix-minimal-deformation-ring-presentation`). Böckle's presentation of a global deformation ring with local conditions, his criterion that a finite `𝒪`-algebra presented by no more relations than variables is a finite flat complete intersection, and his deduction of `R_∅ ≅ T_∅` from an auxiliary `R_Q ≅ T_Q` are targets of Input I.2, with the generic presentation in `GlobalGaloisDeformations:R04.3`. This target verifies their hypotheses for the minimal ring `R_∅` and the `Q`-new rings `R_Q^{α-new}` of a residual representation of conductor one:

1. `ρ̄` is odd; the Euler-characteristic count in the presentation uses oddness once.
2. The local defect `Δ_ℓ` vanishes in the four cases used: no ramification at `ℓ`, no condition at `ℓ`, the minimal condition at a prime where `ρ̄` ramifies, and the `Q`-new condition at a prime of `Q`, where the local ring is `𝒪⟦T⟧`. At `p`, verify `Δ_p = 0` for the finite or Selmer problems of [Bö]. The split finite-flat calculation requires `p` odd, `ρ̄|G_p ≅ diag(χ̄_p,1)`, coefficient ring `W(k)` and determinant fixed to `χ_p`. In this case the flat lifts are reducible, the tangent dimension is `2` and the versal ring is `W(k)⟦X₁,X₂⟧`; after a finite coefficient extension `O/W(k)` it is `O⟦X₁,X₂⟧`. This calculation does not cover arbitrary decomposable flat representations.
3. If `R_Q` is finite over `𝒪`, then `R_∅` is a finite flat complete intersection.
4. The deduction `R_∅ ≅ T_∅` needs `T_Q` and `T_∅` finite flat over `W(k), T_Q` reduced by the choice of `Q`, and Carayol's theorem that a newform unramified at the primes of `Q` has conductor prime to `Q`.

The determinant convention fixes `d` and `Ad_X: d = 0` and `Ad⁰` if the determinant is fixed, otherwise `d = 1` and `Ad`.
Source: [Bö], Theorem 1, p. 1, Proposition 1, p. 2, Lemma 1, pp. 3–4, Corollary 1, p. 4, and Lemma 2/Corollary 2, p. 5.
*Needs:* Input I.2; GlobalGaloisDeformations §3.7.

**Checks.**

- `diag(χ̄_p,1)` with determinant `χ_p` gives the two-variable flat versal ring for odd `p`.
- The scalar unramified representation `1 ⊕ 1` with determinant one has three unramified tangent directions, the trace-zero matrices; the two-dimensional calculation cannot apply.
- Extending `W(k)` to `O` extends the coefficients of the two-variable ring; changing the fixed determinant is a different deformation problem.

### Examples

The two flat tangent directions for `diag(χ̄_p,1)` contrast with the three unramified trace-zero directions for the scalar residual action.

### Dependencies

Input I.2 supplies the presentation and finiteness criterion; GlobalGaloisDeformations §3.7 supplies the global presentation.

## Layer R27.1: Good-dihedral primes and auxiliary primes

*Milestones:* good-dihedral primes; Lemma 8.2, the Chebotarev choice of auxiliary primes.

A good-dihedral prime keeps the residual representations met along a chain of compatible systems large: non-solvable image and projective image different from `A₅`.

**Good-dihedral primes** (`R27.1/good-dihedral-prime-definition`). Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous and write `N = N(ρ̄)`. A prime `q ≠ p` is a *good-dihedral prime* for `ρ̄` if

1. `ρ̄|_{I_q} ≅ ψ ⊕ ψ^q` for a nontrivial character `ψ` of `I_q` whose order is a power of an odd prime `t` with `t | q + 1` and `t > max(Q(N/q²), 5, p)`; and
2. `q ≡ 1 (mod 8)`, and `q ≡ 1 (mod s)` for every prime `s ≤ max(Q(N/q²), p)`.
`ρ̄` is *locally good-dihedral* (for `q`), or *`q`-dihedral*, if such a `q` exists. Since `t | q + 1` and `t ∤ q − 1, ψ` has niveau two at `q`. The bound on `t` uses the largest prime of the prime-to-`q` part of the conductor; the congruences in `(2)` are what make `q` split or ramify in every quadratic field unramified outside the ramification of `ρ̄` (Lemma 6.3). The predicate refers to `N(ρ̄)`, so it is not stable under arbitrary changes of level. Its purpose: starting from a `q`-dihedral representation of characteristic `P` ramified at a set `S`, the proofs of Theorems 3.1 and 3.2 only meet residual representations of characteristic at most `max(P, ℓ)` over `ℓ ∈ S ∖ {q}`, which is exactly the range where `(1)` and `(2)` are imposed.
Source: [KW-I], Definition 2.1, pp. 4–5; §8.2, Remark 2, p. 15.
*Needs:* `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 3`; `ArithmeticGaloisRepresentations Layer 4`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `Nat.maxPrimeFac`; `Nat.maxPrimeFac_one`; `Nat.isGreatest_maxPrimeFac`; `Matrix.GeneralLinearGroup`.

The suggested predicate is algebraic: it takes a representation `ρ : G → GL₂(K)`, a family of inertia homomorphisms `I_q → G`, the characteristic `p` and the conductor `N` as inputs. For the Galois specialisation `p` is the characteristic of `K, N` the actual conductor and the inertia maps the inclusions of inertia groups at chosen primes above `q`.

API (the predicates below are library targets; none is declared in `Suggested.lean`):

- The good-dihedral predicate at `q` is the conjunction: `q` prime, `q ≠ p`; an odd prime `t`, an exponent `a > 0` and a character `ψ` with `t | q + 1`, the strict size bound, `ψ` of exact order `t^a`, and a basis change `B` with `B⁻¹ρ(x)B = diag(ψ(x), ψ(x)^q)` on inertia; and the two congruence conditions.
- Local good-dihedrality is the existence of such a `q`; each direction of this equivalence is a separate lemma.
- Extraction lemmas return the inertia condition and the congruences, the latter including equality at the upper end `s = max(Q(N/q²), p)`.
- Replacing `ρ` by `B⁻¹ρB` with `B ∈ GL₂` changes neither predicate.
- For an actual residual Galois representation, the niveau-two inertia has no invariants, so the conductor exponent at `q` is `2` and `q² | N(ρ̄)`.

**Checks.**

- take `G = DihedralGroup 7`, `K = GaloisField 2 3 = 𝔽₈`, `p = 2`, `q = 41`, `N = 41²` and `t = 7`. For a primitive `ζ₇ ∈ 𝔽₈`, send a rotation to `diag(ζ₇,ζ₇⁻¹)` and a reflection to the swap. Inertia is the cyclic rotation subgroup, with its inclusion. The character has exact order seven, `41 ≡ 1 (mod 8)` and modulo `2`, `7 | 42`, and `7 > max(1,5,2)`. This constructs a good-dihedral prime, hence local good-dihedrality. This algebraic example does not assert a global Galois realization.
- `q = 13` is never good-dihedral, as `13 ≢ 1 (mod 8)`.
- a representation trivial on `I_q` is not good-dihedral at `q`, since `ψ` must have order `t^a` with `a > 0`.
- for `p = 7, q = 241` and `N = 9 · 241², Q(N/q²) = 3`; the congruences modulo `8, 2, 3` and `5` hold but `241 ≢ 1 (mod 7)`, so the predicate fails: the bound `s ≤ max(Q(N/q²), p)` includes `s = p`.
- invariance under conjugation, with the witness basis composed with `B`.
- one good prime makes `ρ` locally good-dihedral although `13` never is; this rejects a universal quantifier in place of the existential.
- trivial inertia at every `q` excludes local good-dihedrality for every conductor parameter.

**Lemma 6.3: image and propagation** (`R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`). Let `ρ̄` be locally good-dihedral for `q`.
(i) The image of `ρ̄` is not solvable and its projective image is not `A₅`.
(ii) Let `(ρ_ι)` be a compatible system lifting `ρ̄` whose fixed Weil–Deligne ramification lies in the primes dividing `N(ρ̄)p` (each member may also ramify at its own coefficient prime), with `ρ_p|_{D_q}` a minimal lift of `ρ̄|_{D_q}`. Then for every prime `r ≤ max(Q(N(ρ̄)/q²), p)`, every mod-`r` representation `ρ̄_r` arising from the system is again good-dihedral for `q`, and so has non-solvable image with projective image other than `A₅`.
Proof outline: since `t | q + 1` and `t ∤ q − 1, ρ̄|_{D_q}` is irreducible, hence so is `ρ̄; t > 5` excludes `A₅`. If the image were solvable, Dickson's classification makes the projective image dihedral (`t > 5` excludes `A₄` and `S₄`), so `ρ̄` is induced from a quadratic field `K` unramified outside the ramification of `ρ̄`. The congruences of `(2)` make `q` split or ramify in `K`: splitting contradicts irreducibility on `D_q`, ramification contradicts `t` odd. For (ii): `t` exceeds every new residual characteristic `r` in range, so reduction is bijective on the dihedral projective image `D_{2t^a}` of the decomposition group at `q`, in particular on its cyclic inertia part of order `t^a`; new prime divisors away from `q` are bounded by `max(Q(N/q²), p)` through the product and power rules for `Q`. Only Dickson's classification is used, no modularity or weight statement.
Source: [KW-I], Lemma 6.3, p. 11, and proof of Lemma 6.3(i), p. 12.
*Needs:* `R27.1/good-dihedral-prime-definition`; `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 3`; `ArithmeticGaloisRepresentations Layer 4`; Input I.3; `Nat.maxPrimeFac_mul`; `Nat.maxPrimeFac_pow`.

**Lemma 8.2: the Chebotarev choice of auxiliary primes** (`R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`). Let `p ≡ 1 (mod 4)` be prime and `ρ̄ : G_ℚ → GL₂(𝔽_p)`, with coefficients in the prime field, continuous, odd, with non-solvable image (so absolutely irreducible). Let `c` be a complex conjugation. The primes `q` unramified in `ρ̄` with
(i) `ρ̄_proj(Frob_q)` conjugate to `ρ̄_proj(c)` in the projective image,
(ii) `q ≡ 1 (mod ℓ)` for every prime `ℓ ≤ p − 1`, and `q ≡ 1 (mod 8)`,
(iii) `q ≡ −1 (mod p)`,
have positive Dirichlet density. At such `q, tr ρ̄(Frob_q) = 0, p | q + 1`, and `ρ̄|_{D_q}` is an unramified twist of `diag(χ̄_p, 1)` with `χ̄_p(Frob_q) = −1`.
The coefficients must be `𝔽_p`, not `𝔽̄_p`: Khare–Wintenberger record that an earlier version allowed `𝔽̄_p` and that a rationality hypothesis may be needed. `p ≡ 1 (mod 4)` is used twice: when the projective image is `PGL₂(𝔽_p), ρ̄_proj(c)` lies in `PSL₂(𝔽_p)` because `det ρ̄(c) = −1` is a square; and `−1` is a square `mod p`, which makes (iii) compatible with the other conditions.
Proof outline: by Dickson the projective image is `PSL₂(𝔽_p), PGL₂(𝔽_p)` or `A₅`. Let `M` be the field cut out by `ρ̄_proj` and `C` the cyclotomic field generated by `μ₈, μ_ℓ` for odd `ℓ < p`, and `μ_p`. As `PSL₂(𝔽_p)` and `A₅` have no nontrivial abelian quotient, `M ∩ C` has degree `1` or `2` over `ℚ`, and in degree `2` it is the fixed field of `PSL₂(𝔽_p)`. The congruence conditions make `Frob_q` trivial on every quadratic subfield of `C` (on `ℚ(i), ℚ(√±2)` by `q ≡ 1 mod 8`, on `ℚ(√ℓ*)` by `q ≡ 1 mod ℓ`, on `ℚ(√p)` because `q ≡ −1 mod p` and `−1` is a square), and condition (i) makes it trivial on `M ∩ C`. So the conditions define a nonempty union of conjugacy classes of `Gal(MC/ℚ)`, and Chebotarev gives positive density. Finally `ρ̄_proj(Frob_q)` has order `2`, so `ρ̄(Frob_q)` has eigenvalues `α, −α`.
Source: [KW-I], Lemma 8.2, the remark after it, and its proof, pp. 17–18; [DP], Lemma 1.15, p. 9, which restates it with `𝔽_p` coefficients.
*Needs:* `ArithmeticGaloisRepresentations Layer 3`; `ArithmeticGaloisRepresentations Layer 4`; [Chebotarev, Layer 10][cheb]; `NumberField.Chebotarev.frobeniusPrimeSet`; `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`; `NumberField.Chebotarev.infinite_frobeniusPrimeSet`.
`Suggested.lean` defines `auxiliaryPrimes` and states the positive-density theorem as `lemma_8_2`.

**Checks.**

- `q = 13` is excluded from `auxiliaryPrimes` for `p = 5`, independently of the representation, by the modulus-eight condition.
- For the trivial `𝔽₅` representation and any complex conjugation `c`, `409 ∈ auxiliaryPrimes 1 c`: inertia and both projective images are trivial, and all three congruences hold.
- `q = 409` satisfies every congruence for `p = 5`, but an inertia element outside the kernel excludes it. Thus congruences alone do not establish membership.
- The action `diag(1,χ_{ℚ(i)})` over `𝔽₅` is odd and unramified at `409`, with Frobenius the identity there since `409 ≡ 1 (mod 4)`. Complex conjugation is `diag(1,−1)`, which is not projectively conjugate to the identity. Consequently `409` is excluded even with all the arithmetic congruences and unramifiedness.

**Dickson, its dyadic refinement and the dihedral weight lemmas** (`R27.1/dickson-and-the-dyadic-solvable-refinement`). This target collects four statements of Khare–Wintenberger §6 in the form the classical strand applies them; each is proved by its owner.

- Dickson: a finite subgroup of `GL₂(𝔽̄_p)` acting irreducibly has projective image dihedral, `A₄, S₄, A₅, PSL₂(𝔽₀)` or `PGL₂(𝔽₀)` for a finite subfield `𝔽₀; PSL₂(𝔽₀)` is simple nonabelian once `|𝔽₀| ≥ 4` (`ArithmeticGaloisRepresentations Layer 4`).
- Lemma 6.1: a finite solvable subgroup of `GL₂(𝔽̄₂)` acting irreducibly has dihedral projective image. `S₄` is excluded because elements of `2`-power order in `GL₂(𝔽̄₂)` have order at most `2; A₄` because its normal subgroup of order `4` would force the group into the upper triangular matrices (ArithmeticGaloisRepresentations Layer 4).
- Lemma 6.2(i): an S-type `ρ̄` with dihedral projective image arises from `S_{k(ρ̄)}(Γ₁(N(ρ̄)))`. At `p = 2` this goes through Serre's Proposition 10 method, with the refined weight and level from Wiese (`GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6`, and `SerreWeightAndLevelOptimisation Layer 5` for the exact weight and level).
- Lemma 6.2(ii): if `ρ̄` is of S-type, `p ≥ 3, 2 ≤ k(ρ̄) ≤ p + 1` and `ρ̄|_{G_{ℚ(μ_p)}}` is reducible, then `k(ρ̄)` is `(p + 1)/2` or `(p + 3)/2`. Here `ρ̄` is induced from the quadratic subfield of `ℚ(μ_p)`, so for `p > 2` its projective image is dihedral of order prime to `p` and the projective image of inertia at `p` is cyclic; it has order `2` because that quadratic field is ramified at `p` (`AlgebraicModularFormsAndSerreWeights:R15.4`).
Source: [KW-I], Lemma 6.1, p. 10, and Lemma 6.2, p. 11; [Ri], proof of Proposition 2.2, pp. 279–280, an analogous inertia argument for semistable `ρ̄` with cyclotomic determinant (not a proof of Lemma 6.2(ii)), read with the correction in Corrections to the sources.
*Needs:* `ArithmeticGaloisRepresentations Layer 4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `SerreWeightAndLevelOptimisation Layer 5`; `AlgebraicModularFormsAndSerreWeights:R15.4`.

### Examples

For `p=5`, the numerical auxiliary candidate `q=409` has residues `1,1,4` modulo `8,3,5`. The Frobenius-class condition remains a separate requirement.

### Dependencies

ArithmeticGaloisRepresentations Layers 2–4, Input I.3 and Chebotarev Layer 10 supply the early good-dihedral and auxiliary-prime results. The solvable-image refinement uses the additional lifting and optimization inputs in its own Needs clause.

## Layer R33.1: Rank-two unitary forms and twist-two vanishing

*Milestones:* irreducibility of rank-two conjugate-self-dual Galois representations; the Hecke-valued representation of a definite unitary tower; twist-two vanishing for totally real fields.

This layer holds three results: rank-two irreducibility of the Galois representations of conjugate-self-dual cuspidal forms over CM fields, the globalization of a local residual representation with the Hecke-valued Galois representation of the resulting definite unitary tower, and the vanishing of the rational second Galois cohomology of a totally real field with coefficients twisted by the square of the cyclotomic character.

**Rank-two irreducibility for conjugate-self-dual forms** (`R33.1/rank-two-unitary-irreducibility`). Let `F` be an imaginary CM field and `Π` a regular algebraic, conjugate-self-dual, cuspidal automorphic representation of `GL₂(𝔸_F)`. For every prime `ℓ` and every `ι : ℚ̄_ℓ ≅ ℂ`, the attached semisimple representation `r_{ℓ,ι}(Π)` of AutomorphicGaloisRepresentationsPartII AG2.3 is irreducible. In particular the rank-two case of the extreme-regularity irreducibility hypothesis of AutomorphicGaloisRepresentationsPartII AG2.6 holds, and the coefficient-prime comparisons of AG2.6 used in `R33.1/global-arithmetic-action` hold in rank two without it. Proof: if `r_{ℓ,ι}(Π) ≅ χ₁ ⊕ χ₂`, each `χ_i` is continuous, unramified outside a finite set and de Rham at every place above `ℓ`, by the polarized admissibility at the coefficient prime of AG2.6, which does not use the hypothesis. By AutomorphicGaloisRepresentations §3.13 each `χ_i` is the `ℓ`-adic character of an algebraic Hecke character `ψ_i`. Comparing good Frobenius polynomials in the normalization of AG2.0, `Π` and the isobaric sum of `ψ₁` and `ψ₂` with the matching norm twists have the same unramified components at almost all places. By strong multiplicity one for isobaric sums `Π` is that isobaric sum, contradicting cuspidality.
Source: [BLGGT], §2.1, p. 32, definition of extreme regularity, and Theorem 5.5.2, p. 81, which proves irreducibility in every rank for a density-one set of `ℓ` under extreme regularity; the rank-two statement for every `ℓ` is proved here directly.
*Needs:* AutomorphicGaloisRepresentationsPartII AG2.0, AG2.3 and AG2.6 (polarized admissibility at the coefficient prime); AutomorphicGaloisRepresentations §3.13; AutomorphicLFunctionsAndLocalFactors AL.3 (strong multiplicity one for isobaric sums); ArithmeticGaloisRepresentations Layer 5.

**Checks.**

- For conjugate-self-dual algebraic Hecke characters `ψ₁, ψ₂` of `F` with distinct infinity types at every embedding, the isobaric sum `ψ₁ ⊞ ψ₂` is regular algebraic and conjugate self-dual but not cuspidal, and its Galois representation is `χ₁ ⊕ χ₂`: the cuspidality hypothesis cannot be dropped.
- For a quadratic CM extension `L/F` and an algebraic character `θ` of `L` with `θ ≠ θ^σ`, the automorphic induction of `θ` is cuspidal and `Ind_{G_L}^{G_F} θ` is irreducible, although its restriction to `G_L` splits; the conclusion concerns `G_F` only.
- Irreducibility of `r_{ℓ,ι}(Π)` does not give irreducibility of its reduction: a cuspidal `Π` congruent to an Eisenstein series has residually reducible `r̄`. The target asserts nothing residual.

**Globalization of local types and the Hecke–Galois input of the unitary tower** (`R33.1/global-arithmetic-action`). For each continuous local representation `r̄ : G_{ℚ_p} → GL₂(k)`, with `k` finite of characteristic `p`, construct, after finite coefficient extension, a rank-two automorphic globalization. For odd `p` use the CM globalization and definite unitary group of [TuA] §3, with `p` split, a distinguished place realizing `r̄`, fixed potentially Barsotti–Tate components at the other places above `p`, and an auxiliary place away from `p`. For `p = 2` use a totally real field of even degree, with `2` split completely, a nonsolvable global residual representation realizing `r̄` at the dyadic places, its modular seed, and an auxiliary place with two distinct residual Frobenius eigenvalues, as in [TuB] Definition 4.3.2 and Lemma 4.3.3. The globalization, its local realization and its modular seed are conclusions to prove here, by the Moret-Bailly and auxiliary-prime potential-modularity construction of I.0 with these local data; they are not assumptions that `r̄` itself is modular over ℚ. Construct the integral finite-level automorphic modules by specialization of the supplied algebraic modular-form carriers, localize them at the global residual Hecke ideal and select one eigenvalue at the auxiliary place.

For odd `p` the Hecke–Galois input of the unitary tower is part of this target. At each finite level the localized Hecke algebra `𝕋_𝔪` is reduced and finite over `𝒪`. Each of its characteristic-zero points comes from an automorphic representation of the definite unitary group whose weak base change to `GL₂(𝔸_F)` (EndoscopicTransferAndUnitaryTraceComparison §§13.1 and 13.4) is regular algebraic and conjugate self-dual; it is cuspidal, since an isobaric sum of two characters would make `ρ̄` reducible. Attach its Galois representation by the conjugate-self-dual existence theorem of AutomorphicGaloisRepresentationsPartII AG2.3, with the good-place normalization of AG2.0. Glue the traces into a continuous degree-two determinant law on `G_{F,S}` with values in `𝕋_𝔪`. As `ρ̄` is absolutely irreducible, the reconstruction of AutomorphicGaloisRepresentations §6.9 gives `ρ_𝔪 : G_F → GL₂(𝕋_𝔪)` lifting `ρ̄`. Its conjugate self-duality with the fixed multiplier extends it to a `𝒢₂`-valued lift of `G_{F⁺}` of the polarized deformation problem of GlobalGaloisDeformations Layer G7, so the universal ring of that problem maps onto `𝕋_𝔪`, at every Taylor–Wiles level as well. Prove the local conditions from local–global compatibility. At the split places above `p`, the de Rham labels and the Weil–Deligne comparison at the coefficient prime of AutomorphicGaloisRepresentationsPartII AG2.6 place every characteristic-zero point of a type-`σ` localization on the framed potentially semistable quotient of the matching Hodge type and inertial type, and on the chosen potentially Barsotti–Tate component at the places other than the distinguished one. At `v₁` the selected eigenvalue matches the retained local factor. AG2.6 states its Weil–Deligne comparisons at places above the coefficient prime under its extreme-regularity irreducibility hypothesis in each rank `m`; only `m = 2` occurs here, and `R33.1/rank-two-unitary-irreducibility` proves that case.
Source: [TuA], §3, p. 9; [TuB], Definition 4.3.2 and Lemma 4.3.3, pp. 20–21.
*Needs:* `I.0/moret-bailly-split-points` and the local-realization argument of `I.0/controlled-residual-potential-modularity`; `I.2/potentially-barsotti-tate-lifting` at the auxiliary odd prime; AutomorphicFormsOnReductiveGroups §§7.4–7.6; HilbertModularVarietiesAndShimuraCurves §§H6.2–H6.5, H6.9 and R18.3; AutomorphicGaloisRepresentations §§6.8–6.12 for the quaternionic dyadic tower; for the odd-prime unitary tower `R33.1/rank-two-unitary-irreducibility`, AutomorphicGaloisRepresentationsPartII AG2.0, AG2.3 and AG2.6, EndoscopicTransferAndUnitaryTraceComparison §§13.1 and 13.4, IntegralHeckeAndGaloisDeterminants Layers 0–1 and AutomorphicGaloisRepresentations §6.9; GlobalGaloisDeformations R04.5–R04.6 and Layer G7; LocalGaloisDeformationRings §§3.1–3.10.

**Checks.**

- For the definite unitary tower over a CM field `F` with `p` split, the Galois input is `ρ_𝔪 : G_F → GL₂(𝕋_𝔪)` with its polarization over `F⁺`; the quaternionic Hecke representations of the totally real field `F⁺` do not supply it. At a residually reducible (Eisenstein) maximal ideal the glued traces give only a determinant law, with no `GL₂(𝕋_𝔪)`-valued lift; the absolute irreducibility of `ρ̄` is what yields the representation.

**Twist-two vanishing for totally real fields** (`R33.1/twist-two-vanishing`). Let `p ≥ 5`, let `E/ℚ_p` be finite with ring of integers `𝒪`, let `L` be a totally real number field and `S` a finite set of places of `L` containing the places above `p`. Then `H²(G_{L,S}, (E/𝒪)(2))^∨ ⊗ E = 0`. When `S` is the set of places above `p` this is Lichtenbaum's theorem; that theorem and its passage to every finite `S` are both part of this target. In Pan's residually reducible lifting argument the vanishing bounds the reducible locus.
Source: [Pan], Lemma 7.4.15 with the discussion before it, pp. 119–120.
*Needs:* ArithmeticGaloisDuality §§R02.4.4 and R02.5.

**Checks.**

- Over `L = ℚ`, `E = ℚ_p` and `S = {p}` the twist-two vanishing is the statement for the `p`-integers of `ℚ`; enlarging `S` by a prime `w ≠ p` is a separate instance, which the target must supply.

### Examples

The isobaric sum of two conjugate-self-dual Hecke characters with distinct infinity types has reducible Galois representation and is not cuspidal; at a residually reducible maximal ideal the glued traces give only a determinant law. Over `ℚ` with `S = {p}` the twist-two vanishing concerns the `p`-integers of `ℚ`.

### Dependencies

The globalization uses Moret-Bailly's theorem and controlled residual potential modularity from Layer I. The odd-prime unitary tower takes its Galois input from AutomorphicGaloisRepresentationsPartII and the polarized problems of GlobalGaloisDeformations Layer G7. The twist-two vanishing rests on the Galois cohomology of ArithmeticGaloisDuality.

## Worked examples

The following worked Checks distinguish the statements and conventions from plausible alternatives.

- **Auxiliary primes.** For `p = 5, q = 409` satisfies `409 ≡ 1 (mod 8), ≡ 1 (mod 3), ≡ −1 (mod 5)`. For `p′ = q = 13, N = 406561` is prime, `≡ 1` modulo `8, 3, 5, 7, 11` and `≡ −1 (mod 13)`. `−1` is a square modulo `5` and `13 (2² + 1 ≡ 0, 5² + 1 ≡ 0)`.
- **Dyadic Dickson refinement.** An element `g` of `2`-power order of `GL₂(𝔽̄₂)` is unipotent `((g − 1)^{2^n} = g^{2^n} − 1 = 0)`, so `(g − 1)² = 0` and `g` has order at most `2`; the same holds in `PGL₂(𝔽̄₂)`, and since `S₄` has elements of order `4` it is not a projective image in characteristic two. The Borel subgroup of `PGL₂(𝔽₄)` has order `12 = |A₄|` while `|PGL₂(𝔽₄)| = 60 = |A₅|`.

## Corrections to the sources

Every target above uses the corrected statement.

- [Ri], proof of Proposition 2.2, p. 280 (dihedral case): the subgroup containing the cyclic inertia image is the index-two rotation subgroup, not the centre, which has at most two elements.
- [Sa], Theorem 6.12(4) of the published version, case `i = 1`: in the exceptional case `m = 1 + (p + 1)j` the characters `ω₂^{m+p}` and `ω₂^{pm+1}` coincide and have niveau one, and the residual representation is split; the author corrects the published lattice statement in Remark 1.7 of arXiv v3, p. 4. Only Theorem 6.11, Corollary 6.15 and Remark 6.17 of v3 are used.

## Source notes

- [Kh] is cited in the page numbers of arXiv v1. It was published, with a different title, in Duke Math. J. 134 (2006).
- [KW-I] is cited in the running page numbers (2–21) of the authors' preprint, not the Inventiones pages. Its Theorems 4.1 and 5.1 are proved in the sequel, Khare–Wintenberger, Serre's modularity conjecture (II), Invent. Math. 178 (2009), 505–586; this roadmap uses them as stated, through Input I.2 and Input I.3.
- [DP] is cited in the pages of arXiv v2.
- [BM] is cited in the running pages of the authors' copy. Proposition 6.1.1 concerns the nonscalar principal-series type `ω_p^i ⊕ 1, 1 ≤ i ≤ p − 2`, with Hodge–Tate weights `{0, 1}` and any stable lattice, without an `End(ρ̄) = 𝔽` condition; the paper leaves out the details of its computation, which the integral classification of `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5` supplies.
- [Ki2] is cited by its locator only: Kisin's dyadic Barsotti–Tate paper is available only behind a paywall and as a device-independent file, so Hypothesis `(H)` is stated here as [KW-I] states it, with [KW-II] §9 for the dyadic patching. Lichtenbaum's twist-two vanishing is cited through [Pan], Lemma 7.4.15, which names it and its needed extension.
- The residually dihedral ordinary branch for `ρ̄` induced from `ℚ(√−p)` rests on the full-scope ordinary lifting target of Input I.1. Khare–Wintenberger refer to Skinner's unpublished correction; the corrected dihedral deformation argument is part of that target. A lifting theorem excluding induction from an imaginary quadratic field cannot supply this branch.

## Suggested Lean forms

[`Suggested.lean`](Suggested.lean) uses the namespace `TauCetiRoadmap.ClassicalSerreModularity`. Its theorem statement is `lemma_8_2` (R27.1), the positive density of auxiliary primes. Its definitions are the arithmetic interfaces of the statements of Serre's conjecture, which SerreModularityByCompatibleSystems states with the same definitions.

The aliases `GQ`, `IntBar` and `FpBar` use native Mathlib carriers. The definitions `IsFrobAt`, `IsUnramifiedAt`, `IsOdd`, `IsAbsIrreducible` and `IsSType` express the arithmetic hypotheses; `coeff`, `coefficientRing` and `ArisesFrom` express residual attachment on `HeckeRing.GL2.Newform`; `toRepresentation` supplies Mathlib's semisimplicity predicate with the actual matrix action. The auxiliary-prime theorem uses `IsProjConj`, `primesOfRat` and `auxiliaryPrimes` to state its projective-image and density conditions.

The prescribed-lift, ordinary and crystalline lifting and compatible-system statements require the arithmetic carriers and local period conditions specified by their suppliers. These targets, their APIs and their Checks are specified in the corresponding layers above.

## Scope and ownership

### Owned here

- The rational-field Khare–Wintenberger constructions of Layer I: Moret-Bailly's theorem, soluble totally real extensions with prescribed completions and controlled residual potential modularity in I.0; the nearly ordinary Hecke algebras, pseudo-deformation rings and pro-modularity argument of Skinner–Wiles and the two ordinary lifting theorems over `ℚ` in I.1; arithmetic global finiteness and point extraction, the potentially Barsotti–Tate lifting theorem with Hypothesis `(H)`, and Khare–Wintenberger's Theorem 4.1 in I.2; the four prescribed lifts, families through those lifts, and residual links with their lifting hypotheses in I.3. These are shared exports. Representation, deformation, patching and compatibility interfaces come from the named suppliers. The full-scope ordinary dihedral argument and the globalisation independence requirement are included as proof targets.
- Böckle's presentation and auxiliary-to-minimal deduction for minimal deformation rings (R26.1).
- The good-dihedral predicate of Khare–Wintenberger Definition 2.1, its image lemma, Khare–Wintenberger Lemmas 6.1 and 6.2 (solvable dyadic images are dihedral; dihedral modularity at the optimal weight and level; the weights of bad-dihedral representations), and the Chebotarev choice of auxiliary primes (R27.1).
- Rank-two irreducibility for conjugate-self-dual forms over CM fields, the globalization of a local residual representation with the Hecke-valued representation of its definite unitary tower, and twist-two vanishing for totally real fields (R33.1).

### Arithmetic and geometric boundaries

| Owner | Interface used here |
| --- | --- |
| ArithmeticGaloisRepresentations Layers 1–5 and [§6.1](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation) | Continuous representations of `G_ℚ` and of local Galois groups, lattices and reduction, inertia and Frobenius, local class field theory for characters, the Artin conductor with its wild part and monodromy term, Dickson's classification with the dyadic refinement, bad-dihedral representations, recognition by characteristic polynomials, and the basis-free elliptic action `TateModule.residualRep E p` with its scalar extension and matrix realization. |
| DeformationAndDerivedPatchingAlgebra §§1.9, 3.4–3.5 and 3.14 | Finite-equation continuous formal presentations, regular-sequence ideals, absolute local complete intersections, dimension and flatness criteria, and the formal/relative comparison. I.2 specializes these shared interfaces to the coefficient DVR and the arithmetic deformation rings. |
| GlobalGaloisDeformations R04.3 and R04.6 §§6.7–6.8, Layer G7, and LocalGaloisDeformationRings Layers 2 and 8 | The local-to-global presentation of global deformation rings; Layer G7's polarized deformation problems with `𝒢₂`-valued lifts and their Taylor–Wiles data, for the unitary tower of R33.1; `HeckeGaloisDatum` and its unframed classifying surjection `R → T`, with trace generation and the prescribed local and determinant conditions; reconstruction from jointly injective characteristic-zero points; minimally ramified local lifting rings; the crystalline, ordinary, endpoint and Barsotti–Tate exports at `p` with their dimensions; the exports at `ℓ ≠ p`, including the level-two inertia-rigid condition. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24a, R07.3–R07.5 and R07.5.6a | `GaloisModel`, `HasFiniteFlatModel` and the coefficient-independent `IsFiniteFlatResidual` at odd `p`; Fontaine–Laffaille tame inertia weights, the crystalline Hodge–Tate `{0,1}` to Barsotti–Tate comparison, and the integral classification of Breuil–Mézard and Savitt for tame potentially Barsotti–Tate types. |
| AlgebraicModularFormsAndSerreWeights R15.1–R15.6, including §7.5 (S-type and modularity predicates) | Katz forms and their analytic comparison, base change and finite generation of spaces of forms, Hecke operators with torsion coefficients, the Deligne–Serre lifting lemma, Serre's local weight recipe including `p = 2`, the bad-dihedral weight lemma, and the definitions of S-type, `N(ρ̄), k(ρ̄), ε(ρ̄)`, and §7.5's `ArisesFrom` and `IsModular`, with the integral-model and coefficient-prime comparisons. |
| `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6` | Langlands–Tunnell and Rohrlich–Tunnell: solvable and dyadic dihedral residual modularity. |
| `AlgebraicModularFormsAndSerreWeights §R15.5A.3` | The Deligne–Serre representation of a weight-one eigenform. |
| SerreWeightAndLevelOptimisation Layers 3–6 | `θ`-operators, Edixhoven's weight theorem, Gross's companion forms and the local shape of ordinary and supersingular eigenforms; Carayol's change of nebentypus; Buzzard's dyadic level lowering and the dyadic multiplicity-one obstruction; Ribet–Edixhoven optimisation. |
| SmallRamificationAndAbelianVarietyBaseCases §§5.0b–5.0e and 5.1–5.4 | `GL₂`-type abelian varieties with descent, Snowden's realisation and reduction control. §5.0d owns the arbitrary-rank raw carrier `AutomorphicSystemData`, its operations and Frobenius/Weil–Deligne and Hodge-sign adapters, and its marked rank-two specialization `ArithmeticCompatibleFamily`; §§5.1–5.4 supply marked isogeny and base-change transports for the realizations. AutomorphicGaloisRepresentations §7.1 supplies the almost-strict predicate on these shared data. |
| [Chebotarev, Layer 10][cheb] | Dirichlet density of the primes whose Frobenius lies in a given union of conjugacy classes, and infinitude of every Frobenius class. |
| [ClassFieldTheory, Layer 13][cft] | Kronecker–Weber and the classification of abelian characters by conductor. |
| [ModularForms, Layers 4–5][mf] | Layer 4 supplies primitive/newform decomposition and the conductor; Layer 5 supplies fixed-space and cross-level strong multiplicity one, including weight one. |
| AutomorphicGaloisRepresentations §§3.10–3.14, 4.4, 4.7, 6.8–6.12, 7.1 and 7.3 | Algebraic Hecke characters of de Rham characters (§3.13), the henselian reconstruction of a Hecke representation from a determinant law with absolutely irreducible residual (§6.9), general-weight Hilbert attachments, their arithmetic-dual normalization, Hodge–Tate and local Weil–Deligne comparisons, the integral Hecke-valued arithmetic representation with conditions on the whole family for GlobalGaloisDeformations R04.6's classifying map, the almost-strict predicate and transport API on shared system data (§7.1), and fixed-eigenform compatible families. |
| AutomorphicFormsOnReductiveGroups §§7.4–7.6 | Algebraic modular forms with their coefficient action, finite-stabilizer and coefficient comparisons, and central-character spaces; R33.1 specializes these to its definite unitary tower. |
| AutomorphicGaloisRepresentationsPartII AG2.0, AG2.3 and AG2.6; EndoscopicTransferAndUnitaryTraceComparison §§13.1 and 13.4; IntegralHeckeAndGaloisDeterminants Layers 0–1 | Weak base change from definite unitary groups to `GLₙ` over CM fields; good-place attachment and conjugate-self-dual existence over CM fields; de Rham labels and Weil–Deligne comparison at the coefficient prime, the latter under AG2.6's extreme-regularity irreducibility hypothesis, which `R33.1/rank-two-unitary-irreducibility` proves in rank two; determinant laws and semisimple reconstruction. R33.1 builds from these the Hecke-valued representation of its unitary tower. |
| AutomorphicLFunctionsAndLocalFactors AL.3 | Strong multiplicity one for isobaric sums. |
| HilbertModularVarietiesAndShimuraCurves H1, §§H6.2–H6.5, H6.9 and R18.3 | The HBAV moduli problem, paired torsion twist, selected geometrically irreducible component and real and finite local loci under the supplier's input hypotheses; integral quaternionic Hecke modules and algebras. |

Each change of prime in the proofs below checks the exact contract of the supplier it uses: the residual image condition, the local type, the coefficient field and the ramification set. A weight recipe never stands in for the integral classification, and a solvable image never stands in for ordinarity.

### Consumers and boundaries

- SerreModularityByCompatibleSystems consumes Layer I, the early targets and the Dickson–Lemma 6.2 package of R27.1, and `R33.1/global-arithmetic-action` and `R33.1/twist-two-vanishing`, to prove Serre's conjecture with its consequences; its `Suggested.lean` repeats this roadmap's arithmetic interfaces.
- The totally real ordinary and lifting theorems of OrdinaryAutomorphicFormsAndModularityLifting and GL2ModularityLifting are compared, in those roadmaps, with §I.1 and `I.2/same-weight-crystalline-lifting`; Layer I is proved here from the suppliers named in its targets, and the Moret-Bailly development of PotentialModularityAndCompatibleSystems Layer 2 is a consumer of `I.0/moret-bailly-split-points`.
- PotentialModularityAndCompatibleSystems, whose rank-two definite-unitary theory generalizes it, and PotentialAutomorphyInfrastructurePartII use the Hecke-valued representation of the definite unitary tower of `R33.1/global-arithmetic-action`. GL2ModularityLifting uses `R33.1/twist-two-vanishing` for its hypothesis LC when `p ≥ 5`.
- PotentialModularityAndCompatibleSystems uses `I.2/full-kw-global-finiteness` and I.2's characteristic-zero point extraction for its Layers 8–10; `I.3/prescribed-lifts` for its §§10.5–10.9; `I.3/families-through-prescribed-lifts` for its §12.4; and `I.3/residual-links-and-modularity-transfer` for the classical branch of its §13.3. It owns the additional base-field and rank generalizations, the all-place strict-family upgrades and the transfers with additional de Rham lifting hypotheses; these retain their stronger hypotheses. The generic presentation and complete-intersection interfaces remain with DeformationAndDerivedPatchingAlgebra.

### Outside this roadmap

Serre's conjecture and its consequences are proved in SerreModularityByCompatibleSystems. Other base fields beyond the totally real auxiliary fields of Layer I, representations of dimension greater than two, the general construction of attached Galois representations, the local classifications and the deformation rings are owned by the suppliers above; the modularity lifting, potential modularity and ordinary lifting theorems over `ℚ` that the proofs use are targets of Layer I.

## Exact supplier contracts

Use Mathlib and Tau Ceti at the pinned revisions. The following declarations are used as they stand.

| Declaration | Use |
| --- | --- |
| `Matrix.GeneralLinearGroup` | `GL₂` of the coefficient ring. |
| `AlgebraicClosure`, `AlgEquiv`, Krull topology | `G_ℚ = AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, the body of `Field.absoluteGaloisGroup ℚ`, used unfolded so that its actions on algebraic integers apply, and its topology. |
| `IsArithFrobAt`, `Ideal.inertia` | Frobenius elements and inertia groups at primes of the algebraic integers. |
| `NumberField.ComplexEmbedding.IsConj` | Complex conjugations. |
| `NumberField.Set.HasDirichletDensity` | Dirichlet density of a set of primes. |
| `NumberField.Chebotarev.frobeniusPrimeSet`, `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean`, `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean`) | For a finite Galois extension of number fields, density `#C/#G` and infinitude for each conjugacy class `C`. `lemma_8_2` uses finite unions of these classes in `MC/ℚ`, through `primesOfRat`. |
| `Nat.maxPrimeFac`, `Nat.maxPrimeFac_one`, `Nat.isGreatest_maxPrimeFac`, `Nat.maxPrimeFac_mul`, `Nat.maxPrimeFac_pow` | `Q(n)` and its API: `Q(mn) = max(Q(m), Q(n))` for `m, n ≠ 0, Q(n^e) = Q(n)` for `e ≠ 0`. |
| `ModularForm`, `CuspForm`, `DirichletCharacter` | The analytic carriers; the attached Galois representations are supplied by other roadmaps. |

In Tau Ceti, `HeckeRing.GL2.Newform` has level and weight parameters, a nebentypus character, newness and normalisation `a₁ = 1`, and `TauCeti.AlgebraicGeometry.AbelianVariety` is a proper geometrically integral group scheme over a field. Neither is redefined by the roadmap; Use `HeckeRing.GL2.Newform N k` directly at a positive level `N` and integer weight `k`; its residual and characteristic-zero Galois attachments are supplied separately by their owning roadmaps. Neither library contains residual Galois representations with their conductor and Serre weight, compatible systems, or any of the theorems below.

Use Mathlib `Representation.invariants` from `Mathlib/RepresentationTheory/Invariants.lean` for fixed submodules, `Representation.IsIrreducible` from `Mathlib/RepresentationTheory/Irreducible.lean` for ordinary irreducibility, and `Matrix.GeneralLinearGroup.map` from `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` for residual and fraction-field matrix actions. These retain the given coefficient ring and source group; the finite-image reduction theorems require the image order invertible in the residue field. The Eisenstein-integer and two-by-two matrix coordinate arithmetic is replaced by the existing ring and matrix operations.

Use `HeckeRing.GL2.Newform.qExpansion_coeff_one` and `HeckeRing.GL2.Newform.dirichletLift` from `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean` for normalization and the Dirichlet-character extension of the existing nebentypus. The integer weight parameter accommodates weight one directly. AlgebraicModularFormsAndSerreWeights §§R15.5A.2–R15.5A.3 and R15.6 supply the Galois and residual attachments with a chosen coefficient place; the analytic carrier by itself contains neither.

Use `TauCeti.localCyclotomicCharacter` and `TauCeti.localCyclotomicCharacter_apply` from `TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean` for the `p`-adic cyclotomic character on the absolute Galois group of a field. LocalGaloisGroups Layer 0 supplies its local arithmetic comparisons; LocalFieldsRamification Layer 4 supplies the tame frame, and ClassFieldTheory Layer 7 supplies local reciprocity. These supply the local-character and tame-group comparisons used in the rank-two constructions.

## References

- [TuA] S.-N. Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_Qp*, [arXiv:1803.07451v4](https://arxiv.org/abs/1803.07451v4); locators use this version.
- [TuB] S.-N. Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, [arXiv:1908.06174v3](https://arxiv.org/abs/1908.06174v3); locators use this version.
- [BLGGT] T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Potential automorphy and change of weight*, Ann. of Math. 179 (2014), 501–609; [arXiv:1010.2561v4](https://arxiv.org/abs/1010.2561v4); locators use the pages of this version.

- [Ki] M. Kisin, *Modularity for some geometric Galois representations*, in *L-functions and Galois representations*, London Math. Soc. Lecture Note Ser. 320 (2007), 438–470; [author's version](https://people.math.harvard.edu/~kisin/dvifiles/dur.dvi), Proposition (3.13) and Theorem (3.14).
- [KW-II] C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586; [authors' preprint](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf).
- [KiFF] M. Kisin, *Moduli of finite flat group schemes, and modularity*, [Ann. of Math. 170 (2009), 1085–1180](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf).
- [Ki2] M. Kisin, *Modularity of 2-adic Barsotti–Tate representations*, Invent. Math. 178 (2009), 587–634, [doi:10.1007/s00222-009-0207-5](https://doi.org/10.1007/s00222-009-0207-5) (cited by locator).
- [MB] L. Moret-Bailly, *Groupes de Picard et problèmes de Skolem. II*, [Ann. Sci. École Norm. Sup. (4) 22 (1989), 181–194](https://www.numdam.org/item/ASENS_1989_4_22_2_181_0/).
- [Pan] L. Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, J. Amer. Math. Soc. 35 (2022); [arXiv:1901.07166v2](https://arxiv.org/abs/1901.07166v2) (cited in the pages of arXiv v2).
- [SW99] C. Skinner and A. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999), 5–126; [version of record](https://www.numdam.org/item/PMIHES_1999__89__5_0/).
- [SW01] C. Skinner and A. Wiles, *Nearly ordinary deformations of irreducible residual representations*, Ann. Fac. Sci. Toulouse 10 (2001), 185–215; [version of record](https://www.numdam.org/item/AFST_2001_6_10_1_185_0/).

- [Kh] C. Khare, *On Serre's modularity conjecture for 2-dimensional `mod p` representations of `Gal(ℚ̄/ℚ)` unramified outside `p`*, [arXiv:math/0504080v1][kh] (2005); published as *Serre's modularity conjecture: the level one case*, Duke Math. J. 134 (2006), 557–589.
- [KW-I] C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504; [authors' preprint][kw1].
- [KW-Ann] C. Khare and J.-P. Wintenberger, *On Serre's conjecture for 2-dimensional `mod p` representations of `Gal(ℚ̄/ℚ)`*, [Ann. of Math. 169 (2009), 229–253][kwann].
- [Bö] G. Böckle, *Appendix 1: On the isomorphism `R_∅ → T_∅`*, appendix to C. Khare, *On isomorphisms between deformation rings and Hecke rings*, Invent. Math. 154 (2003), 199–222; [author's file][bo].
- [Sa] D. Savitt, *On a conjecture of Conrad, Diamond, and Taylor*, Duke Math. J. 128 (2005), no. 1, 141–197; corrected version [arXiv:math/0404327v3][sa] (2010).
- [BM] C. Breuil and A. Mézard, *Multiplicités modulaires et représentations de `GL₂(ℤ_p)` et de `Gal(ℚ̄_p/ℚ_p)` en `ℓ = p`*, Duke Math. J. 115 (2002), 205–310; [authors' copy][bm].
- [DP] L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's Conjectures*, [arXiv:2108.07577v2][dp] (2022).
- [Ri] K. A. Ribet, *Images of semistable Galois representations*, [Pacific J. Math. 181 (1997), no. 3, 277–297][ri].

Neighbouring Tau Ceti roadmaps: [Chebotarev][cheb], [ClassFieldTheory][cft], [ModularForms][mf].

[kh]: https://arxiv.org/abs/math/0504080v1
[kw1]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[kwann]: https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf
[bo]: https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf
[sa]: https://arxiv.org/abs/math/0404327v3
[bm]: https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf
[dp]: https://arxiv.org/abs/2108.07577v2
[ri]: https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf
[cheb]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev
[cft]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ClassFieldTheory/README.md#layer-13-norm-theorems-and-class-fields
[mf]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-4-eigenforms-newforms-primitive-forms-the-conductor
