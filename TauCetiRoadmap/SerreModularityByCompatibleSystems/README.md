# Roadmap: Serre's modularity conjecture by compatible systems

**Summary.** Serre's modularity conjecture predicts that every odd, irreducible two-dimensional representation of the absolute Galois group of `ℚ` over a finite field comes from a modular form, and it predicts the weight, the level and the character of that form. This roadmap proves the conjecture in that strong form. Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous, odd and absolutely irreducible. Then `ρ̄` arises from a normalised newform of weight `k(ρ̄)`, level `N(ρ̄)` and a character lifting `ε(ρ̄)`: there are such a newform `f`, a prime `λ` above `p` of its coefficient field, and an isomorphism between `ρ̄` and the reduction of `ρ_{f,λ}`. Here `N(ρ̄)` is the Artin conductor of `ρ̄` away from `p`, `k(ρ̄)` is Serre's weight and `ε(ρ̄)` is the character that makes `det ρ̄` equal to `ε(ρ̄)` times a power of the cyclotomic character. Every prime `p` is included, `p = 2` among them. The theorem is Khare and Wintenberger's; the proof here is the simplified one of Dieulefait and Pacetti.

The proof first shows that `ρ̄` is modular of some weight and level. For odd `p` and solvable image this is Langlands–Tunnell. Otherwise a lift of `ρ̄` is placed in an almost strictly compatible system of `ℓ`-adic representations, and a chain of such systems is built, each congruent to the next at one prime. Along the chain the weight is first brought to two, an auxiliary good-dihedral prime is added to keep the residual images large, and then the primes of the level are removed one at a time: the odd ones, the prime two after a change of local type, and finally the auxiliary prime. The chain ends in a system unramified outside `5`, whose member at `5` is modular by the theorems of Serre and Schoof on representations and abelian varieties with little ramification. Modularity travels back along the chain by modularity lifting theorems: the de Rham theorems of Kisin, Paškūnas, Hu–Tan and Tung for residually irreducible members, and Pan's theorem and the Skinner–Wiles theorem for residually reducible ones. Characteristic two is reduced to odd characteristic through an auxiliary odd prime.

The second step reaches the optimal weight and level: for odd `p`, and for `p = 2` with Serre weight two, by minimal lifts and Khare and Wintenberger's lifting theorem, including the scalar dyadic case that the sources leave unwritten. For `p = 2` with Serre weight four it uses dyadic level lowering. Several consequences follow. For `p ≥ 5`, an odd, absolutely irreducible residual representation that is finite at `p`, in the sense of finite flat group schemes, and has cyclotomic determinant comes from a weight-two newform of level `N(ρ̄)` with trivial character. Every odd, irreducible, regular compatible system of two-dimensional representations of `G_ℚ` comes, after a twist, from a newform of weight at least two. Every odd irreducible two-dimensional Artin representation of `G_ℚ` is the representation attached to a weight-one newform. In level one the odd, absolutely irreducible representations come from cusp forms of level one, and for each `p` there are, up to isomorphism, only finitely many continuous odd semisimple representations `G_ℚ → GL₂(𝔽̄_p)` unramified outside `p`.

Serre's conjecture is not assumed anywhere. Each lifting theorem is used in the form that assumes the residual representation modular, and the auxiliary global representations inside their proofs come from potential modularity; one target of the roadmap records this check.

The roadmap builds on ClassicalSerreModularity, which provides potential modularity, lifts with prescribed local behaviour and the compatible systems through them, Khare and Wintenberger's lifting theorems and good-dihedral primes. GL2ModularityLifting proves the de Rham lifting theorems over totally real fields, with their cases over `ℚ`, under named hypotheses, and CompletedCohomologyAndLocalGlobalCompatibility proves the patched-module and Breuil–Mézard theorems that discharge those hypotheses. SmallRamificationAndAbelianVarietyBaseCases provides the base cases, and SerreWeightAndLevelOptimisation the optimisation of weight and level.

Layer S1 states the target and the lifting theorems and takes the first step of the chain. Layers S2 and S3 add the auxiliary prime and remove the odd primes and the prime two from the level. Layer S4 reaches characteristic five and proves the conjecture in odd characteristic, and Layer S5 treats characteristic two and checks independence from Serre's conjecture. Layer S6 proves the strong form, and Layer S7 draws the consequences.

Headline statements in [`Suggested.lean`](Suggested.lean) express qualitative Serre modularity, the level-one case in some weight at least two, the finiteness of level-one representations, and Artin weight-one modularity, on the newform and Galois carriers of ClassicalSerreModularity.

## Conventions

### Representations, invariants and systems

Residual representations, representations of S-type (continuous, odd and absolutely irreducible), Serre's invariants `N(ρ̄)`, `k(ρ̄)` and `ε(ρ̄)`, the relations *arises from* and *modular*, minimal lifts, almost strictly compatible systems and the local types at an auxiliary prime (the field `ℚ_{N²}`, niveau two, bad dihedral) are those of ClassicalSerreModularity Conventions §§2.1–2.3 and 2.5. Dieulefait–Pacetti phrase modularity with an eigenform in `S_k(Γ₀(N), ε), k ≥ 2`; `S6/two-notions-of-modularity-agree` proves the two notions equivalent, so the roadmap has one notion of modularity.

Minimality is that of ClassicalSerreModularity §2.3, which is stronger than "unramified wherever `ρ̄` is unramified"; the type-preservation steps of Layers S2–S3 need the stronger notion (Corrections to the sources). The targets of Layers S3 and S5 say which clause of almost strict compatibility each step uses. In the chain of compatible systems `q` is the coefficient characteristic and `N` an auxiliary rational prime, not the level `N(ρ̄)`. Dieulefait–Pacetti divide the chain into six steps, Paso 1 to Paso 6 ([DP], §2, pp. 10–14). The text cites these steps, and Dieulefait–Pacetti's numbered theorems, lemmas and remarks, by the source's numbers; the milestones of Layers S1–S4 pair each step and each lemma of §2 with the target that proves it.

### Finiteness at `p` and elliptic torsion

For `p ≥ 5`, finiteness at `p` is the supplier's `IsFiniteFlatResidual` from FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.6a, using `GaloisModel` and `HasFiniteFlatModel` of §R07.1.24a. It asserts that a finite coefficient model of the actual local representation has a finite flat commutative group scheme over `ℤ_p`, its coefficient-field action and a coefficient-linear Galois-equivariant points identification. The supplier proves independence of the model and invariance under finite coefficient extension; finite flatness of the semisimplification alone does not suffice. This interface is specified here in the README.

For an elliptic curve `E/ℚ`, `ρ̄_{E,p}` is supplied by ArithmeticGaloisRepresentations §6.1, [Basis-free elliptic residual representation](../ArithmeticGaloisRepresentations/README.md#elliptic-residual-representation): use `TateModule.residualRep E p` on the native geometric `p`-torsion, extend scalars from `ZMod p` to `𝔽̄_p`, and choose a basis for its matrix realization. Its trace, determinant and attachment are independent of that basis. This is the residual action to which the finite-flat weight-two case of S7 applies.

### Lean spellings

The Lean spellings `GQ`, `IntBar`, `FpBar`, `IsFrobAt`, `IsUnramifiedAt`, `IsOdd`, `IsAbsIrreducible`, `IsSType`, `coeff`, `coefficientRing`, `ArisesFrom` and `toRepresentation` are those specified, with their Checks, in ClassicalSerreModularity's Arithmetic interfaces for the theorem statements; `Suggested.lean` repeats their definitions unchanged in its own namespace.

The auxiliary level for the geometric weight-one construction is `N′ = N` if `N ≥ 5`, and `N′ = 5N` otherwise. Its API gives divisibility `N ∣ N′`, the two branches, and `N′ ≥ 5` for positive `N`, which is the level hypothesis of `S7/weight-one-reduction-is-onto-for-almost-all-primes`.

**Checks.**

- For `N = 1,4,5,11` it gives `5,20,5,11`.
- At `N = 0` it gives `0`, so the lower bound requires positivity.
- At `N = 4`, replacing multiplication by a maximum would give `5`, for which `4 ∤ 5`, instead of `20`.

## Layer S1: The qualitative target, the lifting theorems and the first weight change

*Milestones:* Serre's conjecture, weak form; the lifting theorems over `ℚ`; Paso 1, the change to a weight-two system.

The chain proves modularity of every odd irreducible `ρ̄` without weight reduction and without an induction on the conductor. Its inputs are lift existence (Dieulefait–Pacetti Theorem 1.9, whose cases `(1)–(3)` are Khare–Wintenberger Theorem 5.1), almost strictly compatible systems (Theorem 1.11, Dieulefait), the lifting theorems `1.4–1.7`, Langlands–Tunnell and Rohrlich–Tunnell, and the base cases of Tate, Serre and Schoof. From ClassicalSerreModularity it uses Layer I, the definition of good-dihedral primes, Lemma 6.3, Lemma 8.2 and the Dickson–Lemma 6.2 package of R27.1, and the globalisations and twist-two vanishing of R33.1.

**The weak form and the solvable case** (`S1/weak-form-and-the-solvable-case`). Target: every odd continuous irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` is modular, `ρ̄ ≅ ρ̄_{f,p}` for an eigenform `f ∈ S_k(Γ₀(N), ε)`. Only forms of weight `k ≥ 2` are used: a representation congruent to that of a weight-one form is congruent to one of weight at least `2` (Deligne–Serre, §6.9). For `p` odd, solvable image is Theorem 1.3 (Langlands–Tunnell): by Dickson the projective image is cyclic, dihedral, `A₄` or `S₄, ρ̄` lifts to an odd complex representation, and that comes from a weight-one form. So in odd characteristic the target reduces to non-solvable image. At `p = 2` the solvable case is Rohrlich–Tunnell (Layer S5). Dieulefait–Pacetti take the passage from the weak to the strong form from the literature (Edixhoven for the weight; Ribet and Boston–Lenstra–Ribet for the level), which leaves the scalar dyadic case open; this roadmap obtains the passage in Layer S6, from `S6/strong-form-by-minimal-lifts` and the dyadic optimisation.
Source: [DP], Introduction and Remark 1, p. 1; Theorem 1.3, p. 3.
*Needs:* `GL2AutomorphicRepresentationsAndTransfer:R17.5`; AlgebraicModularFormsAndSerreWeights §5.10; AlgebraicModularFormsAndSerreWeights Layer 7; `ArithmeticGaloisRepresentations Layer 4`.

**The lifting theorems over `ℚ`** (`S1/lifting-theorems-over-the-rationals`). Let `ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p)` be continuous, odd, finitely ramified and de Rham at `p` with Hodge–Tate weights `{0, k − 1}` and `{0, k′ − 1}, k, k′ > 1`, with isomorphic residual representations. If `p` is odd and `ρ̄|_{G_{ℚ(√p*)}}` is absolutely irreducible (Theorem 1.4), or `p = 2` and `ρ̄` has non-solvable image (Theorem 1.5), then `ρ` is modular if and only if `ρ′` is. For residually reducible `ρ̄`: if `p ≥ 5` and `ρ` is irreducible, `ρ` is modular (Theorem 1.6); if `p = 3`, `ρ` is irreducible, `ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃}` is of the form `(∗, ∗; 0, 1)` and `det ρ = ψχ₃^{k−1}` with `ψ` of finite order, `ρ` is modular (Theorem 1.7). These statements carry no further hypothesis.

Theorems 1.4–1.6 are GL2ModularityLifting §§12.1, 12.2 and 12.3, obtained there from its §§8.8, 9.3 and 10.15, the cases `F = ℚ` of its theorems §§8.7, 9.2 and 10.14 over totally real fields. Each is used in the form that assumes the residual representation modular, which is the form its proof establishes: Kisin's Corollary (2.2.17), Hu–Tan's Theorem 6.3 and Tung's Theorem 4.7 at odd `p`; Paškūnas's Theorem 1.1 and Tung's Theorem A at `p = 2`; Pan's Theorem 1.0.2 in the residually reducible case, where residual modularity is automatic. The forms that assume only that `ρ̄` is odd (Kisin's introduction theorem, Hu–Tan's Theorem 1.4, Tung's introduction theorem, Pan's Theorem 1.0.4) are derived in their sources from Khare–Wintenberger's theorem and are never used (GL2ModularityLifting §7.7). Theorem 1.7 is ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting` at `p = 3`, used along congruences as in GL2ModularityLifting §12.5.

GL2ModularityLifting proves §§8.8, 9.3 and 10.15 under its hypotheses LL1–LL3, CC1–CC5 and LC; here they are discharged. LL1, the Breuil–Mézard identities in cycle form, holds without condition in the cases of PadicLocalLanglandsForGL2Qp §§6.1–6.2; in the remaining cases, every local residual representation at `p = 3` and those with scalar semisimplification at `p ≥ 5`, it is CompletedCohomologyAndLocalGlobalCompatibility §5.4, which proves the identities of PadicLocalLanglandsForGL2Qp §6.3 from actual patched data, and at `p = 2` the dyadic identities are its §5.6. LL2 is PadicLocalLanglandsForGL2Qp §6.6. LL3 is PadicLocalLanglandsForGL2Qp §4.5, with CompletedCohomologyAndLocalGlobalCompatibility §6.3 for the potentially crystalline types that are not crystabelline. CC1–CC4 are the exports of CompletedCohomologyAndLocalGlobalCompatibility §6.6. CC5, the independence of the auxiliary globalisations from Serre's conjecture, is `S5/globalisation-dependency-check`: for `GL₂(ℚ_p)` the globalisations of CompletedCohomologyAndLocalGlobalCompatibility §§5.1 and 5.5 are those constructed from potential modularity in ClassicalSerreModularity `R33.1/global-arithmetic-action`, and the remaining inputs listed in its §6.5 do not assume Serre's conjecture. LC is used only for `p ≥ 5`, where it is ClassicalSerreModularity `R33.1/twist-two-vanishing`.

Each of these theorems is an instance of the lifting hypothesis of ClassicalSerreModularity `I.3/residual-links-and-modularity-transfer`. With Remark 4, that a compatible system is modular if one member is, they propagate modularity along every chain of systems below. The residual condition of Theorem 1.4 over `ℚ(√p*)` is equivalent to absolute irreducibility over `ℚ(ζ_p)` (Dieulefait–Pacetti Lemma 1.13). Each application below verifies the hypotheses listed in GL2ModularityLifting §8.9: the residual image, the Hodge–Tate weights, oddness, residual modularity or the congruence. Theorems 1.4–1.6 impose no ordinarity hypothesis. Theorem 1.7 requires characteristic-zero irreducibility, the stated ordinary inertia shape at `3`, the matching finite-order determinant factor and residual distinguishedness.
Theorem 1.7 is printed with a further condition, that `ρ|_{D₃}` is not the identity. In Skinner–Wiles' theorem, as ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting` states it, the condition is `χ̄|_{D₃} ≠ 1` for the nontrivial residual character `χ̄ = χ̄₃`; it holds automatically, since `χ̄₃` is ramified at `3`.
Source: [DP], Theorems 1.4–1.7, pp. 4–5, and the proof of Theorem 1.4, p. 4; Remark 4, p. 7; [KiFM], Corollary (2.2.17), p. 685; [HT], Theorem 6.3; [TuA], Theorem 4.7; [Paš16], Theorem 1.1; [TuB], Theorem A; [Pan], Theorem 1.0.2.
*Needs:* GL2ModularityLifting §§12.1–12.3 and 12.5, with §§8.8, 9.3 and 10.15; CompletedCohomologyAndLocalGlobalCompatibility §§5.4, 5.6, 6.3, 6.5 and 6.6; PadicLocalLanglandsForGL2Qp §§4.5, 6.1–6.2 and 6.6; ClassicalSerreModularity `I.1/residually-reducible-ordinary-lifting`, `R33.1/global-arithmetic-action`, `R33.1/twist-two-vanishing` and `I.3/residual-links-and-modularity-transfer`; `S5/globalisation-dependency-check`; `ArithmeticGaloisRepresentations Layer 4`.

**Checks.**

- A nonordinary crystalline lift satisfying Theorem 1.4's residual hypotheses still falls under that theorem.
- At `p = 3`, a residually reducible de Rham lift without the ordinary inertia shape does not meet Theorem 1.7's hypotheses.
- In Theorem 1.7, `χ̄₃|I₃ ≠ 1`, so the residual characters are distinguished; a scalar residual pair would fail this condition.
- The split representation `χ₃ ⊕ 1` is odd, crystalline of weights `{0,1}`, unramified outside `3`, distinguished and has determinant `χ₃`. Its invariant coordinate lines exclude it from Theorem 1.7; these other conditions alone cannot give a cuspidal newform.

**Residual-weight normalization transition** (`S1/residual-weight-normalization-transition`). Let `p` be odd and `ρ̄` of S-type. Choose `a ∈ ℤ` such that `τ̄ = ρ̄ ⊗ χ̄_p^a` has `2 ≤ k(τ̄) ≤ p+1`, using AlgebraicModularFormsAndSerreWeights §4.5 (invariance and renormalized twists). Let `θ` be the finite-order Teichmüller lift of the global character `χ̄_p^a`, unramified away from `p`. Let the preceding member `ρ_p` be continuous, odd, irreducible, finitely ramified and de Rham at `p` with Hodge–Tate weights `{0,h−1}`, `h ≥ 2`, with a chosen stable lattice reducing to `ρ̄`. Twist that lattice and member by `θ`; its reduction is the full representation `τ̄`. The twist preserves oddness, irreducibility and the Hodge–Tate weights of `ρ_p`, and is de Rham. Both residual and characteristic-zero modularity are invariant under these twists, by twisting forms and taking their primitive associates. On `G_{ℚ(μ_p)}` the residual twist is trivial, so cyclotomic absolute irreducibility is preserved; the projective image, bad-dihedral property and solvability of the residual image are preserved as well.

At every prime different from `p`, the inertia action, prime-to-`p` conductor and inertial type are unchanged; local Weil–Deligne parameters may acquire an unramified twist. In particular the good-dihedral type at `N ≠ p` is retained. Record `a`, `θ`, the residual character `ε(τ̄)` from `det τ̄ = ε(τ̄)χ̄_p^{k(τ̄)−1}`, and `det(ρ_p ⊗ θ) = (det ρ_p)θ²`. A subsequent crystalline lift of `τ̄` uses weight `k(τ̄)` and its matching prescribed determinant, namely `ε̂(τ̄)χ_p^{k(τ̄)−1}` for the minimal crystalline prescription, with `ε̂` the Teichmüller lift. This determinant need not equal that of the twisted preceding member, whose Hodge–Tate weights can differ. The two determinants reduce to the same residual determinant. The comparison with the new lift is a congruence for `τ̄`, after the recorded twist of the preceding member. Each link retains the twist, the congruence and the new system's weight and character.
Source: [DP], Remark 2, p. 5, Theorem 1.9(3), p. 6, and Theorem 1.4, p. 4; [Se87], §§2.7–2.9, pp. 188–191.
*Needs:* AlgebraicModularFormsAndSerreWeights Layer 4; ArithmeticGaloisRepresentations §§1.2 and 1.6–1.9; ModularForms Layer 9 (twists and primitive associates); the residual and characteristic-zero attachment comparisons of AlgebraicModularFormsAndSerreWeights Layers 6–7.

**Checks.**

- For `p ≥ 5`, split inertia `χ̄_p ⊕ χ̄_p²` has weight `p+3`, outside the weight range of ClassicalSerreModularity §I.3; taking `a=−1` gives `1 ⊕ χ̄_p` and weight two. A finite-order Teichmüller twist of a weight-two member keeps its Hodge–Tate weights `{0,1}` while producing this residual weight `p+3`.
- At `p=5`, niveau-two data `(1,3)` have weight nine; the twist by `χ̄₅⁻¹` gives `(0,2)` and weight three, in `[2,6]`.
- For `p ≠ N`, `θ|I_N=1`, so the two good-dihedral inertial characters remain exactly `κ ⊕ κ^N`; their Frobenius parameter may be multiplied by `θ(Frob_N)`.
- When a member has weights `{0,h−1}` and `h ≠ k(τ̄)`, twisting by `θ` retains `{0,h−1}`; only the replacement crystalline lift has weights `{0,k(τ̄)−1}`. Equating their characteristic-zero determinants would impose an unjustified condition.

**Fontaine–Laffaille members are not bad dihedral** (`S1/fontaine-laffaille-member-not-bad-dihedral`). Let `p` be odd and `ρ : G_ℚ → GL₂(ℚ̄_p)` crystalline at `p` with Hodge–Tate weights `{0, k − 1}, k ≥ 2`, and `p > 2k`. Then `k(ρ̄) = k`, and if `ρ̄` is irreducible it is not bad dihedral. Indeed a bad-dihedral `ρ̄` has `p = 2k(ρ̄) − 1` (niveau one) or `p = 2k(ρ̄) − 3` (niveau two) by Lemma 1.14, the statement of Khare–Wintenberger Lemma 6.2(ii): the projective image of `I_p` has order at most `2`; in niveau one `χ^{k−1}` has order `≤ 2` with `k ≤ p`, so `2k − 2 = p − 1` or `k = p`, and `k = p` makes the image of `I_p` trivial, which a bad-dihedral `ρ̄` excludes; in niveau two `ψ^{(k−1)(p−1)}` has order `(p + 1)/gcd(p + 1, k − 1)`, at most `2` only for `k − 1 = (p + 1)/2`. The uses are `(k, w)` with `w > 2k` in Paso 1, `(2, q)` with `q > 5` in Paso 2, and `(2, p)` with `p > 3` in characteristic two.
Source: [DP], Lemma 1.14, p. 8, and its proof, p. 9; Paso 1, p. 10.
*Needs:* AlgebraicModularFormsAndSerreWeights Layer 4; AlgebraicModularFormsAndSerreWeights §4.14; `ArithmeticGaloisRepresentations Layer 4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.9`.

**Solvable residual image ends the argument** (`S1/solvable-residual-termination`). Let `p ≥ 5` and `ρ : G_ℚ → GL₂(ℚ̄_p)` odd, irreducible, finitely ramified and de Rham at `p` with Hodge–Tate weights `{0, k − 1}, k > 1`, with `ρ̄` of solvable image and not bad dihedral. Then `ρ` is modular: if `ρ̄` is reducible by Theorem 1.6, if irreducible by Theorem 1.3 and then Theorem 1.4. This ends Paso 1 at `w`, Paso 2 at `q` and the reduction of characteristic two; `w > 2k ≥ 4` and `q > 5` provide `p ≥ 5`, and the previous target provides "not bad dihedral". `ρ` is irreducible as a member of an irreducible system.
Source: [DP], Paso 1, p. 10.
*Needs:* `S1/lifting-theorems-over-the-rationals`; `S1/weak-form-and-the-solvable-case`; `S1/fontaine-laffaille-member-not-bad-dihedral`.

**Change to a weight-two system** (`S1/weight-two-system`). Let `p` be odd and `ρ̄` odd irreducible with non-solvable image, twisted so that `2 ≤ k = k(ρ̄) ≤ p + 1`. Let `ρ^{(0)}` be a minimal crystalline lift (Theorem 1.9(3)) in an almost strictly compatible system (Theorem 1.11); non-solvable image gives the absolute irreducibility over `ℚ(ζ_p)` that both theorems need. Choose a prime `w > 2k` outside its ramification set. Then either `ρ^{(0)}_w`, and so `ρ̄`, is modular, or `ρ̄^{(0)}_w` has non-solvable image and there is an almost strictly compatible system `{ρ^{(1)}_ℓ}` with Hodge–Tate weights `{0, 1}`, containing a weight-two lift of `ρ̄^{(0)}_w` with the same ramification set (Theorem 1.9(4)), such that `ρ̄` is modular if and only if `{ρ^{(1)}_ℓ}` is. Write `S₁` for its ramification set; `w` may lie in `S₁`, since the new lift need not be crystalline at `w`.
Source: [DP], Paso 1, p. 10.
*Needs:* `S1/lifting-theorems-over-the-rationals`; `S1/fontaine-laffaille-member-not-bad-dihedral`; `S1/solvable-residual-termination`; ClassicalSerreModularity §I.3.

### Examples

For `p ≥ 5`, split inertia `χ̄_p ⊕ χ̄_p²` has weight `p + 3` and its twist by `χ̄_p^{−1}` has weight two; at `p = 5` the niveau-two data `(1, 3)` of weight nine twist to `(0, 2)` of weight three. A residually reducible de Rham lift at `3` without the ordinary inertia shape meets neither Theorem 1.6 nor Theorem 1.7.

### Dependencies

ClassicalSerreModularity Layer I supplies prescribed lifts and compatible systems. GL2ModularityLifting supplies the lifting theorems, CompletedCohomologyAndLocalGlobalCompatibility and PadicLocalLanglandsForGL2Qp the inputs that make them unconditional, and ClassicalSerreModularity R33.1 the globalisations and the twist-two vanishing.

## Layer S2: The good-dihedral prime and the odd level

*Milestones:* Paso 2, the good-dihedral prime `N`; Lemma 2.1, the residual images stay large; Paso 3, killing the odd part of the level.

**The dihedral local type at `N`** (`S2/dihedral-local-type-at-n`). Let `q` be an odd prime and `N` a prime with `q | N + 1` (so `q ∤ N − 1`). The unit group of `𝔽_{N²}` has order `N² − 1 = (N − 1)(N + 1)`, so by local class field theory there is a character `κ : G_{ℚ_{N²}} → ℤ̄_q^×` of order `q` whose restriction to `I_N` factors through `𝔽_{N²}^×` and not through `𝔽_N^×` (niveau two), normalised by `κ(Art(N)) = 1`. Its induction `τ_N = Ind_{G_{ℚ_{N²}}}^{G_{ℚ_N}} κ` is irreducible (`κ ≠ κ^N` as `q ∤ N − 1`), `τ_N|_{I_N} ≅ κ ⊕ κ^N`, and its image is dihedral of order `2q`. Without the normalisation, `κ(Art(N)) = ζ ≠ 1` is a scalar in the image, which then has order `2q²`; the projective image is dihedral of order `2q` in either case, and the inertial type depends only on `κ|_{I_N}`.
The *standard lattice* is `L_std = Ind 𝒪(κ)` over the integers `𝒪` of a finite extension of `ℚ_q` containing `μ_q`, with basis `e₁ = 1 ⊗ 1, e₂ = s ⊗ 1` for a Frobenius lift `s`. A tame generator `σ` acts by `diag(κ(σ), κ(σ)^N)` and `s` by `(0, 1; 1, 0)`: the transfer sends `s` to `s² = Art(Nu)` with `u` a unit, and `κ` is trivial on units of `ℤ_N` because `q ∤ N − 1`, so `κ(s²) = κ(Art(N)) = 1`. Since `𝔽̄_q^×` has no element of order `q, κ̄ = 1`, and `L_std` modulo the maximal ideal is `1 ⊕ η` with `η` the unramified quadratic character: unramified, with trace `0` at `Frob_N`. This residual statement is about `L_std` only. Every stable lattice has semisimplified reduction `1 ⊕ η`, but another stable lattice can reduce to a non-split extension with nontrivial unipotent inertia, as the lattice `L₁` of Layer S3 does at `(q, N) = (3, 2)`. With coefficients in `ℤ̄_p` for `p ≠ q` the reduction stays irreducible.
Source: [DP], Paso 2, p. 11 (with the two Paso 2 entries under Corrections to the sources, concerning the residue field and the inertia group).
*Needs:* `ArithmeticGaloisRepresentations Layer 2`; `ArithmeticGaloisRepresentations Layer 4`.

API of the full local construction, which needs the local Galois groups and characters of `ArithmeticGaloisRepresentations Layer 2`:

- The niveau-two character: `κ : G_{ℚ_{N²}} → 𝒪^×` of order `q` for `q | N + 1`, with `κ(Art(N)) = 1`; its order is `q`, `κ|_{I_N}` does not factor through `𝔽_N^×`, and `κ(Art(N)) = 1` is recorded as a lemma.
- The dihedral type: `τ_N = Ind κ : G_{ℚ_N} → GL₂(𝒪)` in the basis `e₁, e₂` of `L_std`; `τ_N` is irreducible, and so is its reduction modulo any prime `p ≠ q`.
- The standard lattice `L_std = 𝒪e₁ ⊕ 𝒪e₂`, with `σ ↦ diag(κ(σ), κ(σ)^N)` and `s ↦ (0, 1; 1, 0)`.
- Its reduction: `L_std/𝔪L_std ≅ 1 ⊕ η`, unramified with trace `0` at `Frob_N`.
- The semisimplified reduction: for every stable lattice `Λ`, `(Λ/𝔪Λ)^{ss} ≅ 1 ⊕ η`, while `Λ/𝔪Λ` itself depends on `Λ`.

**Checks.**

- `5² − 1 = 24 = 4 · 6` while `|𝔽₂₅| = 25`, so `(N − 1)(N + 1)` is the order of the unit group.
- `q = 7, N = 13: 7 | 14` and `7 ∤ 12`, so `κ` has niveau two.
- `q = 3, N = 7: 3 | 6 = N − 1`, so a character of order `3` of `I_N` factors through `𝔽₇^×, κ^N = κ` on `I_N`, and with `κ(Art(N)) = 1` the induction `Ind κ` is reducible.
- on `L_std, κ̄ = 1` and the trace of `Frob_N` on `1 ⊕ η` is `1 − 1 = 0`.
- Over any field of characteristic `2` the swap `(0, 1; 1, 0)` is a nonidentity unipotent and is not diagonalizable, so the split description `1 ⊕ η` of the residual standard lattice requires odd residue characteristic. No coefficient map from `𝒪 = ℤ_q[μ_q]` to a field of characteristic `2` exists, since `𝒪` is a `ℤ_q`-algebra with `q` odd.
- if `κ(Art(N)) = ζ ≠ 1`, the restriction of `Ind κ` to `G_{ℚ_{N²}}` maps onto `μ_q × μ_q` and `Ind κ` has image of order `2q²`, with projective image still dihedral of order `2q`.
- at `(q, N) = (3, 2), 𝒪 = ℤ₃[ζ], π = ζ − 1`, the stable lattice `L₁ = 𝒪(e₁ + e₂) + 𝒪πe₂` reduces to `σ ↦ (1, 0; 1, 1)`, with one-dimensional inertia invariants, while `L_std` reduces to trivial inertia; a residual statement that names no lattice is false.

**Inserting the good-dihedral prime `N`** (`S2/good-dihedral-prime-insertion`). Let `{ρ^{(1)}_ℓ}` be the weight-two system of Paso 1, with coefficient field `K` and ramification set `S₁`. Choose a prime `q ≡ 1 (mod 4), q > 5`, larger than every prime of `S₁` and split in `K`. As `q ∉ S₁` the residual weight at `q` is `2`, not `q + 1`. Either `ρ^{(1)}_q` is modular (solvable residual image; not bad dihedral since `k = 2` and `q > 5`), or `ρ̄^{(1)}_q : G_ℚ → GL₂(𝔽_q), 𝔽_q`-valued because `q` splits in `K`, has non-solvable image; non-solvable image gives the absolute irreducibility over `ℚ(ζ_q)` that Theorems 1.9 and 1.11 need. Choose `N ∉ S₁` by Lemma 8.2 (Dieulefait–Pacetti Lemma 1.15): `tr ρ̄^{(1)}_q(Frob_N) = 0` and `χ̄_q(Frob_N) = −1`, so `ρ̄^{(1)}_q|_{D_N}` is, up to twist, `diag(χ̄_q, 1)`, and `q | N + 1`. Theorem 1.9(4), in its crystalline-at-`q` alternative with the compatible type `τ_N` at `N`, gives a lift `ρ^{(2)}_q`, crystalline of weight `2` at `q`, whose inertial type at `N` is that of `τ_N: ρ^{(2)}_q(I_N)` is cyclic of order `q`, acting through `κ ⊕ κ^N`, and the projective image of `D_N` is dihedral of order `2q`. The image of `D_N` itself is infinite, since `det ρ^{(2)}_q(Frob_N) = ψ(N)N` is not a root of unity. By Theorem 1.4, `ρ^{(1)}_q` is modular if and only if `ρ^{(2)}_q` is, and Theorem 1.11 places `ρ^{(2)}_q` in a system `{ρ^{(2)}_ℓ}` with ramification set `S = S₁ ∪ {N}`. `N ≡ 1 (mod 8)` and `N ≡ 1` modulo every prime `≤ q − 1` (Lemma 8.2(ii)) are what Lemma 2.1 needs. This target is the Paso 2 application only; the general existence theorem, Theorem 1.9(1)–`(4)`, is ClassicalSerreModularity §I.3.
Source: [DP], Paso 2, pp. 10–11; Theorem 1.9(4), p. 6.
*Needs:* ClassicalSerreModularity `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`; `S2/dihedral-local-type-at-n`; `S1/solvable-residual-termination`; `S1/lifting-theorems-over-the-rationals`; `S1/weight-two-system`; ClassicalSerreModularity §I.3.

API of the bundled insertion datum, which needs the compatible systems of ClassicalSerreModularity §I.3:

- The insertion datum: `(q, N, κ, {ρ^{(2)}_ℓ})` with `q ≡ 1 (mod 4)`, `q > 5`, `q > max S₁`, `q` split in `K`, and `N` as in Lemma 8.2 for `ρ̄^{(1)}_q`.
- Its system `{ρ^{(2)}_ℓ}`, ramified inside `S₁ ∪ {N}`, with the prescribed nontrivial type at `N`.
- Its Weil–Deligne parameter at `N` restricted to inertia is `κ ⊕ κ^N`.
- Its congruences: `N ≡ 1 (mod 8)`, `N ≡ 1` modulo every prime `≤ q − 1`, `N ≡ −1 (mod q)`.
- `{ρ^{(1)}_ℓ}` is modular if and only if `{ρ^{(2)}_ℓ}` is.

**Checks.**

- for `q = 13` the prime `N = 406561` satisfies `N ≡ 1` modulo `8, 3, 5, 7, 11` and `N ≡ −1 (mod 13)`.
- `13 | 406561 + 1` and `13 ∤ 406561 − 1`, so `κ` has niveau two.
- an inert degree-two coefficient place gives an `𝔽_{q²}`-valued reduction, without certifying descent to `𝔽_q`. A Frobenius trace outside `𝔽_q` obstructs that descent and prevents an application of Lemma 8.2.
- `q = 5` is excluded, because Definition 2.1 asks for `t > 5` and Lemma 2.1 takes `t = q`; the Dickson step alone uses only that `q` divides neither `|A₄| = 12` nor `|S₄| = 24`, so that a solvable projective image of order divisible by `q` is dihedral.
- the construction gives Paso 2 only, not the four cases of Theorem 1.9.
- residual weight `q + 1` at `q` selects the Steinberg case of Theorem 1.9(4) and cannot give the crystalline Paso 2 lift.

**The good-dihedral prime keeps the residual images large** (`S2/large-residual-images`). Let `{ρ_ℓ}` be an almost strictly compatible system ramified inside `S ∪ {2, 3}` whose inertial type at `N` is that of `Ind κ`. Then for every prime `p ∈ S₁ ∪ {2, 3}, ρ̄_p` has non-solvable image. In fact `ρ̄_p` is good-dihedral for `N` with `t = q: ρ̄_p|_{I_N} ≅ κ̄_p ⊕ κ̄_p^N, κ̄_p` the reduction of `κ` in characteristic `p ≠ q`, still of order `q; q | N + 1, q > max(Q(N(ρ̄_p)/N²), 5, p)` because `p` and every other ramified prime lie in `S₁ ∪ {2, 3}`, below `q`, and the congruences of Lemma 8.2(ii) hold; so Lemma 6.3(i) applies. Dieulefait–Pacetti's own proof: `ρ̄_p|_{D_N}` is irreducible because reduction is injective on elements of order `q ≠ p`; a solvable image would be dihedral (Dickson, `q > 5`), induced from a quadratic field ramified only in `S ∪ {2, 3}; N` splits or ramifies there by the congruences, and both contradict the type. The hypothesis on the type at `N` must survive every congruence of Pasos `3–4`; it does for minimal lifts in the sense of ClassicalSerreModularity Conventions §2.3.
Source: [DP], Lemma 2.1, p. 11, and its proof, pp. 11–12.
*Needs:* `S2/dihedral-local-type-at-n`; ClassicalSerreModularity `R27.1/good-dihedral-prime-definition`; ClassicalSerreModularity `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; ClassicalSerreModularity `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`.

**Killing the odd part of the level** (`S2/killing-the-odd-level`). Let `{ρ^{(2)}_ℓ}` be ramified at `{p₁ < … < p_r} ∪ {N}, S₁ = {p₁, …, p_r}`. For `i = 2, …, r`, and also `i = 1` when `p₁` is odd, reduce the preceding `p_i`-adic member modulo `p_i`: the residual representation has non-solvable image (Lemma 2.1). Apply `S1/residual-weight-normalization-transition`, obtaining `τ̄_i = ρ̄_{p_i} ⊗ χ̄_{p_i}^{a_i}` with `2 ≤ k(τ̄_i) ≤ p_i+1`, and twist the preceding member by the finite-order Teichmüller lift `θ_i`. Theorem 1.9(3) now gives a minimal crystalline lift of `τ̄_i` at `p_i`, with Hodge–Tate weights `{0,k(τ̄_i)−1}` and unramified Weil–Deligne parameter, and Theorem 1.11 a system whose ramification set omits `p_i`, stays inside `S₁ ∪ {2, 3, N}` and keeps the type at `N`. Twist invariance and Theorem 1.4 make consecutive systems simultaneously modular; retain `a_i`, `θ_i` and the residual and lifted determinant data of the normalization transition. The result is a system ramified only in `{2, N}` (only at `N` if `p₁` is odd, and then Paso 5 follows), equivalent for modularity to `{ρ^{(2)}_ℓ}`. The `p_i`-adic member can ramify at `p_i`; it is the fixed ramification set of the system that omits `p_i`. The intermediate systems have weight `k(τ̄_i)`, not necessarily `2`; Paso 4 restores weight `2` when it is used, and Paso 5 also accepts the other regular weights. The lifts must be minimal in the sense of ClassicalSerreModularity Conventions §2.3 so that the type at `N` is kept.
Source: [DP], Paso 3, p. 12; Remark 2, p. 5.
*Needs:* `S2/large-residual-images`; `S1/lifting-theorems-over-the-rationals`; `S2/good-dihedral-prime-insertion`; `S1/residual-weight-normalization-transition`; ClassicalSerreModularity §I.3.

**Checks.**

- Split inertia `χ̄_{p_i} ⊕ χ̄_{p_i}²` at `p_i ≥ 5` has weight `p_i+3` even for a finite-order twist of a weight-two member. Normalize by `χ̄_{p_i}^{−1}` before invoking Theorem 1.9(3); inertia at `N` is unchanged.
- The cyclotomic character at `p_i` is crystalline and ramified, with unramified Weil–Deligne parameter; adjoining a trivial summand gives weights `{0,1}`.
- An unramified `p_i`-adic representation has only weight zero, so cannot have weights `{0,k−1}` for `k ≥ 2`.
- After removing `p_i` from the fixed ramification set, a member of coefficient characteristic different from `p_i` is unramified at `p_i`, while the member above `p_i` is crystalline there.

### Examples

For `q=13`, the displayed auxiliary prime `N=406561` is `−1` modulo `13` and `1` modulo `8,3,5,7,11`. The dihedral type concerns inertia at `N`.

### Dependencies

Layer S1 supplies modularity transfer; ClassicalSerreModularity's early R27.1 targets supply the auxiliary prime and image control; ClassicalSerreModularity §I.3 supplies type-preserving lifts. The bad-dihedral and local-type comparisons are those stated in this layer.

## Layer S3: The prime two and the auxiliary prime

*Milestones:* Lemma 2.3, the order-three type at `2`; Remark 6, the dyadic weight after the type change; Paso 4, removing `2`; Paso 5, killing the good-dihedral prime.

**The order-three type at `2`** (`S3/order-three-type-at-two`). Let `{ρ_ℓ}` be an almost strictly compatible system with Hodge–Tate weights `{0, 1}`, unramified at `3`, whose Weil–Deligne representation at `2` is Steinberg up to an unramified twist, and with `ρ̄₃` of non-solvable image. Since the system is unramified at `3, ρ₃` is crystalline and `k(ρ̄₃) = 2`. Let `χ′` be a character of `G_{ℚ₄}` (`ℚ₄` the unramified quadratic extension of `ℚ₂`) of order `3` and niveau two, normalised by `χ′(Art(2)) = 1`, with values in `𝒪 = ℤ₃[ζ], ζ² + ζ + 1 = 0, π = ζ − 1`; let `ρ̃₂ = Ind χ′`, so `ρ̃₂|_{I₂} ≅ χ′ ⊕ χ′²` with trivial monodromy. This is the construction of Layer S2 at `(q, N) = (3, 2)`.
Then `ρ̄₃|_{D₂} ≅ γ ⊗ (χ̄₃, c; 0, 1)` with `γ` unramified, and either `c = 0` (`ρ̄₃` unramified at `2, ρ̄₃|_{D₂} ≅ γ ⊗ (η ⊕ 1)`) or `ρ̄₃|_{I₂}` is a nontrivial unipotent. There is a `G_{ℚ₂}`-stable lattice `Λ` in `ρ̃₂` with `γ ⊗ (Λ/πΛ) ≅ ρ̄₃|_{D₂}`: the standard lattice `L₀` when `c = 0`, the adapted lattice `L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂` when `c ≠ 0; L₀` does not serve when `c ≠ 0`. Hence `ρ̃₂|_{I₂}` is an inertial type compatible with `ρ̄₃` at `2` in the sense of Theorem 1.9, and both reductions have trace `0` at Frobenius. A lift `ρ′₃` of `ρ̄₃`, crystalline of weight `2` at `3`, minimal away from `2` and `3`, with `ρ′₃|_{I₂} ≅ χ′ ⊕ χ′²`, exists by Theorem 1.9(4), and also by Khare–Wintenberger Theorem 5.1(4) at `(p, q) = (3, 2)`, whose hypotheses `ρ̄₃` meets: it is of S-type with `k(ρ̄₃) = 2 ∈ [2, 4]`, absolutely irreducible over `ℚ(μ₃)` because its image is non-solvable, of the form `(χ̄₃, ∗; 0, 1)` on `D₂` up to an unramified twist, and `3 | 2 + 1; χ′|_{I₂}` has niveau two and order `3`, and no parity condition arises since `3` is odd. Its conclusion at `3` is the parameter `(1 ⊕ 1, 0)`, so `ρ′₃` is crystalline of weight `2`. Theorem 1.11 gives a system `{ρ′_ℓ}`, congruent to `{ρ_ℓ}` at `3`, with the same weights, ramification contained in the stated set and an order-three type at `2`; the two are simultaneously modular (Theorem 1.4 at `3`).
Proof outline: Steinberg up to the twist `γ̃` gives `ρ₃(Frob₂)` eigenvalues `γ̃(Frob₂){2, 1}`, reducing to `γ(Frob₂){−1, 1}` since `χ̄₃(Frob₂) = −1; ρ̄₃(I₂)` is unipotent, so wild inertia acts trivially and `I₂` acts through a tame generator `σ`. If `ρ̄₃(σ) = 1`, the distinct eigenvalues give the split case. Otherwise, in a basis whose first vector spans the inertia invariants, `ρ̄₃(σ) = (1, b; 0, 1)` with `b ≠ 0` and `ρ̄₃(Frob₂) = (α, x; 0, β)`; the tame relation `Frob₂σFrob₂⁻¹ = σ²` forces `α = −β`, and conjugation makes `Frob₂` diagonal and `b = 1`. On `L₀, σ ↦ D₀ = diag(ζ, ζ²), Frob₂ ↦ F₀ = (0, 1; 1, 0)`, reducing to `1` and to an involution with eigenvalues `±1`. With `P = (1, 0; 1, π), D₀P = PD₁` and `F₀P = PF₁` for `D₁ = (ζ, 0; ζ, ζ²)` and `F₁ = (1, π; 0, −1)`; both pairs satisfy `D³ = F² = 1` and FDF`⁻¹ = D²`, and modulo `π, D₁ ≡ (1, 0; 1, 1), F₁ ≡ diag(1, −1)`, the non-split module. The level-two inertia-rigid condition at `2` of `LocalGaloisDeformationRings §8.8` describes these lifts; the matrices of `L₀` and `L₁`, after an unramified twist, are lifts of that kind, though not in the supplier's diagonal-Frobenius normal form.
Source: [DP], Lemma 2.3, p. 12, and its proof, p. 13; §1.3 before Theorem 1.9, p. 6 (compatible inertial types); [KW-I], Theorem 5.1(4), p. 10.
*Needs:* `S2/large-residual-images`; `S2/dihedral-local-type-at-n`; `S1/lifting-theorems-over-the-rationals`; `ArithmeticGaloisRepresentations Layer 2`; ClassicalSerreModularity §I.3; `LocalGaloisDeformationRings §8.8`.
These matrix equations hold over any commutative coefficient ring with `ζ²+ζ+1=0` and under any map to a characteristic-three ring sending `ζ` to one. Over every field of characteristic three, adapted inertia has one invariant dimension and standard inertia has two. The cyclotomic coefficient ring gives the integral lattice specialization.

API of the full local construction:

- The order-three character `χ′ : G_{ℚ₄} → ℤ₃[ζ]^×` of order `3` and niveau two with `χ′(Art(2)) = 1`; on `I₂` it is the niveau-two fundamental character into `𝔽₄^× ≅ μ₃`.
- The order-three type `ρ̃₂ = Ind χ′`, with `ρ̃₂|_{I₂} ≅ χ′ ⊕ χ′²` and monodromy `0`.
- The standard lattice `L₀`: `σ ↦ diag(ζ, ζ²)`, `Frob₂ ↦ (0, 1; 1, 0)`.
- The adapted lattice `L₁ = 𝒪(e₁ + e₂) ⊕ 𝒪πe₂`: `σ ↦ (ζ, 0; ζ, ζ²)`, `Frob₂ ↦ (1, π; 0, −1)`.
- The reduction of the standard lattice: `L₀/πL₀ ≅ 1 ⊕ η`, with trivial inertia.
- The reduction of the adapted lattice: `L₁/πL₁` is the non-split extension, `σ ↦ (1, 0; 1, 1)`, `Frob₂ ↦ diag(1, −1)`.
- The lattice selection: if `ρ̄₃|_{D₂} ≅ γ ⊗ (χ̄₃, c; 0, 1)`, then `Λ = L₀` (`c = 0`) or `L₁` (`c ≠ 0`) satisfies `γ ⊗ (Λ/πΛ) ≅ ρ̄₃|_{D₂}`.
- Compatibility: `ρ̃₂|_{I₂}` is compatible with `ρ̄₃` at `2`, the hypothesis of Theorem 1.9(4) at `ℓ = 2`.
- The type change at two: `{ρ_ℓ}` is modular if and only if `{ρ′_ℓ}` is.

**Checks.**

- `|𝔽₄^×| = 3` and `|𝔽₂^×| = 1`, so an order-`3` character of tame inertia at `2` has niveau two.
- `K = ℚ₄(χ′)` has `e(K/ℚ₂) = 3`, which is odd.
- the Steinberg type `(ω₁ ⊕ 1, N ≠ 0)` has nonzero monodromy and is not potentially crystalline; the order-three type is.
- if the system is ramified at `3, k(ρ̄₃) = 2` can fail and Theorem 1.9(4) gives no crystalline lift at `3`.
- over `ℤ[ζ], D₀³ = F₀² = 1, F₀D₀F₀⁻¹ = D₀²`, and `D₀ ≡ 1 (mod π)`.
- `D₀P = PD₁, F₀P = PF₁, D₁³ = F₁² = 1` and `F₁D₁F₁⁻¹ = D₁²`.
- modulo `π, D₁ ≡ (1, 0; 1, 1) ≠ 1` and `F₁ ≡ diag(1, −1)`, so `L₁/πL₁` has one-dimensional inertia invariants.
- `D₀ ≡ 1 (mod π)`, so `L₀` cannot realise a ramified `ρ̄₃|_{I₂}`.
- modulo `π, F₀² = 1` and `F₀ ≠ ±1`, so its eigenvalues are `1` and `−1 = 2 = χ̄₃(Frob₂)`.

**The dyadic weight after the type change** (`S3/weight-two-after-type-change`). In Paso 4, if `ρ̄₂` has non-solvable image and `k(ρ̄₂) = 4`, the system `{ρ′_ℓ}` of Lemma 2.3 has `k(ρ̄′₂) = 2`. The type of `ρ′₂` at `2` comes from `χ′` (almost strict compatibility, `ρ̄′₂` irreducible by Lemma 2.1), so `ρ′₂` is crystalline with Hodge–Tate weights `{0, 1}` over `K = ℚ₄(χ′), e(K/ℚ₂) = 3`; it comes from a `2`-divisible group and `ρ̄′₂|_{G_K}` is finite flat. A très ramifiée representation is finite flat over no extension of odd ramification index, so `ρ̄′₂` has weight `2`. Khare–Wintenberger use the same argument in the proof of their Theorem 9.1; the criterion is imported from AlgebraicModularFormsAndSerreWeights Layer 4. The detour is needed because Theorem 1.9 gives a crystalline lift at `2` only in weight `2`.
Source: [DP], Remark 6, p. 13 (see Corrections to the sources for the operative criterion).
*Needs:* `S3/order-three-type-at-two`; `S2/large-residual-images`; AlgebraicModularFormsAndSerreWeights Layer 4; `FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20`; ClassicalSerreModularity §I.3.

**Removing `2` from the level** (`S3/removing-two`). After Paso 3 let the system be ramified only at `2` and `N`. There is an almost strictly compatible system of weight `2` unramified outside `N` and equivalent for modularity:

1. if `k(ρ̄₂) = 4`, take a minimal weight-two lift with Steinberg type at `2` (Theorem 1.9(2)) and its system (transfer by Theorem 1.5); if `k(ρ̄₂) = 2`, go directly to step `3`;
2. in the weight-four branch, change the type at `2` by Lemma 2.3, which needs the system unramified at `3` (after Paso 3) and of Hodge–Tate weights `{0, 1}` (after step `1`);
3. now `k(ρ̄₂) = 2` (Remark 6, or directly when the weight was `2`), and a minimal crystalline weight-two lift (Theorem 1.9(1)) lies in a system unramified at `2` (transfer by Theorem 1.5).
Non-solvable image at `2` (Lemma 2.1) is needed for Theorems 1.9(1), 1.9(2) and 1.5. The type at `N` is kept by minimal lifts and by prescribing `τ_N` at `N`. The order of the steps matters: the Steinberg lift makes Lemma 2.3 applicable, and Remark 6 needs the type from Lemma 2.3.
Source: [DP], Paso 4, pp. 12–13.
*Needs:* `S3/order-three-type-at-two`; `S3/weight-two-after-type-change`; `S2/large-residual-images`; `S2/killing-the-odd-level`; `S1/lifting-theorems-over-the-rationals`; ClassicalSerreModularity §I.3.

**Killing the good-dihedral prime** (`S3/killing-the-good-dihedral-prime`). Let `{ρ′_ℓ}` be an odd irreducible almost strictly compatible system with Hodge–Tate weights `{0,h−1}`, `h ≥ 2`, unramified outside `N`, with `N ≡ 1 (mod 8)` as chosen in Paso 2. This includes the weight-two output of Paso 4 and the regular-weight output of Paso 3 when Paso 4 is skipped. Reduce its `N`-adic member modulo `N`.

1. If `ρ̄′_N` is reducible, `ρ′_N` is modular by Theorem 1.6 `(N > 5)`. Only the de Rham property at `N` is available here (almost strict compatibility gives no Weil–Deligne information at the ramified coefficient prime `N` when the residual member is reducible), and Pan's theorem needs nothing more.
2. If `ρ̄′_N` is irreducible, first apply `S1/residual-weight-normalization-transition` at `N`, obtaining `τ̄_N = ρ̄′_N ⊗ χ̄_N^a` with `2 ≤ k(τ̄_N) ≤ N+1`, and twist the preceding member by its finite-order Teichmüller lift. Once `τ̄_N` is not bad dihedral, a minimal crystalline lift of `τ̄_N` (Theorem 1.9(3)), with its normalized weight and matching determinant, lies in a system with empty ramification set. Twist invariance and Theorem 1.4 give modularity equivalence with the original system.
3. `τ̄_N` is not bad dihedral: the twist preserves its level `1`, and a level-one bad-dihedral representation in characteristic `N` needs `N ≡ 3 (mod 4)` (Lemma 1.14 with Wintenberger's lemma, Remark 5), while `N ≡ 1 (mod 8)`.
`ρ′_N` is irreducible because other members of the system have irreducible residual representations. Case `1` is the one place where almost strict, rather than strict, compatibility matters.
Source: [DP], Paso 5, p. 14; Remark 2, p. 5; Remark 5, p. 9.
*Needs:* `S2/killing-the-odd-level`; `S3/removing-two`; `S1/residual-weight-normalization-transition`; `S1/lifting-theorems-over-the-rationals`; `S1/fontaine-laffaille-member-not-bad-dihedral`; `SmallRamificationAndAbelianVarietyBaseCases §5.6`; ClassicalSerreModularity §I.3.

**Checks.**

- Locally at `N ≥ 5`, split inertia `χ̄_N ⊕ χ̄_N²` has weight `N+3` and normalizes to weight two. For any global representation being normalized, its prime-to-`N` conductor is unchanged; in particular level one stays level one.
- Skipping Paso 4 can leave `h > 2`; the finite-order twist retains that weight, and Theorem 1.4 compares it to the normalized crystalline lift of possibly different weight.
- Twisting at `N` introduces no ramification at any other prime, so the new crystalline system has empty fixed ramification set. Its `N`-adic member can still be ramified at `N`.

### Examples

The order-three lattice example has inertia-invariant dimensions `2` and `1` after reduction in characteristic `3`, but the same semisimplification. Over `ℤ[ζ]` the matrix `D₀ = diag(ζ, ζ²)` reduces to the identity only modulo the prime above `3`: `X² + X + 1` takes the value `3` at `X = 1`, so modulo the inert prime `2` the image of `ζ` is a primitive cube root of unity in `𝔽₄`, not `1`.

### Dependencies

Layer S2 supplies the system with controlled odd level; Layer S1 supplies lifting; ClassicalSerreModularity §I.3 supplies the local type and compatible systems. Finite-flatness over odd ramification index is used with its stated dyadic hypothesis.

## Layer S4: The terminal characteristic five

*Milestones:* Paso 6, the terminal characteristic five; Serre's conjecture for odd `p`.

**The level-one system at `p = 5`** (`S4/level-one-system-at-five`). Let `{ρ″_ℓ}` be the system with empty ramification set from Paso 5. At `p = 5`, normalize each irreducible reduction by `S1/residual-weight-normalization-transition`, writing `τ̄₅ = ρ̄″₅ ⊗ χ̄₅^a`, twisting the preceding member by its Teichmüller lift and retaining its determinant data. The twist preserves level one and modularity. Then:

1. if `ρ̄″₅` is reducible, `ρ″₅` is modular by Theorem 1.6;
2. `τ̄₅` is not bad dihedral, since it has level `1` and `5 ≢ 3 (mod 4)` (Remark 5);
3. otherwise `k(τ̄₅) ∈ {2, 4, 6}`, as level one forces an even normalised weight (`det ρ̄ = χ̄₅^{k−1}` after normalisation and oddness make `k − 1` odd). For weight `2` or `4`, a minimal crystalline lift of `τ̄₅` in a system with empty ramification set has a `3`-adic member with reducible reduction (Tate–Serre: nothing irreducible is unramified outside `3`), ordinary by Berger–Li–Zhu since the weight is `2` or `4 = 3 + 1`, hence modular by Theorem 1.7, in the form of `S1/lifting-theorems-over-the-rationals`: the semisimplified reduction is `1 ⊕ χ̄₃`, the only odd sum of characters unramified outside `3`, and `χ̄₃|_{D₃} ≠ 1` (Dieulefait–Pacetti phrase this as: the weight is not `3`). For weight `6`, a weight-two lift of `τ̄₅` Steinberg at `5` and unramified elsewhere (Theorem 1.9(4)) comes from a `GL₂`-type abelian variety `A/ℚ` (Snowden, Proposition 9.4.1), semistable with good reduction outside `5`, contradicting Schoof; before Schoof's theorem is applied, `A` must be checked to be of `GL₂`-type, semistable at `5` and of good reduction outside `5`.
In every case the system, hence `ρ̄″₅` and by the chain of Pasos `1–5` the original `ρ̄`, is modular (twist invariance and Theorem 1.4 at `5` for the lifts in case `3`). The terminal cases are `SmallRamificationAndAbelianVarietyBaseCases §5.12`.
Source: [DP], Paso 6, p. 14; Remark 2, p. 5.
*Needs:* `S1/residual-weight-normalization-transition`; `S3/killing-the-good-dihedral-prime`; `S1/lifting-theorems-over-the-rationals`; `SmallRamificationAndAbelianVarietyBaseCases §5.12`; `SmallRamificationAndAbelianVarietyBaseCases §5.6`; `SmallRamificationAndAbelianVarietyBaseCases §5.3`; `SmallRamificationAndAbelianVarietyBaseCases §5.4`; `SmallRamificationAndAbelianVarietyBaseCases §5.9`; `SmallRamificationAndAbelianVarietyBaseCases §5.7`; `SmallRamificationAndAbelianVarietyBaseCases Layer 4`; `SmallRamificationAndAbelianVarietyBaseCases Layer 2`; ClassicalSerreModularity §I.3.

**Checks.**

- Locally at five, split inertia `χ̄₅ ⊕ χ̄₅²` has weight eight and normalizes to weight two. The interval `[2,6]` applies to the normalized reduction, independently of the preceding system's weight.
- Level one and oddness exclude odd normalized weights in `[2,6]`; precisely `2,4,6` remain.
- A finite-order twist at five preserves the preceding member's Hodge–Tate weights. The replacement lifts of normalized weights two and four have empty fixed ramification set, while the weight-two Steinberg replacement at residual weight six retains ramification at five.

**Serre's conjecture in odd characteristic** (`S4/odd-characteristic-assembly`). Every odd irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` with `p` odd is modular. Solvable image is Theorem 1.3. Otherwise Pasos `1` to `6` give a chain of almost strictly compatible systems, consecutive ones simultaneously modular (Theorems 1.4 and 1.5, Remark 4), ending in a modular system or a contradiction. The proof uses no weight reduction and no `(L_r)/(W_r)` induction; its base cases are Tate–Serre and Schoof. Weight and level are not claimed here.
Source: [DP], §2, pp. 10 and 15.
*Needs:* `S1/weak-form-and-the-solvable-case`; `S1/weight-two-system`; `S1/lifting-theorems-over-the-rationals`; `S2/good-dihedral-prime-insertion`; `S2/killing-the-odd-level`; `S3/removing-two`; `S3/killing-the-good-dihedral-prime`; `S4/level-one-system-at-five`.

### Examples

The terminal weight-two characteristic-five case excludes the bad-dihedral equations `5=3` and `5=1`; it can use the level-one base case described above.

### Dependencies

Layer S3 supplies the level-one system. Layer S1 supplies lifting and the arithmetic image and small-ramification suppliers supply the separate terminal branches.

## Layer S5: Characteristic two and the qualitative theorem

*Milestones:* characteristic two; the qualitative Serre theorem in every characteristic.

**The auxiliary odd prime for a dyadic system** (`S5/auxiliary-odd-prime-for-the-dyadic-system`). Let `ρ̄ : G_ℚ → GL₂(𝔽̄₂)` be irreducible with non-solvable image. Take the `E`-rational almost strictly compatible, irreducible, odd system of Khare–Wintenberger Theorem 5.1(1) when `k(ρ̄) = 2`, or `5.1(2)` when `k(ρ̄) = 4`, whose dyadic member lifts `ρ̄` with Hodge–Tate weights `{0, 1}`; by the definitions of Khare–Wintenberger §5 every characteristic-zero member is irreducible and odd. For every prime `p > 3` outside the finite ramification set and every coefficient place above `p`, the `p`-adic member `ρ_p` is odd, irreducible, finitely ramified and crystalline of weight `2` at `p`: the almost strict clause at an odd unramified prime gives crystallinity even when the reduction is reducible. `ρ̄_p` may be reducible; if it is irreducible it has weight `2` and is not bad dihedral, since Lemma 1.14 would force `p = 2 · 2 − 1 = 3` or `p = 2 · 2 − 3 = 1`. Such primes `p` exist, since the ramification set is finite.
Source: [DP], §3, p. 15; [KW-I], §5, definitions on p. 8 and Theorem 5.1(1)–(2), p. 9.
*Needs:* `S1/fontaine-laffaille-member-not-bad-dihedral`; ClassicalSerreModularity §I.3.

**Characteristic two** (`S5/characteristic-two-closure`). Every irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄₂)` is modular. If the image is solvable, the projective image is dihedral (Khare–Wintenberger Lemma 6.1: `S₄` does not occur, and `A₄` would lie in a Borel subgroup over `𝔽₄`), and dihedral images are Rohrlich–Tunnell. If the image is non-solvable, take the dyadic system and an auxiliary prime `p > 3` as above: `ρ̄_p` is either reducible, and `ρ_p` is modular by Theorem 1.6, or irreducible, odd and not bad dihedral, hence modular by the odd case, and `ρ_p` is modular by Theorem 1.4. By Remark 4 the system, hence `ρ̄`, is modular. Only the odd-characteristic theorem of Layer S4 is used, not this layer's own conclusion at `p = 2`; no dyadic lifting theorem is needed, only the dyadic lift existence.
Source: [DP], §3, p. 15.
*Needs:* `S5/auxiliary-odd-prime-for-the-dyadic-system`; `S4/odd-characteristic-assembly`; `S1/lifting-theorems-over-the-rationals`; `ArithmeticGaloisRepresentations Layer 4`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; ClassicalSerreModularity §I.3.

**The qualitative Serre theorem** (`S5/qualitative-serre-theorem`). For every prime `p`, every odd irreducible `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` is modular: `ρ̄ ≅ ρ̄_{f,p}` for a cuspidal eigenform `f` of some weight `k ≥ 2`, level and character. Odd `p` is Layer S4; `p = 2` is the previous target. The proof uses no induction on the weight or on the conductor. No weight or level is asserted.
Source: [DP], Introduction, pp. 1–2.
*Needs:* `S4/odd-characteristic-assembly`; `S5/characteristic-two-closure`; `S1/weak-form-and-the-solvable-case`.
`Suggested.lean` states this conclusion as `serre_conjecture_weak`.

**What the qualitative proof rests on** (`S5/globalisation-dependency-check`). The qualitative theorem rests on exactly:

- (a) lift existence, Theorem 1.9: cases `(1)–(3)` are Khare–Wintenberger Theorem 5.1, proved in their second paper, and case `(4)` is Gee and Snowden (ClassicalSerreModularity §I.3);
- (b) almost strictly compatible systems, Theorem 1.11 (Dieulefait, through Taylor's potential modularity; ClassicalSerreModularity §I.3), and modularity transfer (ClassicalSerreModularity §I.3);
- (c) the lifting theorems `1.4–1.7` (`S1/lifting-theorems-over-the-rationals`);
- (d) Langlands–Tunnell and Rohrlich–Tunnell (`GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6`);
- `(e)` the base cases of Tate, Serre and Schoof with Snowden's realisation (SmallRamificationAndAbelianVarietyBaseCases Layers 2–5);
- `(f)` from ClassicalSerreModularity, besides Layer I, only the early R27.1 targets: the good-dihedral definition, Lemma 6.3 and Lemma 8.2, with Dickson's classification and Khare–Wintenberger Lemma 6.2(ii) (Dieulefait–Pacetti Lemma 1.14) from ArithmeticGaloisRepresentations Layer 4 and AlgebraicModularFormsAndSerreWeights Layer 4.

None of these invokes Serre's conjecture. The chain is independent of Khare–Wintenberger's induction, not of all of their work: it shares Theorem 5.1. The lifts and compatible systems of (a)–(b) come from potential modularity in ClassicalSerreModularity Layer I, which does not assume the universal Serre theorem. In (c) each lifting theorem is used in the form that assumes the residual representation modular (`S1/lifting-theorems-over-the-rationals`, GL2ModularityLifting §7.7). Their proofs use Gee's weight theorem for a modular residual representation over a totally real field, lifting theorems with a modular residual representation, and auxiliary globalisations of local residual representations obtained from potential automorphy: the patched modules of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin with Emerton–Gee's globalisation and Barnet-Lamb–Gee–Geraghty Theorem A.4.1 in Tung's odd-prime argument, and Calegari Proposition 3.2, Snowden Proposition 8.2.1 and the construction of Khare–Wintenberger II Theorem 6.1 in Tung's dyadic argument. For `GL₂(ℚ_p)` these globalisations, with their potentially modular seeds, are constructed from potential modularity in ClassicalSerreModularity `R33.1/global-arithmetic-action`, and CompletedCohomologyAndLocalGlobalCompatibility §6.5 lists the remaining globalisation inputs. Pan's Theorem 1.0.4 and Emerton's promodularity theorem, whose proofs invoke Serre's conjecture, are excluded (GL2ModularityLifting §12.4). Dieulefait–Pacetti attribute the removal of weight reduction to Kisin's and Pan's lifting theorems.
Source: [DP], proof of Theorem 1.9, p. 6; Introduction, p. 2; [KiFM], Introduction and Corollary (2.2.17), p. 685; [HT], proof of Theorem 6.3; [Pan], Remark 8.0.4; [TuB], Lemmas 4.3.3–4.3.4.
*Needs:* `S5/qualitative-serre-theorem`; `S1/lifting-theorems-over-the-rationals`; `S1/weight-two-system`; ClassicalSerreModularity Layer I; ClassicalSerreModularity `R33.1/global-arithmetic-action`; GL2ModularityLifting §§7.7 and 12.4; CompletedCohomologyAndLocalGlobalCompatibility §6.5; ClassicalSerreModularity `R27.1/lemma-8-2-chebotarev-choice-of-auxiliary-primes`; ClassicalSerreModularity `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`; ClassicalSerreModularity §I.3.

### Examples

In characteristic `2`, unipotent rank-two matrices have order at most `2`; thus an element of order `4` in `S₄` cannot occur in this projective image.

### Dependencies

Layer S4 supplies the odd-characteristic conclusion; Layer S1 supplies modularity lifting and ClassicalSerreModularity §I.3 the dyadic lift. The Rohrlich–Tunnell and finite-flat suppliers used in the two image branches are listed in their targets.

## Layer S6: The strong form

*Milestones:* the two notions of modularity; weight and level from minimal lifts; Serre's modularity conjecture, strong form; the level-one case and its finiteness.

The qualitative theorem of Layer S5 gives modularity of some weight and level. This layer passes to Serre's weight `k(ρ̄)` and level `N(ρ̄)`. For odd `p`, and for `p = 2` with `k(ρ̄) = 2`, the passage needs only modularity, minimal lifts and Khare–Wintenberger's lifting theorem, none of their induction; for `p = 2` with `k(ρ̄) = 4` it is the dyadic optimisation of SerreWeightAndLevelOptimisation.

**The two notions of modularity agree** (`S6/two-notions-of-modularity-agree`). For `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` odd and irreducible, the following are equivalent: (i) `ρ̄ ≅ ρ̄_{f,p}` for a Hecke eigenform `f ∈ S_k(Γ₀(N), ε)` with `k ≥ 2` (Dieulefait–Pacetti); (ii) `ρ̄` arises from a newform in the sense of ClassicalSerreModularity Conventions §2.2 (Khare–Wintenberger, AlgebraicModularFormsAndSerreWeights Layer 7). `(ii) ⇒ (i)` because a newform is an eigenform. `(i) ⇒ (ii)`: pass to the newform with the same eigenvalues away from the level (Atkin–Lehner) and apply Brauer–Nesbitt; the residual isomorphism is in general with the semisimplification, and irreducibility of `ρ̄` makes it an isomorphism with `ρ̄`. Weight-one forms are handled by the Deligne–Serre congruence of `S1/weak-form-and-the-solvable-case`. So the qualitative theorem of Layer S5 is modularity in the sense of ClassicalSerreModularity Conventions §2.2.
Source: [DP], Introduction, p. 1; [KW-I], §1, p. 2.
*Needs:* AlgebraicModularFormsAndSerreWeights §7.5; AlgebraicModularFormsAndSerreWeights §5.10; `S1/weak-form-and-the-solvable-case`.

**From modularity to weight `k(ρ̄)` and level `N(ρ̄)`** (`S6/strong-form-by-minimal-lifts`). Let `ρ̄ : G_ℚ → GL₂(𝔽)` be of S-type and modular, with `p` odd, or `p = 2` and `k(ρ̄) = 2`. Then `ρ̄` arises from `S_{k(ρ̄)}(Γ₁(N(ρ̄)))`.

- If the projective image is dihedral, Lemma 6.2(i) gives the conclusion. This covers `ρ̄|_{G_{ℚ(μ_p)}}` reducible for odd `p`, every solvable image at `p = 2`, and every `ρ̄` induced from `ℚ(i)`; the last are kept apart from Buzzard's theorem, which excludes them.
- Otherwise choose `i` with `2 ≤ k(ρ̄ ⊗ χ_p^i) ≤ p + 1` (`i = 0` when `p = 2`) and put `ρ̄′ = ρ̄ ⊗ χ_p^i`, with `N(ρ̄′) = N(ρ̄)`. Theorem 5.1(1) gives a lift of `ρ̄′`, minimal at every prime `≠ p` and crystalline of weight `k(ρ̄′)` at `p`; Theorem 4.1 makes it modular, and its newform has weight `k(ρ̄′)`, level prime to `p`, and level `N(ρ̄)` away from `p`. Undo the twist: twisting by `χ_p` is the `θ`-operator on mod-`p` forms of level prime to `p`, Edixhoven's weight theorem (no exceptional case for `p > 2`) gives a mod-`p` eigenform of type `(N(ρ̄), k(ρ̄), ε)`, and as `k(ρ̄) ≥ 2` the Deligne–Serre lemma lifts it to characteristic zero. The resulting newform has level dividing `N(ρ̄)` and divisible by `N(ρ̄)`, since the prime-to-`p` conductor of `ρ̄` divides that of every lift.
The twist is needed because Theorems 4.1 and 5.1 assume `2 ≤ k ≤ p + 1` while Serre's weight goes up to `p² − 1`: for `p ≥ 5, ρ̄|_{I_p} ≅ χ̄_p ⊕ χ̄_p²` has weight `p + 3` and its twist by `χ̄_p^{−1}` has weight `2`. The case `p = 2, k(ρ̄) = 4` is excluded: Theorem 5.1(1) has no crystalline branch there. At `p = 2` the theorem covers `ρ̄|_{D₂}` scalar with non-dihedral projective image, where Buzzard's multiplicity-one level lowering is not available; a scalar `ρ̄|_{D₂}` is unramified up to twist, hence finite, so `k(ρ̄) = 2` automatically. Khare–Wintenberger state this refinement in Theorem 1.2 but write out only the modularity; this target supplies the passage (Corrections to the sources).
Source: [KW-I], §1.1, p. 2; Theorem 5.1(1), p. 9; proof of Lemma 6.2(i), p. 11.
*Needs:* ClassicalSerreModularity `R27.1/dickson-and-the-dyadic-solvable-refinement`; ClassicalSerreModularity §I.3; ClassicalSerreModularity §I.2; AlgebraicModularFormsAndSerreWeights Layer 4; AlgebraicModularFormsAndSerreWeights Layer 7; AlgebraicModularFormsAndSerreWeights §5.10; `SerreWeightAndLevelOptimisation §3.8`; `SerreWeightAndLevelOptimisation §3.7`.

**Serre's modularity conjecture, strong form** (`S6/strong-form-of-serre-conjecture`). Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous, odd and absolutely irreducible. There are a normalised newform `f` of weight `k(ρ̄) ≥ 2`, level `N(ρ̄)` and character `ε`, a prime `λ | p` of its coefficient field relative to `ι_p`, and an isomorphism of the reduction of `ρ_{f,λ}` with `ρ̄`; moreover `det ρ̄ = ε̄ χ̄_p^{k(ρ̄)−1}`, so `ε` reduces to `ε(ρ̄)`. The cases:

- `p` odd: `S5/qualitative-serre-theorem`, through `S6/two-notions-of-modularity-agree`, then `S6/strong-form-by-minimal-lifts`;
- `p = 2` and `k(ρ̄) = 2`: the same, including `ρ̄|_{D₂}` scalar with non-dihedral projective image;
- `p = 2` and `k(ρ̄) = 4`: `S5/qualitative-serre-theorem`, then the dyadic optimisation: Buzzard's level lowering for `ρ̄` not induced from `ℚ(i)`, Lemma 6.2(i) for dihedral `ρ̄`, and the passage from weight `2` at level `2N(ρ̄)`, Steinberg at `2`, to weight `4` at level `N(ρ̄)`.
The determinant identity and the invariance under enlarging the coefficient field are those of AlgebraicModularFormsAndSerreWeights Layer 7 and Layer 4. Only classical forms of weight at least `2` are produced. Dieulefait–Pacetti cite Edixhoven, Ribet and Boston–Lenstra–Ribet for the passage from the weak to the strong form; those results do not cover the scalar dyadic case, which Khare–Wintenberger Theorem 1.2(2) states; its proof, Theorem 5.1(1) with Theorem 4.1(1) at `2`, is not written out in the source and is supplied by `S6/strong-form-by-minimal-lifts` (Corrections to the sources).
Source: [KW-I], §1, p. 2; §1.1, p. 2; §10.1, p. 20; [Se87], §2.6, p. 188 (the weight bounds); [DP], Introduction, p. 1.
*Needs:* `S5/qualitative-serre-theorem`; `S6/two-notions-of-modularity-agree`; `S6/strong-form-by-minimal-lifts`; ClassicalSerreModularity `R27.1/dickson-and-the-dyadic-solvable-refinement`; `SerreWeightAndLevelOptimisation §5.6`; `SerreWeightAndLevelOptimisation Layer 6`; ClassicalSerreModularity §I.2; AlgebraicModularFormsAndSerreWeights Layer 4; AlgebraicModularFormsAndSerreWeights Layer 7; AlgebraicModularFormsAndSerreWeights §7.5; `ArithmeticGaloisRepresentations Layer 4`.
The strong form requires the residual Artin conductor and Serre's local weight recipe, which the pinned libraries do not provide. Its weight bounds are `2 ≤ k ≤ p²−1` for odd `p` and `2 ≤ k ≤ 4` for `p = 2`. The qualitative conclusion is stated in `Suggested.lean` as `serre_conjecture_weak` (Layer S5).

**Checks.**

- A très ramifiée dyadic representation has Serre weight `4`; the bound `p²−1 = 3` cannot be used at `p = 2`.
- A representation with scalar restriction at `2` and non-dihedral projective image is included at weight `2` by Theorem 1.2(2).
- Twisting by a power of the mod-`p` cyclotomic character can change the Serre weight but preserves the prime-to-`p` conductor; the bounded statement applies to the original representation as well as its twists.

**The level-one case** (`S6/level-one-case`). Let `ρ̄ : G_ℚ → GL₂(𝔽)` be continuous, absolutely irreducible and odd, `𝔽` finite of characteristic `p`, and unramified outside `p`, so `N(ρ̄) = 1`. Then `ρ̄` arises from a cuspidal eigenform of level `SL₂(ℤ)` and weight `k(ρ̄)`: an integral model of `ρ_f` reduces to `ρ̄`. This is Khare's level-one theorem; here it is the case `N(ρ̄) = 1` of `S6/strong-form-of-serre-conjecture`, where the character is trivial. For `p = 2` and `p = 3` there is no such `ρ̄`, by the theorems of Tate and Serre. The `p`-adic lift need not be unramified at `p`.
Source: [Kh], Theorem 1.1 and §1.1, p. 2 (the statement); [KW-I], §1, p. 2 (the meaning of "arises from").
*Needs:* `S6/strong-form-of-serre-conjecture`; AlgebraicModularFormsAndSerreWeights Layer 7.
`Suggested.lean` states its level-one conclusion, in some weight at least two, as `khare_level_one`; the weight `k(ρ̄)` needs Serre's local weight recipe, absent at the pins.

**Checks.**

- The irreducible mod-`11` representation attached to the discriminant form is a level-one instance of weight `12`.
- At `p = 2` and `p = 3` the S-type hypotheses and unramifiedness outside `p` are incompatible, as in the Tate–Serre base cases.
- A crystalline lift of a level-one residual representation may ramify at `p`; unramifiedness outside `p` does not impose unramifiedness at `p`.

**Finiteness of level-one representations** (`S6/finiteness-of-level-one-representations`). For each prime `p` there are finitely many isomorphism classes of continuous semisimple odd representations `G_ℚ → GL₂(𝔽̄_p)` unramified outside `p`. In the absolutely irreducible case, normalise the weight by one of finitely many cyclotomic twists, apply `S6/level-one-case` and realise the form in `S₂(Γ₁(p²))`; the integral Hecke algebra there is finite over `ℤ` and has finitely many mod-`p` eigencharacters, and the residual representations are determined by their Frobenius traces. A finite complex dimension alone is not enough. In the reducible semisimple case `ρ̄` is a sum of two characters unramified outside `p`; by Kronecker–Weber they factor through the prime-to-`p` quotient of `ℤ_p^×`, so their order divides `p − 1` (they are trivial when `p = 2`).
Source: [Kh], Corollary 1.3 and its proof, §7.1, p. 28.
*Needs:* `S6/level-one-case`; AlgebraicModularFormsAndSerreWeights Layer 3; AlgebraicModularFormsAndSerreWeights Layer 7; `ArithmeticGaloisRepresentations Layer 5`; ClassFieldTheory Layer 13.
`Suggested.lean` states the full semisimple conclusion as `finite_level_one_semisimple`.

### Examples

A très ramifiée dyadic residual representation has weight `4`, exceeding `2² − 1 = 3`; its level comes from the dyadic optimisation. A representation with scalar restriction at `2` and non-dihedral projective image has weight `2` and takes its level from a minimal lift.

### Dependencies

Layer S5 supplies the qualitative theorem. ClassicalSerreModularity supplies minimal lifts and Khare–Wintenberger's lifting theorem (§§I.2–I.3) and the Dickson–Lemma 6.2 package (R27.1); SerreWeightAndLevelOptimisation supplies the θ-operators, Edixhoven's weight theorem and the dyadic optimisation.

## Layer S7: Consequences: the finite-flat case, regular compatible systems and weight one

*Milestones:* the finite-flat weight-two case; Theorem 10.1(i) for regular compatible systems; odd Artin representations and weight-one modularity; Khare's weight-one descent.

These are Khare–Wintenberger's consequences of the strong form, with the weight-one descent proved here.

**The finite-flat weight-two export** (`S7/finite-flat-weight-two-case`). Let `p ≥ 5` and `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` continuous, odd and absolutely irreducible, finite at `p` in the sense of `IsFiniteFlatResidual` (Conventions, Finiteness at `p` and elliptic torsion), with `det ρ̄ = χ̄_p`. Then there are a normalised newform `g` of weight `2`, level `N(ρ̄)` and trivial character, and a prime `λ | p` of its coefficient field, with `ρ̄_{g,λ} ≅ ρ̄`; in particular `a_ℓ(g) ≡ tr ρ̄(Frob_ℓ) (mod λ)` for `ℓ ∤ pN(ρ̄)`. By Serre's Proposition 4, finiteness at `p` with `det ρ̄|_{I_p} = χ̄_p` gives `k(ρ̄) = 2; det ρ̄ = χ̄_p` gives `ε(ρ̄) = 1`; the strong form gives a newform of weight `2` and level `N(ρ̄)` with character reducing to `1`; Carayol's change of nebentypus `(p ≥ 5)` makes the character trivial at the same weight and level. The level is the prime-to-`p` conductor of `ρ̄`, not the conductor of an elliptic curve.
Source: [Se87], Proposition 4, p. 189; [KW-I], §1, p. 2.
*Needs:* `S6/strong-form-of-serre-conjecture`; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24a and R07.5.6a; AlgebraicModularFormsAndSerreWeights Layer 7; `SerreWeightAndLevelOptimisation §4.1`.
The exact-conductor statement is a README-only target: its finite-at-`p` notion requires the finite-flat residual-representation carriers of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.6a. The prime and residue-map conclusion on the newform carrier is derived from the integral-closure congruence comparison.

**Checks.**

- The finite-flat representation on the `p`-torsion of an elliptic curve with good reduction at `p ≥ 5`, when absolutely irreducible, gives a trivial-character weight-two form.
- A très ramifiée extension of `1` by `χ̄_p` is excluded even though its semisimplification is finite flat and its determinant is cyclotomic.
- The local model may have coefficients in a finite extension of `𝔽_p`; the statement does not impose prime-field descent.

**Regular compatible systems** (`S7/regular-compatible-systems`). Every odd, irreducible, regular compatible system of two-dimensional representations of `G_ℚ` comes, after a twist, from a newform of weight at least `2`. First, `ρ̄_λ` is irreducible for almost all `λ`, by the bounded conductor and fixed Hodge–Tate weights. Twist so that the Hodge–Tate numbers are `(a, 0)` with `a ≥ 0`; regularity gives `a > 0`. Apply the strong form to `ρ̄_λ` for infinitely many `λ`: the forms all lie in `S_k(Γ₁(N))` with `k = a + 1` and `N` fixed, so one newform occurs infinitely often. The general irregular-system theorem, Theorem 10.1(ii), is outside this roadmap. Its finite-image case is Corollary 10.2(ii) below.
Source: [KW-I], Theorem 10.1 and its proof, p. 20.
*Needs:* `S6/strong-form-of-serre-conjecture`; ClassicalSerreModularity §I.3.

**Checks.**

- Hodge–Tate weights `{0,1}` are regular and give weight two after normalization.
- The multiset `{0,0}` is irregular and fails this target's hypothesis.
- An odd finite-image system is irregular; its modularity belongs to the separate Artin weight-one conclusion below.

**Reductions of an odd Artin representation** (`S7/artin-reductions-of-serre-type`). Let `ρ : G_ℚ → GL₂(ℂ)` be continuous, irreducible and odd, with image `G = Gal(M/ℚ)` (finite, since `GL₂(ℂ)` has no small subgroups), Artin conductor `N` and determinant `ε`, a Dirichlet character `mod N` with `ε(−1) = −1`.
(a) There are a number field `E ⊂ ℂ` and `ρ_E : G → GL₂(E)` with `ρ_E ⊗ ℂ ≅ ρ`. For every finite place `λ` of `E`, with residue characteristic `ℓ, ρ_E` stabilises an `𝒪_λ`-lattice `Λ`, and `ρ̄_λ = Λ/λΛ` satisfies `tr ρ̄_λ(Frob_r) ≡ tr ρ(Frob_r)` and `det ρ̄_λ(Frob_r) ≡ ε(r) (mod λ)` for primes `r ∤ Nℓ`. `E` need not be the field of traces.
(b) If `ℓ ∤ |G|`, then `ℓ` is odd, `ρ̄_λ` is absolutely irreducible, odd, faithful on `G`, independent of `Λ`, and `dim (ρ̄_λ)^H = dim ρ^H` for every subgroup `H ≤ G`.
(c) If moreover `ℓ ∤ N`, then `ρ̄_λ` is unramified at `ℓ, N(ρ̄_λ) = N, ε(ρ̄_λ) = ε mod λ`, Serre's weight is `k(ρ̄_λ) = ℓ` and Edixhoven's weight is `1`.
(d) The primes `ℓ ∤ N|G|` with `ρ(Frob_ℓ)` conjugate to `ρ(c)` have Dirichlet density `|C|/|G| > 0, C` the class of `ρ(c)`; for such `ℓ, ρ̄_λ(Frob_ℓ)` has the distinct eigenvalues `1` and `−1`, so `ρ̄_λ|_{D_ℓ} ≅ 1 ⊕ η` with `η ≠ 1` unramified.
Proof outline: `ℚ̄[G]` is split semisimple, so `ρ` is realisable over a number field; the lattice `Σ_g ρ_E(g)𝒪_λ²` is stable. When `ℓ ∤ |G|` the averaging idempotent `e_H = |H|⁻¹Σ_{h∈H} h` acts on `Λ`, so invariants commute with reduction; the endomorphism ring of the reduction is the reduction of a rank-one direct summand, and Maschke's theorem gives semisimplicity, so the reduction is absolutely irreducible. The kernel of `GL₂(𝒪_λ) → GL₂(k_λ)` is pro-`ℓ`, which gives faithfulness. The conductor is computed from the ramification filtration of `M`, the same for `ρ` and `ρ̄_λ`, and the invariant dimensions agree. Trivial inertia at `ℓ` gives Serre weight `ℓ` and Edixhoven weight `1`, and `det ρ̄_λ = ε(ρ̄_λ)χ̄_ℓ^{ℓ−1} = ε(ρ̄_λ)`. Chebotarev gives (d).
Source: [KW-I], Corollary 10.2(ii), p. 21, and proof of Theorem 10.1(ii), p. 20, state the modularity conclusions; parts (a)–(d) and their reduction argument are targets here.
*Needs:* `ArithmeticGaloisRepresentations Layer 1`; `ArithmeticGaloisRepresentations Layer 3`; AlgebraicModularFormsAndSerreWeights §4.2; AlgebraicModularFormsAndSerreWeights §4.10; AlgebraicModularFormsAndSerreWeights §7.5; [Chebotarev, Layer 10][cheb]; `NumberField.Chebotarev.frobeniusPrimeSet`; `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`; `NumberField.Chebotarev.infinite_frobeniusPrimeSet`; `MonoidAlgebra.Submodule.exists_isCompl`.

**Checks.**

- For a subgroup acting trivially, the averaging idempotent is the identity and both invariant dimensions are two.
- If the group order is invertible in the residue field, two stable lattices in the same generic representation have isomorphic full reductions, by semisimplicity and equality of characteristic polynomials.
- At residue characteristic three, the order-three local type at `2` of ClassicalSerreModularity `I.3/prescribed-lifts` has standard and adapted reductions with inertia-invariant dimensions two and one. Here three divides the group order six, so the lattice-independence hypothesis fails.

**Weight one modulo `ℓ`** (`S7/unramified-residual-representations-arise-in-weight-one`). Let `ℓ` be an odd prime and `ρ̄ : G_ℚ → GL₂(𝔽̄_ℓ)` continuous, irreducible, odd and unramified at `ℓ`, with conductor `N` and character `ε = det ρ̄`, such that `ρ̄(Frob_ℓ)` has two distinct eigenvalues. Then there is a Katz cuspidal eigenform `h` of type `(N, 1, ε)` over `𝔽̄_ℓ` (a section of `ω ⊗ 𝒪(−cusps)` on the `Γ₁(N)` moduli stack, on which the diamond operators act through `ε`) with `T_r h = tr ρ̄(Frob_r) · h` for every prime `r ∤ Nℓ`. The form need not lift to characteristic zero for this `ℓ`.
Proof outline: `k(ρ̄) = ℓ`, so the strong form gives a newform `f` of weight `ℓ` and level `N` with `ρ̄_{f,λ′} ≅ ρ̄`; its reduction `g` is a Katz eigenform of type `(N, ℓ, ε)`. `g` is ordinary, since a supersingular eigenform has ramified local representation at `ℓ`. So `ρ_g|_{D_ℓ} ≅ (λ(ε(ℓ)/a_ℓ), ∗; 0, λ(a_ℓ))`, and distinct Frobenius eigenvalues give `a_ℓ² ≠ ε(ℓ)`. `ρ̄` is not exceptional in Edixhoven's sense, Edixhoven's weight is `1`, and Gross's companion-form theorem `(k = ℓ, k′ = 1)` gives `h` with `a_r(h) = a_r(g)` for `r ≠ ℓ`. Without the hypothesis on `Frob_ℓ` the conclusion still holds for `ℓ > 2` by the form of Edixhoven's theorem without an exceptional case (Coleman–Voloch); the Artin case below uses only the form with the hypothesis.
Source: [KW-I], proof of Theorem 10.1, p. 20.
*Needs:* `S6/strong-form-of-serre-conjecture`; `SerreWeightAndLevelOptimisation §3.7`; `SerreWeightAndLevelOptimisation §§3.5–3.6`; `SerreWeightAndLevelOptimisation §3.1`; `SerreWeightAndLevelOptimisation §3.2`; AlgebraicModularFormsAndSerreWeights §4.2; AlgebraicModularFormsAndSerreWeights §4.10; AlgebraicModularFormsAndSerreWeights §2.8; AlgebraicModularFormsAndSerreWeights §7.4.

**Weight-one forms reduce onto Katz forms for almost all `ℓ`** (`S7/weight-one-reduction-is-onto-for-almost-all-primes`). Let `N ≥ 5, X = X₁(N)` over `ℤ[1/N]` (proper smooth of relative dimension one), `ω` its Hodge bundle, `C` the cusps, and `S₁(N; A) = H⁰(X_A, ω ⊗ 𝒪(−C))` for a `ℤ[1/N]`-algebra `A`. There is a finite set `B(N)` of primes such that for every prime `ℓ ∤ N` outside `B(N)` and every discrete valuation ring `𝒪` flat over `ℤ_(ℓ)` with residue field `k`, the base-change map `S₁(N; 𝒪) ⊗ k → S₁(N; k)` is an isomorphism, compatible with `T_r (r ∤ Nℓ)` and the diamond operators. One may take `B(N)` to be the primes `ℓ` for which `H¹(X, ω ⊗ 𝒪(−C))` has nonzero `ℓ`-torsion: multiplication by `ℓ` on the invertible sheaf gives `0 → H⁰/ℓ → H⁰(X_{𝔽_ℓ}, ·) → H¹[ℓ] → 0`, and `H¹` is finitely generated over the principal ideal domain `ℤ[1/N]`, so only finitely many primes divide its torsion. `B(N)` may be nonempty. In weight `k ≥ 2` the exceptional set is empty (`H¹` vanishes for `k ≥ 3`, and is locally free for `k = 2` by Kodaira–Spencer and duality).
Source: [KW-I], proof of Theorem 10.1, p. 20, sketches the weight-one step by reference to [Kh97]; the cohomology argument above proves the base-change assertion and defines `B(N)`.
*Needs:* AlgebraicModularFormsAndSerreWeights §1.2; AlgebraicModularFormsAndSerreWeights Layer 2; AlgebraicModularFormsAndSerreWeights §2.4; AlgebraicModularFormsAndSerreWeights §2.8; AlgebraicModularFormsAndSerreWeights §2.12; AlgebraicModularFormsAndSerreWeights §2.3.

**Khare's weight-one descent** (`S7/weight-one-descent-from-infinitely-many-primes`). Let `N ≥ 1, ε` a Dirichlet character `mod N, E ⊂ ℂ` a number field containing its values, and `(t_r)` elements of `𝒪_E` indexed by the primes `r ∤ N`. Put `N′ = N` if `N ≥ 5` and `N′ = 5N` otherwise. Suppose that for infinitely many primes `ℓ` there are a place `λ | ℓ` of `E`, an embedding of its residue field in `𝔽̄_ℓ`, and a Katz cuspidal eigenform `h_ℓ` of type `(N, 1, ε mod λ)` over `𝔽̄_ℓ` with `T_r h_ℓ = (t_r mod λ) h_ℓ` for every prime `r ∤ Nℓ`. Then there is a normalised newform `f` of weight one and level dividing `N′`, with character agreeing with `ε` on integers prime to `N′`, such that `a_r(f) = t_r` for every prime `r ∤ N′`. If moreover `ρ : G_ℚ → GL₂(ℂ)` is continuous, semisimple and unramified outside `N` with `tr ρ(Frob_r) = t_r` and `det ρ(Frob_r) = ε(r)` for `r ∤ N`, then `ρ` is isomorphic to the Deligne–Serre representation `ρ_f`. Nothing is assumed about `T_ℓ` or the operators at primes dividing `N`, and the level of `f` is only shown to divide `N′`.
Proof outline: pull `h_ℓ` back to level `N′` and discard `ℓ | 2N′` and `ℓ ∈ B(N′)`. By the previous target, `h_ℓ` lies in the reduction of the finite free module `M = S₁(N′; ℤ[1/N′])`; the Deligne–Serre lemma gives an eigenvector over a discrete valuation ring with eigenvalues `b_r ≡ t_r`. The eigenvalue systems on `M ⊗ ℚ̄` form a finite Galois-stable set, so one system `Θ` occurs for infinitely many `ℓ`; then `Θ(T_r) − t_r` lies in primes above infinitely many rational primes and vanishes. `Θ` is the system of a nonzero weight-one form, and the theory of newforms gives `f`. Two semisimple representations of finite image with equal traces and determinants at all Frobenius elements outside a finite set are isomorphic, by Chebotarev.
Source: [KW-I], proof of Theorem 10.1, p. 20, sketches descent by reference to [Kh97]; the finite Galois-orbit argument above supplies the descent proof.
*Needs:* `S7/weight-one-reduction-is-onto-for-almost-all-primes`; AlgebraicModularFormsAndSerreWeights §5.10; AlgebraicModularFormsAndSerreWeights §2.4; AlgebraicModularFormsAndSerreWeights §1.5; [ModularForms, Layers 4–5][mf]; AlgebraicModularFormsAndSerreWeights §6.4; `ArithmeticGaloisRepresentations Layer 5`; [Chebotarev, Layer 10][cheb].

**Odd Artin representations come from weight one** (`S7/odd-artin-weight-one-modularity`). Let `ρ : G_ℚ → GL₂(ℂ)` be continuous, odd and irreducible, with Artin conductor `N`; put `N′ = N` if `N ≥ 5` and `N′ = 5N` otherwise. There is a normalised cuspidal newform `f` of weight one, level dividing `N′` and character `det ρ` on integers prime to `N′`, with `ρ ≅ ρ_f`. This is Khare–Wintenberger Corollary 10.2(ii). Proof: for `ℓ` in the positive-density set `P_c` of `S7/artin-reductions-of-serre-type`(d) and `λ | ℓ, ρ̄_λ` is absolutely irreducible, odd, unramified at `ℓ` with distinct Frobenius eigenvalues `1, −1`, of conductor `N` and character `det ρ mod λ`; the weight-one step gives a Katz eigenform `h_ℓ` of type `(N, 1, det ρ mod λ)` with eigenvalues `tr ρ(Frob_r) mod λ`; descent over the infinite set `P_c` gives `f`. The weight-one step used is the non-exceptional case of Edixhoven's theorem.
Source: [KW-I], Corollary 10.2(ii) and §10.2, p. 21.
*Needs:* `S7/artin-reductions-of-serre-type`; `S7/unramified-residual-representations-arise-in-weight-one`; `S7/weight-one-descent-from-infinitely-many-primes`; `S6/strong-form-of-serre-conjecture`; AlgebraicModularFormsAndSerreWeights §6.4.
`Suggested.lean` states Artin weight-one modularity as `weight_one_artin_modularity`. Open kernel gives continuity with finite image on the Krull Galois group; the conclusion includes unramifiedness, trace equality and determinant-character equality at every prime away from the newform level. The exact conductor divisibility above requires the Artin conductor, absent at the pins.

**Checks.**

- A representation induced from a non-conjugation-invariant finite-order character of an imaginary quadratic field is included in the dihedral case.
- An odd icosahedral Artin representation is included without a solvable-image hypothesis.
- A sum of two characters fails irreducibility; its weight-one Eisenstein series is outside the cuspidal conclusion.

### Examples

The regular Hodge pair `{0,1}` gives weight `2`; the pair `{0,0}` belongs to the distinct Artin weight-one argument. For absolutely irreducible elliptic torsion at a good prime `p ≥ 5` the finite-flat case gives weight `2` and trivial character; a très ramifiée local extension fails the finite-flat hypothesis.

### Dependencies

Layer S6 supplies the strong form. The finite-flat, geometric-form, companion-form, Chebotarev and newform suppliers in the individual targets supply the refinements and the descent.

## Worked examples

The following worked Checks distinguish the statements and conventions from plausible alternatives.

- **Bad-dihedral arithmetic.** `p > 2k` excludes `p = 2k − 1` and `p = 2k − 3`; the niveau-two case is attained at `p = 7, k = 5`, where `gcd(8, 4) = 4` and `8/4 = 2`. At level one a bad-dihedral representation has `p ≡ 3 (mod 4)`, which `N ≡ 1 (mod 8)` and `p = 5` avoid. At weight `2` the excluded primes are `3` and `1`.
- **Odd ramification index.** An odd valuation stays odd in an extension of odd ramification index and becomes even in index `2`.
- **Order-three lattices.** The identities `D₀³ = F₀² = 1, F₀D₀F₀⁻¹ = D₀², D₀P = PD₁, F₀P = PF₁, D₁³ = F₁² = 1, F₁D₁F₁⁻¹ = D₁²`, and the reductions modulo `π`, in exact arithmetic over `ℤ[ζ]`; both Frobenius matrices have trace `0`.

## Corrections to the sources

Every target above uses the corrected statement.

- [KW-I], §3.2 and the remark after Theorem 3.4, p. 6: Theorem 3.4 proves modularity, and the passage to weight `k(ρ̄)` and level `N(ρ̄)` claimed in Theorem 1.2, including the scalar dyadic case, is not written out. `S6/strong-form-by-minimal-lifts` supplies it from Theorems 4.1 and 5.1(1), Lemmas 6.1 and 6.2(i), `θ`-operators, Edixhoven's weight theorem and the Deligne–Serre lemma.
- [DP], Paso 3, p. 12: the lift at `p_i` is crystalline with unramified Weil–Deligne parameter, not an unramified `p_i`-adic representation. Its system omits `p_i` from the fixed ramification set, while the member above `p_i` can ramify there.
- [DP], Paso 2, p. 11: `(N − 1)(N + 1)` is the order of the unit group of the residue field `𝔽_{N²}`, which itself has `N²` elements; and the niveau-two condition concerns the restriction of `κ` to the inertia group at `N`, not at `q`.
- [DP], Paso 2, p. 11: the lift `ρ^{(2)}_q` does not have dihedral image of order `2q` at `N`, since `det ρ^{(2)}_q(Frob_N) = ψ(N)N` is not a root of unity; its inertial type at `N` is that of `Ind κ`, and the projective image of `D_N` is dihedral of order `2q`, which is all Lemma 2.1 uses. Even `Ind κ` has image of order `2q` only when `κ(Art(N)) = 1`.
- [DP], Remark 6, p. 13: flatness over some extension of even ramification index gives no contradiction. The operative fact is that a très ramifiée representation becomes finite flat over no extension of odd ramification index: up to twist it is given by a Kummer class of odd valuation, which over `K` has valuation `e(K/ℚ₂)` times as large, and it is finite flat over `K` exactly when that valuation is even; so it becomes flat over `ℚ₂(√x)` (index `2`) but over no extension of odd ramification index.
- [DP], definition of minimal lift, p. 6, Lemma 2.1, p. 11, Pasos `3–4`, pp. 12–13: with Dieulefait–Pacetti's definition, under which a minimal lift need only be unramified at the primes `ℓ ≠ p` where `ρ̄` is unramified, a lift of `ρ̄_{p_i}` could have type `Ind(κε)` at `N` with `ε` of `p_i`-power order, and Lemma 2.1 would not apply to the new system. The lifts must be minimal in the sense of ClassicalSerreModularity Conventions §2.3, which Khare–Wintenberger Theorem 5.1 provides; then the type at `N` is kept.

## Source notes

- [Kh] is cited in the page numbers of arXiv v1. It was published, with a different title, in Duke Math. J. 134 (2006).
- [KW-I] is cited in the running page numbers (2–21) of the authors' preprint, not the Inventiones pages. Its Theorems 4.1 and 5.1 are proved in the sequel [KW-II]; this roadmap uses them as stated, through ClassicalSerreModularity §§I.2–I.3.
- [DP] is cited in the pages of arXiv v2. The lifting theorems it imports are used in the forms stated in `S1/lifting-theorems-over-the-rationals`.
- The weight-one step and the descent of Layer S7 go back to Gross's companion forms, Coleman–Voloch, Edixhoven's weight paper with its note on the exceptional case, and Khare's note on `mod p` forms of weight one (Internat. Math. Res. Notices `1997`, corrigendum `1999`). The proofs given in Layer S7 are complete from the listed prerequisites; the form of the weight-one step without a hypothesis on `Frob_ℓ` rests on Coleman–Voloch through `SerreWeightAndLevelOptimisation §3.7`. The Artin argument uses the distinct-Frobenius form; the general theorem for irregular compatible systems is outside this roadmap.

## Suggested Lean forms

[`Suggested.lean`](Suggested.lean) uses the namespace `TauCetiRoadmap.SerreModularityByCompatibleSystems`. Its four theorem statements are `serre_conjecture_weak` (S5), `khare_level_one` and `finite_level_one_semisimple` (S6), and `weight_one_artin_modularity` (S7). Its definitions repeat, unchanged, the arithmetic interfaces of ClassicalSerreModularity: the aliases `GQ`, `IntBar` and `FpBar` on native Mathlib carriers, the predicates `IsFrobAt`, `IsUnramifiedAt`, `IsOdd`, `IsAbsIrreducible` and `IsSType`, the newform readings `coeff` and `coefficientRing`, the attachment `ArisesFrom` and the matrix action `toRepresentation`.

The exact strong theorem requires the residual Artin conductor and Serre-weight recipe. The finite-flat case also requires the finite-flat residual predicate and its group-scheme model. The compatible-system statements require the system carriers and local period conditions of their suppliers. The Katz weight-one step, the geometric reduction theorem and the descent require the geometric modular-form spaces and their integral Hecke actions, and the exact-conductor Artin refinement requires the Artin conductor. These targets, their APIs and their Checks are specified in the layers above.

## Scope and ownership

### Owned here

- Dieulefait–Pacetti's chain of compatible systems: the weak form and the solvable case, the normalisation of the residual weight, the Fontaine–Laffaille members, Paso 1 to Paso 6 with the dihedral type at the auxiliary prime and the order-three type at `2`, the odd-characteristic assembly, characteristic two, the qualitative theorem, and the check that the proof does not use Serre's conjecture (S1–S5).
- The lifting theorems 1.4–1.7 over `ℚ` as statements without conditions, assembled from the lifting theorems and their inputs in the roadmaps named below (S1).
- The passage from modularity to weight `k(ρ̄)` and level `N(ρ̄)` by minimal lifts, including the scalar dyadic case, the strong form of Serre's conjecture, the level-one case and the finiteness of level-one representations (S6).
- The finite-flat weight-two case, Theorem 10.1(i) for regular compatible systems, and weight-one modularity of odd Artin representations with its three ingredients (S7).

### Arithmetic and geometric boundaries

| Owner | Interface used here |
| --- | --- |
| ClassicalSerreModularity Layer I, R27.1 and R33.1, its Conventions and its Arithmetic interfaces | Potential modularity with local control; the Skinner–Wiles ordinary lifting theorems; Khare–Wintenberger's global finiteness, lifting theorem and prescribed lifts (Theorems 4.1 and 5.1); compatible systems and residual links; good-dihedral primes, Lemma 6.3, Lemma 8.2, Dickson and Lemmas 6.1–6.2; the globalisations of local residual representations and the twist-two vanishing; the conventions for residual representations, Serre's invariants and compatible systems, and the Lean interfaces. |
| GL2ModularityLifting §§7.7, 8.8–8.9, 9.3, 10.15 and 12.1–12.5 | The de Rham, dyadic and residually reducible lifting theorems over `ℚ` and the transfer statements, under its hypotheses LL1–LL3, CC1–CC5 and LC; the admissible forms of the source theorems. |
| CompletedCohomologyAndLocalGlobalCompatibility §§5.4, 5.6, 6.3, 6.5 and 6.6 | The Breuil–Mézard identities proved from patched data at odd `p` and at `2`, the locally algebraic vectors of non-crystabelline types, the globalisation audit and the exports CC1–CC4. |
| PadicLocalLanglandsForGL2Qp §§4.5, 6.1–6.2, 6.6 and 6.10 | The local Breuil–Mézard identities of Paškūnas and Hu–Tan, Kisin's local inequality and his Hypothesis (1.2.6). |
| AlgebraicModularFormsAndSerreWeights Layers 1–7 | Serre weights, attachment and its comparisons, Katz forms, and Deligne–Serre eigenvalue lifting. |
| `GL2AutomorphicRepresentationsAndTransfer:R17.5`, `R17.6` | Langlands–Tunnell and Rohrlich–Tunnell: solvable and dyadic dihedral residual modularity. |
| SerreWeightAndLevelOptimisation Layers 3–6 | `θ`-operators, Edixhoven's weight theorem, Carayol's change of nebentypus and the dyadic level and weight optimisation. |
| SmallRamificationAndAbelianVarietyBaseCases Layers 2–5 | Tate and Serre in characteristics `2` and `3`, Schoof's theorem, Snowden's realisation, the ordinary terminal members and the terminal application at five. |
| ArithmeticGaloisRepresentations Layers 1–5 and §6.1 | Representations, conductors, Dickson's classification, compatible-system linkage and the elliptic residual representation. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.24a, R07.4.20 and R07.5.6a | The finite-flat residual predicate and Fontaine's conjecture for weights `{0, 1}`. |
| [Chebotarev, Layer 10][cheb], ClassFieldTheory Layer 13 and [ModularForms, Layers 4–5][mf] | Frobenius density, Kronecker–Weber, newforms and strong multiplicity one. |

### Consumers and boundaries

- Roadmaps that need Serre's conjecture or its consequences use Layers S5–S7: the qualitative theorem `S5/qualitative-serre-theorem`, the strong form `S6/strong-form-of-serre-conjecture`, the finite-flat case `S7/finite-flat-weight-two-case`, Theorem 10.1(i) `S7/regular-compatible-systems` and weight one, `S7/odd-artin-weight-one-modularity` with its descent.

### Outside this roadmap

The general theorem for irregular compatible systems, Khare–Wintenberger Theorem 10.1(ii), is outside this roadmap; its finite-image case is `S7/odd-artin-weight-one-modularity`. Corollary 10.2(i) of Khare–Wintenberger, modularity of `GL₂`-type abelian varieties over `ℚ`, follows from Theorem 10.1(i) together with Faltings' isogeny theorem and is outside this roadmap. Katz weight-one forms in residue characteristic two and Edixhoven's strong form at `p = 2` are not part of the strong theorem here. Khare and Wintenberger's own proof, by induction on the weight and on the conductor, is not repeated.

## Exact supplier contracts

Use Mathlib and Tau Ceti at the pinned revisions. The following declarations are used as they stand.

| Declaration | Use |
| --- | --- |
| `Matrix.GeneralLinearGroup` | `GL₂` of the coefficient ring. |
| `AlgebraicClosure`, `AlgEquiv`, Krull topology | `G_ℚ = AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ`, used unfolded as in ClassicalSerreModularity. |
| `IsArithFrobAt`, `Ideal.inertia` | Frobenius elements and inertia groups at primes of the algebraic integers. |
| `NumberField.ComplexEmbedding.IsConj` | Complex conjugations. |
| `MonoidAlgebra.Submodule.exists_isCompl` | Maschke's theorem over a field in which the group order is invertible. |
| `Representation.IsSemisimpleRepresentation` | Semisimplicity in the finiteness statement. |
| `ModularForm`, `CuspForm`, `DirichletCharacter`, `HeckeRing.GL2.Newform` | The analytic carriers and Tau Ceti's bundled newforms; the attached Galois representations are supplied by other roadmaps. |

### From ClassicalSerreModularity

Layer I as stated there: Moret-Bailly's theorem and controlled residual potential modularity (I.0); `I.1/residually-reducible-ordinary-lifting` with its ordinary hypotheses, used at `p = 3` as Theorem 1.7; Khare–Wintenberger's Theorem 4.1 (`I.2/classical-modularity-lifting`) and the prescribed lifts, compatible systems and residual links of I.3. R27.1: the good-dihedral definition, Lemma 6.3, Lemma 8.2 with prime-field coefficients, and the Dickson–Lemma 6.1–6.2 package. R33.1: the globalisation of a local residual representation from potential modularity (`R33.1/global-arithmetic-action`), which supplies the globalisations of CC5 for `GL₂(ℚ_p)`, and `R33.1/twist-two-vanishing`, which is LC for `p ≥ 5`.

### From GL2ModularityLifting

§§8.8, 9.3 and 10.15 with the transfer statements §§12.1–12.3 and 12.5, at their stated hypotheses, including LL1–LL3, CC1–CC5 and LC; §7.7 fixes that only the forms assuming residual modularity are admissible, and §8.9 lists what each application verifies.

### From CompletedCohomologyAndLocalGlobalCompatibility

§5.4(4) and §5.6(4): the Breuil–Mézard identities for every residual representation of `G_{ℚ_p}`, `p` odd, and of `G_{ℚ₂}`; §6.3: the locally algebraic vectors of potentially crystalline, non-crystabelline types; §6.6: the exports CC1–CC4; §6.5: the audit of the globalisations and of the residual-modularity hypotheses.

## References

- [DP] L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's Conjectures*, [arXiv:2108.07577v2][dp] (2022).
- [KW-I] C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504; [authors' preprint][kw1].
- [KW-II] C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009), 505–586; [authors' preprint](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf).
- [Kh] C. Khare, *On Serre's modularity conjecture for 2-dimensional `mod p` representations of `Gal(ℚ̄/ℚ)` unramified outside `p`*, [arXiv:math/0504080v1][kh] (2005); published as *Serre's modularity conjecture: the level one case*, Duke Math. J. 134 (2006), 557–589.
- [Kh97] C. Khare, *Remarks on mod p forms of weight one*, Internat. Math. Res. Notices 1997, no. 3, 127–133, [original note](https://doi.org/10.1155/S1073792897000093); corrigendum, 1999, no. 18, 1029, [correction](https://doi.org/10.1155/S1073792899000537).
- [Se87] J.-P. Serre, *Sur les représentations modulaires de degré 2 de `Gal(ℚ̄/ℚ)`*, [Duke Math. J. 54 (1987), 179–230][se].
- [KiFM] M. Kisin, *The Fontaine–Mazur conjecture for `GL₂`*, [J. Amer. Math. Soc. 22 (2009), 641–690](https://www.ams.org/journals/jams/2009-22-03/S0894-0347-09-00628-6/S0894-0347-09-00628-6.pdf).
- [TuA] S.-N. Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_Qp*, [arXiv:1803.07451v4](https://arxiv.org/abs/1803.07451v4); locators use this version.
- [TuB] S.-N. Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, [arXiv:1908.06174v3](https://arxiv.org/abs/1908.06174v3); locators use this version.
- [Pan] L. Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, J. Amer. Math. Soc. 35 (2022); [arXiv:1901.07166v2](https://arxiv.org/abs/1901.07166v2) (cited in the pages of arXiv v2).
- [HT] Y. Hu and F. Tan, *The Breuil–Mézard conjecture for non-scalar split residual representations*, Ann. Sci. Éc. Norm. Supér. 48 (2015); [arXiv:1309.1658v2](https://arxiv.org/abs/1309.1658v2).
- [Paš16] V. Paškūnas, *On 2-adic deformations*, Math. Z. 286 (2017); [arXiv:1509.00332v2](https://arxiv.org/abs/1509.00332v2).

Neighbouring Tau Ceti roadmaps: [Chebotarev][cheb], [ModularForms][mf].

[kh]: https://arxiv.org/abs/math/0504080v1
[kw1]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[dp]: https://arxiv.org/abs/2108.07577v2
[se]: https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf
[cheb]: ../../Completed/Chebotarev/README.md#layer-10-dirichlet-density-chebotarev
[mf]: https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/ModularForms/README.md#layer-4-primitive-associates
