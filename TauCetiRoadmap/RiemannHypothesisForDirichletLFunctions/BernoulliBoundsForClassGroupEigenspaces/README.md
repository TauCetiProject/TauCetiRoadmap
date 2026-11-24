# Roadmap: Bernoulli bounds for class group eigenspaces

**Summary.** For a number field `F`, a prime `ℓ` and `e ≥ 1`, the twisted Tate–Shafarevich group `Ш¹(F, ℓ, e)` is the group of classes in `H¹(G_F, ℚ_ℓ/ℤ_ℓ(−e))` that are unramified at every finite place prime to `ℓ` and vanish on the decomposition groups above `ℓ`. It is finite; its strict form is Pontryagin dual to the cohomological wild kernel `Sha²_{e,ℓ}(F)`, and for odd `ℓ` its length is that of the `ℓ`-part of the wild kernel of `K_{2e}(F)`; the length of its strict form is at most that of `H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`; and over an abelian field it splits into components indexed by Dirichlet characters. Along the cyclotomic tower its classes become eigen-homomorphisms on class groups, the twist `e` fixing the eigencharacter. This roadmap defines these groups and their total over all primes and twists, and bounds them by generalized Bernoulli numbers and by explicit torsion bounds for the homology of general linear groups over rings of integers, for étale cohomology and for K-groups. It also records a rank bound for unramified Iwasawa modules, a special-value formula for finite-order characters, and two statements on Kato's Euler systems for modular forms.

The headline theorems are these. (1) Let `E` be an abelian CM field of conductor `N` and degree `n`, `ℓ` an odd prime not dividing `n`, `e ≥ 1`, and `ψ` a character of `Gal(E/ℚ)` with `ψ(−1) = (−1)^{e+1}`, with values in the integers `O` of a finite extension of `ℚ_ℓ`. The normalized length of the `ψ`-component of the twisted Tate–Shafarevich group over `ℚ`, with vanishing imposed at `ℓ` and at the primes dividing the conductor of `ψ`, is at most `v_O(N·P_{e+2}·B_{e+1,ψ})`, where `B_{e+1,ψ}` is the generalized Bernoulli number of the primitive character attached to `ψ` and `P_{e+2}` the product of the primes `≤ e + 2`; and `Σ_{ℓ odd, ℓ∤n} log ℓ · length Ш⁻(E, ℓ, e) ≤ n log(16 N^{e+2} (e + 1)!)`. (2) There is an absolute constant `c₂` such that for every number field `L` of degree `n` and discriminant `d_L`, every `N ≥ 1` and every `m ≥ 0`, the group `H_m(GL_N(𝒪_L); ℤ)` is finitely generated and `log log #H_m(GL_N(𝒪_L); ℤ)_tors ≤ c₂(m + 1)(nN)³N · log(2|d_L| n N)` (for totally complex `L` this is the bound of [FormalProof]). (3) There is an absolute constant `C_K ≥ 1` such that for every prime `ℓ`, every totally complex number field `L` containing `μ_ℓ` (and `μ₄` if `ℓ = 2`) and every `E ≥ 1`, the group `H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` is finite and `log #H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1)) ≤ (2|d_L|)^{(2E[L:ℚ])^{C_K}}`; and there is an absolute `C` such that for every number field `L` of degree `n` and every `m ≥ 2`, the part of `K_m(𝒪_L)_tors` prime to `R_m` has order at most `exp((2|d_L|)^{(mn)^C})`, where `R_m` is an integer depending only on `m` that kills the kernel of the Hurewicz map `K_m(R) → H_m(GL(R); ℤ)` for every ring `R`. (4) Let `f` be a newform of weight `k ≥ 2`, `K` an abelian field, `λ` a place above `p` of the coefficient field of `f` with `(f, λ)` admissible over `K`, and `1 ≤ r ≤ k − 1` with `r ≠ k/2`; then the Bloch–Kato group `H¹_f(K, V_λ(f)(r))` vanishes. If `f` has no complex multiplication, `(f, λ)` is admissible over every abelian field whenever the restriction of `V_λ(f)` to the decomposition group at `p` is reducible, in particular at every ordinary place.

The roadmap extends four roadmaps. [ArithmeticKTheory](../../ArithmeticKTheory/README.md) supplies the K-groups of rings of integers, their ranks, the étale comparison of the even groups and the wild kernels on which the twisted Tate–Shafarevich groups and the torsion bounds are built. [EulerSystemsCyclotomicMainConjecture](../../EulerSystemsCyclotomicMainConjecture/README.md) has the cyclotomic Euler systems and Stickelberger annihilation, which the Bernoulli bound for minus parts complements. [IntegralIwasawaTheory](../../IntegralIwasawaTheory/README.md) has the towers, the unramified Iwasawa modules and the main conjecture for characters that the rank bound and the special-value formula extend. KatoEulerSystems has the admissible pairs, the splitting of Momose's algebra at ordinary places and the finiteness of Selmer groups over abelian fields behind the last two statements. The duality of Sha kernels comes from [HeckeIdealsAndTaylorWilesRelations](../HeckeIdealsAndTaylorWilesRelations/README.md) and ArithmeticGaloisDuality §D7.6a, and the perfect forms over rings of integers generalize those of [LatticePackingsAndPerfectForms](../../LatticePackingsAndPerfectForms/README.md). In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [UniformWildKernelBounds](../UniformWildKernelBounds/README.md) uses the groups, their total, the character components, the étale bound and the Bernoulli bound.

Layer 6 defines `Ш¹(F, ℓ, e)` and its strict form, proves the duality with the cohomological wild kernels, finiteness, the comparison with `H²`, the behaviour under restriction, the finiteness and monotonicity of the total over all primes and twists, and the plus/minus decomposition for CM fields, and decomposes the group over abelian fields into character components. Layer 9 proves explicit torsion bounds by Soulé's method: torsion of cokernels with short relations and of the homology of a group acting on an acyclic complex, perfect forms over a ring of integers and the acyclicity of their nerve, the bound for the homology of `GL_N(𝒪_L)`, values of primitive classes, the additive classes of finite fields with a cycle of prescribed residues, the étale bound and the bounds for K-groups. Layer 10 bounds the minus parts of abelian CM fields by generalized Bernoulli numbers. Layer 11 bounds the ranks of unramified Iwasawa modules in cyclic extensions of degree `p`; Layer 12 extends the special-value formula of Iwasawa theory to finite-order characters of an abelian extension of a totally real field; Layer 13 shows that Momose's quaternion algebra splits at reducible places; Layer 14 proves the vanishing of rational Bloch–Kato groups at non-central twists. The layer and section numbers (Layers 6 and 9–14, sections from 6.17) are this roadmap's own and are cited below without a roadmap name, as in "6.17 (c)"; a section of ArithmeticKTheory, which also has a Layer 6, is always cited with that roadmap's name.

## Conventions

Notation and conventions not restated here are those of the roadmaps this one extends: ArithmeticKTheory (its Conventions, with the étale groups of ArithmeticKTheory §6.1 and the cohomological kernels `Sha²_{i,ℓ}(F)` of ArithmeticKTheory §6.9), EulerSystemsCyclotomicMainConjecture (its Conventions), IntegralIwasawaTheory (its Conventions and Layer 0: towers, Iwasawa modules, `Γ` and the Teichmüller character `ω`) and KatoEulerSystems (its Conventions: the newform `f`, its coefficient field, `V_λ(f)`, `E_λ`-coefficients and admissible pairs; and KatoEulerSystems §4.1: the group of inner twists, the field `F⁰`, Momose's quaternion algebra `B` over `F⁰` and the open subgroup `H` of `G_ℚ`).

- `F` is a number field, `ℓ` a prime, `S_ℓ` and `S_∞` the sets of places of `F` above `ℓ` and at infinity, `G_F` the absolute Galois group of `F` and `G_{F,S}` the Galois group of the maximal extension of `F` unramified outside `S`; `r₁(F)` is the number of real places. `H^i(𝒪_F[1/ℓ], ℤ_ℓ(j))` is continuous étale cohomology with Tate-twisted coefficients, as in ArithmeticKTheory.
- Lengths `length_{ℤ_ℓ}` take values in `ℕ∞`. For the integers `O` of a finite extension `Φ` of `ℚ_ℓ`, with ramification index `e_O`, an `O`-length is divided by `e_O` ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/CharacterLevelBounds/ShaFamMono.lean` (`UpperTheory.V.Chr.nrm`), `Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/SelmerTransport/ConjStableShaFam.lean` (`UpperTheory.V.Base.eO`)), and `v_O` is the valuation of `Φ` normalized by `v_O(ℓ) = 1`, so that both are measured in units of `ℓ`. For an abelian group `A`, `A{ℓ}` is its `ℓ`-primary part and `A_tors` its torsion subgroup.
- `Ш¹(F, ℓ, e)` and its strict form `Ш¹_str(F, ℓ, e)` are defined in 6.17. For a CM field `F` with maximal totally real subfield `F⁺` and `ℓ` odd, `Ш⁺(F, ℓ, e)` and `Ш⁻(F, ℓ, e)` are the eigenspaces of complex conjugation for `(−1)^e` and `(−1)^{e+1}` (6.17 (f)). `V(F, t)` is the total of 6.17 (e). The component `Ш_{ψ,e}(S)` and its normalized length `V_ℓ(ψ, e; S)` are defined in 6.18.
- Dirichlet characters are characters of `G_ℚ` through arithmetic Frobenius ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/CharacterLevelBounds/ShaFamMono.lean` (`UpperTheory.V.Chr.dirG`)), with values in `ℚ̄_ℓ` through a fixed embedding; `χ_ℓ` is the `ℓ`-adic cyclotomic character. Generalized Bernoulli numbers `B_{k,ψ}` are those of Tau Ceti's `DirichletCharacter.generalizedBernoulli` (CyclotomicClassGroupsAndStickelberger §3.1), with `B_{1,1} = +1/2` ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/BernoulliNumbers/MapGenBChar.lean` (`UpperTheory.V.Bern.genB`, `UpperTheory.V.Bern.bcoef`)); `P_k` is the product of the primes `≤ k`.
- In Layer 9, `L` is a number field of degree `n` and discriminant `d_L`, `H_m(G; ℤ)` is the homology of a group `G` with trivial coefficients `ℤ`, and "absolute" means independent of all data.
- The formal proof [FormalProof] (References) is cited by file and declaration at the commit the References name; paths are relative to the `src` directory of its repository, and `AV/` abbreviates the directory `Development/AutomorphicArithmetic/AutomorphicVarieties/`. Where a target names it, the form it states is recorded there, with its hypotheses; a wider form stated by the target is this roadmap's own, proved by the route written at the target. Its lengths over `O` are not divided by `e_O`.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The statements of 9.8, 12.1 and 13.1 are not
statements of [FormalProof]: 9.8 (a), and 12.1 when `[E : F]` is prime to `p`, are published theorems,
stated in the roadmaps cited with them; 9.8 (b), 12.1 when `p` divides `[E : F]`, and 13.1, which extends a
published splitting theorem from the ordinary places to the reducible ones, are this roadmap's own
formulations.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary
of:*`, which names a general theorem and the roadmap section that states it, and the clauses it covers when
it does not cover the whole section. The general theorem is proved in the roadmap that states it, and what
the line covers is deduced from it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only
that case, not the general theorem in full: the `*Method of the formal proof:*` label says how [FormalProof]
proves it, and for which form of the statement when that proof has a narrower one. Where the route given with
the section is not the deduction, it is a second proof, [FormalProof]'s unless the label says that it
differs; the `*Needs:*` line lists what that route needs, and the deduction needs the section that the
`*Corollary of:*` line names.

## Layer 6: Twisted Tate–Shafarevich groups and character components

This layer defines the twisted Tate–Shafarevich groups with divisible coefficients `ℚ_ℓ/ℤ_ℓ(−e)`, relates them to the cohomological wild kernels and to `H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`, sums their lengths over all primes and twists, and decomposes them over abelian fields into components indexed by Dirichlet characters.

### 6.17 Twisted Sha groups above `ℓ`, their duality and their total

*Origin:* adapted from Schneider (1979) and Kolster and Movahhedi (2000): Poitou–Tate duality between the
twisted Tate–Shafarevich group and the étale wild kernel, and the exact sequence of the étale wild kernel with `H²`,
the local `H²` and the dual of the global `H⁰` (ArithmeticGaloisDuality §D7.6a); here in lengths, with the
choice-free form (a), the restriction kernels (d), the total `V(F, t)` over all primes and twists (e), the
plus/minus split (f) and the case `ℓ = 2` with real places.

*Method of the formal proof:* for `ℓ` odd or `F` without real places, the equality
`length Sha²_{e,ℓ}(F) = length Ш¹(F, ℓ, e)` is obtained by counting at
each level `ℓ^r` from Poitou–Tate duality for finite modules, and the order identity of (c) by adding lengths along
the kernel, image and cokernel of the localisation map on `H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`. For a layer of the cyclotomic
`ℤ_ℓ`-extension the inequality of (d) comes from a descent formula: `length Ш¹` of the `m`-th layer is the length of
the cokernel of `g^{ℓ^m} − 1` for one operator `g` on a fixed module, and the image of `g^{ℓ^m} − 1` lies in that of
`g − 1`. The route written below differs in (b)–(d): it passes Poitou–Tate duality and the Poitou–Tate sequence to
the lattice `ℤ_ℓ(e+1)`, and for a layer of the cyclotomic `ℤ_ℓ`-extension it computes the kernel of restriction
(`Ĥ⁰ = 0` from the valuation of the norm, and the Herbrand quotient of a finite module).

*Corollary of:* ArithmeticGaloisDuality §D7.6a (Poitou–Tate duality for the `Ш` kernels of a lattice `T`,
`Ш²_S(F, T) ≅ Ш¹_S(F, T^D)^*`, and the exact sequence that ends the lattice sequence; here `T = ℤ_ℓ(e+1)`), for the
Pontryagin duality of (b), with the equality of lengths it gives, and for (c); (a), the other statements of (b) and
(d)–(f) are not deduced from it.

For a number field `F`, a prime `ℓ` and `e ≥ 1`, let `S = S_ℓ ∪ S_∞` and define

```text
Ш¹(F, ℓ, e) = ker( H¹(G_{F,S}, ℚ_ℓ/ℤ_ℓ(−e)) → ∏_{v | ℓ} H¹(F_v, ℚ_ℓ/ℤ_ℓ(−e)) ),
```

the classes unramified outside `ℓ` and trivial at every place above `ℓ` (HeckeIdealsAndTaylorWilesRelations §10.1,
`Ш¹_{S;S_ℓ}`), with length `length_{ℤ_ℓ}` in `ℕ∞`; and its strict version `Ш¹_str(F, ℓ, e) = Ш¹_S(F, ℚ_ℓ/ℤ_ℓ(−e))`, which also
vanishes at the real places. Prove:

(a) *Choice-free form.* `Ш¹(F, ℓ, e)` is the group of classes in `H¹(G_F, ℚ_ℓ/ℤ_ℓ(−e))` unramified at every finite
`v ∤ ℓ` and zero on the decomposition groups above `ℓ`; it does not depend on the decomposition groups chosen, and is
invariant under isomorphisms of fields.

(b) *Duality and finiteness.* `Ш¹_str(F, ℓ, e)` is the Pontryagin dual of the cohomological wild kernel `Sha²_{e,ℓ}(F)` of ArithmeticKTheory §6.9
(with `S` the primes above `ℓ`); in particular, for `ℓ` odd or `F` totally imaginary, `length Ш¹(F, ℓ, e) = length Sha²_{e,ℓ}(F)`,
which is the form used in this family; `Ш¹_str ⊂ Ш¹` with quotient in `(ℤ/2)^{r₁}`, zero unless `ℓ = 2` and `e` is even. Hence
`Ш¹(F, ℓ, e)` is finite for every `F`, `ℓ`, `e ≥ 1`, and equals `Ш¹_str` when `ℓ` is odd, `e` is odd or `F` is totally imaginary;
for odd `ℓ` its length is that of `WK^sym_{2e}(F){ℓ}` (ArithmeticKTheory §6.9).

(c) *Comparison with `H²`.* `length Ш¹_str(F, ℓ, e) ≤ length H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`, hence
`length Ш¹(F, ℓ, e) ≤ length H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1)) + r₁(F)`; and, for `ℓ` odd or `F` totally imaginary, the étale order identity
`length H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1)) + length H⁰(F, ℚ_ℓ/ℤ_ℓ(−e)) = length Ш¹(F, ℓ, e) + Σ_{v|ℓ} length H⁰(F_v, ℚ_ℓ/ℤ_ℓ(−e))`.

(d) *Restriction.* For a finite Galois `F′/F` the kernel of restriction `Ш¹(F, ℓ, e) → Ш¹(F′, ℓ, e)`, which lies in
`H¹(Gal(F′/F), H⁰(F′, ℚ_ℓ/ℤ_ℓ(−e)))` by HeckeIdealsAndTaylorWilesRelations §10.1(f), is zero if `ℓ ∤ [F′:F]`, zero if `μ_ℓ ⊂ F` (`μ₄` if `ℓ = 2`) and `F′` is a layer of the
cyclotomic `ℤ_ℓ`-extension of `F`, and has length at most one if `[F′ : F] = 2`.
In lengths: `length Ш¹(F, ℓ, e) ≤ length Ш¹(F′, ℓ, e)` in the first two cases and `length Ш¹(F, ℓ, e) ≤ 1 + length Ш¹(F′, ℓ, e)`
in the third; 9.7 and UniformWildKernelBounds use these inequalities only.

(e) *The total.* `V(F, t) = Σ_ℓ log ℓ · Σ_{1≤e<t} length Ш¹(F, ℓ, e)` is a finite sum of real numbers: for fixed `e`
only the primes dividing `2 · #K_{2e}(𝒪_F)` contribute. A bound `V(F, t) ≤ B` is used in the form: every `Ш¹(F, ℓ, e)`,
`1 ≤ e < t`, is finite, and every finite partial sum over primes is at most `B`; this form does not need the finiteness of the
set of contributing primes. `V(F, t)` is monotone in `t`, and `V(F, t) = log ∏_ℓ ∏_{1≤e<t} #Ш¹(F, ℓ, e)`.

(f) *Plus and minus parts.* For `F` CM with maximal totally real subfield `F⁺` and `ℓ` odd, `Ш¹(F, ℓ, e) = Ш⁺ ⊕ Ш⁻`, the
eigenspaces of complex conjugation for `(−1)^e` and `(−1)^{e+1}`; the `(+1)`-eigenspace is `Ш¹(F⁺, ℓ, e)` through restriction,
so `Ш⁻(F, ℓ, e) ≅ Ш¹(F⁺, ℓ, e)` for odd `e` and `Ш⁺(F, ℓ, e) ≅ Ш¹(F⁺, ℓ, e)` for even `e`.

[FormalProof] defines `Ш¹(F, ℓ, e)` through chosen decomposition groups as `Formalism.GaloisCohomology.Sha`, with length
`shaLen` (`Formalism/GaloisCohomology/Statement.lean`), and states these forms of the clauses above. (a) for lengths:
`UpperTheory.V.LDataCardLeFinrank.shaLen_eq_shaInv`, `shaInv_congr` and `indep`
(`AV/GaloisLibrary/GaloisCohomologyLength/ShaLenEqShaInv.lean`), with `shaInv` the choice-free length
(`AV/GaloisLibrary/GaloisCohomologyLength/LevelInertiaLeLevelDec.lean`). (b) and (c) only for `ℓ` odd or `F` without real
places, from Poitou–Tate duality, local finiteness and local Tate duality taken as hypotheses: the equality
`length Sha²_{e,ℓ}(F) = length Ш¹(F, ℓ, e)` as `GlobalTheory.TateLimit.ptShaAt`
(`Development/AbelianVarietyTheory/Proofs/FoundationProofs/LengthEqLengthInvariantsOfTorsionLevels.lean`), the inequality
of (c) as `UpperTheory.V.PropA.shaLeV` (`AV/AdditiveValuationNorms/ShaLeV.lean`), the length of `H²` being [FormalProof],
`Formalism/GaloisCohomology/Statement.lean` (`Formalism.GaloisCohomology.VLen`), and the order identity as
`UpperTheory.V.LDataCardLeFinrank.vFormula_of_classicalTheorems` (`AV/GaloisLibrary/GaloisCohomologyLength/Formula.lean`);
also [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/GaloisCohomologyLength/VFormula.lean`
(`UpperTheory.V.LDataCardLeFinrank.vFormula`), of the statement [FormalProof], `Formalism/GaloisCohomology/Statement.lean`
(`Formalism.GaloisCohomology.VFormula`).
(d) as inequalities of lengths, for cyclotomic layers (`LateralTheory.Q.SLayerCut.sha_le`,
`Development/EtaleCohomology/CyclotomicDiscriminants/SLayerCut.lean`) and for `ℓ = 2` and `[F′ : F] = 2`
(`UpperTheory.V.Two.shaTwo`, `AV/QuadraticExtensions/ShaTwo.lean`; the kernel of length at most one: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/KerTwo.lean` (`UpperTheory.V.Two.kerTwo`)).
(e) as the bound `V(F, t) ≤ B`, with the finiteness of
the groups it sums, the predicate `UpperTheory.Top.VVle`, and its monotonicity `UpperTheory.Top.VVle.mono`
(`Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean`). (f) as the additivity of lengths
`UpperTheory.V.shaLen_eq_add` (`AV/LengthEqAddEigen.lean`), with `Ш⁺` and `Ш⁻` as [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LengthEqAddEigen.lean`
(`UpperTheory.V.ShaPlus`, `UpperTheory.V.ShaMinus`).
The Pontryagin duality and the finiteness of (b), the strict
form and its real-place quotient, the comparison with `WK^sym_{2e}(F){ℓ}`, the case `ℓ = 2` with real places in (b)–(c), the clause `ℓ ∤ [F′:F]` of
(d), the statements of (e) on the support and the product, and the identification with `Ш¹(F⁺, ℓ, e)` in (f) are this
roadmap's, by the routes below.

*Route.* (a) Inflation from `G_{F,S}` to `G_F`; conjugate decomposition groups give the same kernel. (b) HeckeIdealsAndTaylorWilesRelations
§10.1(b) with `p = ℓ`, `T = ℤ_ℓ(e+1)`, `T^D = ℚ_ℓ/ℤ_ℓ(−e)`, and HeckeIdealsAndTaylorWilesRelations §10.1(d) for the real places; finiteness from ArithmeticKTheory §6.1 (and ArithmeticKTheory §6.3 at
`ℓ = 2` with real places), since `Sha²_{e,ℓ}(F) ⊂ H²` is finite. (c) The first inequality is `Sha² ⊂ H²` and (b); the identity is
the Poitou–Tate sequence for the lattice `ℤ_ℓ(e+1)` (ArithmeticGaloisDuality §D7.6, with HeckeIdealsAndTaylorWilesRelations §10.1 for the kernels) with local
duality `H²(F_v, ℤ_ℓ(e+1)) ≅ H⁰(F_v, ℚ_ℓ/ℤ_ℓ(−e))^∨` and `H⁰(F, ℚ_ℓ/ℤ_ℓ(−e))^∨ = coker` at the end of the sequence; it is the étale
form of ArithmeticKTheory §6.8's order identity. (d) The inclusion is HeckeIdealsAndTaylorWilesRelations §10.1(f) with `W = ℚ_ℓ/ℤ_ℓ(−e)` and `Σ = S_ℓ`; `H⁰(F′, ℚ_ℓ/ℤ_ℓ(−e))` is cyclic. For a layer `F′/F` of degree `ℓ^m` of the cyclotomic `ℤ_ℓ`-extension,
with generator acting on `μ_{ℓ^∞}` through `κ = 1 + ℓ^c u`, `H⁰(F′, ℚ_ℓ/ℤ_ℓ(−e))` is cyclic of order `ℓ^{c+m+v_ℓ(e)}` and the norm
`Σ_{j<ℓ^m} κ^{−ej}` has valuation exactly `m`, so `Ĥ⁰ = 0`; the Herbrand quotient of a finite module is `1`, so `H¹ = 0`. (e) ArithmeticKTheory Layer 3 (finiteness of
`K_{2e}(𝒪_F)`) and ArithmeticKTheory §6.1. (f) `2` is invertible in `ℤ_ℓ`; restriction–corestriction for `F/F⁺`.
*Needs:* ArithmeticKTheory §§6.1, 6.3, 6.8, 6.9 and Layer 3; ArithmeticGaloisDuality §D7.6; HeckeIdealsAndTaylorWilesRelations §10.1;
ProfiniteCohomology §5.4 (inflation–restriction) and ProfiniteCohomology §§6.2–6.3 (corestriction).

**Checks.**

- `V(ℚ, 2) = 0`: `K₂(ℤ) = ℤ/2`, the odd parts vanish, and at `ℓ = 2` the wild kernel of `K₂(ℚ)` is zero (ArithmeticKTheory §6.7 Check), so
  `Ш¹(ℚ, 2, 1) = 0` (with `e = 1` odd, `Ш¹ = Ш¹_str`).
- `Ш¹(ℚ(i), 2, e) = 0` for all `e ≥ 1`: every positive even K-group of `ℤ[i]` has odd order (ArithmeticKTheory §6.1 Check).
- `Ш¹(ℚ(μ₃₇), 37, e) ≠ 0` for every `e ≥ 1`: `K_{2e}(ℤ[ζ₃₇]){37} ≠ 0` (ArithmeticKTheory §7.4), there is one place above `37`, and
  `H⁰(F, ℚ₃₇/ℤ₃₇(−e)) = H⁰(F_v, ℚ₃₇/ℤ₃₇(−e))`, so the identity of (c) gives `length Ш¹ = length H² > 0`.
- `F = ℚ`, `ℓ` odd, `S = {ℓ, ∞}`: `Ш²_S(ℚ, ℤ_ℓ(2)) ⊂ H²(ℤ[1/ℓ], ℤ_ℓ(2)) ≅ K₂(ℤ){ℓ} = 0` (ArithmeticKTheory §6.1), so
  `Ш¹_S(ℚ, ℚ_ℓ/ℤ_ℓ(−1)) = 0` by HeckeIdealsAndTaylorWilesRelations §10.1(b); more generally, for every odd `ℓ` and `e ≥ 1`,
  `length Ш¹(ℚ, ℓ, e) = length K_{2e}(ℤ){ℓ}`, since the global and local `H⁰` terms of (c) agree (one place above `ℓ`, totally
  ramified in `ℚ(μ_{ℓ^∞})`).

### 6.18 Character components for abelian fields

*Origin:* adapted from Kolster (2009), §3: the decomposition into character components of the `H¹` and `H²` of the
`S`-integers of an abelian field of degree prime to `ℓ`; here for the twisted Tate–Shafarevich groups with their
local conditions, with the change of the vanishing set (a), the defect bound (c) when `ℓ` divides the degree and
the going-up bound (d).

*Method of the formal proof:* (b) for `ψ` trivial on an open normal subgroup of index prime to `ℓ`, restriction to
that subgroup is injective on the Tate–Shafarevich group of the twisted module with image the invariants (restriction
and corestriction, the index being a unit, local conditions included), and the invariants are the `ψ`-eigenspace;
(a) dropping the conditions at `p | N` costs at most the classes of the decomposition group that die on inertia,
which vanish when `ψ` is unramified at `p` (the Frobenius scalar is not `1` on a divisible module) and have length
at most `v_ℓ(n)·e_O` when `ψ^n = 1`; (c) the length of a sign eigenspace is at most the sum of the lengths of the
character eigenspaces, each of which exceeds `V_ℓ(ψ, e; ·)` by at most a cokernel of restriction onto invariants
and kernels of local restrictions, all bounded by multiples of an `H⁰`; (d) the kernel of restriction to `G_L` is
bounded by evaluating cocycles on lifts of generators of `Gal(L/ℚ)`. The route written below differs in (b) and (c):
it identifies the components by Shapiro's lemma, with the primes `p | N` treated inside (b), and names only the `H¹`
of the finite inertia and decomposition quotients as defect in (c).

For a prime `ℓ`, `O` the integers of a finite extension `Φ` of `ℚ_ℓ` (ramification index `e_O`), a Dirichlet character `ψ`
with values in `O^×` (a character of `G_ℚ` by arithmetic Frobenius), `e ≥ 1` and a finite set `S` of primes containing `ℓ`,
define `Ш_{ψ,e}(S)` as the classes in `H¹(G_ℚ, (Φ/O)(ψ⁻¹χ_ℓ^{−e}))` unramified at every prime and zero on the decomposition
groups at the primes of `S`, and `V_ℓ(ψ, e; S) = length_O Ш_{ψ,e}(S)/e_O`. Prove:

(a) `V_ℓ(ψ, e; S′) ≤ V_ℓ(ψ, e; S)` for `S ⊂ S′`, with equality when the order of `ψ` is prime to `ℓ`, and also when `ψ` is
unramified at every `p ∈ S′ ∖ S`. (More generally equality holds when `ψ|_{I_p}` has order prime to `ℓ` for every
`p ∈ S′ ∖ S`, by the same local computation; only the two cases named are used.)

(b) *Decomposition.* Let `F ⊂ ℚ(μ_N)` be abelian with group `G`, `ℓ ∤ [F:ℚ]`, and `O` containing the values of the characters of
`G`. Then for every `ψ ∈ Ĝ` the `ψ`-eigenspace of `Ш¹(F, ℓ, e) ⊗_{ℤ_ℓ} O` has `O`-length `e_O · V_ℓ(ψ, e; {ℓ} ∪ {p | N})`; hence, for
`F` CM and `ℓ` odd, `length Ш^±(F, ℓ, e) ≤ Σ V_ℓ(ψ, e; {ℓ} ∪ {p | N})`, the sum over the `ψ` with `ψ(−1) = ±(−1)^e`, which is the
form used. Equality holds there, and `length Ш¹(F, ℓ, e) = Σ_{ψ∈Ĝ} V_ℓ(ψ, e; {ℓ} ∪ {p | N})`, because eigenspaces of distinct
characters of order prime to `ℓ` are independent.

(c) *Defect.* For `F` CM, `ℓ` odd and `ℓ | [F:ℚ]`, `length Ш^±(F, ℓ, e) ≤ Σ_ψ (V_ℓ(ψ, e; {ℓ} ∪ {p | N}) + δ)`, the sum
over all `ψ ∈ Ĝ` with `ψ(−1) = ±(−1)^e`, those of `ℓ`-power order included, with one `δ ≤ (N e)^{c}` for all `ψ`, `c` absolute.

(d) *Going up.* If `ψ` factors through `Gal(L/ℚ)` for an abelian field `L` of conductor `f_L`, then
`V_ℓ(ψ, e; S) ≤ length Ш¹(L, ℓ, e) + 2[L:ℚ] · f_L · e`.

[FormalProof] defines the component over any number field, for a character `ψ` of its absolute Galois group, as
`UpperTheory.V.Chr.VS`, with `UpperTheory.V.Chr.V` for `S = {ℓ}` and `UpperTheory.V.Chr.V'` for `S = {ℓ} ∪ {p | N}`
(`AV/CharacterLevelBounds/ShaFamMono.lean`), and states: the inequality of (a) as `UpperTheory.V.Chr.VS_anti` (same file),
and its equality only for `S = {ℓ} ⊂ {ℓ} ∪ {p | N}` and `ψ` of order prime to `ℓ` (`UpperTheory.V.Chr.vLe`,
`AV/CharacterLevelBounds/VLe.lean`); (b) for one component at a time, `ψ` trivial on an open normal subgroup of index prime
to `ℓ` (`UpperTheory.V.Chr.eigV`, `AV/CharacterLevelBounds/EigV.lean`); (c) for every odd `ℓ`, with the sum and the defect
as above, the defect an explicit function `UpperTheory.V.Chr.loss` of `ℓ`, `N`, `[F:ℚ]` and `e`
(`UpperTheory.V.Chr.reduction_to_dirichletChar_any_level_of_le`,
`AV/CharacterLevelBounds/ReductionToDirichletCharAnyLevelOfLe.lean`), through [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/GaloisLibrary/GaloisCohomologyLength/LevelInertiaLeLevelDec.lean`
(`UpperTheory.V.LDataCardLeFinrank.nuBound`); (d) with `#T` times the length of
`H⁰(G_ℚ, (Φ/O)(ψ⁻¹χ_ℓ^{−e}))` in place of `2[L:ℚ] · f_L · e`, for a set `T` of generators of `Gal(L/ℚ)`
(`UpperTheory.V.Chr.upV`, `AV/CharacterLevelBounds/LiftGens.lean`). The sum of (b), the equality of (a) in general and the
constant of (d) are this roadmap's.

*Route.* (b) Shapiro's lemma identifies `H¹(G_F, W)` with `⊕_ψ H¹(G_ℚ, W(ψ⁻¹))` after extending scalars to `O`; a component class
whose restriction to `G_F` is unramified at `p | N` is unramified at `p`, because the inertia group of `F/ℚ` at `p` has order prime
to `ℓ`, and then zero at `p`: `W^{I_p} = 0` if `ψ` is ramified at `p`, and `Frob_p − 1` is onto the divisible `W` otherwise, since
`p^{−e}ψ(p)⁻¹ ≠ 1`. The same with decomposition groups above `ℓ`. (c) The same with the `H¹` of the finite inertia and
decomposition quotients as defect. (d) Inflation–restriction from `G_ℚ` to `G_L`; the `H⁰`-term and the local invariants at the
primes dividing `f_L` are bounded by the orders of the roots of unity of `ℓ`-power order in `L` and in its completions, at most
`2 f_L e` in length for each of the `[L:ℚ]` characters. *Needs:* 6.17; ProfiniteCohomology §5.4 (inflation–restriction) and
ProfiniteCohomology §7.2 (Shapiro);
PadicMeasuresIwasawaAlgebras §6.1 (character components).

**Checks.**

- (a) can be strict when `ψ|_{I_p}` has `ℓ`-power order: then `W^{I_p}` is a nonzero finite group on which `Frob_p − 1` need not be
  onto.
- For `F = ℚ`, (b) reads `length Ш¹(ℚ, ℓ, e) = V_ℓ(1, e; {ℓ})`.

### Examples

For `F = ℚ` and `ℓ = 2`, `V(ℚ, 2) = 0`; over `ℚ(i)`, `Ш¹(ℚ(i), 2, e) = 0` for every `e ≥ 1`; over `ℚ(μ₃₇)`, `Ш¹(ℚ(μ₃₇), 37, e) ≠ 0` for every `e ≥ 1`; and for every odd `ℓ` and `e ≥ 1`, `length Ш¹(ℚ, ℓ, e) = length K_{2e}(ℤ){ℓ}` (6.17, Checks). For `F = ℚ` the decomposition 6.18 (b) reads `length Ш¹(ℚ, ℓ, e) = V_ℓ(1, e; {ℓ})`.

### Dependencies

ArithmeticKTheory §§6.1, 6.3, 6.7, 6.8, 6.9, 7.4 and Layer 3; HeckeIdealsAndTaylorWilesRelations §10.1; ArithmeticGaloisDuality §§D7.6, D7.6a; ProfiniteCohomology §§5.4, 6.2–6.3, 7.2 (inflation–restriction, corestriction, Shapiro's lemma); PadicMeasuresIwasawaAlgebras §6.1.

## Layer 9: Explicit torsion bounds for K-groups

Throughout, `L` is a number field of degree `n` and discriminant `d_L`; "absolute" means independent of all data.

### 9.1 Torsion of a cokernel with short relations

*Origin:* adapted from Soulé (1999), Lemma 1: the bound of the torsion of a cokernel by the product of the
Euclidean norms of a subfamily of the relations that is a basis of their real span; here in the `ℓ¹` form
`#(ℤ^ι/⟨Λ₀⟩)_tors ≤ b^{#ι}`.

*Method of the formal proof:* a maximal independent subfamily of `Λ₀` is completed by unit vectors to `#ι`
independent vectors of `ℓ¹`-norm at most `b`; the index of the lattice they span is the absolute value of a
determinant, at most the product of the `ℓ¹`-norms of its rows by expansion over permutations, and the torsion of
`ℤ^ι/⟨Λ₀⟩` has at most as many elements as the quotient by that lattice. Soulé's lemma uses Euclidean norms and
Hadamard's inequality in the real span of the subfamily; the `ℓ¹` form needs only the permutation expansion.

For a finite set `ι` and a set `Λ₀ ⊂ ℤ^ι` of vectors of `ℓ¹`-norm at most `b ≥ 1`: `#(ℤ^ι/⟨Λ₀⟩)_tors ≤ b^{#ι}`. This follows from
the bound of the torsion of the cokernel by the product of the Euclidean norms of a subfamily of `Λ₀` that is a basis of its
real span (Soulé 1999, Lemma 1, p. 5), since the Euclidean norm is at most the `ℓ¹`-norm and the span has rank at most `#ι`.
[FormalProof] states the bound as `UpperTheory.V.KH.cokerTors` (`AV/TorsionBoundsChains/CokerTors.lean`).

*Route.* Choose a maximal linearly independent subfamily of `Λ₀` and complete it by unit vectors to a basis of `ℚ^ι`; the index of
the lattice it spans is `|det| ≤` the product of the `ℓ¹`-norms of its members `≤ b^{#ι}`, and the torsion of `ℤ^ι/⟨Λ₀⟩` has at most as many
elements as the quotient by that lattice (the saturation of `⟨Λ₀⟩` modulo the span of the subfamily embeds in it and maps onto the torsion). *Needs:* Mathlib `Matrix.det`, `LinearIndependent`.

**Checks.**

- `ι = {1}`, `Λ₀ = {b}`: the quotient is `ℤ/b`, of order `b = b^{#ι}`; the bound is sharp.

### 9.2 Torsion of the homology of a group acting on an acyclic complex

*Origin:* adapted from Brown (1982), Soulé (1999) and Emery (2014): the cellular chains of a complex as sums of
permutation modules with Shapiro's lemma (Brown), the bounds for the torsion of a cokernel and of the homology of a
based complex (Soulé, Lemma 1 and Proposition 3, the latter after Gabber), and the bound at every prime of Emery
(2014), Theorem 1.1, under the hypothesis that the rational homology vanishes; here with every prime kept, without
that hypothesis, and with an explicit bound in the number of orbits and the orders of the stabilizers.

*Method of the formal proof:* dimension shifting along the permutation modules of the complex, by induction on the
degree: in degree zero the coinvariants are a cokernel on the orbit sets, bounded by the cokernel bound; at each step
a piece of the long exact sequence bounds the torsion by the order of the homology of a permutation module, computed
orbit by orbit by Shapiro's lemma and the bound `#S^{#S^j}` for `H_j` of a finite group `S`.

Let a group `G` act on sets `X_p`, `p ≥ 0`, with equivariant face maps, the augmented chain complex `⋯ → ℤ[X₁] → ℤ[X₀] → ℤ → 0`
exact up to degree `m`. If for `p ≤ m` there are at most `A` orbits on `X_p` and all stabilizers have order at most `s`, then
`H_m(G; ℤ)_tors` is finite of order at most `(m+2)^A · s^{m·A·s^m}`. Also, for a finite group `S` and `j ≥ 1`,
`#H_j(S; ℤ) ≤ #S^{#S^j}`. For a complex of free modules of finite rank, the torsion of the homology in degree `k` has order
at most `b^a`, where `b ≥ 1` bounds the Euclidean norms of the boundaries of the basis elements in degree `k + 1` and `a` is
the smaller of the ranks in degrees `k` and `k + 1` (Gabber's lemma, ArithmeticKTheory §9.1; Soulé 1999, Proposition 3, p. 6); Soulé applies it to `SL_N(ℤ)` acting on a
cell complex only modulo the primes `≤ N + 1`, which contain those dividing the orders of the stabilizers (Soulé 1999, proof
of Theorem 1, pp. 7–8); the bound here includes those primes through the bound for finite groups. [FormalProof] states the
bound for a group acting on an acyclic complex as `UpperTheory.V.KH.mainFace` (`AV/TorsionBoundsChains/LogLeExp.lean`), the
bound being [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/TorsionBoundsChains/FaceDSingle.lean`
(`UpperTheory.V.KH.bound`), and
the bound for finite groups as `UpperTheory.V.KH.finGroup` (`AV/TorsionBoundsChains/FinGroup.lean`); it does not state
Gabber's lemma.

*Route.* Dimension shifting for a module resolved by the permutation modules `ℤ[X_•]`: in degree zero the coinvariants are the
cokernel of the map on orbit sets, whose columns have `ℓ¹`-norm at most `m + 2`, and 9.1 applies; the induction uses the long
exact sequence of `0 → K → ℤ[X₀] → M → 0`, Shapiro's lemma for the permutation modules, the bound for finite groups (killed by
`#S`, a subquotient of chains on `#S^j` generators), and submultiplicativity of torsion orders in such sequences.
*Needs:* 9.1; Mathlib `groupHomology` (long exact sequence, Shapiro's lemma).

**Checks.**

- `G` finite acting trivially on a point (`X_p` one point for all `p`, `A = 1`, `s = #G`): the bound reads `(m + 2)·#G^{m·#G^m}`,
  weaker than the finite-group bound `#G^{#G^m}`; the acyclic-complex bound is not sharp there.

### 9.3 Perfect forms over a ring of integers and their nerve

*Origin:* adapted from Koecher (1960) and Braun, Coulangeon, Nebe and Schönnenbeck (2015): Voronoi's theory of
perfect forms over a number field, (a)–(b); here with the ordered nerve of the cover by perfect domains and its
acyclicity (c), the common minimal vectors of a simplex (d), the explicit orbit count (e) for every number field and
the bound (f) in this form; orbits of cells are counted over `ℤ` in Soulé (1999), Propositions 1–2, and for totally
real and CM fields in de la Torre Durán (2026).

*Method of the formal proof:* the tuples of Hermitian forms of minimum at least one form a locally finite
polyhedron in the definite cone whose vertices are the perfect forms; the ordered nerve of the cover of the dual
cone by their normal cones is acyclic by a nerve lemma for convex covers (hyperplane cuts and Mayer–Vietoris); orbits
of simplices are counted through nonsingular matrices of common minimal vectors with bounded norm of the
determinant, and finite stabilizers are bounded by reduction modulo `3`. The route written below differs in (f): it
applies Minkowski's lemma in `GL_{nN}(ℤ)` through a `ℤ`-basis of `𝒪_L` and takes the finiteness of the stabilizers
of vertices from the automorphism group of the Gram matrix.

For `N ≥ 1` let `V = ∏_{w real} Sym_N(ℝ) × ∏_{w complex} Herm_N(ℂ)`, `q_h(y) = Σ_w y_w^* h_w y_w` for `y ∈ 𝒪_L^N`, and
`𝓡 = {h : q_h(y) ≥ 1 for all y ≠ 0}`. Prove: (a) `𝓡` is a nonempty, closed, convex, locally finite polyhedron inside the cone of
positive definite tuples; its vertices (perfect forms of minimum one) exist and each is determined by at most `dim V` minimal
vectors; (b) every linear functional positive on the closed cone attains its minimum on `𝓡` at a vertex; the normal cones of the
vertices (perfect domains) cover the open dual cone, finitely many meeting each compact subset; (c) the ordered nerve of this
cover is acyclic; (d) the common minimal vectors of the vertices of a simplex span `L^N`; (e) the number of `GL_N(𝒪_L)`-orbits of
`p`-simplices is at most `(2|d_L| n N)^{c₁(p+1)(nN)³N}`, `c₁` absolute; (f) every finite subgroup of `GL_N(𝒪_L)` has order at most
`3^{nN²}`, and stabilizers of vertices are finite.

[FormalProof] states 9.3 for totally complex `L` only, where `V` is a product of spaces `Herm_N(ℂ)`: (a) as
`UpperTheory.V.KT.good` (`AV/HermiteNormalForms/Imports.lean`), with vertices determined by at most `nN²` minimal vectors
(`UpperTheory.V.KT.vxdet`, `AV/HermiteNormalForms/FiniteSubfamilySpansDual.lean`) in place of `dim V = nN²/2`; (b) for the
convex hulls of finite subsets of the dual cone in place of its compact subsets (`UpperTheory.V.ConeExtensionAcyclic.exists_vert`,
`UpperTheory.V.ConeExtensionAcyclic.cone_finite`, `AV/ConvexNerveComplexes/ExistsVert.lean`, `ConeFinite.lean`); (c) through
the nerve lemma `UpperTheory.V.ConeExtensionAcyclic.nerve_convex` (`AV/ConvexNerveComplexes/NerveConvex.lean`) and the
exactness `UpperTheory.V.KT.sx_exact` (`AV/HermiteNormalForms/Assembly.lean`); (e) with `c₁ = 12`
(`UpperTheory.V.KT.orbnum`, `AV/HermiteNormalForms/Orbnum.lean`); and the bound of (f) for the unit group of every ring that
is finite and free over `ℤ`, for its finite subgroups (`UpperTheory.V.KT.mink3`, `AV/HermiteNormalForms/Mink3.lean`). For a number
field with a real place the statements are this roadmap's, by the same route with `Sym_N(ℝ)` at the real places. In (a),
`dim V ≤ nN²`, and (e) uses the bound `nN²` for the number of minimal vectors that determine a vertex.

*Route.* (a), (b): the real Gram matrix of `q_h` on `𝒪_L^N ≅ ℤ^{nN}` and the fact that a real symmetric matrix with `cᵀGc ≥ 1` on
nonzero integer vectors is positive definite; local finiteness from the finiteness of integers with bounded conjugates; a
functional positive on the closed cone has compact sublevel sets on `𝓡`. (c) The nerve lemma for covers of a convex set by closed
convex sets, finitely many meeting each compact convex subset, by induction on the faces of the nerve with a separating
hyperplane and Mayer–Vietoris. (e) A simplex has a matrix `A` of common minimal vectors with `|N(det A)|` bounded through the
Hermite–Minkowski lower bound for determinants, Hadamard's inequality and `2^{nN} det G = |d_L|^N (∏_w det h_w)²`; the left class of
such a matrix `A` is determined by `I = |N(det A)| ∈ ℤ` and by `I·A⁻¹` modulo `I`, and the vertices with given minimal vectors by Cramer's
rule. (f) An element of finite order congruent to `1` modulo `3` in a ring finite free over `ℤ` is `1` (Minkowski:
K3SurfacesAndSymplecticBoundedness §4.5, applied in `GL_{nN}(ℤ)` through a `ℤ`-basis of `𝒪_L`; a finite subgroup of `GL_N(𝒪_L)` then
injects into `GL_N(𝒪_L/3)`); stabilizers of vertices lie in the automorphism group of the Gram matrix of `q_h` on `ℤ^{nN}`,
finite by LatticePackingsAndPerfectForms §4.4.
*Needs:* LatticePackingsAndPerfectForms §§1.7–1.8 (Minkowski and Hermite for real forms), LatticePackingsAndPerfectForms §4.4
(automorphism groups of forms), K3SurfacesAndSymplecticBoundedness §4.5 (finite subgroups modulo `3`),
LatticePackingsAndPerfectForms §§4.1, 4.9 (the case `L = ℚ`: the
Ryshkov polyhedron and its tiling by Voronoi domains, of which (a)–(b) are the number-field generalization); Mathlib
`Matrix.det`, `NumberField.discr`. For `L = ℚ` the count of Voronoi's cells by the size of their minimal vectors is
Soulé 1999, Propositions 1–2, pp. 3–4; Soulé 2003 and BFEH 2014 use Ash's well-rounded retract (BFEH 2014, Theorem 2.2,
p. 4) instead of the nerve of (c). For totally real and CM fields de la Torre Durán 2026 bounds the number of orbits of
the faces of the Voronoi tessellation, the published result nearest to (e).

**Checks.**

- `L = ℚ`, `N = 2`: the vertices of `𝓡` are the forms equivalent to `x² + xy + y²` (minimal vectors `±e₁, ±e₂, ±(e₁ − e₂)`), one orbit,
  with stabilizer of order `12` in `GL₂(ℤ)`, below `3^{4} = 81`.

### 9.4 Torsion in the homology of `GL_N(𝒪_L)`

*Origin:* particular to this proof: an explicit bound for the whole torsion of `H_m(GL_N(𝒪_L); ℤ)`, every prime
included, with `log log` of its order linear in `log |d_L|`, for totally complex `L`; nearest published results: Soulé
(2003) and Bayer-Fluckiger, Emery and Houriet (2014), bounds of the same shape away from small primes, de la Torre
Durán (2026), such bounds for totally real and CM fields, and Emery (2014), every prime under the hypothesis that the
rational homology vanishes, with constants that are not explicit. The form for a field with a real place is this
roadmap's own formulation.

*Method of the formal proof:* the torsion bound for groups acting on acyclic complexes is applied to `GL_N(𝒪_L)`
acting on the ordered nerve of the perfect forms: the nerve is acyclic, its orbits of simplices are counted
explicitly, and the stabilizers are finite of order at most `3^{nN²}`. Soulé (2003) and Bayer-Fluckiger, Emery and
Houriet (2014) pass from the complex of orbits to the group through the equivariant spectral sequence and discard the
primes dividing the orders of the stabilizers; here the homology of the finite stabilizers is bounded at every prime.

There is an absolute `c₂` such that for every number field `L`, `N ≥ 1` and `m ≥ 0`:
`log log #H_m(GL_N(𝒪_L); ℤ)_tors ≤ c₂(m + 1)(nN)³N · log(2|d_L| n N)`; in particular `log #H_m(GL_N(𝒪_L); ℤ)_tors ≤ (2|d_L|)^{(nN(m+1))^{c₃}}`
for an absolute `c₃`, and `H_m(GL_N(𝒪_L); ℤ)` is finitely generated. All primes are included. The first bound, with the finite generation, is
`log_log_card_torsion_groupHomology_GL_le` in `Suggested.lean`.
The unconditional published bounds of this kind discard small torsion:
Soulé 1999, Theorem 1, p. 7, bounds the torsion of `H_k(SL_N(ℤ); ℤ)`, `k ≤ N(N − 1)/2`, modulo the primes `≤ N + 1` by a
double exponential in `N`; for rings of integers of fields `L ≠ ℚ`, BFEH 2014, Corollary 2.3 and §§3.1–3.4, pp. 4–6, bound the torsion of the
homology of `GL_{2m+1}(𝒪_L)` in degree `m`, and with it that of `K_m(𝒪_L)` (their Theorem 1.1 and Corollary 1.2,
pp. 1–2), up to the elements of order at most `max(n + 1, 2m + 2)`, with `log log` linear in `log |d_L|`, improving
Soulé 2003; de la Torre Durán 2026, Theorem 4.5, gives bounds of this kind for totally real and CM fields. Emery 2014,
Theorem 1.1, includes every prime, under the hypothesis that the rational homology vanishes and with constants that
are not explicit. [FormalProof] proves the bound with all primes for totally complex `L`: for every `N` and `m` in the form of
9.2 (`UpperTheory.V.KT.tors_le`, `AV/HermiteNormalForms/Assembly.lean`), and in the `log log` form with `c₂ = 49` and the
factor `m` in place of `m + 1` only for `N = 4e + 4` and `m = 2e`, `e ≥ 1` (`UpperTheory.V.KT.torsBound`, same file, of the
statement `UpperTheory.V.K.TorsBound`, `AV/GeneratorCountTuples/TorsBoundPow.lean`); and finite generation for totally
complex `L` (`UpperTheory.FiniteGenerationAndTorsion.hglFG_of` applied to `UpperTheory.FiniteGenerationAndTorsion.fgShift`,
`AV/LiteratureResults/KTheoryStability/FinitelyGeneratedTorsion/`). The form stated here, for every `N` and with all primes,
is that of [FormalProof] for totally complex `L`, which is the case 9.7 uses; for a field with a real place it is this
roadmap's, by 9.3 in that case. The route below treats the small primes through the bound of 9.2 for the finite stabilizers.

*Route.* 9.2 applied to the action of `GL_N(𝒪_L)` on the nerve of 9.3, with the orbit bound of 9.3(e) and the stabilizer bound of
9.3(f). *Needs:* 9.2, 9.3.

### 9.5 Values of primitive classes

*Origin:* particular to this proof: a count of the values on cycles of a family of functionals on the homology of
the groups `GL_n(𝒪_L)` compatible with stabilization and block sums, for totally complex `L` and `j < r₂(L)` with
`r₂(L)` in place of `ρ_j`; the form with `ρ_j` for every number field is this roadmap's own formulation.

*Method of the formal proof:* a Bockstein reduces the count to integral homology, where the functionals satisfy
`Φ(ψ^d x) = d·Φ(x)` and hence `ℓ^{j−1}Φ(x) = u·Φ(∏_{t<j−1}(ψ^ℓ − ℓ^{t+2})x)` with `u` a unit modulo `ℓ^ν`; the
image of this operator has rank at most `r₂(L)` because every real class is detected by invariant differential forms
on the symmetric space, which are spanned by alternated products of traces whose weight under block sums is the
number of trace factors, so that only the single traces, one for each complex place, survive the operator. The usual
derivation takes the rank of the primitive part from Borel's theorem; here the representation of classes by
invariant forms comes from a Hecke operator at a principal prime that contracts square-integrable functions of mean
zero (an angle bound for three vertex stabilizers in the building) and is close to the identity on stable cycles.
The route written below is that usual derivation: it takes the rank of the primitive part from Borel's theorem and
uses the Hopf algebra of the stable rational homology.

For a prime `ℓ`, `ν ≥ 1`, an odd degree `j`, a `ℤ/ℓ^ν`-module `B`, and a family `Φ = (Φ_n)` of `ℤ/ℓ^ν`-linear maps from the
`j`-chains of the groups `GL_n(𝒪_L)` with coefficients `ℤ/ℓ^ν` to `B` that vanish on boundaries and satisfy
`Φ_{n′} ∘ stab = Φ_n` and `Φ_{dn} ∘ ψ^d = d·Φ_n` on cycles (`ψ^d(g) = 1_d ⊗ g`): `ℓ^{j−1}Φ` takes at most
`(ℓ^ν)^{ρ_j} · t_j · t_{j−1}` values on cycles, where `ρ_j` is the rank of the primitive part of the stable rational homology
`H_j(GL(𝒪_L); ℚ)` and `t_i` the torsion order of `H_i(GL_n(𝒪_L); ℤ)` for `n` in the stable range (`n ≥ 2j + 4` suffices).
The module `B` is the point: for `B = ℤ/ℓ^ν` the bound is empty as soon as `ρ_j ≥ 1`, and 9.7 applies the statement to a
product of copies of `ℤ/ℓ^ν` indexed by primes. For `L` totally complex and `j < r₂(L)` the bound holds with `r₂(L)` in place
of `ρ_j` without Borel's theorem; this is the case 9.7 uses. [FormalProof] states it in that case, with `n = 2j + 4`, as
`UpperTheory.V.ZK.SUpper` (`AV/ModularityArgument/ClassCounting/LemmaKOfSteps.lean`), proved through `UpperTheory.V.ZK.sUpperOf`
(`AV/ModularityArgument/ClassCounting/SUpperOf.lean`) from the chain identities `UpperTheory.V.ZK.SChain` and the rank bound
`UpperTheory.V.ZK.BOdd` (the image of `H_j(GL_n(𝒪_L); ℤ)` under the operator `∏_{t<j−1}(ψ^ℓ − ℓ^{t+2})` of the route
below has rank at most `r₂(L)`), which it proves as `UpperTheory.V.ZK.sChain` (`AV/ModularityArgument/ClassCounting/SChain.lean`)
and `UpperTheory.V.ZK.bOdd` (`AV/ModularityArgument/ClassCounting/BOdd.lean`).

*Route.* A Bockstein identifies the obstruction to lifting a mod-`ℓ^ν` cycle with torsion in degree `j − 1`; on liftable cycles `Φ`
descends to a homomorphism on integral homology; `Φ` is primitive, so `ℓ^{j−1}Φ` factors through the primitive part, of rank `ρ_j` (ArithmeticKTheory §3.4) modulo torsion: `∏_{t<j−1}(ψ^ℓ − ℓ^{t+2})` projects onto
the primitive part because `ψ^ℓ` is the `ℓ`-th convolution power of the identity of the Hopf algebra `H_*(GL(𝒪_L); ℚ)`
(free graded-commutative on its primitive part, Polylogarithms §2.2), which
acts on products of `k` primitive classes by `ℓ^k`: the factors kill the products of `2, …, j` primitives and multiply the
primitive part by `ℓ^{j−1}` times a unit. Homological stability
compares the torsion at different `n`. *Needs:* ArithmeticKTheory §3.4 (Borel's ranks); SchemeKTheoryOperations §6.7 (homological stability for
`GL_n`); Polylogarithms §2.2 (the rational homology of `GL(R)` as a Hopf algebra and its primitives); 9.4.

### 9.6 The additive classes of finite fields and the cycle with prescribed residues

*Origin:* particular to this proof: the additive classes of finite fields with their values on prism cycles (a),
and cycles in the homology of `GL(𝒪_L)` with prescribed values under the additive classes of the residue fields
(b), a homological model of the transfer of `b_ζ^E·{α}` in `K_{2E+1}(F; ℤ/q)`.

*Method of the formal proof:* the additive class is an explicit cochain on `k^×` (the carry cocycle of a discrete
logarithm on consecutive pairs of arguments, times `v` on the last), carried to every `GL(V)` by a transfer over the
lines of `V`; additivity comes from `ℙ(V ⊕ W) → ℙ(V) ⊔ ℙ(W)` having fibres of cardinality `≡ 1` modulo `q`, and the
value on prism cycles factors through the determinant because it is a homomorphism killing transvections. The cycle
with prescribed residues is built on bar complexes from a linear relation among `2E + 2` embeddings of `C_q` in
`C_q × C_q`, a weight function on `(ℤ/q)²`, lattice isomorphisms of prescribed determinant and a homotopy formula for
prism chains.

An *additive class* of degree `j` with coefficients in an abelian group `𝒜` over a finite field `k` is a family `θ = (θ_V)` of
`𝒜`-valued functionals on the `j`-chains of `GL(V)`, for all finite-dimensional `k`-vector spaces `V`, vanishing on boundaries,
invariant under isomorphisms of vector spaces, and additive on direct sums: `θ_{V⊕W}(z ⊕ z′) = θ_V(z) + θ_W(z′)` on cycles of
`GL(V) × GL(W)`. Let `q = ℓ^ν`, `C_q` the cyclic group of order `q`, and `zc ∈ H_{2i−2}(C_q; ℤ/q)` the divided-power generator,
represented by the cyclic chain `Σ_j [j₀ | 1 | j₁ | 1 | ⋯ | j_{i−2} | 1]`; it differs from the `(i − 1)`-st power of the degree-two
generator by `(i − 1)!`.

(a) For a finite field `k` with `q | #k − 1`, a primitive `q`-th root of unity `ζ ∈ k`, a homomorphism `v : k^× → ℤ/q` and `i ≥ 2`, there is an
additive class `θ` of degree `2i − 1` with coefficients in `ℤ/q` such that `θ_V(prism_g((χ_x)_* zc)) = x^{i−1}·v(det g)` for every `V`,
every `g ∈ GL(V)` and every `x ∈ ℤ/q`, where `χ_x : C_q → k^×` sends a generator to `ζ^x`, embedded as scalars, and `prism_g` is
the product with `g` of a cycle of the centralizer. (For `i = 1` the class is `v ∘ det`.)

(b) Let `F = L(μ_q)` be cyclic over `L`, with the generator `γ` for which `γζ = ζ^κ`, `κ = 1 + ℓ^c` (`c ≥ 1`, `c ≥ 2` if `ℓ = 2`,
`c ≤ ν`), let `M := 2E + 1 < ℓ^c`, and let `α ∈ F^×` with `div(α) = (γ⁻¹ − κ^E)𝔡` for a divisor `𝔡` of `F`. Prove:

- (b1) (*a relation among `2E + 2` slopes*) `H_{2E}(C_q × C_q; ℤ/q)` is generated by `2E + 1` elements (it is free of that
  rank), and there are `n_t ∈ ℤ/q`, `t = 0, …, 2E + 1`, one of them a unit, with `Σ_t n_t (d_t)_* zc` a boundary, `d_t(c) = (c, tc)`;
- (b2) (*a weight function*) with `χ_t(x₁, x₂) = x₁ + tx₂` on `J = (ℤ/q)²` and `P_M(X) = ∏_{j<M}(X − κ^j) = Σ_i p_iX^i`, for every
  `t₀ ≤ M` there is `η : J → ℤ` of finite support with `(χ_t)_*η = 0` for every `t ≤ M`, `t ≠ t₀`, and `(χ_{t₀})_*η = Σ_i p_i[κ^i]`;
- (b3) (*Steinitz with prescribed determinant*) for a number field `F`, a nonempty finite set `J` and divisors `𝔞_j, 𝔟_j`
  with `Σ_j(𝔟_j − 𝔞_j) = div(β)` for some `β ∈ F^×`, some `g ∈ GL_J(F)` with `det g = β` carries `⊕_j I(𝔞_j)` onto `⊕_j I(𝔟_j)`, where `I(𝔞)` is
  the fractional ideal with divisor `𝔞`;
- (b4) (*gluing prism cycles*) given a cycle `z` of a group `C`, homomorphisms `d_t : C → D`, `ρ : D → G`, coefficients with
  `Σ_t n_t(d_t)_*z = ∂w`, elements `g_t ∈ G` commuting with `ρd_t(C)`, and a subgroup `H ⊂ G` containing `ρ(D)`, `g_{t₀}⁻¹ρ(D)g_{t₀}`
  and the `g_{t₀}⁻¹g_t`, the cycle `Σ_t n_t prism_{g_t}((ρd_t)_*z)` of `G` is homologous in `G` to a cycle of `H`;
- (b5) (*the cycle*) there is a class `y ∈ H_{2E+1}(GL(𝒪_L); ℤ/q)` whose value under the additive class `θ` of (a) (`i = E + 1`) of
  the residue field, at every prime of `F` of degree one over `L` outside a finite set of primes of `𝒪_L` (those dividing an
  element `b ∈ 𝒪_L` divisible by the support of `𝔡` and by the primes ramified in `F/L`), is `pe·v(N_{γ,κ^E}(α))`, with
  `N_{γ,a}(α) = ∏_j γ^j(α)^{a^j}` and `pe = ∏_{j≤2E, j≠E}(κ^E − κ^j)`.

Additive classes and `zc`: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ClassCounting/HasVal.lean`
(`UpperTheory.V.ZK.IsAdd`, `UpperTheory.V.ZK.zc`).
[FormalProof] states these as propositions of `AV/ModularityArgument/ClassCounting/LemmaKOfSteps.lean` and proves them: (a)
for every `q ≥ 1` in place of `ℓ^ν` and every `i ≥ 2`, as `UpperTheory.V.ZK.STheta`, proved through
`UpperTheory.V.ZK.sThetaOf` (`AV/ModularityArgument/ClassCounting/SThetaOf.lean`); the relation of (b1) as
`UpperTheory.V.ZK.SRel`, proved as `LateralTheory.Q.SRelT.SRel_of`
(`Development/EtaleCohomology/CyclotomicDiscriminants/SRelTPf.lean`), with the bound `2E + 1` for the number of generators
of `H_{2E}(C_q × C_q; ℤ/q)` (`LateralTheory.Q.SRelT.gen_two`, same file); (b2) as `UpperTheory.V.ZK.SEta`,
proved as `UpperTheory.V.ZK.sEta` (`AV/ModularityArgument/ClassCounting/ExpStep.lean`);
(b3) as `UpperTheory.V.ZK.SStein`, proved as `LateralTheory.Q.SSteinT.SStein_of`
(`Development/EtaleCohomology/CyclotomicDiscriminants/SSteinTPf.lean`); (b4) as `UpperTheory.V.ZK.Cl.cChain`
(`AV/ModularityArgument/ClassCounting/LatticeBlockClasses/CChain.lean`); (b5) with the element `b` in
`𝒪_F` (its norm to `L` serves for `b ∈ 𝒪_L`), as `UpperTheory.V.ZK.SClass`, proved through `UpperTheory.V.ZK.sClassOf`
(`AV/ModularityArgument/ClassCounting/SClassOf.lean`).

*Route.* (a) Steps: on `k^×` the cup product `y^{i−1} ∪ v`, `y` the class of the carry cocycle `u(a, b) = (lg a + lg b − lg ab)/(qr)` of a
discrete logarithm `lg` normalized by `lg(ζ^x) ≡ rx (mod qr)`, has value `x^{i−1}v(g)` on `prism_g((χ_x)_*zc)`, because `u` is a
symmetric 2-cocycle with `Σ_j u(ζ^{xj}, ζ^x) = x`; transfer from the stabilizer of a line to `GL(V)` (the 1-cocycle of the action on
`ℙ(V)` given by a homogeneous function), additive because `ℙ(V ⊕ W) → ℙ(V) ⊔ ℙ(W)` has fibres of cardinality `#W ≡ 1` and `1`
modulo `q`; `g ↦ θ_V(prism_g(…))` is a homomorphism killing transvections, hence factors through `det`. With the `(i − 1)`-st
power of the Bott class in place of `zc` the value is `(i − 1)!·x^{i−1}v(det g)`, which loses the primes `ℓ ≤ i − 1`. (b1) The
minimal resolution of `C_q` has differentials `0, q, 0, q, …`, zero modulo `q`, so Künneth gives `(ℤ/q)^{2E+1}`; `2E + 2` elements
of a free `ℤ/q`-module of rank `2E + 1` satisfy a relation with a unit coefficient. (b2) In the group ring of `(ℤ/q, +)`, with
`w = ℓ^c`, `Σ_i p_i[κ^i]` is divisible by `([w] − [0])^M`, because `X ↦ X^{1+w}` is congruent to the identity modulo `X^w − 1` and acts on
`(X^w − 1)^j/(X^w − 1)^{j+1}` by `κ^j`; and `([w] − [0])^M` times any element is the push-forward of a product of `M` differences
`[v_t] − [0]` with `v_t ∈ ker χ_t`, `χ_{t₀}(v_t) = ℓ^c`, which exist because `|t − t₀| < ℓ^c`. (b3) Moves in `SL₂` between two
coordinates, then a scaling of one coordinate. (b4) `prism_{g_{t₀}h} − prism_{g_{t₀}} − prism_h ∘ conj` is null-homotopic, so the
cycle is homologous to `conj_{g_{t₀}⁻¹}(ρ_*w) − ρ_*w + Σ_t n_t prism_{h_t}(conj_{g_{t₀}⁻¹}(ρd_t)_*z)`, `h_t = g_{t₀}⁻¹g_t`. (b5) Let `C_q × C_q`
act on `F^J` by `ζ^{j₁c₁+j₂c₂}` on the coordinate `j`; with `η` from (b2) and `t₀` from (b1), `Λ = ⊕_j 𝔞^{η(j)}`, `𝔞` the ideal of `𝔡`;
for each `t` an element `g_t` carries `𝒪_F^J` to `Λ` and commutes with the `t`-th copy of `C_q`, by (b3) on the blocks of
characters, with determinant `1` for `t ≠ t₀` and determinant `β = α^{P_{M,E}(γ⁻¹)}`, `P_{M,E} = P_M/(X − κ^E)`, on one block for
`t = t₀`; the masses of colliding characters carry the same twist because `κ^i mod ℓ^ν` and `γ^i` have the same period. (b4)
moves the cycle into `Aut_{𝒪_L}(𝒪_F^J)`, hence into `GL_N(𝒪_L)` after adding a complement; evaluation by the block formula of (a)
at the reductions gives `pe·v(N_{γ,κ^E}(α))`, using `T·p(γ⁻¹) ≡ p(κ)·T` modulo `q` for `T = Σ_s κ^sγ^s`. Equivalently, `y` is a
homological model of the transfer of `b_ζ^E·{α}` in `K_{2E+1}(F; ℤ/q)`, `b_ζ ∈ K₂(F; ℤ/q)` the Bott element of `ζ`. *Needs:* ArithmeticKTheory §§2.1–2.3 (localization and residue transfer), KTheoryFiniteLocalFields §§1.1–1.2
(coefficient products and Bott classes);
GeneralAlgebraicKTheory §§13.8b–13.8c (Quillen's computation of the homology of `GL(k)` and of `K_*(k)`),
for (a); Mathlib `groupHomology`, the Künneth
formula.

### 9.7 The étale bound

*Origin:* particular to this proof: the explicit bound `log #H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1)) ≤ (2|d_L|)^{(2E[L:ℚ])^{C_K}}` for
every prime `ℓ` and every totally complex `L` containing `μ_ℓ` (`μ₄` if `ℓ = 2`); nearest published result: Soulé
(2003), Theorem 3, a bound of this kind at large primes, obtained through K-groups. The corestriction form is this
roadmap's own formulation.

*Method of the formal proof:* Poitou–Tate duality reduces the bound to `Ш¹`; after enlarging the field in its
cyclotomic tower, a class becomes an eigen-homomorphism on the class group of a cyclotomic layer, and these are
counted through twisted norms, which are told apart by their residues at primes of degree one (Chebotarev); the
residues are values of a primitive family of additive classes on explicit cycles of `GL_N(𝒪_L)`, so the count is
bounded by the torsion of the homology of `GL_N(𝒪_L)`. Soulé's bound for large primes goes through Chern classes on
`K_{2E}(𝒪_L)`, Borel's finiteness theorem and the Hurewicz map; here the count is made in the homology of
`GL_N(𝒪_L)`, and cycles built from a divided-power class take the place of the powers of the Bott element.

There is an absolute constant `C_K ≥ 1` such that for every prime `ℓ`, every totally complex number field `L` containing `μ_ℓ`
(and `μ₄` if `ℓ = 2`), and every `E ≥ 1`, `H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` is finite and

`log #H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1)) ≤ exp((2E [L:ℚ])^{C_K} log(2|d_L|)) = (2|d_L|)^{(2E[L:ℚ])^{C_K}}`.

Equivalently (by 6.17(c)) `length Ш¹(L, ℓ, E) · log ℓ` satisfies a bound of the same shape. *Corestriction form:* for every
number field `L`, totally imaginary if `ℓ = 2`, the same bound holds with `L(μ_ℓ)` (`L(μ₄)` if `ℓ = 2`) in place of `L` on the right,
because corestriction `H²(𝒪_{L(μ_ℓ)}[1/ℓ], ℤ_ℓ(E+1)) → H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` is onto, `H²` being the top cohomological degree.
[FormalProof] states the bound, with the same hypotheses, as `UpperTheory.V.LemmaK` (`AV/GeneratorCountTuples/LemmaK.lean`),
the bound being [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean`
(`UpperTheory.V.kBound`),
and proves `∃ C_K, LemmaK C_K` by the first route below as `UpperTheory.V.ZK.lemmaK`
(`AV/ModularityArgument/ClassCounting/LemmaKOfLitN.lean`), from Poitou–Tate duality, local finiteness and local Tate duality
taken as hypotheses and from the rank bound `UpperTheory.V.ZK.BOdd` of 9.5, which it proves as `UpperTheory.V.ZK.bOdd`. The corestriction form is this roadmap's.
Soulé 2003, Theorem 3, bounds `H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` at large primes `ℓ`, through K-groups as in the second route
below; the bound here also covers the small primes.

*Route.* (1) `length H² ≤ length Ш¹ + Σ_{v|ℓ} length H⁰(L_v, ℚ_ℓ/ℤ_ℓ(−E))` (6.17(c)), the local terms being small since `ℓ ≤ n + 1`.
(2) Enlarge `L` inside its cyclotomic `ℤ_ℓ`-tower to `L′` with `2E + 1 < ℓ^{c′} ≤ 2[L′:ℚ]`; restriction `Ш¹(L, ℓ, E) → Ш¹(L′, ℓ, E)` is
injective by 6.17(d). (3) Kummer description: restriction to `L′(μ_{ℓ^∞})` is injective on `Ш¹` (inflation–restriction with
`H¹(Γ, ℚ_ℓ/ℤ_ℓ(−E)) = 0` for `Γ` procyclic and `E ≠ 0`; IntegralIwasawaTheory §10.5), and a class is a `γ`-eigen homomorphism
from the class group of a layer `F = L′(μ_{ℓ^ν})`, `γ` acting through `κ^E` (`θ(γ⁻¹P) = κ^Eθ(P)`). (4) The number of such eigen
homomorphisms is bounded through the twisted norms `N_{γ,κ^E}(α)` of the elements `α` with `div(α) ∈ (γ⁻¹ − κ^E)Div(F)`: the units
contribute `(ℓ^ν)^{r₂(L′)}` up to a factor `ℓ^X` with `X` polynomial in `E`, `[L′:ℚ]` and `log h_{L′}` and independent of `ν`, which
enters the bound. (5) Distinct twisted norms modulo `ℓ^ν`-th powers are separated at primes of degree one (Chebotarev),
so by 9.6 they give distinct values of a primitive family of functionals built from the additive classes of the residue
fields, with values in the product of copies of `ℤ/ℓ^ν` indexed by these primes, and 9.5, with `B` that product, bounds the
number of values by `(ℓ^ν)^{ρ_{2E+1}} t_{2E+1} t_{2E}` with `ρ_{2E+1} ≤ r₂(L′)` (Borel, ArithmeticKTheory §3.4): the factors
`(ℓ^ν)^{r₂}` cancel, and what remains is torsion in the homology of `GL_{4E+6}(𝒪_{L′})`, bounded by 9.4. No K-group occurs in this
route. *Second route.* For `V = H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))`, the surjection `K_{2E}(𝒪_L) ⊗ ℤ_ℓ → V` (ArithmeticKTheory §6.1), the Hurewicz map
`K_{2E}(𝒪_L) → H_{2E}(GL(𝒪_L); ℤ)` with kernel killed by `R_{2E}` (9.8(a)), finite generation and the vanishing of the rank of
`K_{2E}(𝒪_L)` (ArithmeticKTheory §§3.2, 3.4) give `#V ≤ #(V/ℓ)^{v_ℓ(R_{2E})}·#H_{2E}(GL_N(𝒪_L))_tors` for `N` in the stable range (SchemeKTheoryOperations §6.7),
with `#(V/ℓ) ≤ #H²(𝒪_L[1/ℓ], μ_ℓ) ≤ h_L ℓ^n`; 9.4 bounds the last factor. *Needs:* 9.4, 9.5, 9.6, 6.17; ArithmeticKTheory §§3.2, 3.4, 6.1;
IntegralIwasawaTheory §§0.1–0.3, 10.5; SchemeKTheoryOperations §6.7; Chebotarev Layer 10.

**Checks.**

- `L = ℚ(i)`, `ℓ = 2`: `H²(ℤ[i, 1/2], ℤ₂(E+1)) = 0` (ArithmeticKTheory §6.1 Check); the bound is trivially satisfied.
- For `ℓ = 2` the hypothesis `μ₄ ⊂ L` makes `L` totally imaginary, so `H²` has no contribution from real places; with a real place
  `H²` also contains real-place classes, and the bound is stated for totally complex `L` only.
- What is proved is linear in `log|d_L|` in the inner exponent, not a power of `|d_L|`.

### 9.8 K-groups

*Origin:* (a) published: Arlettaz (1991), the kernel of the Hurewicz map of algebraic K-theory is killed by an
integer depending only on the degree, stated in StableHomotopyKTheory §4.24a; (b) this roadmap's own formulation:
the bound for the part of `K_m(𝒪_L)_tors` prime to `R_m` and the `ℓ`-part inequalities, from 9.4 and (a).

*Method of the formal proof:* none; the statement is not in [FormalProof].

(a) For every `m ≥ 1` and every ring `R` the kernel of the Hurewicz map `K_m(R) = π_m(BGL(R)^+) → H_m(GL(R); ℤ)` is
killed by the positive integer `R_m` of StableHomotopyKTheory §4.24a, which depends only on `m`: for
`m ≥ 2` this is the first clause of that section, and for `m = 1`, where `R_1 = 1`, the map is an isomorphism. For a ring whose K-groups are
finitely generated, ArithmeticKTheoryPartII §8.3 shows that no odd prime `ℓ ≥ (m + 3)/2` divides the order of this kernel (a comparison, not an input); (a)
also covers the small primes, for every ring. (b) There is an absolute `C` such that for every number
field `L` and `m ≥ 2`, the part of `K_m(𝒪_L)_tors` prime to `R_m` has order `≤ exp((2|d_L|)^{(mn)^C})`; for even `m` the same holds for the
`ℓ`-part for every odd `ℓ`, and for `ℓ = 2` when `L` is totally imaginary, with `#K_m(𝒪_L){ℓ} ≤ #(K_m(𝒪_L)/ℓ)^{v_ℓ(R_m)}·#H_m(GL(𝒪_L); ℤ)_tors{ℓ}`
and `#(K_m(𝒪_L)/ℓ) ≤ h_{L(μ_ℓ)} ℓ^{n(ℓ−1)}`. The form (b), which discards only the primes dividing `R_m`, is this roadmap's,
from 9.4 and (a); the published bounds discard more: Soulé 1999, Theorem 2, p. 9, bounds `K_m(ℤ)_tors` modulo the primes
`≤ 2m + 2`, and BFEH 2014, Theorem 1.1 and Corollary 1.2, pp. 1–2, bound `K_m(𝒪_L)_tors` for `L ≠ ℚ` up to the elements of
order at most `max(n + 1, 2m + 2)`. [FormalProof] does not state (b).

*Route.* (a) is StableHomotopyKTheory §4.24a, as above. (b) On the part prime to `R_m` the Hurewicz map is
injective, so the torsion of `K_m(𝒪_L)` prime to `R_m` embeds in that of `H_m(GL(𝒪_L); ℤ)`, which stabilizes
(SchemeKTheoryOperations §6.7) and is bounded by 9.4. For even `m` the image of the kernel in `K_m{ℓ}` lies in `K_m[ℓ^{v_ℓ(R_m)}]`, of
order at most `#(K_m/ℓ)^{v_ℓ(R_m)}`, and `K_m(𝒪_L)/ℓ` injects into `H²(𝒪_L[1/ℓ], μ_ℓ^{⊗(m/2+1)})`, bounded through ArithmeticKTheory §6.1 by the
class number of `L(μ_ℓ)`. 9.7 does not give (b) directly, because it changes the field with `ℓ`. *Needs:* 9.4; ArithmeticKTheory §§3.1–3.2, 6.1;
StableHomotopyKTheory §4.24a (the integers `R_m` and the exponent of the kernel of the Hurewicz map); SchemeKTheoryOperations §6.7.

### Examples

For `ι = {1}` and `Λ₀ = {b}` the quotient is `ℤ/b` and the bound `b^{#ι}` of 9.1 is attained. For a finite group `G` acting trivially on a point, the acyclic-complex bound of 9.2, `(m + 2)·#G^{m·#G^m}`, is weaker than its finite-group bound `#G^{#G^m}`. For `L = ℚ` and `N = 2` the perfect forms of minimum one are the forms equivalent to `x² + xy + y²`, one orbit, with stabilizer of order `12` in `GL₂(ℤ)`, below the bound `3⁴ = 81` of 9.3 (f). For `L = ℚ(i)` and `ℓ = 2`, `H²(ℤ[i, 1/2], ℤ₂(E+1)) = 0`, and 9.7 holds trivially (Checks of 9.1, 9.2, 9.3, 9.7).

### Dependencies

Layer 6 (6.17, in 9.7); ArithmeticKTheory §§2.1–2.3, 3.1, 3.2, 3.4, 6.1, 9.1 (Gabber's lemma, cited in 9.2); LatticePackingsAndPerfectForms §§1.7, 1.8, 4.1, 4.4, 4.9; K3SurfacesAndSymplecticBoundedness §4.5; Polylogarithms §2.2; SchemeKTheoryOperations §6.7; GeneralAlgebraicKTheory §§13.8b–13.8c (Quillen's computation for finite fields); KTheoryFiniteLocalFields §§1.1–1.2; IntegralIwasawaTheory §§0.1–0.3, 10.5; Chebotarev Layer 10; StableHomotopyKTheory §4.24a; Mathlib `Matrix.det`, `LinearIndependent`, `groupHomology`, `NumberField.discr`.

## Layer 10: Minus parts of twisted Sha groups and Bernoulli numbers

This layer bounds the components of 6.18 for the characters `ψ` of an abelian CM field with `ψ(−1) = (−1)^{e+1}` by generalized Bernoulli numbers, through the Euler system of Jacobi sums and its derivative classes, and sums the bound over these characters and over the odd primes prime to the degree.

### 10.1 The minus part of twisted Sha groups and Bernoulli numbers

*Origin:* adapted from Kolster (2009), Theorem 3.3, the order of the character parts of `H²` of an abelian field
through the values `L_S(−e, ψ)` for characters of order prime to `ℓ` (IntegralIwasawaTheory §12.3a), and from
Kolyvagin (1990) and Rubin (1991), the Euler system of Gauss sums for the minus parts of the class groups of
cyclotomic fields: here an inequality for the components of 6.18 with vanishing at the primes of the conductor, for
every conductor and with the explicit constant `N·P_{e+2}` (a), its sum over the odd primes prime to the degree
(b), and the Euler system of Jacobi sums with its derivative classes for the twists `e ≥ 1` (c).

*Method of the formal proof:* Kolyvagin's induction at finite level: the classes of the dual character are
derivative classes of an Euler system of Jacobi sums, a reciprocity law at auxiliary primes lets each of them kill
the localisation of the cocycles being counted, the auxiliary primes come from Chebotarev's theorem, and the first
class is ramified at one prime to the order of a Stickelberger sum congruent to the generalized Bernoulli number.
This is the published method for the minus part of class groups (Kolyvagin's system of Gauss sums), carried to the
twists `e ≥ 1`, to every conductor and to finite level with a uniform constant.

*Corollary of:* IntegralIwasawaTheory §12.3a (the order of the `χ⁻¹`-part of `H²(O_{E,S}, ℤ_p(n))` through
`L_S(1 − n, χ)`, for a character `χ` of order prime to `p` of a totally real field and an abelian extension `E` of
degree prime to `p`; here `F = ℚ`, `p = ℓ`, `n = e + 1`), for (a), through 6.17 (b)–(c) and 6.18 (a)–(b), and for
(b), which follows from (a); the Euler system of Jacobi sums (c) is not a corollary of it.

Let `E` be an abelian CM field of conductor `N` and degree `n`, `ℓ` an odd prime with `ℓ ∤ n`, `e ≥ 1`, `O ⊂ ℚ̄_ℓ` containing the values
of the characters of `Gal(E/ℚ)`, and `ψ` such a character, a Dirichlet character modulo `N` of order prime to `ℓ`, with
`ψ(−1) = (−1)^{e+1}`. Let `B_{k,ψ}` be the generalized Bernoulli number of the primitive character attached to `ψ` (Tau Ceti
`DirichletCharacter.generalizedBernoulli`, CyclotomicClassGroupsAndStickelberger §3.1) and `P_k` the product of the primes `≤ k`.
Prove:

(a) the normalized length `V_ℓ(ψ, e)` of 6.18's component `Ш_{ψ,e}(S)`, `S = {ℓ} ∪ {p : p | f_ψ}`, satisfies
`V_ℓ(ψ, e) ≤ v_O(N·P_{e+2}·B_{e+1,ψ})`;

(b) `Σ_{ℓ odd, ℓ∤n} log ℓ · length Ш⁻(E, ℓ, e) ≤ n log(16 N^{e+2} (e + 1)!)`.

(c) *The Euler system of Jacobi sums and its derivative classes.* For an integer `M′ ≥ 1` and `t ∈ (ℤ/M′)^×` let `σ_t`
be the automorphism `ζ ↦ ζ^t` of `ℚ(μ_{M′})`, `⟨t⟩ ∈ [0, M′)` the representative of `t`, and
`θ_{M′,b}(t) = ⌊⟨t⟩b/M′⌋ − ⌊⟨−t⟩b/M′⌋` for an integer `b ≥ 0`. Let `ℓ` be an odd prime, `T = T₀·ℓ^h` with `ℓ ∤ T₀` and
`h ≥ 1`, `M = ℓ^h`, `r` a prime with `r ≡ 1 mod T`, `𝔯` a place of `ℚ̄` above `r`, and `0 ≤ b < T`. A prime `q` is
*admissible* if `q ≡ 1 mod T`, `q ≠ r` and `ℓ` does not divide the order of `r` modulo `q`; an *admissible modulus* is a
squarefree product `d` of admissible primes, `d = 1` included; for a finite set `Q` of admissible primes,
`d_Q = ∏_{q∈Q} q`. Prove:

(c1) *Stickelberger elements of ideals.* For every `M′ ≥ 1`, every `0 ≤ b < M′` and every nonzero ideal `𝔞` of
`ℤ[μ_{M′}]` there is `X ∈ ℚ(μ_{M′})^×` with `X·X̄ = 1` and `(X) = ∏_{t∈(ℤ/M′)^×} (σ_t^{−1}𝔞)^{θ_{M′,b}(t)}`. Two such `X`
differ by a root of unity `ζ` with `ζ^{2M′} = 1`; products and quotients of such elements belong to the products and
quotients of the ideals; for `𝔞 = (y)` one may take `X = ∏_t (σ_t^{−1}y)^{θ_{M′,b}(t)}`; and for a prime `𝔭` with residue
field `𝔽_p`, `p ∤ M′`, one may take `X = J̄/J` with `J = ∏_{1≤j<b} J(χ, χ^j)`, where `χ : 𝔽_p^× → μ_{M′}` is the
character with `χ(x) ≡ x^{(p−1)/M′} mod 𝔭` and `J(χ, χ′) = Σ_x χ(x)χ′(1 − x)` is the Jacobi sum. For a prime `q ∤ M′`,
`b < q` and `t ∈ (ℤ/M′)^×`: `Σ_{t′ ↦ t} θ_{qM′,b}(t′) = θ_{M′,b}(t) − θ_{M′,b}(q^{−1}t)`, the sum over the
`t′ ∈ (ℤ/qM′)^×` with image `t`.

(c2) *The system.* There are elements `X_d ∈ ℚ(μ_{Td})^×`, one for every admissible modulus `d`, and natural numbers
`s(d, q)` prime to `ℓ`, one for every admissible modulus `d` and every admissible prime `q ∤ d`, such that: `X_d` is a
unit at every place of `ℚ̄` not above `r`; the order of `σ_tX_1` at `𝔯` is `θ_{T,b}(t)` for every `t ∈ (ℤ/T)^×`; and, with
`Frob_q` the automorphism `ζ ↦ ζ^q` of `ℚ(μ_{Td})`, (i) `N_{ℚ(μ_{Tqd})/ℚ(μ_{Td})}(X_{qd}) = ζ·(X_d/Frob_q^{−1}X_d)^{s(d,q)}`
for a root of unity `ζ` with `ζ^{2Tqd} = 1`, and (ii) there is a root of unity `ζ′` with `ζ′^{2Tqd} = 1` such that
`X_{qd} ≡ ζ′·(Frob_q^{−1}X_d)^{s(d,q)}` modulo every place of `ℚ̄` above `q`. For `δ ∈ G_ℚ`, acting on `μ_M` by
`ζ ↦ ζ^u`, write `P(v) = δ(v)/v^u`. The elements `x_d = P(X_d)^{2T₀d}` lie in `ℚ(μ_{Td})^×`, are units at every place not
above `r`, and satisfy (i) and (ii) with `ζ = ζ′ = 1` and with the exponents `q·s(d, q)` in place of `s(d, q)`; these
exponents are prime to `ℓ`.

(c3) *Derivative classes.* For every admissible prime `q` fix `τ_q ∈ G_ℚ` that fixes every root of unity of order prime
to `q` and acts on `μ_q` through a generator of `(ℤ/q)^×`. Let `D_q = Σ_{0≤i≤q−2} i·τ_q^i` and `N_q = Σ_{0≤i≤q−2} τ_q^i`,
acting on the groups `ℚ(μ_{Td})^×`, written multiplicatively, for the admissible moduli `d` divisible by `q`; let
`D_Q = ∏_{q∈Q} D_q` and `y_Q = D_Q x_{d_Q}`. Then `(τ_q − 1)D_q = (q − 1) − N_q`; for every `g ∈ Gal(ℚ̄/ℚ(μ_T))` there is
`z ∈ ℚ(μ_{T·d_Q})^×` with `z^M = g(y_Q)/y_Q`; and, for a fixed primitive `M`-th root of unity `ζ_M`, there is exactly one
map `κ_Q : Gal(ℚ̄/ℚ(μ_T)) → ℤ/M` such that `ζ_M^{κ_Q(g)} = g(P(Y))/(P(Y)·P(z))` for every `Y ∈ ℚ̄` with `Y^M = y_Q` and
every `z ∈ ℚ̄` with `z^M = g(y_Q)/y_Q`. It is a continuous homomorphism, and it is zero on the inertia group of every
place of `ℚ̄` not above `T·r·d_Q`.

(c4) *Values on inertia.* Let `q ∉ Q` be an admissible prime, `𝔔` a place of `ℚ̄` above `q`, `τ` an element of the
inertia group of `𝔔` that acts on `μ_q` as `τ_q`, and `φ` a Frobenius element at `𝔔`. Then
`κ_{Q∪{q}}(τ) = −q·s(d_Q, q)·κ_Q(φ)`. Let `ρ ∈ ℚ̄` with `ρ^M = r`, `τ₀` an element of the inertia group of `𝔯` with
`τ₀(ρ) = ζ_M·ρ`, `t ∈ (ℤ/T)^×` and `σ ∈ G_ℚ` acting on `μ_T` by `ζ ↦ ζ^t`. Then `t·κ_∅(σ^{−1}τ₀σ)` is the class modulo `M`
of the order of `σ(P(x_1))` at `𝔯`; by (c2) this order is `2T₀·(θ_{T,b}(tv²) − 2u·θ_{T,b}(tv) + u²·θ_{T,b}(t))`, where `δ`
acts on `μ_T` by `ζ ↦ ζ^v`.

(c5) *The classes of a character.* Let `O` be the ring of integers of a finite extension `Φ` of `ℚ_ℓ` and
`α : G_ℚ → O^×` a character with `α(g) ≡ 1 mod ℓ^h` for `g ∈ Gal(ℚ̄/ℚ(μ_T))`, with `α(g) ≡ −1 mod ℓ^h` for every `g`
acting on `μ_T` by inversion, and with `α(δ) − χ_ℓ(δ) ∈ O^×` for some `δ ∈ G_ℚ`; this `δ` is used in (c2) to (c4). Put
`β = χ_ℓα^{−1}`, choose for each `t ∈ (ℤ/T)^×` an element `σ_t ∈ G_ℚ` acting on `μ_T` by `ζ ↦ ζ^t`, and `w ∈ Φ/O` with
`ℓ^h·w = 0`, and let `ν_Q(g) = Σ_{t∈(ℤ/T)^×} κ_Q(σ_t^{−1}gσ_t)·β(σ_t)·w` for `g ∈ Gal(ℚ̄/ℚ(μ_T))`. Then: (i) `ν_Q` is a
continuous homomorphism to `Φ/O`, killed by `ℓ^h`, with `ν_Q(g′gg′^{−1}) = β(g′)·ν_Q(g)` for `g′ ∈ G_ℚ`, and zero on the
inertia group of every place of `ℚ̄` not above `T·r·d_Q`; (ii) for every admissible prime `q ∉ Q`, every place `𝔔` of
`ℚ̄` above `q` and every Frobenius element `φ` at `𝔔` there are `τ` in the inertia group of `𝔔` and `ε ∈ O^×` with
`ν_{Q∪{q}}(τ) = ε·ν_Q(φ)`; (iii) there are `τ₀` in the inertia group of `𝔯` and `ε₀ ∈ O^×` with `ν_∅(τ₀) = ε₀·z·w`, where
`z = Σ_{t∈(ℤ/T)^×} θ_{T,b}(t)·α(σ_t)^{−1}`.

[FormalProof] states (a) with `S = {ℓ}`, which implies (a) by 6.18 (a), for every modulus `N` of `ψ`, as
`UpperTheory.V.ML.vChar` (`AV/PrimitiveFrobeniusFixed/PrimCase.lean`), from the reciprocity law `UpperTheory.V.ML.Rec`
taken as a hypothesis; and (b), with the finiteness of each `Ш⁻(E, ℓ, e)` and for every `N` with `E ⊂ ℚ(μ_N)`, as
`UpperTheory.V.Odd.PrimeBound` (`AV/OddResidueBounds/ZeroMemUnrHom.lean`), proved from the form `UpperTheory.V.Odd.PsiBound`
of (a) for the components of `Ш(E)` (same file) as `UpperTheory.V.Odd.primeBound_of`
(`AV/OddResidueBounds/ThmBcOfPsiBound.lean`).
It states (c) for lists of distinct admissible primes in place of the sets `Q`, with `D_Q` independent of the order, and
(c5) as the existence of maps with (i) to (iii), its proof taking the `ν_Q` displayed. (c1): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/XEx.lean` (`UpperTheory.V.ML.xEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/XUniqConj.lean` (`UpperTheory.V.ML.xUniq`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/XMulConjIMul.lean` (`UpperTheory.V.ML.xMul`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/XJacPowNe.lean` (`UpperTheory.V.ML.xJac`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ThDist.lean` (`UpperTheory.V.ML.thDist`),
with the definitions in
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/IsAdmissiblePrimeListNil.lean`
(`UpperTheory.V.ML.th`, `UpperTheory.V.ML.IsX`). (c2): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/PlaceEmb.lean` (`UpperTheory.V.ML.laxEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/SysOfLax.lean` (`UpperTheory.V.ML.sysOfLax`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/XNormDiv.lean` (`UpperTheory.V.ML.xNormDiv`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/AlgStep.lean` (`UpperTheory.V.ML.xCong`),
with the definitions in
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/IsAdmissiblePrimeListNil.lean`
(`UpperTheory.V.ML.AdmP`, `UpperTheory.V.ML.admitted`, `UpperTheory.V.ML.AdmL`, `UpperTheory.V.ML.Lax`,
`UpperTheory.V.ML.Sys`, `UpperTheory.V.ML.HasOrd`). (c3): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/DerBasic.lean` (`UpperTheory.V.ML.derBasic`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/DerInv.lean` (`UpperTheory.V.ML.derInv`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/KolEx.lean` (`UpperTheory.V.ML.kolEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/KolHom.lean` (`UpperTheory.V.ML.kolHom`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/KolUnr.lean` (`UpperTheory.V.ML.kolUnr`),
with the definitions in
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/IsAdmissiblePrimeListNil.lean`
(`UpperTheory.V.ML.IsTau`, `UpperTheory.V.ML.der1`, `UpperTheory.V.ML.der`, `UpperTheory.V.ML.opP`,
`UpperTheory.V.ML.IsKol`). (c4): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/KolStep.lean` (`UpperTheory.V.ML.kolStep`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/KolInit.lean` (`UpperTheory.V.ML.kolInit`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/HasOrdP.lean` (`UpperTheory.V.ML.hasOrdP`).
(c5): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/NuSysEx.lean` (`UpperTheory.V.ML.nuSysEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ValAddSmul.lean` (`UpperTheory.V.ML.nuIs`),
with the definitions in
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/IsAdmissiblePrimeListNil.lean`
(`UpperTheory.V.ML.Dat`, `UpperTheory.V.ML.nu`, `UpperTheory.V.ML.IsNu`, `UpperTheory.V.ML.NuSys`, `UpperTheory.V.ML.zVal`).
The classes `κ_Q` are the derivative classes of Kolyvagin's method for Euler systems, here for the system of Jacobi
sums. The steps of the Route of (a) are [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/RatPlace.lean` (`UpperTheory.V.ML.exc`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ShaToShT.lean` (`UpperTheory.V.ML.shaToShT`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ZeNorm.lean` (`UpperTheory.V.ML.zEval`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/GenBUnits.lean` (`UpperTheory.V.ML.zCong`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ChiDvd.lean` (`UpperTheory.V.ML.step`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ShtNu.lean` (`UpperTheory.V.ML.shtNu`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/AddPowNsmul.lean` (`UpperTheory.V.ML.pick`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/ChebQ.lean` (`UpperTheory.V.ML.chebQ`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimitiveFrobeniusFixed/FrobFix.lean` (`UpperTheory.V.ML.count`).

*Route.* (a) A reciprocity law at auxiliary primes `q`, from Poitou–Tate duality and the orthogonality of unramified classes
(ArithmeticGaloisDuality §R02.4.3): for a cocycle `c` of a character `α` and a cocycle `m` of the dual character, both killed by `a`,
unramified outside `Nq`, with `c` locally trivial at the primes of `N` and unramified at `q`, `ℓ | N`, `q ≠ ℓ`, `α ≡ 1 mod a` on
inertia outside `Nq`, and both characters `≡ 1 mod a` on the decomposition group at `q`, if `m(τ) = y·w₀` at an inertia element
`τ` at `q`, `w₀` a generator of the coefficients of `m`, then `y·c(g) = 0` on the decomposition group at `q`: a class of the dual character ramified at `q` annihilates, through
its value on inertia at `q`, the localisation at `q` of a class unramified at `q`.
It is applied to the classes of (c5), as follows; lengths are `O`-lengths and `v` is the valuation of `O` with value
group `ℤ`, so that dividing by `e_O` gives (a). Let `ψ` be primitive of conductor `f`; this suffices, since `B_{e+1,ψ}`
is the number of the primitive character and its conductor divides `N`. Let `α = ψ^{−1}χ_ℓ^{−e}`, the character of the
component, and `β = χ_ℓα^{−1}`. If `α(g) − χ_ℓ(g)` is a non-unit for every `g ∈ G_ℚ`, then `ψ` is unramified outside `ℓ`
and the component is zero: a cocycle of `α` killed by a uniformizer, unramified outside `ℓ` and trivial at `ℓ`, is the
Kummer cocycle of a rational number whose valuations are all divisible by the odd prime `ℓ`, an `ℓ`-th power.
Otherwise fix `δ` with `α(δ) − χ_ℓ(δ) ∈ O^×` and `γ ∈ G_ℚ` with `α(γ) − 1 ∈ O^×`, which exists because `α(g) ≡ −1 mod ℓ`
for `g` acting by inversion on `μ_{fℓ}`. Every class of the component has exactly one cocycle `c` with `c(γ) = 0`; it
has finite image and is a coboundary on the decomposition groups above `fℓ` (above `p | f`, `p ≠ ℓ`, because it is one
on inertia, where `α − 1` takes a unit value, `ψ` being primitive of order prime to `ℓ`). So it suffices to prove
`length C(a₀) ≤ v(N·P_{e+2}·B_{e+1,ψ})` for every `a₀ ≠ 0` in `O`, where `C(a₀)` is the `O`-module of the cocycles `c` of
`α` with values in `Φ/O`, with `c(γ) = 0` and `a₀c = 0`, unramified outside `fℓ`, that are coboundaries of elements
killed by `a₀` on the decomposition groups above `fℓ`. Fix `a₀`; in (c) take `T = f₀·ℓ^h`, with `f₀` the part of `f` prime
to `ℓ` and `h ≥ max(1, v_ℓ(f))`, `b` the exponent of `δ` on `μ_T`, and `w` of annihilator `ℓ^hO`. For a Dirichlet
character `χ` modulo `T` with `χ(−1) = (−1)^{e+1}` and `b` prime to `T`,
`2(e + 1)P_{e+2}·(b^eχ(b)·Σ_t θ_{T,b}(t)⟨t⟩^eχ(t) − 2(χ(b)b^{e+1} − 1)·B_{e+1,χ}/(e + 1)) ≡ 0 mod ℓ^h`, the sum over
`t ∈ (ℤ/T)^×` and `B_{e+1,χ}` taken at the modulus `T`. For `χ = ψ` at the modulus `T` this number is
`(1 − ψ(ℓ)ℓ^e)·B_{e+1,ψ}`, `χ(b)b^{e+1} − 1` is a unit by the choice of `δ`, and `α(σ_t)^{−1} ≡ ⟨t⟩^eψ(t) mod ℓ^h`; since
`B_{e+1,ψ} ≠ 0`, for `h` large `v(z) = v(B_{e+1,ψ}/(e + 1))`, so that `a₀z | ℓ^h` and `z | N·P_{e+2}·B_{e+1,ψ}`, an
algebraic integer (von Staudt and `f^{k−1}B_k(a/f) = Σ_j binom(k,j) B_j a^{k−j} f^{j−1}`). For `n ≥ 1` let
`C_n(a₀) ⊂ C(a₀)` be the cocycles that vanish on the decomposition groups above `n`. *Step.* Let `q ≡ 1 mod T` be a
prime, `φ` a Frobenius element and `τ` an inertia element at a place above `q`, and `ν` a map with the properties
(c5) (i), unramified outside `T·n·q`; let `(a′)` be the annihilator of its image and `(a)` that of `ν(τ)`, and suppose
`a₀ | a`. Then `a′ = a·ε′` with `ε′·c(φ) = 0` for every `c ∈ C_n(a₀)`: `ν` extends to a cocycle of `β` on `G_ℚ`, because
`β(δ) − 1` is a unit, and the reciprocity law applies to it with `a′`, `N = T·n` and a generator `w₀` of the
`a′`-torsion of `Φ/O`, the decomposition group at `q` lying in `Gal(ℚ̄/ℚ(μ_T))`, on which `α ≡ β ≡ 1 mod ℓ^h`. A cocycle
of `C_n(a₀)` with `c(φ) = 0` vanishes on the decomposition groups above `q`; hence
`length C_n(a₀) ≤ length C_{nq}(a₀) + v(ε′)`. *Start.* Let `(a_Q)` be the annihilator of the image of `ν_Q`; it contains
`ℓ^h`. By (c5) (iii) the annihilator of `ν_∅(τ₀)` is generated by `ℓ^h/z`, a multiple of `a₀`, and the step with `q = r`,
`n = 1` gives `a_∅ = (ℓ^h/z)·ε₀′` and `length C(a₀) ≤ length C_r(a₀) + v(ε₀′)`. *Induction.* Let `a₀ | a_Q` and `c ≠ 0` in
`C_{r·d_Q}(a₀)`; `c` is a nonzero homomorphism on `Gal(ℚ̄/ℚ(μ_T))`. Chebotarev's theorem for `ℚ` gives a prime
`q ∤ T·ℓ·r·d_Q` and a Frobenius element `φ` at a place above `q` in the set of the `g ∈ Gal(ℚ̄/ℚ(μ_T, r^{1/M}))` with
`c(g) ≠ 0`, with `ν_Q(g)` a generator of the image of `ν_Q`, and with `g` not the identity on `μ_{Tℓ}`. This set is open,
and nonempty: a homomorphism on `Gal(ℚ̄/ℚ(μ_T))` killed by `ℓ^h`, equivariant for a character `λ` of `G_ℚ` and zero on
`Gal(ℚ̄/ℚ(μ_T, r^{1/M}))`, is killed by `λ(g) − χ_ℓ(g)` for every `g`, which is a unit for `λ = α` at `g = δ` and for
`λ = β` at an element inverting `μ_T`; so each condition excludes a proper subgroup of `Gal(ℚ̄/ℚ(μ_T, r^{1/M}))`, the
first of odd index, and three such subgroups do not cover the group. Such a `q` is admissible: `q ≡ 1 mod T`,
`q ≢ 1 mod Tℓ`, and `r^{(q−1)/M} ≡ 1 mod q`. By (c5) (ii) the annihilator of `ν_{Q∪{q}}(τ)` is `(a_Q)`, so the step gives
`a_{Q∪{q}} = a_Q·ε′` with `ε′·c(φ) = 0`, hence `ε′` is not a unit, and
`length C_{r·d_Q}(a₀) + v(a_Q) ≤ length C_{r·q·d_Q}(a₀) + v(a_{Q∪{q}})`. As `v(a_Q) ≤ v(ℓ^h)`, after finitely many primes
`C_{r·d_Q}(a₀) = 0`; therefore `length C_r(a₀) + v(a_∅) ≤ v(ℓ^h)`, and
`length C(a₀) ≤ v(ℓ^h) − v(ℓ^h/z) = v(z) ≤ v(N·P_{e+2}·B_{e+1,ψ})`.
The pairing is that of the `ψ`-component with `B_{e+1,ψ}`, the
same character: the `ψ`-eigenspace of the classes of `H¹(G_ℚ, (Φ/O)(λ))` restricted to `G_E` is `λ = ψ⁻¹χ_ℓ^{−e}`. (b) From (a) and 6.18(b): `N·P_{e+2}·B_{e+1,ψ}`
is an algebraic integer, nonzero because `L(e + 1, ψ̄) ≠ 0` and the functional equation, and of absolute value at most `N·4^{e+2}·N^{e+1}·4(e + 1)!/(2π)^{e+1} = 16(2/π)^{e+1}N^{e+2}(e + 1)! ≤ 16N^{e+2}(e + 1)!`,
by `|B_k(x)| ≤ 4k!/(2π)^k` on `[0, 1]` and `∏_{p≤m} p ≤ 4^m`; the product over the `ψ` of minus type is a rational integer, and the sum
of `log ℓ · v_ℓ` over odd `ℓ` is at most the logarithm of its absolute value, at most `(n/2)·log(16N^{e+2}(e + 1)!)`.
(c) (c1) For a prime of degree one this is Stickelberger's relation for Jacobi sums: `J(χ, χ^j)` divides `p` and lies in
`σ_t^{−1}𝔭` exactly when `⟨t⟩ + ⟨jt⟩ < M′`, so the exponent of `σ_t^{−1}𝔭` in `(J)` is `(b − 1) − ⌊⟨t⟩b/M′⌋`. The principal
case is immediate, and every ideal class contains a prime of degree one prime to `M′` (Chebotarev's theorem for the
Hilbert class field), which gives the general case by multiplicativity; uniqueness holds because a unit `ε` of
`ℤ[μ_{M′}]` with `ε·ε̄ = 1` is a root of unity. The distribution relation is a count of integer parts over the `q − 1`
units above `t`. (c2) `X_d` is the element of (c1) for `M′ = Td`, the prime `𝔭_d` of `ℚ(μ_{Td})` below `𝔯` and the same
`b`, and `s(d, q)` is the residue degree of `𝔭_{qd}` over `𝔭_d`, a divisor of the order of `r` modulo `Tqd`, which is
prime to `ℓ`. By the distribution relation both sides of (i) generate the same ideal, and uniqueness gives (i). The
congruence (ii) is multiplicative in the ideal: for a principal ideal prime to `q` it follows from the distribution
relation, because `Gal(ℚ(μ_{Tqd})/ℚ(μ_{Td}))` acts trivially on the residue fields above `q`; for a prime of degree one
it is the congruence between the Jacobi sums of a character `χ′` of order `Tqd` and those of `χ′^q`, since
`χ′ ≡ Frob_q^{−1}(χ′^q)` modulo the primes above `q`. `P` kills the roots of unity of order dividing `M`, and `ζ^{2T₀qd}`
is one of them when `ζ^{2Tqd} = 1`. (c3) The identity is EulerSystemsAndKolyvaginSystems §3.1. With (c2) (i) it gives
`(τ_q − 1)y_Q = (D_{Q∖{q}}x_{d_Q})^{q−1}·((Frob_q^{−1} − 1)y_{Q∖{q}})^{q·s(d_{Q∖{q}}, q)}`, an `M`-th power by induction on
the number of primes, since `M | q − 1` and `Frob_q` fixes `μ_T`; the `τ_q`, `q ∈ Q`, generate
`Gal(ℚ(μ_{T·d_Q})/ℚ(μ_T))`. The quotient defining `κ_Q` is an `M`-th root of unity that does not depend on `Y` and `z`,
because `P` kills `μ_M`; additivity uses that `Gal(ℚ̄/ℚ(μ_T))` fixes `μ_M`; at a place not above `T·r·d_Q` the element
`P(Y)` is a unit and inertia fixes `y_Q`, and an `M`-th root of unity congruent to `1` there is `1`. (c4) For the first
formula take `z = (D_Qx_{q·d_Q})^{(q−1)/M}·z′^{q·s(d_Q, q)}` with `z′^M = φ^{−1}(y_Q)/y_Q`, and reduce modulo `𝔔`, where
`τ` acts trivially, `φ^{−1}(v)^q ≡ v` and (c2) (ii) holds: this gives `κ_{Q∪{q}}(τ) = q·s(d_Q, q)·κ_Q(φ^{−1})`. For the
second, with `k` the order of `σ(P(x_1))` at `𝔯`, the element `σ(P(Y))·ρ^{−k}` is a unit at `𝔯` whose `M`-th power is
fixed by `τ₀`, so `τ₀` fixes it and multiplies `σ(P(Y))` by `ζ_M^k`. (c5) (i) is formal; (ii) and (iii) follow from (c4)
with `ε = −q·s(d_Q, q)` and `ε₀ = 2T₀·(α(δ) − u)²`, because `β(σ_t) ≡ t·α(σ_t)^{−1} mod ℓ^h` and
`Σ_t θ_{T,b}(tv)·α(σ_t)^{−1} ≡ α(δ)·z mod ℓ^h`.
*Needs:* 6.17, 6.18; ArithmeticGaloisDuality §R02.4.3; for (c): ClassicalArithmeticCompletion §1.55 (Stickelberger's relation, for
(c1) at a prime of degree one), CyclotomicClassGroupsAndStickelberger §2.5 (a prime of degree one in every ideal class),
EulerSystemsAndKolyvaginSystems §3.1 (the derivative operator and its identity), Mathlib `jacobiSum`; for the Route of (a): (c),
ProfiniteCohomology §9.6 (the Kummer sequence, in the exceptional case), Mathlib `Nat.exists_prime_gt_modEq_one` (the prime `r`);
CyclotomicClassGroupsAndStickelberger §3.1; DirichletPadicLFunctions §0.4; LFunctions Layer 4.

**Checks.**

- `E = ℚ(i)`, `ψ = 1`, `e = 11` (odd, so `ψ` is of minus type), `ℓ = 691`: `N = 4`, `P₁₃ = 30030`, `B₁₂ = −691/2730`, and
  `4·30030·B₁₂ = −30404` has `v_{691} = 1`, so (a) allows length at most `1`; indeed the component is `Ш¹(ℚ, 691, 11)`, dual to
  `K₂₂(ℤ){691} = ℤ/691` (ArithmeticKTheory §7.5 and the last Check of 6.17), of length exactly `1`.
- The normalization is the one of `DirichletCharacter.generalizedBernoulli`: `B_{1,1} = +1/2`, while the ordinary `B₁ = −1/2`.
- No exceptional case is needed: for `ψ = 1` and `(ℓ − 1) | (e + 1)`, `B_{e+1}` has `ℓ` in its denominator (von Staudt), and so does
  `B_{e+1}/(e + 1)`, while `ℓ ≤ e + 2` divides `P_{e+2}`, which makes `N·P_{e+2}·B_{e+1}` integral at `ℓ`.
- The character is `ψ`, not `ψ⁻¹`: the `ψ⁻¹χ_ℓ^{−e}`-twisted classes see the `ℓ`-adic `L`-function of `ψω^{e+1}`.
- For `ψ` factoring through `Gal(ℚ(μ_ℓ)/ℚ)`, IntegralIwasawaTheory §12.3 (with `F = ℚ`, `p = ℓ`, `n = e + 1` and its `χ` equal to
  `ψ`) gives an exact formula for the order of the coinvariants `X_{ψω^{e+1}}(−e−1)_Γ` through `L_S(−e, ψ)`, and
  IntegralIwasawaTheory §12.3a the order of the `ψ⁻¹`-part of `H²` for every `ψ` of order prime to `ℓ`; (a) is an
  inequality for the groups with vanishing at the primes of the conductor.
- (b) is the analogue in twist `e ≥ 1` of the relative class number formula of CyclotomicClassGroupsAndStickelberger §3.4 and
  of its bound in CyclotomicClassGroupsAndStickelberger §4.1, where the minus part of the class group is measured by the `B_{1,χ}`.
- For odd `e`, EulerSystemsCyclotomicMainConjecture §5.3 (c) gives, over `ℚ(μ_{ℓ^∞})^+`, the characteristic ideal of the dual
  of the Selmer group of `ℚ_ℓ/ℤ_ℓ(−e)` with the unramified condition at `ℓ`; the groups here are at finite level and vanish at
  the places above `ℓ`.

### Examples

For `E = ℚ(i)`, `ψ = 1`, `e = 11` and `ℓ = 691`: `N = 4`, `P₁₃ = 30030`, `B₁₂ = −691/2730`, and `4·30030·B₁₂ = −30404` has `v_{691} = 1`, so 10.1 (a) allows length at most `1`; the component is `Ш¹(ℚ, 691, 11)`, dual to `K₂₂(ℤ){691} = ℤ/691`, of length exactly `1` (10.1, Checks).

### Dependencies

Layer 6 (6.17, 6.18); ArithmeticGaloisDuality §R02.4.3; IntegralIwasawaTheory §12.3a (the general theorem of which 10.1 (a) is a corollary); ClassicalArithmeticCompletion §1.55; CyclotomicClassGroupsAndStickelberger §§2.5, 3.1; EulerSystemsAndKolyvaginSystems §3.1; ProfiniteCohomology §9.6; DirichletPadicLFunctions §0.4; LFunctions Layer 4; ArithmeticKTheory §7.5 (in a Check); Mathlib `jacobiSum`, `Nat.exists_prime_gt_modEq_one`; Tau Ceti `DirichletCharacter.generalizedBernoulli`.

## Layer 11: Ranks in cyclic extensions of degree p

This layer bounds the `p`-rank of the Galois group of the maximal unramified abelian pro-`p` extension along cyclic extensions of degree `p`, ramified away from `p`, of fields containing a cyclotomic `ℤ_p`-extension.

### 11.1 Ranks in cyclic extensions of degree `p`

*Origin:* this roadmap's own formulation: the bound `rank_p X(A′) ≤ p (rank_p X(A) + #P)` for a cyclic extension of
degree `p` ramified only at places not above `p`, and its iteration along a chain of such extensions; for `p = 2` it
is the statement of [FormalProof].

*Method of the formal proof:* for `p = 2`, on the characters of order 2 of the subgroup of index 2 the operator
`1 + σ` has square zero and its kernel consists of the `σ`-invariant characters, which are no more numerous than the
characters of the larger group, so the count is at most squared; allowing ramification at a prime `q ∤ p` multiplies
the count by at most `p` for each place above `q`, a character of a tame inertia group being determined by its value
at a generator.

Let `A` be an algebraic extension of `ℚ` containing the cyclotomic `ℤ_p`-extension of a number field, totally imaginary if
`p = 2` (so that "unramified" imposes no condition at real places), `A′/A` a cyclic
extension of degree `p` ramified only at a finite set `P` of places of `A` not above `p`, and `X(A)` the Galois group of the
maximal unramified abelian pro-`p` extension of `A`, with `rank_p X(A) = dim_{𝔽_p} X(A)/p ∈ ℕ∞`. Prove
`rank_p X(A′) ≤ p (rank_p X(A) + #P)`. The route below does not use that `A` contains a cyclotomic `ℤ_p`-extension; that
hypothesis is the setting in which [FormalProof] and UniformWildKernelBounds use the bound. Iterating along a chain `A_0 ⊂ A_1 ⊂ ⋯ ⊂ A_r` of cyclic extensions of degree `p`, `A_j/A_{j−1}`
ramified only at a finite set `P_j` of places not above `p`: `rank_p X(A_r) ≤ p^r rank_p X(A_0) + Σ_{j=1}^{r} p^{r−j+1} #P_j`.
For `p = 2` this is the statement of [FormalProof], which UniformWildKernelBounds uses for two quadratic steps; for odd `p` it
is this roadmap's, by the route below.

[FormalProof] states it for `p = 2` only, in pieces: the doubling of the `2`-rank of the characters that kill a
conjugation-stable set, in passing to a subgroup of index dividing `2` (`UpperTheory.V.Two.idxTwo`,
`AV/QuadraticExtensions/IdxTwo.lean`); the growth of the rank by at most the number of places above a prime when
ramification at that prime is allowed (`UpperTheory.V.Two.charStep`, `AV/QuadraticExtensions/CharStep.lean`); and the
iterated bound with `r = 2` for one family of dyadic fields containing `ℚ(i)(μ_{2^∞})` (`UpperTheory.V.Two.baseRk`,
`AV/QuadraticExtensions/IsAlgClosureRat.lean`).

*Route.* Let `σ` generate `Gal(A′/A)` and `𝒱 = Hom(X(A′), ℤ/p)`, an `𝔽_p[σ]`-module with `(σ − 1)^p = 0`; so `dim 𝒱 ≤ p · dim 𝒱^σ`.
Let `G` be the Galois group of the maximal pro-`p` extension of `A` unramified outside `P` and `H ⊂ G` the subgroup fixing `A′`. A
`σ`-invariant unramified character of `A′` lies in `H¹(H, ℤ/p)^G`, and inflation–restriction gives the exact sequence
`H¹(G/H, ℤ/p) → H¹(G, ℤ/p) → H¹(H, ℤ/p)^G → H²(G/H, ℤ/p) ≅ ℤ/p`, whose first map is injective with one-dimensional source; so
`dim 𝒱^σ ≤ dim H¹(G, ℤ/p) − 1 + 1`. The `p`-rank of `G^{ab}` exceeds `rank_p X(A)` by at most `#P`, since the inertia groups at places
prime to `p` are procyclic in a pro-`p` quotient. Hence `dim 𝒱^σ ≤ rank_p X(A) + #P`. The iterated bound follows by induction.
*Needs:* IntegralIwasawaTheory §§0.3, 3.5; ClassFieldTheory Layers 8–12 (ramification of abelian extensions, class field theory over the
layers); ProfiniteCohomology §5.5 (five-term sequence) and ProfiniteCohomology §9.6 (Kummer).

**Checks.**

- `p = 2`, `A = ℚ(i)(μ_{2^∞})`, `A′ = A(√−q)` with `q ≡ 3 mod 8`: `X(A) = 0`; `q` has two places in `A`, and the bound gives
  `rank₂ X(A′) ≤ 4`.
- Two quadratic steps at `p = 2` over `A_0 = M(i)(μ_{2^∞})`, `M` abelian, adjoining `√−q` and `√−q′` with `q ≡ 3 mod 8`,
  `q′ ≡ 7 mod 16`: `q` has two places in `ℚ(μ_{2^∞})` and `q′` four, so `#P_1 ≤ 2[M:ℚ]` and `#P_2 ≤ 8[M:ℚ]`, and
  `rank₂ X(A_2) ≤ 4 rank₂ X(A_0) + 4·2[M:ℚ] + 2·8[M:ℚ] = 4(rank₂ X(A_0) + 6[M:ℚ])`; the other order gives the same value.
- For `p` odd the analogous statement for a *quadratic* extension is false in general: its new part is a character
  component of the Iwasawa module of a twisted field, which genus theory does not bound. The degree must be `p`.
- The same bound for the split-at-`p` quotients `X′ = X/D_∞` needs a further term for the places above `p` that do not split in
  `A′`: a `σ`-invariant character of `A′` split above `p` descends to a character of `A` split only at the places above `p` that
  split in `A′`. A group-theoretic model for odd `p`: `G` the Heisenberg group of order `p³` (exponent `p`) generated by `x, y`,
  decomposition groups `⟨y⟩` and `⟨xy⟩`, `H = ⟨x, [x, y]⟩`; `G^{ab}` is generated by the decomposition groups, `H` meets no conjugate
  of them (each has order `p` and its generator lies outside `H`), and `H^{ab}` has rank `2`. The model is for odd `p` only: for
  `p = 2` the group of order `8` so generated is dihedral and `(xy)² = [x, y] ∈ H`. `X′` is a quotient of `X`, which is what
  consumers use.
- The bound `dim 𝒱^σ ≤ rank_p X(A) + #P` of the route is the infinite-level rank analogue of Chevalley's ambiguous-class
  formula (IntegralIwasawaTheory §3.5).

### Examples

For `p = 2`, `A = ℚ(i)(μ_{2^∞})` and `A′ = A(√−q)` with `q ≡ 3 mod 8`: `X(A) = 0`, `q` has two places in `A`, and 11.1 gives `rank₂ X(A′) ≤ 4` (11.1, Checks).

### Dependencies

IntegralIwasawaTheory §§0.3, 3.5; ClassFieldTheory Layers 8–12; ProfiniteCohomology §§5.5, 9.6.

## Layer 12: Specialization at finite-order characters of abelian extensions

This layer extends the specialization of the main conjecture at arithmetic weights from the abelian extensions of degree prime to `p` (IntegralIwasawaTheory §§12.3, 12.3a) to the finite-order characters of an arbitrary finite abelian extension `E` of a totally real field `F`, over `E(μ_p)`.

### 12.1 Specialization for finite-order characters of an abelian extension

*Origin:* adapted from Kolster (2009), Theorem 3.3: the order of the `χ⁻¹`-part of `H²` and of the twisted
coinvariants for an abelian extension of degree prime to `p` (IntegralIwasawaTheory §12.3a); here over
`E′ = E(μ_p)` for every finite abelian `E/F`, also when `p` divides `[E : F]`, with `S` containing the places
ramified in `E′`.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `F` be totally real, `p` odd, `E/F` a finite abelian extension, `E′ = E(μ_p)`, `n ≥ 2`, and `χ` a character of `Gal(E′/F)` of
order prime to `p` with `χ(c) = (−1)^n` for every complex conjugation `c`; put `ψ = χ ω^n` (even, of order prime to `p`) and
`d_χ = [O_χ : ℤ_p]`. Let `S` contain the places above `p`, the infinite places and those ramified in `E′`. Prove
`X_ψ(−n)^Γ = 0` and

```text
v_p(#X_ψ(−n)_Γ) = d_χ v_p(L_S(1 − n, χ)) + v_p(#H⁰(E′, ℚ_p/ℤ_p(n))_{χ⁻¹}),
```

and that `#X_ψ(−n)_Γ` is the order of the `χ⁻¹`-part of `H²(𝒪_{E′,S}, ℤ_p(n))` (for the natural action of `Gal(E′/F)` on
cohomology). For `[E : F]` prime to `p`, 12.1 is IntegralIwasawaTheory §12.3a for the field `E′`, which is then abelian
over `F` of degree prime to `p` and contains `μ_p` (Kolster 2009, Theorem 3.3); the case where `p` divides `[E : F]` is
this roadmap's statement, by the route below. [FormalProof] does not state it.

*Route.* As in IntegralIwasawaTheory §12.3, with IntegralIwasawaTheory §12.1's character-quotient main conjecture applied to the even character `ψ` of prime-to-`p`
order (IntegralIwasawaTheory §12.2 for going up from `F` to the field of `ψ`), IntegralIwasawaTheory §10.4 for the Euler quotient and absence of finite submodules, and IntegralIwasawaTheory §10.5
for the comparison with the finite étale `H²` eigenspace of the correct parity. The case `E = F(μ_p)` is IntegralIwasawaTheory §12.3. *Needs:* IntegralIwasawaTheory §§10.4,
10.5, 12.1, 12.2, 12.3, and §12.3a for `[E : F]` prime to `p`; LFunctions Layer 5 (finite-order Hecke L-functions).

**Checks.**

- For `E` a CM quadratic extension of `F` and `χ = χ_{E/F}`, `n = e + 1` with `e` even: the formula gives the order of the minus part of
  `H²(𝒪_E[1/p], ℤ_p(e+1))` through `L_S(−e, χ_{E/F})`, a value that is nonzero because `χ_{E/F}` is totally odd and `e` even.
- `χ = 1` and `E = F(μ_p)` recover IntegralIwasawaTheory §12.3; `p | o_χ` is excluded, as in IntegralIwasawaTheory §12.1, where eigenspaces and quotients differ integrally.
- For `χ = 1`, `E = F` and `n = 2k`, the formula is the cohomological form of the `p`-part, `p` odd, of ArithmeticKTheory §7.5's
  `|ζ_F(1 − 2k)| = 2^{r₁}|K_{4k−2}(𝒪_F)|/|K_{4k−1}(𝒪_F)|`.
- The part of `H²` is the `χ⁻¹`-part: for `E′ = ℚ(μ₇)`, `p = 7`, `n = 2`, `χ = ω⁴`, adding `2` to `S` adds one to the length of the
  `χ`-part (the residue groups are `Ind μ₇(𝔽₈)`, with the characters `ω, ω⁴`), while `1 − 2χ(2) ≡ 4` is a unit and `1 − 2χ⁻¹(2) ≡ 0`
  modulo `7`.

### Examples

For `χ = 1` and `E = F(μ_p)`, 12.1 is IntegralIwasawaTheory §12.3. For a CM quadratic extension `E/F`, `χ = χ_{E/F}` and `n = e + 1` with `e` even, it gives the order of the minus part of `H²(𝒪_E[1/p], ℤ_p(e+1))` through the nonzero value `L_S(−e, χ_{E/F})` (12.1, Checks).

### Dependencies

IntegralIwasawaTheory §§10.4, 10.5, 12.1, 12.2, 12.3, 12.3a; LFunctions Layer 5.

## Layer 13: Splitting of quaternion algebras at reducible places

This layer shows that Momose's quaternion algebra of a newform without complex multiplication splits at every place at which the local Galois representation at `p` is reducible, so that the pair `(f, λ)` is admissible there.

### 13.1 Splitting at reducible places

*Origin:* adapted from Brown and Ghate (2003), Theorem 3.3.1: Momose's quaternion algebra splits at the places above
a prime not dividing the level at which the newform is ordinary (KatoEulerSystems §4.1a); here at every place at
which the restriction of `V_λ(f)` to `G_{ℚ_p}` is reducible, by the characters of inertia, with the admissibility of
`(f, λ)` over every abelian field.

*Method of the formal proof:* none; the statement is not in [FormalProof].

Let `f` be a non-CM newform of weight `k ≥ 2`, `λ` a place of its coefficient field above `p`, and `λ₀` the place of `F⁰` below it.
If the restriction of `V_λ(f)` to the decomposition group `G_{ℚ_p}` is reducible, then `B` splits at `λ₀`, and `(f, λ)` is admissible
over every abelian field. At a place `λ` above a prime `p` not dividing the level of `f` at which `f` is ordinary, the
splitting is KatoEulerSystems §4.1a (Brown–Ghate 2003, Theorem 3.3.1); at the other places at which the restriction is
reducible, and with the admissibility over every abelian field, 13.1 is this roadmap's statement, by the route below.
[FormalProof] does not state it, and in its instance of 14.1 assumes an ordinary newform in place of admissibility (14.1).

*Route.* By the open-image theorem of Ribet and Momose (KatoEulerSystems §4.1) the image of `H` lies in `B_{λ₀}^×`. Suppose `B_{λ₀}` is a division algebra. An element of a
quaternion division algebra over `F⁰_{λ₀}` is central or has irreducible reduced characteristic polynomial over `F⁰_{λ₀}`. On a
`G_{ℚ_p}`-stable line of the reducible restriction and on the quotient, `G_{ℚ_p}` acts through characters which, being de Rham of
the Hodge–Tate weights `0` and `k − 1` of `V_λ(f)` (PadicHodgeTheory §3.6: characters with labelled weights, locally algebraic on
an open subgroup of inertia), are `χ_p^a` and `χ_p^b` on an open subgroup of the inertia group, `a ≠ b` (up to sign the weights `0` and `k − 1`). For `τ` in the intersection of
that subgroup with `H`, `ρ_f(τ)` has the eigenvalues `χ_p(τ)^a`, `χ_p(τ)^b ∈ ℤ_p ⊂ F⁰_{λ₀}`, so its reduced characteristic polynomial
splits over `F⁰_{λ₀}`; hence `ρ_f(τ)` is central, so `χ_p(τ)^{a−b} = 1`, for all `τ` in an open subgroup of inertia, which is false.
So `B` splits at `λ₀`, and the splitting criterion of KatoEulerSystems §4.1 applies; over an abelian field `K`, `G_{K(μ_{p^∞})}` has finite index in
`G_{ℚ(μ_{p^∞})}`, so its image still contains a nontrivial unipotent. The decomposition group of `ℚ_p` itself is needed: on a line
stable only under `G_{K′}` for a proper finite extension `K′/ℚ_p` the character is, on inertia, a product `∏_τ τ^{n_τ}∘Art⁻¹` over the
embeddings of `K′`, whose values need not lie in `ℤ_p`. *Needs:* KatoEulerSystems §4.1, and §4.1a at the ordinary places above primes not dividing the level; PadicHodgeTheory §3.6 (characters with labelled weights).

**Checks.**

- A newform ordinary at `λ` satisfies the hypothesis: `V_λ(f)|_{G_{ℚ_p}}` has an unramified-twisted quotient.
- The hypothesis is not met at a good non-ordinary place: there `V_λ(f)|_{G_{ℚ_p}}` is irreducible, the route gives nothing, and
  KatoEulerSystems §4.1's division case is not excluded by this section.

### Examples

A newform ordinary at `λ` satisfies the hypothesis of 13.1, since `V_λ(f)|_{G_{ℚ_p}}` has an unramified-twisted quotient; at a good non-ordinary place `V_λ(f)|_{G_{ℚ_p}}` is irreducible and 13.1 gives nothing (13.1, Checks).

### Dependencies

KatoEulerSystems §§4.1, 4.1a; PadicHodgeTheory §3.6.

## Layer 14: Vanishing of rational Bloch–Kato groups at non-central twists

This layer deduces the vanishing of the Bloch–Kato group with `E_λ`-coefficients from the finiteness of Selmer groups over abelian fields.

### 14.1 Vanishing of rational Bloch–Kato groups at non-central twists

*Origin:* adapted from Kato (2004), Theorem 14.2: the finiteness of `Sel(K, T)` for `(f, λ)` admissible over an
abelian field `K` and `1 ≤ r ≤ k − 1`, `r ≠ k/2` (KatoEulerSystems §7.9), read rationally as the vanishing of
`H¹_f(K, V_λ(f)(r))`; [FormalProof] proves the instance over `ℚ` with `k = 2e + 1` and `r = e` for an ordinary
newform of level prime to `p`.

*Method of the formal proof:* for the instance over `ℚ` (weight `2e + 1`, twist `e`, an ordinary newform of level
prime to `p`) the Euler system of zeta elements provides a class `y`, not ordinary at `p`, and tame classes at
auxiliary primes `w ≡ 1 mod p^n` with norm `P·y`, `P ≡ u·det(W(Frob_w) − 1)`; a nonzero strict Selmer class `z` of
the dual twist is excluded by cup products with these classes and global reciprocity, one auxiliary prime at a time,
with `w` chosen by density; the ordinary Selmer group of the dual then vanishes because `y` is not ordinary, that of
`W` by the Greenberg–Wiles count, and a Bloch–Kato class is unramified outside `p` and ordinary at `p`. Kato's proof
passes through Iwasawa theory over the cyclotomic tower and the finiteness of Selmer groups; here only the first step
of Kolyvagin's argument is used, directly over `ℚ` with ordinary local conditions. The route written below is not
this proof: it deduces the vanishing, for every pair admissible over an abelian field, from the finiteness of
`Sel(K, T)` (KatoEulerSystems §7.9).

*Corollary of:* KatoEulerSystems §7.9 (Kato's theorem: for `(f, λ)` admissible over an abelian field `K` and
`1 ≤ r ≤ k − 1`, `r ≠ k/2`, `Sel(K, T)` is finite for every stable lattice `T` of `V_λ(f)(r)`).

Let `f` be a newform of weight `k ≥ 2`, `K` an abelian field, `λ` a place of the coefficient field of `f` above `p` with `(f, λ)`
admissible over `K`, and `1 ≤ r ≤ k − 1` with `r ≠ k/2`. Prove `H¹_f(K, V_λ(f)(r)) = 0`.
This is Kato's theorem in the form of KatoEulerSystems §7.9. [FormalProof] proves, by a direct argument, the instance used
downstream (first Check below) under hypotheses that include these: `p` odd with `(p − 1) ∤ 2e` and `p ∤ d_K h_K`; an even integer `N ≥ 1`
prime to `d_K` such that `V_λ(f)(e)` has level `N|d_K|` (at every prime other than `p` the inertia group acts through two
characters trivial on `G_{ℚ(μ_{N|d_K|})}`, and at `p` the two characters of the flag below are, on inertia, `χ_p^{±e}` times such
characters, and either they are not in ratio `χ_p` on the decomposition group or the representation is potentially crystalline
at `p`; no condition is put on the level of `f`);
`V_λ(f)(e)` has a line stable under the whole decomposition group at `p`, with inertial characters `χ_p^{e}χ` and `χ_p^{−e}χ` for a
character `χ` of conductor dividing `p`; and `V_λ(f)` is irreducible on `G_{K(μ_{p^∞})}`. The full list is the structure
`UpperTheory.V.Z.Kato.Used`; among its further fields, `K` is imaginary quadratic,
the determinant of `V_λ(f)(e)` is the quadratic character of `K`, and `V_λ(f)(e)` is residually reducible. The general
statement and the criterion 13.1 for admissibility are this roadmap's route to that instance.

[FormalProof] states it only over `ℚ`, with `ℚ̄_p`-coefficients, for `p` odd, `k = 2e + 1` and `r = e`, and with, in place of
admissibility, the conditions `GlobalTheory.Ord2.admitted` (`Development/AbelianVarietyTheory/Definitions/Foundations/FinalTheorems.lean`)
and `GlobalTheory.Ord2.SrcL` (an ordinary newform of level prime to `p`), as `GlobalTheory.Ord2.VanishOrdL`
(`Development/AbelianVarietyTheory/Definitions/Foundations/VanishOrdL.lean`); it proves this through an Euler system,
not through the finiteness of Selmer groups. The Euler system is a theorem of [FormalProof]: let `p` be odd, `e ≥ 1`, and `W` a
continuous integral two-dimensional representation of `G_ℚ`, unramified outside a finite set of primes containing `p`, with
`(det W)² = 1` and `det W = −1` at complex conjugations, irreducible on the common kernel of the cyclotomic character and of
`det W`, upper triangular on a decomposition group at `p` with first diagonal character equal to `χ_p^e` up to finite order on
inertia and different from `χ_p` on the decomposition group; assume that for some character `χ` of conductor dividing `p` the
twist `W ⊗ χ_p^{−e}(det W)⁻¹χ` is attached to a newform of weight `2e + 1` (at almost every prime `q`, the inverse of an arithmetic
Frobenius at `q` has characteristic polynomial `X² − a_q X + ε(q)q^{2e}`, `ε` the nebentypus), of level prime to `p` and ordinary at `p`, and has quotient character
`χ_p^{−2e}` on inertia at `p`. Then there are a continuous integral cocycle `y` of `G_ℚ` in `W`, a coboundary on
an inertia group at every prime other than `p` and not a coboundary in the quotient line on the decomposition group at `p`, and
a finite set of primes outside which, for every `n ≥ 1`, every prime `w` with `p^n ∣ w − 1` and every character of `G_ℚ` of order
`p^n` trivial on `G_{ℚ(μ_w)}`, there is a continuous integral cocycle over the field of that character, a coboundary on inertia
with integral primitive at the primes other than `p` and `w`, whose norm is `P·y` up to the coboundary of an integral vector,
with `P ≡ u·det(W(Frob_w) − 1)` modulo `p^n`, `u` a unit
(`Development/AbelianVarietyTheory/Statements/CuspidalUnitaryTwists/ZetaUr.lean` (`GlobalTheory.Ord2.ZetaUr`,
`GlobalTheory.Ord2.SrcUr`), `Development/AbelianVarietyTheory/Definitions/Foundations/FinalTheorems.lean`
(`GlobalTheory.Ord2.Nf`, `GlobalTheory.Ord2.ES`, `GlobalTheory.Ord2.Tame`)). [FormalProof] proves it from the zeta elements of
a tower of modular curves (`AV/ModularityArgument/KatoQuadraticCharacters/UnramifiedZeta/ZetaUr.lean`
(`UpperTheory.V.Z.Kato.Final.zetaUr`),
`Development/AutomorphicArithmetic/Foundations/IwahoriReduction/NormProducts/AdmissibleWeightedDataMonoCoef.lean`
(`UpperTheory.Kd.K4.kato_eulerSystem_integrality`)), and deduces the vanishing from it and from statements of published
theorems of Galois cohomology (Poitou–Tate and local Tate duality, the unramified classes of an unramified module and of its
dual being each other's annihilators at primes not above `p`, finiteness and the Euler characteristic formulas, the Greenberg–Wiles formula, the
dimension and duality of the Bloch–Kato local conditions), which that deduction takes as a
hypothesis (`Development/AbelianVarietyTheory/Proofs/FoundationProofs/VanishOrdLOfZetaUr.lean`
(`GlobalTheory.Ord2.vanishOrdL_of_zetaUr`), with
`Development/AbelianVarietyTheory/Definitions/AutomorphicMembership/Brauer.lean` (`GlobalTheory.Mem.LiteralAutomorphy.LitCoh`)).
The statement for every abelian `K`, every `k` and `r`
and every admissible pair is this roadmap's.

*Route.* For a stable lattice `T`, the image of `H¹_f(K, V_λ(f)(r))` in `H¹(K, T ⊗ ℚ/ℤ)` lies in `Sel(K, T)` and is divisible, with
kernel `H¹_f(K, T)`, a lattice in `H¹_f(K, V)` modulo torsion; a divisible subgroup of the finite group `Sel(K, T)` (KatoEulerSystems §7.9(1)) is zero,
so `H¹_f(K, V) = 0`. *Needs:* KatoEulerSystems §7.9; SelmerIwasawaCohomology §4.9 (Bloch–Kato conditions).

**Checks.**

- The instance used downstream: `f` of odd weight `k = 2e + 1` with quadratic nebentypus `η_K`, `K` imaginary quadratic,
  `r = e`: `1 ≤ e ≤ 2e` and `e ≠ (2e + 1)/2`, so `H¹_f(K, V_λ(f)(e)) = 0`; since `H¹_f(K, V) = H¹_f(ℚ, V) ⊕ H¹_f(ℚ, V ⊗ η_K)` for `p` odd,
  both `H¹_f(ℚ, V_λ(f)(e))` and `H¹_f(ℚ, V_λ(f ⊗ η_K)(e))` vanish.
- `k = 2e + 1` is odd, so the twist `e` is never central and no hypothesis `L(f, k/2) ≠ 0` enters.
- The conclusion is rational: the integral Selmer group of a lattice can be nonzero.

### Examples

For `f` of odd weight `k = 2e + 1` with quadratic nebentypus `η_K`, `K` imaginary quadratic, `(f, λ)` admissible over `K` and `r = e`, the twist is not central and `H¹_f(K, V_λ(f)(e)) = 0`; for `p` odd, both `H¹_f(ℚ, V_λ(f)(e))` and `H¹_f(ℚ, V_λ(f ⊗ η_K)(e))` vanish (14.1, Checks).

### Dependencies

KatoEulerSystems §7.9; SelmerIwasawaCohomology §4.9.

## Downstream consumers

In the family RiemannHypothesisForDirichletLFunctions, UniformWildKernelBounds uses this roadmap throughout. It uses the groups `Ш¹(F, ℓ, e)` and the total `V(F, t)` (6.17) and the character components (6.18); the étale bound 9.7 in the explicit form stated there (a power of `|d_L|` in the inner exponent would not serve its window arguments); the bound 10.1 (b), summed over the twists, for the minus part of its abelian host fields at the odd primes prime to the degree; the rank bound 11.1 for its dyadic base fields `ℚ(χ, i, √−q : q ∈ Q)`, uniformly in `Q` (these fields contain `√−1`); and 13.1 and 14.1 at its points of type `W ⊕ 1`, for admissibility (the line of `W` of cyclotomic exponent `e` is stable under the whole decomposition group at `ℓ`, and `f` has no complex multiplication) and for rigidity (the off-diagonal blocks, which over `ℚ` are `W ≅ V_λ(f)(e)` and `W ⊗ η_K ≅ V_λ(f ⊗ η_K)(e)`). 14.1 is Kato's theorem in the form of KatoEulerSystems §7.9; [FormalProof] proves, by a direct argument, the instance used there under hypotheses that include these: `ℓ` odd with `(ℓ − 1) ∤ 2e` and `ℓ ∤ d_K h_K`; an even integer `N ≥ 1` prime to `d_K` such that `V_λ(f)(e)` has level `N|d_K|` (as in 14.1, with `ℓ` in place of `p`; no condition is put on the level of `f`); `V_λ(f)(e)` has a line stable under the whole decomposition group at `ℓ`, with inertial characters `χ_ℓ^{e}χ` and `χ_ℓ^{−e}χ` for a character `χ` of conductor dividing `ℓ`; and `V_λ(f)` is irreducible on `G_{K(μ_{ℓ^∞})}` (the full list, with `K` imaginary quadratic, the determinant and residual reducibility, is `UpperTheory.V.Z.Kato.Used`, as in 14.1). The general statement and the criterion 13.1 for admissibility are this roadmap's route to that instance. The congruence UniformWildKernelBounds measures is the integral Selmer group of a lattice, which can be nonzero although the rational group of 14.1 vanishes.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the statements above: the twisted Tate–Shafarevich groups `Ш¹(F, ℓ, e)` with `ℚ_ℓ/ℤ_ℓ(−e)` coefficients, their duality with the cohomological wild kernels, their comparison with `H²`, their behaviour under restriction, their total over all primes and twists, and their plus/minus and character decompositions (Layer 6); explicit torsion bounds for cokernels with short relations, for the homology of groups acting on acyclic complexes and of `GL_N(𝒪_L)`, for `H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` and for K-groups, with the perfect forms over rings of integers and their nerve, the values of primitive classes and the additive classes of finite fields that these bounds use (Layer 9); the per-character bound for the minus parts of abelian CM fields by generalized Bernoulli numbers, with the Euler system of Jacobi sums and its derivative classes (Layer 10); the rank bound for unramified Iwasawa modules in cyclic extensions of degree `p` (Layer 11); the special-value formula for finite-order characters of an abelian extension of a totally real field, over `E(μ_p)` when `p` divides the degree (Layer 12); the splitting of Momose's quaternion algebra at reducible places (Layer 13); and the vanishing of rational Bloch–Kato groups at non-central twists (Layer 14). The perfect forms over a ring of integers (9.3 (a)–(d)) generalize LatticePackingsAndPerfectForms §4.9, which is the case `L = ℚ`.

Not owned here. The theory these statements extend belongs to four roadmaps. [ArithmeticKTheory](../../ArithmeticKTheory/README.md) owns the K-groups of rings of integers and S-integers, their finite generation and Borel's ranks, the even groups in cohomological dimension two, the wild kernels, the cohomological kernels `Sha²_{i,ℓ}(F)` and the Moore sequence, the Bernoulli conventions with the character projectors and Herbrand–Ribet (ArithmeticKTheory §7.3), and the tame kernels of cyclotomic integers. [EulerSystemsCyclotomicMainConjecture](../../EulerSystemsCyclotomicMainConjecture/README.md) owns the Euler systems of cyclotomic units, Stickelberger annihilation and the Stickelberger cohomology family (EulerSystemsCyclotomicMainConjecture §§0.29–0.31), and the main conjecture with its finite consequences. [IntegralIwasawaTheory](../../IntegralIwasawaTheory/README.md) owns cyclotomic towers, unramified Iwasawa modules with their rank criteria, Ferrero–Washington, and the main conjecture in its character-quotient form with the specialization at arithmetic weights for `E = F(μ_p)` (IntegralIwasawaTheory §12.3) and for the characters of order prime to `p` over abelian extensions of degree prime to `p` (IntegralIwasawaTheory §12.3a). KatoEulerSystems owns Kato's Euler systems for modular forms, admissible pairs with the open-image theorem of Ribet and Momose (KatoEulerSystems §4.1), the splitting of Momose's algebra at ordinary places (KatoEulerSystems §4.1a), and the finiteness of Selmer groups over abelian fields (KatoEulerSystems §7.9). The class groups of cyclotomic fields as Galois modules, with their character components, Stickelberger's theorem and the Herbrand–Ribet theorem, are [CyclotomicClassGroupsAndStickelberger](../../CyclotomicClassGroupsAndStickelberger/README.md). Sha kernels with lattice and divisible coefficients and their duality are HeckeIdealsAndTaylorWilesRelations §10.1 and ArithmeticGaloisDuality §D7.6a. Gabber's lemma on the torsion in the homology of a based complex is ArithmeticKTheory §9.1, and the integers `R_m` that kill the kernel of the Hurewicz map of K-theory are StableHomotopyKTheory §4.24a. Uniform bounds for the plus part in towers of abelian fields, and the bound for the minus part at the odd primes dividing the degree, belong to UniformWildKernelBounds.

## Exact supplier contracts

### From TauCetiRoadmap.ArithmeticKTheory

Layer 3: finite generation of the K-groups of rings of integers and finiteness of `K_{2e}(𝒪_F)` for `e ≥ 1` (6.17 (e)); §§3.1–3.2: the rank filtration, relative homology and stability (9.8); §3.4: Borel's ranks, for `K_m(𝒪_L)` and for the primitive part of the stable rational homology of `GL(𝒪_L)`, and the vanishing of the rank of the positive even groups (9.5, 9.7). §§2.1–2.3: the localization sequence and the residue transfer (9.6). §6.1: the even groups in cohomological dimension two, with the surjection `K_{2e}(𝒪_F) ⊗ ℤ_ℓ → H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`, the finiteness of these `H²` and the Checks over `ℚ` and `ℚ(i)` (6.17, 9.7, 9.8). §6.3: the real dyadic integral table (6.17 (b) at `ℓ = 2`). §6.7: the wild kernel of `K₂(ℚ)` at `ℓ = 2` (a Check of 6.17). §6.8: the Moore sequence and the order identity (6.17 (c)). §6.9: the cohomological kernel `Sha²_{i,ℓ}(F)` and its comparison with `WK^sym_{2i}(F){ℓ}` (6.17 (b)). §7.4: `K_{2e}(ℤ[ζ₃₇]){37} ≠ 0` (a Check of 6.17). §7.5: `K₂₂(ℤ){691} = ℤ/691` (a Check of 10.1). §9.1: Gabber's lemma, the torsion of the homology in degree `k` of a based complex of free abelian groups of finite rank has order at most `b^a`, for `b ≥ 1` bounding the Euclidean norms of the boundaries of the basis elements in degree `k + 1` and `a` the smaller of the ranks in degrees `k` and `k + 1` (cited at 9.2).

### From TauCetiRoadmap.ArithmeticGaloisDuality

§D7.6: continuous cohomology with lattice coefficients and the Poitou–Tate sequence for the lattice `ℤ_ℓ(e+1)` (6.17 (c)). §D7.6a: for a lattice `T` with `W = V/T` and `T^D = Hom(T, ℚ_p/ℤ_p)(1)`, the kernels `Ш¹_S(F, W)`, `Ш¹_S(F, T^D)` and `Ш²_S(F, T)` with the real places included, the perfect pairing `Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p`, and the exact sequence `0 → Ш²_S(F, T) → H²(G_{F,S}, T) → ⊕_{v∈S} Ĥ²(F_v, T) → H⁰(G_{F,S}, T^D)^* → 0`, the general theorem of which the duality of 6.17 (b) and 6.17 (c) are corollaries (6.17). §R02.4.3: Poitou–Tate duality, for the reciprocity law at auxiliary primes (10.1).

### From HeckeIdealsAndTaylorWilesRelations, a sub-roadmap of this family

§10.1: for a number field `F`, a prime `p`, a finite set `S` of places containing those above `p` and the infinite ones, `Σ ⊂ S`, and a lattice `T` with `W = V/T` and `T^D = Hom(T, ℚ_p/ℤ_p)(1)`, the kernels `Ш¹_{S;Σ}(F, W)` and `Ш²_S(F, T)` with the modified groups at the real places; the perfect pairing `Ш¹_S(F, T^D) × Ш²_S(F, T) → ℚ_p/ℤ_p` of (b), with the real places included in both kernels; and the change of the vanishing set of (d), to which the real places contribute nothing for `p` odd (6.17 (b), and the last Check of 6.17).

### From TauCetiRoadmap.IntegralIwasawaTheory

§§0.1–0.3: cyclotomic extensions, towers and their layers, and ramification and inertia in a procyclic tower (9.7, 11.1). §3.5: the ray-class comparisons, with the `p`-split quotient `X/D_∞` and Chevalley's ambiguous-class formula (11.1). §10.4: arithmetic-character Euler characteristics, for the Euler quotient and the absence of finite submodules (12.1). §10.5: Galois descent of twists, for the injectivity of restriction to the cyclotomic tower on `Ш¹` and the comparison with the finite étale `H²` eigenspace (9.7, 12.1). §12.1: the character-quotient main conjecture; §12.2: inflation, induction and going up; §12.3: the specialization at arithmetic weights for `E = F(μ_p)` (12.1). §12.3a: for `p` odd, `n ≥ 2`, a character `χ` of order prime to `p` of a totally real `F` with `χ(c) = (−1)^n` and a finite abelian extension `E/F` of degree prime to `p` containing the field of `χ`, the order of the `χ⁻¹`-part of `H²(O_{E,S}, ℤ_p(n))` through `L_S(1 − n, χ)`, and, when `μ_p ⊂ E`, the vanishing of `X_ψ(−n)^Γ` and the duality of `X_ψ(−n)_Γ` with that part (the general theorem of which 10.1 (a) is a corollary; 12.1 for `[E : F]` prime to `p`).

### From TauCetiRoadmap.KatoEulerSystems

§4.1: the open-image theorem of Ribet and Momose for a newform `f` without complex multiplication (the group of inner twists, the field `F⁰`, Momose's quaternion algebra `B` over `F⁰`, and an open subgroup `H` of `G_ℚ` with `ρ_f(H) ⊂ B^×`), and the criterion that `(f, λ)` is admissible when `B` splits at the place `λ₀` of `F⁰` below `λ` (13.1). §4.1a: `B` splits at `λ₀` when `λ` lies above a prime `p` not dividing the level of `f` at which `a_p(f)` is a `λ`-adic unit (cited at 13.1). §7.9: for `(f, λ)` admissible over an abelian field `K` and `1 ≤ r ≤ k − 1`, `r ≠ k/2`, the Selmer group `Sel(K, T)` is finite for every stable lattice `T` of `V_λ(f)(r)` (14.1).

### From TauCetiRoadmap.ProfiniteCohomology

§5.4: inflation–restriction (6.17, 6.18); §5.5: the five-term sequence (11.1); §§6.2–6.3: corestriction and `cor ∘ res` (6.17); §7.2: Shapiro's lemma (6.18); §9.6: the Kummer sequence (10.1, 11.1).

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

§6.1: character group rings and their duals, for the character components (6.18).

### From TauCetiRoadmap.LatticePackingsAndPerfectForms

§1.7: Minkowski's bound for real forms; §1.8: Hermite's inequality for real forms; §4.1: perfection; §4.4: the finiteness of the automorphism group `{U ∈ GL_n(ℤ) : UᵀAU = A}` of a positive definite real form `A` (9.3 (f)); §4.9: the Ryshkov polyhedron and Voronoi neighbours, the case `L = ℚ` of 9.3 (a)–(b) (9.3).

### From TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness

§4.5: for every odd prime `ℓ`, reduction `GL_n(ℤ_ℓ) → GL_n(𝔽_ℓ)` is injective on finite subgroups, so every finite subgroup of `GL_n(ℤ)` embeds in `GL_n(𝔽₃)` (9.3 (f)).

### From TauCetiRoadmap.SchemeKTheoryOperations

§6.7: van der Kallen's homology stability: for a ring `R` with Bass's stable range condition `SR_{s+2}` and `e = max(1, s)`, the map `H_m(GL_n(R); ℤ) → H_m(GL_{n+1}(R); ℤ)` is onto for `n ≥ 2m + e − 1` and bijective for `n ≥ 2m + e`, and so is the map to `H_m(GL(R); ℤ)` (9.5, 9.7, 9.8).

### From TauCetiRoadmap.Polylogarithms

§2.2 (its rational primitive K-theory): for a unital ring `R`, the rational homology of `BGL(R)^+`, that is of `GL(R)`, is the free graded-commutative Hopf algebra on `K_*(R) ⊗ ℚ`, with `K_j(R) ⊗ ℚ ≅ Prim H_j(GL(R); ℚ)` and the primitive projection the convolution logarithm of the identity (9.5).

### From TauCetiRoadmap.GeneralAlgebraicKTheory

§13.8b: the Brauer-lift equivalence `BGL(𝔽_q)⁺ ≃ fib(ψ^q − 1 : BU → BU)`, with Quillen's computation of the homology of `GL(𝔽_q)`; §13.8c: `K_{2i}(𝔽_q) = 0` and `K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1)` for `i ≥ 1` (9.6 (a)).

### From TauCetiRoadmap.KTheoryFiniteLocalFields

§1.1: the coefficient K-groups `K_*(R; ℤ/m)` and, for `m = ℓ^ν` outside `{2, 3, 4, 8}`, their products; §1.2: the Bott class `β_ω ∈ K₂(R; ℤ/m)` of a root of unity `ω` of exact order `m`, with Bockstein `[ω]` (9.6).

### From TauCetiRoadmap.Chebotarev

Layer 10: the Chebotarev density theorem in Dirichlet density, for the primes of degree one that separate twisted norms (9.7).

### From TauCetiRoadmap.StableHomotopyKTheory

§4.24a: the integers `R_j` (`R_j = 1` for `j ≤ 1`, `R_j = L₂L₃⋯L_j` for `j ≥ 2`), and, for every ring `R` and `m ≥ 2`, the kernel of the Hurewicz map `K_m(R) → H_m(GL(R); ℤ)` is killed by `R_m`, the map being an isomorphism for `m = 1` (9.8 (a), and through it 9.7).

### From TauCetiRoadmap.ClassFieldTheory

Layers 8–12: ramification of abelian extensions and local and global class field theory, applied over the layers of a tower (11.1).

### From TauCetiRoadmap.LFunctions

Layer 4: Dirichlet L-functions with their completed functions and functional equation, for the nonvanishing of `N·P_{e+2}·B_{e+1,ψ}` through `L(e + 1, ψ̄) ≠ 0` (10.1). Layer 5: finite-order Hecke L-functions and their values `L_S(1 − n, χ)` (12.1).

### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger

§2.5: every ideal class of `ℤ[μ_m]` contains a prime of degree one outside a given finite set (10.1 (c)). §3.1: generalized Bernoulli numbers, Bernoulli evaluation and `p`-adic congruences (10.1).

### From TauCetiRoadmap.DirichletPadicLFunctions

§0.4: the comparison of generalized Bernoulli numbers and conductors (10.1).

### From TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

§3.1: for a finite cyclic group `Γ` of order `n` with generator `σ`, the operator `D_σ = Σ_{i<n} i·σ^i` and the identity `(σ − 1)D_σ = n − N_Γ` (10.1 (c3)).

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.55: Stickelberger's relation, the prime factorisation of the `m`-th power of the Gauss sum of a prime of `ℤ[μ_m]` not dividing `m` (10.1 (c1)).

### From TauCetiRoadmap.PadicHodgeTheory

§3.6: characters with labelled Hodge–Tate weights, locally algebraic on an open subgroup of inertia (13.1).

### From TauCetiRoadmap.SelmerIwasawaCohomology

§4.9: the Bloch–Kato local conditions (14.1).

### From Mathlib

`Matrix.det` and `LinearIndependent` (9.1); `groupHomology` with its long exact sequence and Shapiro's lemma, and `Rep.trivial` (9.2, 9.4, 9.6); `Matrix.GeneralLinearGroup`, `NumberField.RingOfIntegers`, `NumberField.discr` and `AddCommGroup.torsion` (9.3, 9.4); `jacobiSum` and `Nat.exists_prime_gt_modEq_one` (10.1).

### From Tau Ceti

`DirichletCharacter.generalizedBernoulli` (10.1).

## References

- C. Soulé, Perfect forms and the Vandiver conjecture, J. reine angew. Math. 517, 1999, 209–221 (theorem numbers and pages of arXiv:math/9812171v1): for `SL_N(ℤ)` only (the extension to rings of integers is left open, p. 2), Voronoi's cells and their count (Propositions 1–2, pp. 3–4; 9.3), the torsion of a cokernel (Lemma 1, p. 5; 9.1), Gabber's lemma (Proposition 3, p. 6; 9.2), the torsion of `H_k(SL_N(ℤ); ℤ)` modulo the primes `≤ N + 1` (Theorem 1, p. 7; 9.2, 9.4) and of `K_m(ℤ)` modulo the primes `≤ 2m + 2` (Theorem 2, p. 9; 9.8).
- C. Soulé, A bound for the torsion in the K-theory of algebraic integers, Documenta Math. Extra Volume Kato, 2003, 761–788: bounds for the torsion of `K_m(𝒪_L)` up to small torsion, through the homology of `GL_N(𝒪_L)` and Ash's well-rounded retract, whose bound for `log card` is of size at least `exp(α|d_L|^{1/2})` (Proposition 4, as BFEH 2014, pp. 1–2, describe it; 9.4, 9.8); the bound for `H²(𝒪_L[1/ℓ], ℤ_ℓ(E+1))` at large primes `ℓ`, through K-groups (Theorem 3; 9.7).
- BFEH 2014: E. Bayer-Fluckiger, V. Emery, J. Houriet, Hermitian lattices and bounds in K-theory of algebraic integers, Documenta Math. Extra Volume Merkurjev, 2015, 71–83; arXiv:1406.5953, 2014 (numbering and pages of its third version, 2015): the bound for `K_m(𝒪_L)_tors`, `L ≠ ℚ`, up to the elements of order at most `max(n + 1, 2m + 2)`, with `log card` at most `(mn)^α|d_L|^β` (Theorem 1.1 and Corollary 1.2, pp. 1–2), through the homology of `GL_{2m+1}(𝒪_L)` (Corollary 2.3 and §3, pp. 4–6) and Ash's well-rounded retract (Theorem 2.2, p. 4), the alternative to the nerve of 9.3 (9.3, 9.4, 9.8).
- D. Arlettaz, The Hurewicz homomorphism in algebraic K-theory, J. Pure Appl. Algebra 71, 1991, 1–12: the kernel of the Hurewicz map is killed by an integer depending only on the degree (Theorem 1.5; 9.8 (a)).
- V. A. Kolyvagin, Euler systems, in The Grothendieck Festschrift II, Progr. Math. 87, Birkhäuser, 1990: the derivative classes of 10.1 (c3), (c4).
- K. Rubin, Kolyvagin's system of Gauss sums, in Arithmetic Algebraic Geometry, Progr. Math. 89, Birkhäuser, 1991: the method for class groups of cyclotomic fields, of which 10.1 (c) is the analogue for the twists `e ≥ 1`.
- P. Schneider, Über gewisse Galoiscohomologiegruppen, Math. Z. 168, 1979, 181–205: Poitou–Tate duality for the Tate–Shafarevich kernels with the coefficients `ℤ_p(i)` (6.17).
- M. Kolster, A. Movahhedi, Galois co-descent for étale wild kernels and capitulation, Ann. Inst. Fourier 50, no. 1, 2000, 35–65: the exact sequence of the étale wild kernel with `H²`, the local `H²` and the dual of the global `H⁰`, for `p` odd (§1; 6.17, through ArithmeticGaloisDuality §D7.6a).
- M. Kolster, Special values of L-functions at negative integers, lecture notes of the Maine–Québec Number Theory Conference, 2009: the decomposition into character components of the `H¹` and `H²` of the `S`-integers of an abelian field of degree prime to `p` (§3; 6.18), and the order of the `χ⁻¹`-part of `H²` through `L_S(1 − n, χ)` for the characters `χ` of order prime to `p` of a totally real field (Propositions 3.1–3.2 and Theorem 3.3, pp. 13–15; 10.1, 12.1, through IntegralIwasawaTheory §12.3a).
- K. S. Brown, Cohomology of Groups, Springer GTM 87, 1982: the cellular chains of a complex with a group action as sums of permutation modules, and Shapiro's lemma (III.1, III.10, VII.7–VII.8; 9.2).
- V. Emery, Torsion homology of arithmetic lattices and K2 of imaginary fields, Math. Z. 277, 2014 (arXiv:1303.6132): a bound for the torsion of the homology of arithmetic groups that includes every prime, under the hypothesis that the rational homology vanishes and with constants that are not explicit (Theorem 1.1; 9.2, 9.4).
- M. Koecher, Beiträge zu einer Reduktionstheorie in Positivitätsbereichen I, Math. Ann. 141, 1960: Voronoi's theory of perfect forms in positivity domains, which includes the forms over the ring of integers of a number field (9.3).
- O. Braun, R. Coulangeon, G. Nebe, S. Schönnenbeck, Computing in arithmetic groups with Voronoï's algorithm, J. Algebra 435, 2015: Voronoi's theory of perfect forms over the ring of integers of a number field (Theorem 2.4 and Corollary 2.5; 9.3).
- A. de la Torre Durán, Perfect forms and torsion bounds in algebraic K-theory over totally real and CM fields, arXiv:2611.06300, 2026: for totally real and CM fields, bounds for the number of orbits of faces of the Voronoi tessellation (9.3) and for torsion in homology and K-theory away from small primes (Theorem 4.5; 9.4).
- A. F. Brown, E. P. Ghate, Endomorphism algebras of motives attached to elliptic modular forms, Ann. Inst. Fourier 53, 2003, 1615–1676: at the places above a prime not dividing the level at which the newform is ordinary, the crossed-product algebra of its inner twists, which is embedded in the endomorphism algebra of its motive and equal to it in weight two, is a matrix algebra (Theorem 3.3.1; 13.1, through KatoEulerSystems §4.1a, which compares it with Momose's algebra `B`).
- K. Kato, p-adic Hodge theory and values of zeta functions of modular forms, Astérisque 295, 2004, 117–290: the finiteness of the Selmer groups of modular forms over abelian fields at non-central twists (Theorem 14.2; 14.1, through KatoEulerSystems §7.9).
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions that the family index ([RiemannHypothesisForDirichletLFunctions](../README.md)) names, with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>, cited at its first commit `40e56bab026552e089d7afcfeff08d2defb9c005`, the source as published, which the family index names; the file paths and declaration names given at the targets refer to that commit. It is the source of the statements of this roadmap that no work in this list states: Layer 6 for `ℓ` odd or `F` totally imaginary (in the form of lengths), 9.3 (c)–(f), 9.4 and 9.5 for totally complex number fields, 9.6, 9.7, the forms of 9.2 and 9.4 that discard no prime, Layer 10, and the case `p = 2` of 11.1; it also proves the instance of 14.1 that UniformWildKernelBounds uses. The statements at `ℓ = 2` with real places and the K-theoretic clauses of Layer 6, the extension of 9.3 (c)–(f), 9.4 and 9.5 to fields with a real place, the corestriction form of 9.7, 9.8 (b), 11.1 for odd `p`, 12.1 when `p` divides `[E : F]`, 13.1 away from the ordinary places above primes not dividing the level, and the general form of 14.1 are this roadmap's, by the routes given. What a target states beyond the form recorded there is this roadmap's.
