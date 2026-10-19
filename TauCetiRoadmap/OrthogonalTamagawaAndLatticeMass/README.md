# Orthogonal Tamagawa comparison, arbitrary lattice masses, and certified class counts

Construct orthogonal gauge and quotient comparisons, arbitrary integral-genus mass formulas, general unramified dyadic integral models and certified class-count applications. Reuse the existing lattice, orthogonal group, local field, restricted-product and generic Haar/Tamagawa carriers; build the missing comparison maps and their complete APIs here.

## Conventions and actual suppliers

Use native TauCeti.IntegralLattice with its rational form B and integral restriction. Over a characteristic-zero field distinguish norm B(x,x) from the half-norm Q(x)=B(x,x)/2. Their orthogonal point groups agree, but the bilinear dyadic automorphism congruence count and the integral quadratic count differ. Keep both symbols and their exact scalar dictionary. Positive definite class sets may be represented by positive symmetric integer Gram matrices modulo GL_n(Z); prove the equivalence with native embedded-lattice isometries using ofIntegralForm/carrierEquiv. This supplies a small quotient without quantifying over all carrier universes. Rank zero has the unique empty matrix and trivial automorphism group.

IntegralLattices0–5 supplies integral forms, inertia, duality, Jordan symbols, positive-definite reduction/class finiteness, proper/full classes, local density limits and their stabilization. Its6D/6E construct reference lattices and prove nonisomorphism; a list of references is not completeness. Its7A proves m_proper=2m_full in positive rank; its7G owns the direct low-rank branches. RootSystems supplies the actual reduced crystallographic root classification and lattice comparison, not a presumed table of automorphism orders. OrthogonalSpinGroups0–3 supplies native point groups, local spinor norms, controlled restricted-product references and point-group diagonals. It supplies neither strong approximation nor Tamagawa measures.

Consume [AdelicAlgebraicGroups AA.1–4](https://github.com/TauCetiProject/TauCetiRoadmap/pull/792), [GeometryOfNumbersAndQuadraticArithmetic §§2.4/3.3](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851), and [EndoscopicTransferAndUnitaryTraceComparison §6.2](https://github.com/TauCetiProject/TauCetiRoadmap/pull/999) at their stated hypotheses; a written supplier contract does not assert its implementation. In particular §3.3 owns orthogonalTamagawa_two, orthogonalPinnedGaugeJacobian, compactOrthogonalGaugeVolume and orthogonalIntegralRealGaugeCompatibility for number-field rank≥3; its maximal-lattice numerical specialization has totally real degree≥2, total positivity and maximality hypotheses. The extension to rational arbitrary integral genera is constructed below, not claimed from that specialization. AA.2.4 fixes |d_K|^(-dimG/2) rho_G^(-1) product_v lambda_v |omega|_v, vol(O_v)=1 additive measures, dx and 2 dxdy and counting measure on rational points. A different convention requires a proved transport scalar. §6.2's tau=1 has no set S; §6.5's scoped ratios are not an arbitrary finite-central-isogeny library.

## 0. Native and scheme dictionaries, before numerical theorems

0.1 Construct the group-scheme/point comparisons between the actual OG Spin/SO groups and ReductiveGroups' affine Hopf points over the number field, completions and adeles. Retain matrix action, Spin projection, coefficient change, determinant, rational diagonals, continuity in both directions and compatibility with AA integral models outside an explicitly proved finite exceptional set. Transport compatible reference tuples through finite-change and away-S identifications. A bare forward map or equality of abstract groups is insufficient.

0.2 Consume the shared nondegenerate orthogonal algebraic-group construction, semisimplicity and Spin simple-connectedness at rank≥3, treating rank3 and split/nonsplit rank4 and every almost-simple factor explicitly. Do not use the rank2 torus as semisimple. Prove the finite-prime lattice stabilizers compact open on these exact point carriers, consuming IL4B and the completed-lattice embedding dictionary, and identify proper/full arithmetic stabilizers with native integral isometry groups.

0.3 Retain the entire required approximation programme: instantiate AA.4.2 with a finite S containing all archimedean places and, for every almost-K-simple factor H, noncompact product_(v∈S)H(K_v). Prove rational Spin density in Spin(A^S) and the closure of its image in the SAME SO(A^S) equals the reference-controlled spinor kernel. Specialization to finite adeles requires these hypotheses for S=all archimedean places; a definite form may instead require finite places in S and does not thereby acquire the finite-adelic conclusion. Prove the IL4D Eichler and indefinite rank≥3 class-finiteness applications separately. Keep definite forms and full-adeles distinctions. This lane is not a prerequisite of the positive-definite mass lane.

## 1. Quotient and gauge transport

1.1 On the proper finite-adelic double coset set IL4B, construct the measurable decomposition of SO(V)(K)\SO(V)(A) into pieces indexed by actual proper lattice classes, with arithmetic stabilizer SO(M). Compare this quotient and its measure to AA's actual quotient integration and the shared §3.3 proper mass identity. In the positive-definite rational branch the archimedean group is compact. Each piece has volume vol(K_infinity) product_p vol(K_p^+(M))/|SO(M)|. Prove measurability/disjointness, positivity, independence of representative and finiteness using actual lattice reduction, not strong approximation.

1.2 Transport orthogonalPinnedGaugeJacobian and orthogonalIntegralRealGaugeCompatibility to B and B/2 conventions. For rank n>=3 let V_n be the IL7E sphere-fibration volume of SO(n) for the metric making E_ij-E_ji orthonormal. For the pinned mass gauge in the shared §3.3, prove compactOrthogonalGaugeVolume=s_n V_n, where s_n=2^(-floor(n/2)) in odd rank and s_n=1 in even rank. In particular V_3=8π² while the rank-three mass-gauge volume is 4π². Keep this pinned-gauge scalar distinct from the B versus B/2 coefficient transport and from the global integral/real gauge compatibility. Identify the local Haar density with the stabilized bilinear count IL7C, including the determinant-component index and every factor of two. Do not declare vol(K_p)=alpha_p without this Jacobian theorem. Prove model-independence and form-twist transport with the gauge scaling and global product formula. State measure equality before substituting any numerical tau value.

1.3 Consume §3.3 orthogonalTamagawa_two for rank≥3 only AFTER1.1–1.2 and0.1. Derive the rational arbitrary-genus proper/full mass formula. Good-prime factors are beta_p=alpha_p/2; their inverse Euler product converges absolutely for rank≥3. Use the signed determinant character, not the raw determinant, and retain the bad-prime factors. The rank0 mass is1, rank1 full mass1/2/proper mass1, and positive binary masses use IL's separate ideal-class/norm-torus route. A rank≥3 tau theorem does not establish those cases.

## 1.4 Binary quadratic analytic normalization

Construct the rank-two analytic endpoint independently of the rank≥3 orthogonal
value and AA split-measure lanes. The positive binary class-count mass remains
IL B8's algebraic theorem; the comparison below is required when identifying
its value with local Euler factors. Preserve the indefinite real/narrow/regulator
comparison and the distinct split branch. None follows from a rank≥3 tau theorem.

**1.4a Signed character and conductor.** For a nonsplit nondegenerate rational
binary form, select the fundamental discriminant `D` of its quadratic field and
prove that its square class is the signed determinant `−det B`. For an integral
primitive binary form of discriminant `Δ`, construct `Δ=f²D` with the actual order
conductor `f≥1`; content removal is a separate lattice-to-form map.
For `B=[[A,b],[b,C]]`, the integral classical form `B(x,x)` has coefficients
`(A,2b,C)`. After dividing by its positive gcd content `g`, its primitive
classical discriminant is `Δ=−4 det(B)/g²`. If `B` is even, the integral
half-norm has coefficients `(A/2,b,C/2)`; after its own gcd `g_half`, the
primitive discriminant is `Δ=−det(B)/g_half²`. Prove integrality, primitivity,
`Δ≡0 or1 mod4`, and agreement via `g=2g_half` in the even case. A half-norm
of an odd lattice is not silently an integral classical form. Cancel content in
the integral POLYNOMIAL isometry equations: for the primitive polynomial the
integral polar matrix is `2B/g`; `B/g` need not be integral (A2 is a test). Use
the actual polynomial-to-native-lattice/ideal adapter, not an unsupported
assertion that dividing the bilinear lattice by its polynomial content stays
integral. The signed
extension square class is `−det B` in both conventions, but that square class
alone does not determine the order or its conductor. Construct the actual
quadratic order of discriminant `Δ`, not automatically the maximal order.
 Use the native
`DirichletCharacter ℂ |D|`, `IsPrimitive`, `conductor` and `changeLevel` carriers.
Instantiate the existing native
`TauCeti.Multiquadratic.fundamentalDiscriminantChar D hD`, then complexify it by
`.ringHomComp (Int.castRingHom ℂ)`. Consume native
`isPrimitive_fundamentalDiscriminantChar`, `fundamentalDiscriminantChar_isQuadratic`,
`fundamentalDiscriminantChar_neg_one` and the odd-prime Legendre evaluation,
and native `DirichletCharacter.conductor_ringHomComp` /
`isPrimitive_ringHomComp_iff` with `Int.cast_injective`. The CRT/prime-discriminant,
quadratic character and primitive-conductor constructions already exist and are
not commissioned again. Derive `χ_D≠1` from the fundamental nonsplit `D≠1`
and conductor, and keep `[NeZero D.natAbs]` explicit. For the field dictionary,
extract the actual squarefree integral radicand of `−det B` and transport its
square-root field to the chosen native quadratic field. Reuse native
`discr_eq_fundamentalDiscriminant` with its actual integral generator/minpoly/
adjoin/Squarefree data, or `discr_adjoin_singleton_eq_fundamentalDiscriminant`
with its square-root and rational-nonsquare data. Only these SAME-form/field
transport and local dyadic/order dictionaries are new adapters. The `D=1` split
algebra uses the native trivial case and remains separate from a quadratic
number field. Existing native Gauss-sum/fixed-field comparisons may supply
cyclotomic field identification at their exact hypotheses; they are not needed
as a late class-field-theory premise of this endpoint.
Compare the finite-order Hecke character over ℚ through GNF9's actual conductor-
and parity-compatible dictionary, including ideal values and the real sign.
This adapter does not require global class field reciprocity or a new character
carrier. For a changed level or finite excluded prime set use native
`LFunction_changeLevel` with its `χ≠1 ∨ s≠1` and nonzero-level hypotheses; prove
the finite deleted factors individually nonzero at1.

**1.4b Native endpoint application.** Consume TauberianBoundaryConvergence N2/N3
on the actual primitive native `χ_D` constructed in1.4a, or its explicitly changed
level. Retain `[NeZero N]`, `χ≠1`, native `differentiable_LFunction` and
`LFunction_ne_zero_of_one_le_re` on the ENTIRE closed half-plane. N3 uses the
existing coefficient `χ(n)Λ(n)/Real.log(n)`, its0/1 cases and prime-power bound,
normalized local analytic-log patching, the N2 ordinary endpoint and the absolute
higher-prime-power removal. No second logarithm/Tauberian engine is owned here.
Its exact output is `Tendsto` of finite increasing-prime products outside `S` to
`LFunction χ 1 * ∏ p∈S, (1−χ(p)/p) ≠ 0`. The cutoff comparison, conductor change,
finite deletion factors and real positivity for quadratic `χ_D` are mandatory.
No unordered `HasProd`/`HasSum` or totalized `LSeries` value at1 is substituted.

**1.4c Quadratic residue, order and genus dictionary.** Before using an analytic
class-number value, construct the all-prime coefficient identity
`# {I ⊆ O_K : norm I=n} = Σ_(d|n) χ_D(d)` for `n≥1` from the actual quadratic
split/inert/ramified ideal factorization and finite norm fibres. Use completed/native arithmetic Dirichlet-series norm
regrouping/convolution and native absolute convergence to obtain
`dedekindZeta K s = riemannZeta s * LFunction χ_D s` on `Re s>1`.
This is a constructed comparison, not an assumed native Dedekind Euler product.
The right side defines the meromorphic germ at1. Compare its residue using
native `riemannZeta_residue_one` and the native quadratic Dedekind right-residue
`NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, whose constant is
`2^r1 (2π)^r2 h R/(w sqrt(|D|))`. This proves the actual class-number comparison;
it does not deduce ordinary prime convergence from a residue alone.
For `D<0` obtain `L(1,χ_D)=2π h_D/(w_D sqrt(|D|))`, with imaginary regulator1.
For `D>0` obtain `L(1,χ_D)=2 h_D R_D/sqrt D`, and prove the equivalent narrow
normalization `h_D^+ R_D^+/sqrt D`, where `R_D^+` is the log of the least
unit positive at both real embeddings. Distinguish ordinary and narrow classes
and the possible norm−1 unit; prove `h_D^+ R_D^+=2 h_D R_D` rather than silently
identifying the groups or regulators.

Consume actual native `NumberFieldOrder.integralIdealsAwayConductorEquiv`
for extension/contraction on nonzero conductor-coprime ideals, native
`discr_eq_index_sq_mul`, and the actual `narrowToPic` unit-sign kernel/cardinality
comparison. Construct the remaining nonmaximal-order exact sequence from these
existing maps, `(O_K/fO_K)^×/(O_f/fO_K)^×`, and the actual unit index; treat
the primes dividing `f` explicitly. For `O_f=ℤ+f O_K`, prove the exact sequence
`1→O_f^×→O_K^×→(O_K/fO_K)^×/(ℤ/fℤ)^×→Pic(O_f)→Pic(O_K)→1`.
Use native conductor-coprime representatives for surjectivity; a class in the
kernel has a maximal-order principal generator whose residue gives the middle
unit quotient, and changing the generator changes precisely the global-unit
image. Prove both kernel equalities. CRT reduces its finite cardinality to
`p^e || f`: the unit quotient has size `p^e(1−χ_D(p)/p)`, using the actual
split product, unramified quadratic residue field, or ramified local order;
the ramified size is `p^e` even at2. Use the maximal integral basis in the
dyadic case, not a possibly nonmaximal `ℤ[√d]`. Divide by the actual unit index.
For real fields combine this sequence with native unit signatures to obtain
`h_f^+/h_K^+=f∏(1−χ_D(p)/p)/[O_K^{×,+}:O_f^{×,+}]` and prove the same positive-unit
index multiplies `R_K^+` to `R_f^+`. In the imaginary case that unit index
cancels against `w_K/w_f`. These finite cardinality statements require the
actual finite Picard/narrow Picard carriers; the native `Nat.card` identity
alone is not a finiteness proof. Deduce
`h(Δ)/w_f = sqrt(|Δ|) L(1,χ_D) ∏_(p|f)(1−χ_D(p)/p)/(2π)` in the imaginary case,
and
`h^+(Δ) R_f^+ = sqrt Δ L(1,χ_D) ∏_(p|f)(1−χ_D(p)/p)` in the real case.
Require `Δ=f²D` and the actual primitive/invertible ideal hypotheses; no number-
field theorem is applied to the split product order. Transport these identities
through IL B2/B3/B4's actual proper-form/ideal, unit and principal-genus maps,
retaining the square-subgroup index so B8 uses the number of proper classes in
ONE genus, not the full class number. The maximal-field case reuses native
`isSquare_iff_forall_genusCharFunNarrowClassGroupHom_eq_one` with its actual
squarefree generator and prime-discriminant data; it is not a theorem about
every nonmaximal order. The nonmaximal comparison retains IL B3’s genuine
conductor-local/form-to-ideal genus construction, including dyadic conditions,
before transporting its square-subgroup count. Prove the density finite-set `S` and the
order-conductor exclusions agree by their explicit factors. The local `B` versus
`B/2`, O versus SO and real angular/logarithmic measure scalars are the separate
1.2/B7 compatibility theorem, not consequences of this Dirichlet endpoint.

In the square split case the normalized good product reduces to
`∏_(p≤N,p∉S)(1−1/p)⁻¹` and diverges to positive infinity. Prove divergence from
the finite Euler expansion dominating the harmonic sum after discarding a fixed
finite factor; do not apply nontrivial-character continuation. The modulus-one
idele quotient and the split order of conductor `f` remain IL B7's distinct
algebraic/measure targets. Rank0 and rank1 retain their elementary branches.
The nonsplit endpoint, the class-number/residue comparison, and the direct
positive binary mass are three separate outputs with explicit connecting maps.

The compulsory calibrations are A2: primitive polynomial `(1,−1,1)`,
`Δ=−3`, `h=1`, `w=6`, full mass `1/12`; and Gram `[[4,1],[1,6]]`:
polynomial content2, primitive `(2,1,3)`, `Δ=−23`, `h=3`, `w=2`, full genus
mass `3/4`. Prove those class counts by the complete reduced-form list and
retain the actual genus index `|Pic(O_Δ)[2]|`, so the positive binary full
mass is `h(Δ)/(2 w_Δ |Pic(O_Δ)[2]|)`. Positive polynomial content changes
preserve the properly transported automorphism/genus mass; integral bilinear
rescaling is not assumed. Indefinite branches use units/regulators/Haar,
not a finite automorphism cardinality. These calibrations test the general
adapter; they do not replace its proof.

## 2. Arbitrary dyadic integral models and densities

2.1 For a nondegenerate quadratic lattice over EVERY unramified finite extension R/Z_2, construct Cho's smooth affine integral model from the actual IL3I Jordan data; construct its coordinate Hopf algebra, generic-fibre O(V,q) comparison and equality of R-points with O(L). Prove smoothness of relative dimension n(n−1)/2, the successive congruence kernels and their counts. This is genuine new integral-model work at this owner, not supplied by a model name or the existing maximal-lattice theorem. Include rank0 separately.

2.2 Construct the special fibre, its unipotent radical and reductive quotient, the product of the specified reduced orthogonal factors and elementary abelian2 component group. Use the type/bound/free invariants, alpha+beta component count and N=N_Q-N_M from IL3I with their exact definitions. Prove #U(k)=f^dimU, the quotient count and Cho's beta_L=(1/2)f^(N-dimO)#G_tilde(k) in positive rank; compare to the actual stabilized IL7C bilinear count. For R=Z_2 prove alpha_2=2 beta_L, never erase the type-II +c conversion. The tests U (N=2,alpha2=4), <1> (4), <2> (8), and E8 (N=8) distinguish conventions. General unramified R and arbitrary Jordan scales precede the rational specialization.

2.3 Assemble the full Conway–Sloane normalization against IL7C/7E, including gamma factors, all bad primes and scaling. Prove the normalized good Euler product, local formulas and the archimedean identity before cancellation. Supply rank8 and A2 checks, but do not use checks as the proof of a general mass formula. These constructions preserve all arbitrary-genus, general dyadic and binary branches already required at this successor.

## 3. Even-unimodular specialization and exact arithmetic

For n=2m>0 divisible by8 prove all positive even unimodular rank-n lattices belong to the single genus, using the real signature and the odd/dyadic local classifications (IL3/5A). Apply1–2 to that genus; prove the rational full O-mass is

 M_(2m)=|B_m/(2m)| product_(j=1..m-1)|B_(2j)/(4j)|.

Here t/(exp(t)-1)=sum B_k t^k/k!, B_1=-1/2, and all displayed Bernoulli indices are even. Derive this identity from the normalized local and real factors; it is not the odd-unimodular formula. A second check uses the Belolipetsky–Gan proper-SO formula: for even unimodular rational lattices, the local correction lambda2=1, whereas the article's §6 odd-lattice correction is not used. Compare proper mass to full O mass by IL7A, giving exactly a factor2, including classes that split into two proper classes. Rank8 must yield1/696729600. Rank0 is not obtained by this formula.

Construct Bernoulli numbers by the exact rational recurrence sum_(j=0)^k binom(k+1,j)B_j=0 for k≥1 and B0=1. Evaluate M8,M16,M24,M32,M40 by rational arithmetic and prove the recurrence/evaluation in the native rational-number carrier before claiming a certified computation. Supply native rational recurrence and evaluation certificates for these exact equalities.

## 4. Finite automorphism and completeness certificates

Use a positive rational Gram matrix G on Z^n. Produce a positive rational c with c sum_i x_i²≤x^T Gx (e.g. rational lower bound below the least real eigenvalue, justified by the native finite-dimensional positivity theorem). For each column j of an integral automorphism, norm is G_jj, so |a_ij|≤sqrt(G_jj/c). A certificate supplies integer bounds whose squares dominate G_jj/c. Enumerate every column in these finite boxes and retain matrices satisfying A^TGA=G. Such a matrix has determinant±1 by determinant comparison; therefore it is an integral automorphism and the enumeration is exact, not a heuristic root search. Prove both directions, no duplicates, basis-change transport and the n0 singleton. This is an executable finite certificate model on native Matrix/Fin/Fintype, prior to large actual certificates.

4.1 Rank8 uses IL6C and actual O(E8) order696729600. Rank16 first constructs the two IL6D classes and proves nonisomorphism. Root/glue automorphisms give orders2*696729600² and2^15*16!, respectively. Prove these orders by actual root action and glue stabilizer, or by the complete Gram enumeration above. Verify the sum of reciprocals equals M16. Finite class-set reduction and positivity of each omitted reciprocal prove no third class.

4.2 For rank24 bind ALL24 explicit IL6E Gram/glue constructions and their actual pairwise nonisomorphism proofs. Construct a full finite certificate, with its explicit bounds/matrices or an equivalent proved root/glue stabilizer enumeration, for EACH automorphism order. Prove the exact reciprocal sum is M24. The same positivity argument proves completeness. This target includes the rootless Leech row; no claim that its automorphisms are detected only by roots is allowed. A named list, its length24 or a table of purported group orders is not the certificate. Uniqueness of the rootless class follows only AFTER this exhaustion, not from calling the row Leech. The actual24 certificates remain implementation work; they are specified finite mathematical objects, not assumed numerical data.

4.3 In positive rank -id≠id, so each automorphism group has size≥2 and each reciprocal≤1/2. For the finite class number h_n, M_n≤h_n/2. Use the exact recurrence certificates to prove 2M32>10^7 and 2M40>10^51, hence the source lower bounds (with strict inequality). No enumeration of all rank32/40 classes is required for these bounds. The mass theorem and one-genus theorem remain indispensable; the inequality alone is not a count proof.

## 5. Retained generic measure library and limits

Retain the required arbitrary finite-central-isogeny defect programme at the existing generic TamagawaMeasures/AA owner: genuine local/adelic lifting obstruction, rational images, actual kernels/cokernels and their finite cohomological defect, quotient-measure comparison, character lattice and gauge Jacobians. It is not replaced by tau(Spin)=1, |mu2|, or ET6.5. The direct orthogonal-value route in1 does not require that alternative programme. Construct the generic measure/defect precision at its existing owner and consume its exact local/adelic quotient-measure and gauge-Jacobian interfaces here.

Dependency order is0.1/0.2→1.1/1.2→1.3, IL3I→2.1→2.2, then2.3→3→4. The separate binary lane is IL B1–B4 and GNF9/native quadratic characters→1.4a; native Dirichlet Euler/continuation/nonvanishing and TauberianBoundaryConvergence N2/N3→1.4b; actual quadratic ideal factorization, native Dedekind residue and the order/unit comparison→1.4c. IL B8 direct class-count mass is an independent earlier algebraic output, compared only after these maps exist. Consume only IL7C local factors here, never its later global analytic conclusion; no owner-level circular premise is intended. Approximation0.3 is independent of this positive mass route. Native lattice finiteness/class reduction, AA quotients/gauges and the actual shared orthogonal-value contracts are mandatory lower suppliers; integral-model construction2 is this owner's explicit earlier target.

## References

- Sungmun Cho, [Group schemes and local densities of quadratic lattices in residue characteristic2](https://arxiv.org/abs/1210.7625v3), for smooth integral models and local densities over unramified dyadic extensions.
- M. Belolipetsky and W. T. Gan, [The mass of unimodular lattices](https://arxiv.org/abs/math/0307195v2), for the parahoric/proper-SO mass comparison; retain the even-versus-odd normalization in Section3.
- The IntegralLattices, OrthogonalSpinGroups and linked adelic/orthogonal-value specifications above, at their actual coefficient, rank and gauge hypotheses.
